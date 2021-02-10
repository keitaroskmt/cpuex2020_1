	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 64464
	ori	%hp, %hp, 478

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
	nop

	nop
	nop
	addi	%v1, %zero, 0
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
	nop

	nop
	nop
	addi	%v1, %zero, 0
	nop

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
	nop

	nop
	nop
	addi	%v1, %zero, 0
	nop

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

	nop
	nop
	nop
	jr	%ra

min_caml_read_float:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %zero, 0
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
	nop

	nop
	nop
	addi	%v1, %zero, 0
	nop

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
	nop

	nop
	nop
	addi	%v1, %zero, 0
	nop

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
	nop

	nop
	nop
	nop
	jr	%ra

min_caml_create_array:
	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	addi	%v0, %hp, 0
	nop

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
	nop

	nop
	nop
	nop
	j	create_array_loop

min_caml_create_float_array:
	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	addi	%v0, %hp, 0
	nop

create_float_array_loop:
	nop
	nop
	nop
	bne	%a0, %zero, create_float_array_cont

	nop
	nop
	nop
	jr	%ra

create_float_array_cont:
	fsw	%f0, 0(%hp)
	nop
	addi	%a0, %a0, -1
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	j	create_float_array_loop

min_caml_create_extarray:
	nop
	nop
	addi	%a1, %v0, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

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
	nop

	nop
	nop
	nop
	j	create_extarray_loop

min_caml_create_float_extarray:
	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	addi	%v0, %v1, 0
	nop

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
	nop

	nop
	nop
	nop
	j	create_float_extarray_loop

kernel_atan.2612:
	flw	%f4, 477(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	flw	%f5, 476(%zero)
	nop
	fmul	%f2, %f1, %f1
	fmul	%f4, %f4, %f0

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f4, %f4, %f1

	nop
	nop
	fsub	%f4, %f0, %f4
	nop

	nop
	nop
	fmul	%f5, %f5, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f2
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	flw	%f5, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f1
	nop

	nop
	nop
	fmul	%f5, %f5, %f2
	nop

	nop
	nop
	fsub	%f4, %f4, %f5
	nop

	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f3
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	flw	%f5, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f0
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
	fsub	%f1, %f4, %f1
	nop

	flw	%f4, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	jr	%ra

f.6155.10100:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16391

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16392

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16393

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16394

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16395

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16396

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16397

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16398

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16399

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16400

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16401

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16402

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16403

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16404

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16405

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16406

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	f.6155.10100

fbgt_else.16406:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16405:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16404:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16403:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16402:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16401:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16400:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16399:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16398:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16397:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16396:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16395:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16394:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16393:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16392:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16391:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

g.6159.10104:
	flw	%f2, 1(%k1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16407

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16408

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16409

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16410

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16411

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16412

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16413

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16414

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16414:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16413:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16412:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16415

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16416

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16416:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16415:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16411:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16410:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16417

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16418

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16419

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16420

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16420:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16419:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16418:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16421

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16422

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16422:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16421:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16417:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16409:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16408:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16423

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16424

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16425

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16426

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16427

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16428

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16428:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16427:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16426:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16429

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16430

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16430:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16429:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16425:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16424:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16431

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16432

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16433

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16434

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16434:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16433:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16432:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16435

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16436

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16436:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16435:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16431:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16423:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16407:
	nop
	nop
	nop
	jr	%ra

cos.2616:
	flw	%f1, 470(%zero)
	nop
	fabs	%f0, %f0
	nop

	flw	%f2, 469(%zero)
	fsw	%f1, 0(%sp)
	nop
	nop

	fsw	%f0, 1(%sp)
	nop
	nop
	nop

	fsw	%f2, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16437

	flw	%f3, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16439

	flw	%f3, 467(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16441

	flw	%f3, 466(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16443

	flw	%f3, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16445

	flw	%f3, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16447

	flw	%f3, 463(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16449

	flw	%f3, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16451

	flw	%f3, 461(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16453

	flw	%f3, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16455

	flw	%f3, 459(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16457

	flw	%f3, 458(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16459

	flw	%f3, 457(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16461

	flw	%f3, 456(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16463

	flw	%f3, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16465

	flw	%f3, 454(%zero)
	sw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	f.6155.10100

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16466

fbgt_else.16465:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16466:
	nop
	nop
	nop
	j	fbgt_cont.16464

fbgt_else.16463:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16464:
	nop
	nop
	nop
	j	fbgt_cont.16462

fbgt_else.16461:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16462:
	nop
	nop
	nop
	j	fbgt_cont.16460

fbgt_else.16459:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16460:
	nop
	nop
	nop
	j	fbgt_cont.16458

fbgt_else.16457:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16458:
	nop
	nop
	nop
	j	fbgt_cont.16456

fbgt_else.16455:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16456:
	nop
	nop
	nop
	j	fbgt_cont.16454

fbgt_else.16453:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16454:
	nop
	nop
	nop
	j	fbgt_cont.16452

fbgt_else.16451:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16452:
	nop
	nop
	nop
	j	fbgt_cont.16450

fbgt_else.16449:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16450:
	nop
	nop
	nop
	j	fbgt_cont.16448

fbgt_else.16447:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16448:
	nop
	nop
	nop
	j	fbgt_cont.16446

fbgt_else.16445:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16446:
	nop
	nop
	nop
	j	fbgt_cont.16444

fbgt_else.16443:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16444:
	nop
	nop
	nop
	j	fbgt_cont.16442

fbgt_else.16441:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16442:
	nop
	nop
	nop
	j	fbgt_cont.16440

fbgt_else.16439:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16440:
	nop
	nop
	nop
	j	fbgt_cont.16438

fbgt_else.16437:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16438:
	flw	%f1, 2(%sp)
	nop
	add	%k1, %zero, %hp
	nop

	flw	%f2, 1(%sp)
	nop
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10104

	sw	%v0, 0(%k1)
	nop
	nop
	nop

	fsw	%f1, 1(%k1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16467

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16469

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16471

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16473

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16475

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16477

	sw	%ra, 3(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16478

fbgt_else.16477:
	flw	%f1, 471(%zero)
	sw	%ra, 3(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

fbgt_cont.16478:
	nop
	nop
	nop
	j	fbgt_cont.16476

fbgt_else.16475:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16476:
	nop
	nop
	nop
	j	fbgt_cont.16474

fbgt_else.16473:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16479

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16481

	sw	%ra, 3(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16482

fbgt_else.16481:
	flw	%f1, 471(%zero)
	sw	%ra, 3(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

fbgt_cont.16482:
	nop
	nop
	nop
	j	fbgt_cont.16480

fbgt_else.16479:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16480:
fbgt_cont.16474:
	nop
	nop
	nop
	j	fbgt_cont.16472

fbgt_else.16471:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16472:
	nop
	nop
	nop
	j	fbgt_cont.16470

fbgt_else.16469:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16483

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16485

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16487

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16489

	sw	%ra, 3(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16490

fbgt_else.16489:
	flw	%f1, 471(%zero)
	sw	%ra, 3(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

fbgt_cont.16490:
	nop
	nop
	nop
	j	fbgt_cont.16488

fbgt_else.16487:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16488:
	nop
	nop
	nop
	j	fbgt_cont.16486

fbgt_else.16485:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16491

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16493

	sw	%ra, 3(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16494

fbgt_else.16493:
	flw	%f1, 471(%zero)
	sw	%ra, 3(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

fbgt_cont.16494:
	nop
	nop
	nop
	j	fbgt_cont.16492

fbgt_else.16491:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16492:
fbgt_cont.16486:
	nop
	nop
	nop
	j	fbgt_cont.16484

fbgt_else.16483:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16484:
fbgt_cont.16470:
	nop
	nop
	nop
	j	fbgt_cont.16468

fbgt_else.16467:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16468:
	flw	%f1, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16495

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16496

fbgt_else.16495:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.16496:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16497

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.16498

fbgt_else.16497:
fbgt_cont.16498:
	flw	%f2, 453(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16499

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16501

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16502

bnei_else.16501:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.16502:
	nop
	nop
	nop
	j	fbgt_cont.16500

fbgt_else.16499:
fbgt_cont.16500:
	flw	%f2, 453(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16503

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16504

fbgt_else.16503:
fbgt_cont.16504:
	flw	%f1, 452(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16505

	flw	%f2, 448(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	flw	%f3, 447(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f3, %f0
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	nop

	flw	%f3, 446(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 445(%zero)
	nop
	nop
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
	nop
	j	fbgt_cont.16506

fbgt_else.16505:
	flw	%f1, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 451(%zero)
	nop
	fsub	%f0, %f1, %f0
	nop

	flw	%f4, 450(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

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
	nop

	flw	%f4, 449(%zero)
	nop
	nop
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

fbgt_cont.16506:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16507

	nop
	nop
	nop
	jr	%ra

bnei_else.16507:
	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	jr	%ra

f.6155.10057:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16508

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16509

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16510

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16511

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16512

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16513

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16514

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16515

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16516

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16517

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16518

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16519

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16520

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16521

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16522

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16523

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	f.6155.10057

fbgt_else.16523:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16522:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16521:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16520:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16519:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16518:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16517:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16516:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16515:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16514:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16513:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16512:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16511:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16510:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16509:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.16508:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

g.6159.10061:
	flw	%f2, 1(%k1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16524

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16525

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16526

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16527

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16528

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16529

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16530

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16531

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16531:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16530:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16529:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16532

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16533

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16533:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16532:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16528:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16527:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16534

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16535

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16536

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16537

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16537:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16536:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16535:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16538

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16539

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16539:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16538:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16534:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16526:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16525:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16540

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16541

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16542

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16543

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16544

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16545

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16545:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16544:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16543:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16546

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16547

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16547:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16546:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16542:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16541:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16548

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16549

	flw	%f3, 471(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16550

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16551

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16551:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16550:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16549:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16552

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16553

	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16553:
	flw	%f2, 471(%zero)
	lw	%at, 0(%k1)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	jr	%at

fbgt_else.16552:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16548:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16540:
	nop
	nop
	nop
	jr	%ra

fbgt_else.16524:
	nop
	nop
	nop
	jr	%ra

sin.2618:
	flw	%f1, 470(%zero)
	nop
	nop
	nop

	flw	%f2, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16554

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.16555

fbgt_else.16554:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.16555:
	flw	%f2, 469(%zero)
	sw	%v0, 0(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 1(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%sp)
	nop
	nop
	nop

	fsw	%f2, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16556

	flw	%f3, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16558

	flw	%f3, 467(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16560

	flw	%f3, 466(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16562

	flw	%f3, 465(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16564

	flw	%f3, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16566

	flw	%f3, 463(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16568

	flw	%f3, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16570

	flw	%f3, 461(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16572

	flw	%f3, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16574

	flw	%f3, 459(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16576

	flw	%f3, 458(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16578

	flw	%f3, 457(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16580

	flw	%f3, 456(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16582

	flw	%f3, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16584

	flw	%f3, 454(%zero)
	sw	%ra, 4(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	f.6155.10057

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16585

fbgt_else.16584:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16585:
	nop
	nop
	nop
	j	fbgt_cont.16583

fbgt_else.16582:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16583:
	nop
	nop
	nop
	j	fbgt_cont.16581

fbgt_else.16580:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16581:
	nop
	nop
	nop
	j	fbgt_cont.16579

fbgt_else.16578:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16579:
	nop
	nop
	nop
	j	fbgt_cont.16577

fbgt_else.16576:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16577:
	nop
	nop
	nop
	j	fbgt_cont.16575

fbgt_else.16574:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16575:
	nop
	nop
	nop
	j	fbgt_cont.16573

fbgt_else.16572:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16573:
	nop
	nop
	nop
	j	fbgt_cont.16571

fbgt_else.16570:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16571:
	nop
	nop
	nop
	j	fbgt_cont.16569

fbgt_else.16568:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16569:
	nop
	nop
	nop
	j	fbgt_cont.16567

fbgt_else.16566:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16567:
	nop
	nop
	nop
	j	fbgt_cont.16565

fbgt_else.16564:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16565:
	nop
	nop
	nop
	j	fbgt_cont.16563

fbgt_else.16562:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16563:
	nop
	nop
	nop
	j	fbgt_cont.16561

fbgt_else.16560:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16561:
	nop
	nop
	nop
	j	fbgt_cont.16559

fbgt_else.16558:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.16559:
	nop
	nop
	nop
	j	fbgt_cont.16557

fbgt_else.16556:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16557:
	flw	%f1, 3(%sp)
	nop
	add	%k1, %zero, %hp
	nop

	flw	%f2, 2(%sp)
	nop
	addi	%hp, %hp, 2
	addi	%v0, %zero, g.6159.10061

	sw	%v0, 0(%k1)
	nop
	nop
	nop

	fsw	%f1, 1(%k1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16586

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16588

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16590

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16592

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16594

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16596

	sw	%ra, 4(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16597

fbgt_else.16596:
	flw	%f1, 471(%zero)
	sw	%ra, 4(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

fbgt_cont.16597:
	nop
	nop
	nop
	j	fbgt_cont.16595

fbgt_else.16594:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16595:
	nop
	nop
	nop
	j	fbgt_cont.16593

fbgt_else.16592:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16598

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16600

	sw	%ra, 4(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16601

fbgt_else.16600:
	flw	%f1, 471(%zero)
	sw	%ra, 4(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

fbgt_cont.16601:
	nop
	nop
	nop
	j	fbgt_cont.16599

fbgt_else.16598:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16599:
fbgt_cont.16593:
	nop
	nop
	nop
	j	fbgt_cont.16591

fbgt_else.16590:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16591:
	nop
	nop
	nop
	j	fbgt_cont.16589

fbgt_else.16588:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16602

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16604

	flw	%f3, 471(%zero)
	nop
	fsub	%f2, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16606

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16608

	sw	%ra, 4(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16609

fbgt_else.16608:
	flw	%f1, 471(%zero)
	sw	%ra, 4(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

fbgt_cont.16609:
	nop
	nop
	nop
	j	fbgt_cont.16607

fbgt_else.16606:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16607:
	nop
	nop
	nop
	j	fbgt_cont.16605

fbgt_else.16604:
	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16610

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16612

	sw	%ra, 4(%sp)
	lw	%at, 0(%k1)
	fsub	%f1, %f2, %f0
	nop

	flw	%f2, 471(%zero)
	nop
	fmov	%f29, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	fmov	%f0, %f29
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.16613

fbgt_else.16612:
	flw	%f1, 471(%zero)
	sw	%ra, 4(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	fdiv	%f1, %f0, %f1
	addi	%sp, %sp, 5

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

fbgt_cont.16613:
	nop
	nop
	nop
	j	fbgt_cont.16611

fbgt_else.16610:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16611:
fbgt_cont.16605:
	nop
	nop
	nop
	j	fbgt_cont.16603

fbgt_else.16602:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16603:
fbgt_cont.16589:
	nop
	nop
	nop
	j	fbgt_cont.16587

fbgt_else.16586:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.16587:
	flw	%f1, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16614

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16616

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16617

bnei_else.16616:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.16617:
	nop
	nop
	nop
	j	fbgt_cont.16615

fbgt_else.16614:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

fbgt_cont.16615:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16618

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.16619

fbgt_else.16618:
fbgt_cont.16619:
	flw	%f2, 453(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.16620

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16621

fbgt_else.16620:
fbgt_cont.16621:
	flw	%f1, 452(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16622

	flw	%f3, 451(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	flw	%f4, 450(%zero)
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
	nop

	flw	%f4, 449(%zero)
	nop
	nop
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
	nop
	j	fbgt_cont.16623

fbgt_else.16622:
	flw	%f1, 453(%zero)
	nop
	nop
	nop

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f1, %f0
	nop

	flw	%f3, 447(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f3, %f0
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	nop

	flw	%f3, 446(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 445(%zero)
	nop
	nop
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

fbgt_cont.16623:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16624

	nop
	nop
	nop
	jr	%ra

bnei_else.16624:
	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	jr	%ra

print_int_sub1.2622:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16625

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16626

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16627

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16628

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16629

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16630

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16631

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16632

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	print_int_sub1.2622

bgti_else.16632:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16631:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16630:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16629:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16628:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16627:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16626:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.16625:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

print_int_sub2.2625:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16633

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16634

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16635

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16636

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16637

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16638

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16639

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16640

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	j	print_int_sub2.2625

bgti_else.16640:
	nop
	nop
	nop
	jr	%ra

bgti_else.16639:
	nop
	nop
	nop
	jr	%ra

bgti_else.16638:
	nop
	nop
	nop
	jr	%ra

bgti_else.16637:
	nop
	nop
	nop
	jr	%ra

bgti_else.16636:
	nop
	nop
	nop
	jr	%ra

bgti_else.16635:
	nop
	nop
	nop
	jr	%ra

bgti_else.16634:
	nop
	nop
	nop
	jr	%ra

bgti_else.16633:
	nop
	nop
	nop
	jr	%ra

print_int.2627:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.16641

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16643

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16645

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16647

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16649

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16651

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16653

	sw	%ra, 1(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 7

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 2

	nop
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2622

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.16654

bgti_else.16653:
	nop
	nop
	addi	%v0, %zero, 6
	nop

bgti_cont.16654:
	nop
	nop
	nop
	j	bgti_cont.16652

bgti_else.16651:
	nop
	nop
	addi	%v0, %zero, 5
	nop

bgti_cont.16652:
	nop
	nop
	nop
	j	bgti_cont.16650

bgti_else.16649:
	nop
	nop
	addi	%v0, %zero, 4
	nop

bgti_cont.16650:
	nop
	nop
	nop
	j	bgti_cont.16648

bgti_else.16647:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.16648:
	nop
	nop
	nop
	j	bgti_cont.16646

bgti_else.16645:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.16646:
	nop
	nop
	nop
	j	bgti_cont.16644

bgti_else.16643:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.16644:
	nop
	nop
	nop
	j	bgti_cont.16642

bgti_else.16641:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.16642:
	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16655

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16657

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16659

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16661

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16663

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16665

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16667

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	print_int_sub2.2625

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.16668

bgti_else.16667:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16668:
	nop
	nop
	nop
	j	bgti_cont.16666

bgti_else.16665:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16666:
	nop
	nop
	nop
	j	bgti_cont.16664

bgti_else.16663:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16664:
	nop
	nop
	nop
	j	bgti_cont.16662

bgti_else.16661:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16662:
	nop
	nop
	nop
	j	bgti_cont.16660

bgti_else.16659:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16660:
	nop
	nop
	nop
	j	bgti_cont.16658

bgti_else.16657:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16658:
	nop
	nop
	nop
	j	bgti_cont.16656

bgti_else.16655:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16656:
	lw	%v1, 1(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.16669

	nop
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.16669:
	sw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16670

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16672

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16674

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16676

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16678

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16680

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.16682

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 7

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2622

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.16683

bgti_else.16682:
	nop
	nop
	addi	%v0, %zero, 6
	nop

bgti_cont.16683:
	nop
	nop
	nop
	j	bgti_cont.16681

bgti_else.16680:
	nop
	nop
	addi	%v0, %zero, 5
	nop

bgti_cont.16681:
	nop
	nop
	nop
	j	bgti_cont.16679

bgti_else.16678:
	nop
	nop
	addi	%v0, %zero, 4
	nop

bgti_cont.16679:
	nop
	nop
	nop
	j	bgti_cont.16677

bgti_else.16676:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.16677:
	nop
	nop
	nop
	j	bgti_cont.16675

bgti_else.16674:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.16675:
	nop
	nop
	nop
	j	bgti_cont.16673

bgti_else.16672:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.16673:
	nop
	nop
	nop
	j	bgti_cont.16671

bgti_else.16670:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.16671:
	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16684

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16686

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16688

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16690

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16692

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16694

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16696

	sw	%ra, 4(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	print_int_sub2.2625

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.16697

bgti_else.16696:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16697:
	nop
	nop
	nop
	j	bgti_cont.16695

bgti_else.16694:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16695:
	nop
	nop
	nop
	j	bgti_cont.16693

bgti_else.16692:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16693:
	nop
	nop
	nop
	j	bgti_cont.16691

bgti_else.16690:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16691:
	nop
	nop
	nop
	j	bgti_cont.16689

bgti_else.16688:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16689:
	nop
	nop
	nop
	j	bgti_cont.16687

bgti_else.16686:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16687:
	nop
	nop
	nop
	j	bgti_cont.16685

bgti_else.16684:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16685:
	lw	%v1, 3(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.16698

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.16698:
	sw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16699

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16701

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16703

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16705

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16707

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16709

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.16711

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	print_int_sub2.2625

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.16712

bgti_else.16711:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16712:
	nop
	nop
	nop
	j	bgti_cont.16710

bgti_else.16709:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16710:
	nop
	nop
	nop
	j	bgti_cont.16708

bgti_else.16707:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16708:
	nop
	nop
	nop
	j	bgti_cont.16706

bgti_else.16705:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16706:
	nop
	nop
	nop
	j	bgti_cont.16704

bgti_else.16703:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16704:
	nop
	nop
	nop
	j	bgti_cont.16702

bgti_else.16701:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16702:
	nop
	nop
	nop
	j	bgti_cont.16700

bgti_else.16699:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.16700:
	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	nop
	j	min_caml_print_char

vecunit_sgn.2655:
	flw	%f0, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16713

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16714

fbeq_else.16713:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.16714:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16715

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16716

bnei_else.16715:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16717

	flw	%f1, 443(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.16718

bnei_else.16717:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.16718:
bnei_cont.16716:
	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

vecaccumv.2679:
	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	nop
	nop

	flw	%f2, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 1(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f0, 1(%v0)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%v0)
	flw	%f1, 2(%v1)
	nop
	nop

	flw	%f0, 2(%v0)
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

read_screen_settings.2756:
	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 61

	lw	%ra, 0(%sp)
	fsw	%f0, 0(%v0)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 61

	lw	%ra, 0(%sp)
	fsw	%f0, 1(%v0)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 61

	lw	%ra, 0(%sp)
	fsw	%f0, 2(%v0)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -1
	nop

	lw	%ra, 0(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 0(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
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

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	flw	%f1, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	sin.2618

	flw	%f3, 441(%zero)
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	addi	%v0, %zero, 160
	nop

	flw	%f1, 1(%sp)
	flw	%f5, 441(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	fsw	%f2, 0(%v0)
	flw	%f3, 2(%sp)
	nop
	nop

	flw	%f2, 440(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f3, %f2
	addi	%v0, %zero, 160

	fsw	%f2, 1(%v0)
	nop
	nop
	nop

	flw	%f2, 4(%sp)
	nop
	addi	%v0, %zero, 160
	nop

	nop
	nop
	fmul	%f4, %f1, %f2
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	fsw	%f4, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 154
	nop

	fsw	%f2, 0(%v0)
	flw	%f4, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 154
	nop

	fsw	%f4, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f4, %f0
	addi	%v0, %zero, 154

	fsw	%f4, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f4, %f3
	addi	%v0, %zero, 157

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f1
	addi	%v0, %zero, 157

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f3
	addi	%v0, %zero, 157

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 61
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 160
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 61
	nop

	flw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 160
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 61
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 160
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 64

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

read_light.2758:
	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -1
	nop

	lw	%ra, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -1
	nop

	lw	%ra, 0(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -2
	fneg	%f0, %f0

	lw	%ra, 1(%sp)
	nop
	addi	%v0, %zero, 67
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 0(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	flw	%f1, 1(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 67

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 1(%sp)
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
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 67

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 70

	lw	%ra, 3(%sp)
	fsw	%f0, 0(%v0)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2760:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
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

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	fsw	%f0, 2(%sp)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	fsw	%f0, 3(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	fsw	%f0, 4(%sp)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%v0)
	fsw	%f0, 5(%sp)
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%v0)
	fsw	%f0, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	flw	%f1, 6(%sp)
	nop
	nop
	nop

	flw	%f2, 4(%sp)
	nop
	nop
	nop

	flw	%f4, 5(%sp)
	nop
	fmul	%f3, %f2, %f1
	nop

	flw	%f5, 3(%sp)
	nop
	fmul	%f12, %f3, %f3
	nop

	flw	%f7, 2(%sp)
	nop
	fmul	%f6, %f5, %f4
	nop

	lw	%v0, 0(%sp)
	nop
	fmul	%f6, %f6, %f1
	fmul	%f8, %f7, %f0

	nop
	nop
	fsub	%f6, %f6, %f8
	fmul	%f9, %f5, %f0

	nop
	nop
	fmul	%f8, %f7, %f4
	nop

	nop
	nop
	fmul	%f8, %f8, %f1
	fmul	%f10, %f5, %f4

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f10, %f10, %f0

	nop
	nop
	fmul	%f9, %f2, %f0
	fmul	%f11, %f7, %f1

	nop
	nop
	fadd	%f10, %f10, %f11
	fmul	%f1, %f5, %f1

	nop
	nop
	fmul	%f11, %f7, %f4
	fmul	%f13, %f9, %f9

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	flw	%f11, 2(%v0)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f1, %f4
	nop

	nop
	nop
	fmul	%f4, %f5, %f2
	nop

	flw	%f5, 0(%v0)
	nop
	fmul	%f2, %f7, %f2
	nop

	flw	%f7, 1(%v0)
	nop
	fmul	%f12, %f5, %f12
	nop

	nop
	nop
	fmul	%f13, %f7, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	fmul	%f14, %f7, %f10

	nop
	nop
	fmul	%f13, %f1, %f1
	fmul	%f14, %f14, %f0

	nop
	nop
	fmul	%f13, %f11, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	nop

	fsw	%f12, 0(%v0)
	nop
	fmul	%f13, %f10, %f10
	nop

	nop
	nop
	fmul	%f12, %f6, %f6
	fmul	%f13, %f7, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f4, %f4
	nop

	nop
	nop
	fmul	%f13, %f11, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	nop

	fsw	%f12, 1(%v0)
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f12, %f8, %f8
	fmul	%f13, %f7, %f13

	nop
	nop
	fmul	%f12, %f5, %f12
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f2, %f2
	nop

	nop
	nop
	fmul	%f13, %f11, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	nop

	fsw	%f12, 2(%v0)
	nop
	fmul	%f13, %f5, %f6
	nop

	flw	%f12, 471(%zero)
	lw	%v0, 1(%sp)
	fmul	%f13, %f13, %f8
	nop

	nop
	nop
	fadd	%f13, %f13, %f14
	nop

	nop
	nop
	fmul	%f14, %f11, %f4
	nop

	nop
	nop
	fmul	%f14, %f14, %f2
	nop

	nop
	nop
	fadd	%f13, %f13, %f14
	nop

	nop
	nop
	fmul	%f12, %f12, %f13
	nop

	fsw	%f12, 0(%v0)
	nop
	fmul	%f13, %f5, %f3
	nop

	flw	%f12, 471(%zero)
	nop
	fmul	%f8, %f13, %f8
	nop

	nop
	nop
	fmul	%f13, %f7, %f9
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f11, %f1
	nop

	nop
	nop
	fmul	%f2, %f8, %f2
	fmul	%f1, %f11, %f1

	nop
	nop
	fadd	%f0, %f0, %f2
	fmul	%f1, %f1, %f4

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f2, %f5, %f3

	fsw	%f0, 1(%v0)
	nop
	fmul	%f2, %f2, %f6
	fmul	%f3, %f7, %f9

	flw	%f0, 471(%zero)
	nop
	fmul	%f3, %f3, %f10
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	nop
	nop
	fadd	%f1, %f2, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

read_nth_object.2763:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16724

	sw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
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

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
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

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 3

	lw	%ra, 4(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	sw	%ra, 6(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 6(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 3

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%v0)
	sw	%ra, 6(%sp)
	nop
	nop

	flw	%f0, 444(%zero)
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
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

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%v0)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 444(%zero)
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16725

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16726

fbgt_else.16725:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.16726:
	sw	%v0, 7(%sp)
	nop
	addi	%v1, %zero, 2
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 8(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
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

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	sw	%ra, 9(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 3

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 9(%sp)
	nop
	nop

	flw	%f0, 444(%zero)
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	sw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	sw	%ra, 10(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 10(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %zero, 3

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%v0)
	sw	%ra, 10(%sp)
	nop
	nop

	flw	%f0, 444(%zero)
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16727

	sw	%v0, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	sw	%ra, 11(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%ra, 11(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 442(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16728

bnei_else.16727:
bnei_cont.16728:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.16729

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16730

bnei_else.16729:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.16730:
	sw	%a0, 11(%sp)
	nop
	addi	%a1, %zero, 4
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 10(%sp)
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	add	%v1, %zero, %hp

	lw	%ra, 12(%sp)
	sw	%v0, 10(%v1)
	addi	%hp, %hp, 11
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 9(%v1)
	lw	%a0, 9(%sp)
	nop
	nop

	sw	%a0, 8(%v1)
	lw	%a1, 4(%sp)
	nop
	nop

	lw	%a0, 8(%sp)
	nop
	nop
	nop

	sw	%a0, 7(%v1)
	lw	%a2, 3(%sp)
	nop
	nop

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	sw	%a0, 6(%v1)
	lw	%a3, 1(%sp)
	nop
	nop

	lw	%a0, 6(%sp)
	nop
	nop
	nop

	sw	%a0, 5(%v1)
	lw	%t0, 0(%sp)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 4(%v1)
	nop
	nop
	nop

	sw	%a1, 3(%v1)
	nop
	nop
	nop

	sw	%a2, 2(%v1)
	nop
	nop
	nop

	lw	%a2, 2(%sp)
	nop
	nop
	nop

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	add	%at, %a3, %t0
	nop

	sw	%v1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.16731

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.16733

	nop
	nop
	nop
	j	bnei_cont.16734

bnei_else.16733:
	lw	%v1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16735

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16736

bnei_else.16735:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.16736:
	sw	%ra, 12(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	vecunit_sgn.2655

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

bnei_cont.16734:
	nop
	nop
	nop
	j	bnei_cont.16732

bnei_else.16731:
	flw	%f0, 0(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16737

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16738

fbeq_else.16737:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16738:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16739

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16740

bnei_else.16739:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16741

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16742

fbeq_else.16741:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16742:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16743

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16744

bnei_else.16743:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16745

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16746

fbgt_else.16745:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16746:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16747

	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16748

bnei_else.16747:
	flw	%f1, 443(%zero)
	nop
	nop
	nop

bnei_cont.16748:
bnei_cont.16744:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.16740:
	fsw	%f0, 0(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16749

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16750

fbeq_else.16749:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16750:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16751

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16752

bnei_else.16751:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16753

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16754

fbeq_else.16753:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16754:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16755

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16756

bnei_else.16755:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16757

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16758

fbgt_else.16757:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16758:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16759

	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16760

bnei_else.16759:
	flw	%f1, 443(%zero)
	nop
	nop
	nop

bnei_cont.16760:
bnei_cont.16756:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.16752:
	fsw	%f0, 1(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16761

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16762

fbeq_else.16761:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16762:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16763

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16764

bnei_else.16763:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16765

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16766

fbeq_else.16765:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.16766:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16767

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16768

bnei_else.16767:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16769

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16770

fbgt_else.16769:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16770:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16771

	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16772

bnei_else.16771:
	flw	%f1, 443(%zero)
	nop
	nop
	nop

bnei_cont.16772:
bnei_cont.16768:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.16764:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.16732:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16773

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2760

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16774

bnei_else.16773:
bnei_cont.16774:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16724:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

read_object.2765:
	nop
	nop
	nop
	blti	%v0, 60, bgti_else.16775

	nop
	nop
	nop
	jr	%ra

bgti_else.16775:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	read_nth_object.2763

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16777

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.16778

	nop
	nop
	nop
	jr	%ra

bgti_else.16778:
	sw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	read_nth_object.2763

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16780

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.16781

	nop
	nop
	nop
	jr	%ra

bgti_else.16781:
	sw	%v0, 2(%sp)
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
	nop

	nop
	nop
	nop
	jal	read_nth_object.2763

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16783

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blti	%v0, 60, bgti_else.16784

	nop
	nop
	nop
	jr	%ra

bgti_else.16784:
	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	read_nth_object.2763

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16786

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	read_object.2765

bnei_else.16786:
	lw	%v1, 3(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16783:
	lw	%v1, 2(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16780:
	lw	%v1, 1(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16777:
	lw	%v1, 0(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

read_net_item.2769:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16791

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	addi	%a0, %v1, 1
	nop

	sw	%a0, 2(%sp)
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
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16792

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%a0, %v1, 1
	nop

	sw	%a0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16794

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%sp)
	nop
	addi	%a0, %v1, 1
	nop

	sw	%a0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16796

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 7(%sp)
	nop
	addi	%a0, %v1, 1
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	read_net_item.2769

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16797

bnei_else.16796:
	lw	%v0, 6(%sp)
	nop
	addi	%v1, %zero, -1
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.16797:
	lw	%v1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16795

bnei_else.16794:
	lw	%v0, 4(%sp)
	nop
	addi	%v1, %zero, -1
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.16795:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16793

bnei_else.16792:
	lw	%v0, 2(%sp)
	nop
	addi	%v1, %zero, -1
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.16793:
	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16791:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %zero, -1
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	min_caml_create_array

read_or_network.2771:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16798

	sw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16800

	sw	%v0, 2(%sp)
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
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16802

	sw	%v0, 3(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	read_net_item.2769

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16803

bnei_else.16802:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16803:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16801

bnei_else.16800:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16801:
	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%v1, %zero, %v0
	nop

	nop
	nop
	nop
	j	bnei_cont.16799

bnei_else.16798:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16799:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16804

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 4(%sp)
	nop
	addi	%a0, %v0, 1
	nop

	sw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16805

	sw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16807

	sw	%v0, 7(%sp)
	nop
	addi	%v1, %zero, 2
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	read_net_item.2769

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 7(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16808

bnei_else.16807:
	sw	%ra, 8(%sp)
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.16808:
	lw	%v1, 6(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%v1, %zero, %v0
	nop

	nop
	nop
	nop
	j	bnei_cont.16806

bnei_else.16805:
	sw	%ra, 8(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.16806:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16809

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%v1, 8(%sp)
	nop
	addi	%a0, %v0, 1
	nop

	sw	%ra, 9(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	read_or_network.2771

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	lw	%a0, 8(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16810

bnei_else.16809:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.16810:
	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	add	%at, %v0, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16804:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	min_caml_create_array

read_and_network.2773:
	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16811

	sw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16813

	sw	%v0, 2(%sp)
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
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16815

	sw	%v0, 3(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	read_net_item.2769

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16816

bnei_else.16815:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16816:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16814

bnei_else.16813:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16814:
	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16812

bnei_else.16811:
	sw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.16812:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.16817

	lw	%a0, 0(%sp)
	nop
	addi	%v1, %zero, 72
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a0, 1
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16818

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.16820

	sw	%v0, 6(%sp)
	nop
	addi	%v1, %zero, 2
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	read_net_item.2769

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16821

bnei_else.16820:
	sw	%ra, 7(%sp)
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

bnei_cont.16821:
	lw	%v1, 5(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16819

bnei_else.16818:
	sw	%ra, 7(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %zero, -1
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

bnei_cont.16819:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.16822

	lw	%a0, 4(%sp)
	nop
	addi	%v1, %zero, 72
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a0, 1
	nop

	nop
	nop
	nop
	j	read_and_network.2773

bnei_else.16822:
	nop
	nop
	nop
	jr	%ra

bnei_else.16817:
	nop
	nop
	nop
	jr	%ra

solver_rect_surface.2777:
	flw	%f4, 444(%zero)
	nop
	add	%at, %v1, %a0
	nop

	flw	%f3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.16825

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16826

fbeq_else.16825:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.16826:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.16827

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16827:
	lw	%a3, 4(%v0)
	flw	%f4, 444(%zero)
	add	%at, %v1, %a0
	nop

	lw	%v0, 6(%v0)
	flw	%f3, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.16828

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16829

fbgt_else.16828:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.16829:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16830

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.16832

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16833

bnei_else.16832:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.16833:
	nop
	nop
	nop
	j	bnei_cont.16831

bnei_else.16830:
	nop
	nop
	add	%v0, %zero, %t0
	nop

bnei_cont.16831:
	nop
	nop
	add	%at, %a3, %a0
	nop

	flw	%f3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16834

	nop
	nop
	nop
	j	bnei_cont.16835

bnei_else.16834:
	nop
	nop
	fneg	%f3, %f3
	nop

bnei_cont.16835:
	nop
	nop
	fsub	%f0, %f3, %f0
	add	%at, %v1, %a0

	flw	%f3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	add	%at, %v1, %a1

	flw	%f3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f0, %f3
	add	%at, %a3, %a1

	nop
	nop
	fadd	%f1, %f3, %f1
	nop

	flw	%f3, 0(%at)
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.16836

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16837

fbgt_else.16836:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.16837:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16838

	nop
	nop
	add	%at, %v1, %a2
	nop

	flw	%f1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f0, %f1
	add	%at, %a3, %a2

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 0(%at)
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.16839

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16840

fbgt_else.16839:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.16840:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16841

	nop
	nop
	addi	%v0, %zero, 124
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16841:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16838:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_surface.2792:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	nop
	nop

	flw	%f4, 0(%v0)
	nop
	nop
	nop

	flw	%f5, 1(%v0)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f5, 2(%v0)
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f3, fbgt_else.16842

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16843

fbgt_else.16842:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16843:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16844

	flw	%f4, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	flw	%f4, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f4, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 124

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

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16844:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

quadratic.2798:
	lw	%v1, 4(%v0)
	nop
	fmul	%f3, %f0, %f0
	nop

	flw	%f4, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f5, 1(%v1)
	nop
	fmul	%f4, %f1, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f5, 2(%v1)
	nop
	fadd	%f3, %f3, %f4
	nop

	lw	%v1, 3(%v0)
	nop
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
	nop
	beqi	%v1, 0, bnei_else.16845

	lw	%v1, 9(%v0)
	nop
	fmul	%f4, %f1, %f2
	nop

	flw	%f5, 0(%v1)
	nop
	fmul	%f2, %f2, %f0
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f4, %f4, %f5
	fmul	%f0, %f0, %f1

	lw	%v0, 9(%v0)
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 1(%v1)
	flw	%f1, 2(%v0)
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f4
	fmul	%f0, %f0, %f1

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
	nop
	jr	%ra

bnei_else.16845:
	nop
	nop
	fmov	%f0, %f3
	nop

	nop
	nop
	nop
	jr	%ra

bilinear.2803:
	lw	%v1, 4(%v0)
	nop
	fmul	%f6, %f0, %f3
	nop

	flw	%f7, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f6, %f6, %f7
	nop

	flw	%f8, 1(%v1)
	nop
	fmul	%f7, %f1, %f4
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f7, %f7, %f8
	nop

	flw	%f8, 2(%v1)
	nop
	fadd	%f6, %f6, %f7
	nop

	lw	%v1, 3(%v0)
	nop
	fmul	%f7, %f2, %f5
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
	nop
	beqi	%v1, 0, bnei_else.16846

	lw	%v1, 9(%v0)
	nop
	fmul	%f7, %f2, %f4
	fmul	%f8, %f1, %f5

	nop
	nop
	fadd	%f7, %f7, %f8
	fmul	%f5, %f0, %f5

	flw	%f8, 0(%v1)
	nop
	fmul	%f2, %f2, %f3
	fmul	%f0, %f0, %f4

	lw	%v1, 9(%v0)
	nop
	fmul	%f7, %f7, %f8
	fadd	%f2, %f5, %f2

	flw	%f5, 1(%v1)
	lw	%v0, 9(%v0)
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f2, %f2, %f5
	fadd	%f0, %f0, %f1

	flw	%f1, 2(%v0)
	nop
	fadd	%f2, %f7, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 447(%zero)
	nop
	fadd	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fadd	%f0, %f6, %f0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16846:
	nop
	nop
	fmov	%f0, %f6
	nop

	nop
	nop
	nop
	jr	%ra

solver_second.2811:
	flw	%f3, 0(%v1)
	fsw	%f2, 0(%sp)
	nop
	nop

	flw	%f4, 1(%v1)
	fsw	%f1, 1(%sp)
	nop
	nop

	flw	%f5, 2(%v1)
	fsw	%f0, 2(%sp)
	fmov	%f1, %f4
	nop

	sw	%v0, 3(%sp)
	nop
	fmov	%f2, %f5
	fmov	%f0, %f3

	sw	%v1, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	flw	%f1, 444(%zero)
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16847

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16848

fbeq_else.16847:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbeq_cont.16848:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16849

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16849:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	flw	%f4, 2(%sp)
	nop
	nop

	flw	%f2, 1(%v0)
	flw	%f5, 1(%sp)
	nop
	nop

	flw	%f3, 2(%v0)
	flw	%f6, 0(%sp)
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f2
	addi	%sp, %sp, 7

	nop
	nop
	fmov	%f2, %f3
	nop

	nop
	nop
	fmov	%f3, %f4
	nop

	nop
	nop
	fmov	%f4, %f5
	nop

	nop
	nop
	fmov	%f5, %f6
	nop

	nop
	nop
	nop
	jal	bilinear.2803

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%sp)
	nop
	nop
	nop

	flw	%f2, 1(%sp)
	nop
	nop
	nop

	flw	%f3, 0(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f2
	addi	%sp, %sp, 8

	nop
	nop
	fmov	%f2, %f3
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.16850

	nop
	nop
	nop
	j	bnei_cont.16851

bnei_else.16850:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.16851:
	flw	%f1, 6(%sp)
	nop
	nop
	nop

	flw	%f3, 5(%sp)
	nop
	fmul	%f2, %f1, %f1
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	flw	%f2, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16852

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16853

fbgt_else.16852:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16853:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16854

	lw	%v0, 6(%v0)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16855

	nop
	nop
	nop
	j	bnei_cont.16856

bnei_else.16855:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.16856:
	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 124

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16854:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver.2817:
	flw	%f0, 0(%a0)
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 5(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%a1)
	nop
	nop
	nop

	lw	%a1, 5(%v0)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 1(%a0)
	flw	%f2, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%v0)
	nop
	nop
	nop

	flw	%f3, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.16857

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.16858

	nop
	nop
	nop
	j	solver_second.2811

bnei_else.16858:
	lw	%v0, 4(%v0)
	flw	%f3, 0(%v1)
	nop
	nop

	flw	%f4, 0(%v0)
	nop
	nop
	nop

	flw	%f5, 1(%v0)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f5, 2(%v0)
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f3, fbgt_else.16859

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16860

fbgt_else.16859:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16860:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16861

	flw	%f4, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	flw	%f4, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f4, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 124

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

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16861:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16857:
	fsw	%f0, 0(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	fsw	%f2, 1(%sp)
	nop
	addi	%a1, %zero, 1
	nop

	fsw	%f1, 2(%sp)
	nop
	addi	%a2, %zero, 2
	nop

	sw	%v1, 3(%sp)
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

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16862

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16862:
	flw	%f0, 2(%sp)
	nop
	addi	%a0, %zero, 1
	nop

	flw	%f1, 1(%sp)
	nop
	addi	%a1, %zero, 2
	nop

	flw	%f2, 0(%sp)
	nop
	addi	%a2, %zero, 0
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16863

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16863:
	flw	%f0, 1(%sp)
	nop
	addi	%a0, %zero, 2
	nop

	flw	%f1, 0(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	flw	%f2, 2(%sp)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16864

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16864:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_rect_fast.2821:
	flw	%f3, 0(%a0)
	lw	%a1, 4(%v0)
	nop
	nop

	flw	%f4, 1(%a0)
	flw	%f5, 1(%a1)
	fsub	%f3, %f3, %f0
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 1(%v1)
	nop
	nop
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
	fabs	%f4, %f4
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.16865

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16866

fbgt_else.16865:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.16866:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16867

	flw	%f4, 2(%v1)
	lw	%a1, 4(%v0)
	nop
	nop

	flw	%f5, 2(%a1)
	nop
	fmul	%f4, %f3, %f4
	nop

	nop
	nop
	fadd	%f4, %f4, %f2
	nop

	nop
	nop
	fabs	%f4, %f4
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.16869

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16870

fbgt_else.16869:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.16870:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16871

	flw	%f4, 1(%a0)
	flw	%f5, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f5, fbeq_else.16873

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16874

fbeq_else.16873:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.16874:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16875

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16876

bnei_else.16875:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.16876:
	nop
	nop
	nop
	j	bnei_cont.16872

bnei_else.16871:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.16872:
	nop
	nop
	nop
	j	bnei_cont.16868

bnei_else.16867:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.16868:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16877

	nop
	nop
	addi	%v0, %zero, 124
	nop

	fsw	%f3, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16877:
	flw	%f3, 2(%a0)
	lw	%a1, 4(%v0)
	nop
	nop

	flw	%f4, 3(%a0)
	flw	%f5, 0(%a1)
	fsub	%f3, %f3, %f1
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 0(%v1)
	nop
	nop
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
	fabs	%f4, %f4
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.16878

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16879

fbgt_else.16878:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.16879:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16880

	flw	%f4, 2(%v1)
	lw	%a1, 4(%v0)
	nop
	nop

	flw	%f5, 2(%a1)
	nop
	fmul	%f4, %f3, %f4
	nop

	nop
	nop
	fadd	%f4, %f4, %f2
	nop

	nop
	nop
	fabs	%f4, %f4
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.16882

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16883

fbgt_else.16882:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.16883:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16884

	flw	%f4, 3(%a0)
	flw	%f5, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f5, fbeq_else.16886

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16887

fbeq_else.16886:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.16887:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16888

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16889

bnei_else.16888:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.16889:
	nop
	nop
	nop
	j	bnei_cont.16885

bnei_else.16884:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.16885:
	nop
	nop
	nop
	j	bnei_cont.16881

bnei_else.16880:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.16881:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16890

	nop
	nop
	addi	%v0, %zero, 124
	nop

	fsw	%f3, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16890:
	flw	%f3, 4(%a0)
	lw	%a1, 4(%v0)
	nop
	nop

	nop
	nop
	fsub	%f2, %f3, %f2
	nop

	flw	%f3, 5(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f2, %f3
	nop

	nop
	nop
	fadd	%f0, %f3, %f0
	nop

	flw	%f3, 0(%a1)
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16891

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16892

fbgt_else.16891:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.16892:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16893

	flw	%f0, 1(%v1)
	lw	%v0, 4(%v0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v0)
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16895

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16896

fbgt_else.16895:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.16896:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16897

	flw	%f0, 5(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16899

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16900

fbeq_else.16899:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbeq_cont.16900:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16901

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16902

bnei_else.16901:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.16902:
	nop
	nop
	nop
	j	bnei_cont.16898

bnei_else.16897:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.16898:
	nop
	nop
	nop
	j	bnei_cont.16894

bnei_else.16893:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.16894:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16903

	nop
	nop
	addi	%v0, %zero, 124
	nop

	fsw	%f2, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16903:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_second_fast.2834:
	flw	%f3, 0(%v1)
	flw	%f4, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.16904

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16905

fbeq_else.16904:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.16905:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16906

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16906:
	flw	%f4, 1(%v1)
	nop
	nop
	nop

	flw	%f5, 2(%v1)
	nop
	fmul	%f4, %f4, %f0
	nop

	sw	%v1, 0(%sp)
	nop
	fmul	%f5, %f5, %f1
	nop

	fsw	%f3, 1(%sp)
	nop
	fadd	%f4, %f4, %f5
	nop

	flw	%f5, 3(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f2
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	fsw	%f4, 2(%sp)
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

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.16907

	nop
	nop
	nop
	j	bnei_cont.16908

bnei_else.16907:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.16908:
	flw	%f1, 2(%sp)
	nop
	nop
	nop

	flw	%f3, 1(%sp)
	nop
	fmul	%f2, %f1, %f1
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	flw	%f2, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.16909

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16910

fbgt_else.16909:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16910:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16911

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16912

	lw	%v0, 0(%sp)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16913

bnei_else.16912:
	lw	%v0, 0(%sp)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	flw	%f1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

bnei_cont.16913:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16911:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_second_fast2.2851:
	flw	%f3, 0(%v1)
	flw	%f4, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.16914

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16915

fbeq_else.16914:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.16915:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16916

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16916:
	flw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f4, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 3(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 3(%a0)
	nop
	fmul	%f2, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.16917

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16918

fbgt_else.16917:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.16918:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16919

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16920

	nop
	nop
	fsqrt	%f1, %f1
	addi	%v0, %zero, 124

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 4(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16921

bnei_else.16920:
	nop
	nop
	fsqrt	%f1, %f1
	addi	%v0, %zero, 124

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 4(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

bnei_cont.16921:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16919:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_fast2.2858:
	lw	%a2, 1(%v1)
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 10(%a0)
	nop
	add	%at, %a2, %v0
	nop

	flw	%f0, 0(%a1)
	lw	%v0, 0(%at)
	nop
	nop

	flw	%f1, 1(%a1)
	lw	%a2, 1(%a0)
	nop
	nop

	flw	%f2, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.16922

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.16923

	nop
	nop
	addi	%v1, %v0, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	j	solver_second_fast2.2851

bnei_else.16923:
	flw	%f0, 0(%v0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16924

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16925

fbgt_else.16924:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16925:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16926

	flw	%f0, 0(%v0)
	flw	%f1, 3(%a1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 124

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16926:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.16922:
	lw	%v1, 0(%v1)
	nop
	addi	%k0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	j	solver_rect_fast.2821

setup_rect_table.2861:
	sw	%v1, 0(%sp)
	nop
	addi	%a0, %zero, 6
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 444(%zero)
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16927

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16928

fbeq_else.16927:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.16928:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16929

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16930

bnei_else.16929:
	lw	%a0, 0(%sp)
	flw	%f0, 0(%v1)
	nop
	nop

	lw	%a1, 6(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16931

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16932

fbgt_else.16931:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.16932:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16933

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.16935

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16936

bnei_else.16935:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.16936:
	nop
	nop
	nop
	j	bnei_cont.16934

bnei_else.16933:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.16934:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16937

	nop
	nop
	nop
	j	bnei_cont.16938

bnei_else.16937:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.16938:
	fsw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	nop
	nop

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.16930:
	flw	%f0, 1(%v1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16939

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16940

fbeq_else.16939:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.16940:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16941

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16942

bnei_else.16941:
	lw	%a0, 0(%sp)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%a1, 6(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16943

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16944

fbgt_else.16943:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.16944:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16945

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.16947

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16948

bnei_else.16947:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.16948:
	nop
	nop
	nop
	j	bnei_cont.16946

bnei_else.16945:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.16946:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16949

	nop
	nop
	nop
	j	bnei_cont.16950

bnei_else.16949:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.16950:
	fsw	%f0, 2(%v0)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.16942:
	flw	%f0, 2(%v1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16951

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16952

fbeq_else.16951:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.16952:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.16953

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16954

bnei_else.16953:
	lw	%a0, 0(%sp)
	flw	%f0, 2(%v1)
	nop
	nop

	lw	%a1, 6(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16955

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16956

fbgt_else.16955:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.16956:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16957

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.16959

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.16960

bnei_else.16959:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.16960:
	nop
	nop
	nop
	j	bnei_cont.16958

bnei_else.16957:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.16958:
	lw	%a0, 4(%a0)
	nop
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16961

	nop
	nop
	nop
	j	bnei_cont.16962

bnei_else.16961:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.16962:
	fsw	%f0, 4(%v0)
	flw	%f1, 2(%v1)
	nop
	nop

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.16954:
	nop
	nop
	nop
	jr	%ra

setup_surface_table.2864:
	sw	%v1, 0(%sp)
	nop
	addi	%a0, %zero, 4
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%a1, 4(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%a1)
	nop
	nop
	nop

	lw	%a1, 4(%a0)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%a0)
	nop
	nop
	nop

	flw	%f2, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.16963

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16964

fbgt_else.16963:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16964:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16965

	flw	%f1, 443(%zero)
	lw	%v1, 4(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%a0)
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%a0)
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	nop
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16966

bnei_else.16965:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

bnei_cont.16966:
	nop
	nop
	nop
	jr	%ra

setup_second_table.2867:
	sw	%v1, 0(%sp)
	nop
	addi	%a0, %zero, 5
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	flw	%f1, 1(%v1)
	sw	%v0, 2(%sp)
	nop
	nop

	flw	%f2, 2(%v1)
	sw	%ra, 3(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	nop
	nop

	lw	%a0, 4(%v1)
	nop
	nop
	nop

	flw	%f2, 0(%a0)
	lw	%a1, 3(%v1)
	nop
	nop

	lw	%a0, 4(%v1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 1(%v0)
	flw	%f3, 1(%a0)
	fneg	%f1, %f1
	nop

	lw	%a0, 4(%v1)
	nop
	fmul	%f2, %f2, %f3
	nop

	flw	%f3, 2(%v0)
	flw	%f4, 2(%a0)
	fneg	%f2, %f2
	nop

	lw	%a0, 2(%sp)
	nop
	fmul	%f3, %f3, %f4
	nop

	fsw	%f0, 0(%a0)
	nop
	fneg	%f3, %f3
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.16967

	flw	%f4, 2(%v0)
	lw	%a1, 9(%v1)
	nop
	nop

	flw	%f5, 1(%a1)
	nop
	nop
	nop

	lw	%a1, 9(%v1)
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f5, 1(%v0)
	flw	%f6, 2(%a1)
	nop
	nop

	lw	%a1, 9(%v1)
	nop
	fmul	%f5, %f5, %f6
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	flw	%f5, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fsub	%f1, %f1, %f4
	nop

	fsw	%f1, 1(%a0)
	flw	%f4, 0(%a1)
	nop
	nop

	flw	%f1, 2(%v0)
	lw	%a1, 9(%v1)
	nop
	nop

	flw	%f5, 2(%a1)
	nop
	fmul	%f1, %f1, %f4
	nop

	flw	%f4, 0(%v0)
	lw	%a1, 9(%v1)
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f1, %f1, %f4
	nop

	flw	%f4, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f4
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%a0)
	flw	%f2, 0(%a1)
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	lw	%v0, 9(%v1)
	nop
	nop
	nop

	flw	%f4, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f4
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f1, %f3, %f1
	nop

	fsw	%f1, 3(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16968

bnei_else.16967:
	fsw	%f1, 1(%a0)
	nop
	nop
	nop

	fsw	%f2, 2(%a0)
	nop
	nop
	nop

	fsw	%f3, 3(%a0)
	nop
	nop
	nop

bnei_cont.16968:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.16969

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.16970

fbeq_else.16969:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbeq_cont.16970:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.16971

	nop
	nop
	nop
	j	bnei_cont.16972

bnei_else.16971:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 4(%a0)
	nop
	nop
	nop

bnei_cont.16972:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2870:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.16973

	lw	%a1, 1(%v0)
	nop
	addi	%a0, %zero, 1
	nop

	lw	%a2, 0(%v0)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%v0, 0(%sp)
	nop
	nop

	lw	%a3, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.16974

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.16976

	sw	%v1, 1(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16977

bnei_else.16976:
	sw	%v1, 1(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.16977:
	nop
	nop
	nop
	j	bnei_cont.16975

bnei_else.16974:
	sw	%v1, 1(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.16975:
	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.16978

	lw	%a0, 0(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	lw	%a1, 1(%a0)
	nop
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	lw	%a2, 0(%a0)
	nop
	nop

	lw	%a3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.16979

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.16981

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.16982

bnei_else.16981:
	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.16982:
	nop
	nop
	nop
	j	bnei_cont.16980

bnei_else.16979:
	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.16980:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2870

bgti_else.16978:
	nop
	nop
	nop
	jr	%ra

bgti_else.16973:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2875:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.16985

	flw	%f0, 0(%v0)
	nop
	addi	%a0, %zero, 1
	nop

	sw	%v0, 0(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%v1, 1(%sp)
	nop
	nop

	lw	%a1, 10(%a0)
	nop
	nop
	nop

	lw	%a2, 1(%a0)
	nop
	nop
	nop

	lw	%a3, 5(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a0)
	nop
	fsub	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a1)
	flw	%f1, 1(%a3)
	nop
	nop

	flw	%f0, 1(%v0)
	lw	%a3, 5(%a0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%a1)
	flw	%f1, 2(%a3)
	nop
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.16986

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.16988

	nop
	nop
	nop
	j	bgt_cont.16989

bgt_else.16988:
	flw	%f0, 0(%a1)
	nop
	addi	%v0, %a0, 0
	nop

	flw	%f1, 1(%a1)
	nop
	nop
	nop

	flw	%f2, 2(%a1)
	nop
	nop
	nop

	sw	%a1, 2(%sp)
	nop
	nop
	nop

	sw	%a2, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.16990

	nop
	nop
	nop
	j	bnei_cont.16991

bnei_else.16990:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.16991:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bgt_cont.16989:
	nop
	nop
	nop
	j	bnei_cont.16987

bnei_else.16986:
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 1(%a1)
	flw	%f3, 0(%a0)
	nop
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f0, %f3, %f0
	nop

	flw	%f3, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 3(%a1)
	nop
	nop
	nop

bnei_cont.16987:
	lw	%v0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, -1
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	setup_startp_constants.2875

bgti_else.16985:
	nop
	nop
	nop
	jr	%ra

is_rect_outside.2880:
	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f0
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.16993

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16994

fbgt_else.16993:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16994:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16995

	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.16997

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.16998

fbgt_else.16997:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.16998:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.16999

	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17001

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17002

fbgt_else.17001:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17002:
	nop
	nop
	nop
	j	bnei_cont.17000

bnei_else.16999:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.17000:
	nop
	nop
	nop
	j	bnei_cont.16996

bnei_else.16995:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.16996:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17003

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17003:
	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17004

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17004:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

is_outside.2895:
	lw	%v1, 5(%v0)
	nop
	nop
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	fsub	%f0, %f0, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.17005

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.17006

	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.17007

	nop
	nop
	nop
	j	bnei_cont.17008

bnei_else.17007:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.17008:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17009

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17010

fbgt_else.17009:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17010:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17011

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17013

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17014

bnei_else.17013:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17014:
	nop
	nop
	nop
	j	bnei_cont.17012

bnei_else.17011:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bnei_cont.17012:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17015

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17015:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17006:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v0, 6(%v0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17016

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17017

fbgt_else.17016:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17017:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17018

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17020

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17021

bnei_else.17020:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17021:
	nop
	nop
	nop
	j	bnei_cont.17019

bnei_else.17018:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bnei_cont.17019:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17022

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17022:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17005:
	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f0
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.17023

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17024

fbgt_else.17023:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17024:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17025

	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17027

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17028

fbgt_else.17027:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17028:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17029

	lw	%v1, 4(%v0)
	nop
	fabs	%f0, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17031

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17032

fbgt_else.17031:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17032:
	nop
	nop
	nop
	j	bnei_cont.17030

bnei_else.17029:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.17030:
	nop
	nop
	nop
	j	bnei_cont.17026

bnei_else.17025:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.17026:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17033

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17033:
	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17034

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17034:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

check_all_inside.2900:
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
	beqi	%a0, -1, bnei_else.17035

	fsw	%f2, 0(%sp)
	nop
	addi	%a1, %zero, 1
	nop

	fsw	%f1, 1(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	fsw	%f0, 2(%sp)
	nop
	nop

	lw	%a1, 5(%a0)
	sw	%v1, 3(%sp)
	nop
	nop

	flw	%f3, 0(%a1)
	sw	%v0, 4(%sp)
	nop
	nop

	lw	%a1, 5(%a0)
	nop
	fsub	%f3, %f0, %f3
	nop

	flw	%f4, 1(%a1)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	nop
	fsub	%f4, %f1, %f4
	nop

	flw	%f5, 2(%a1)
	nop
	nop
	nop

	lw	%a1, 1(%a0)
	nop
	fsub	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.17036

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.17038

	sw	%a0, 5(%sp)
	nop
	fmov	%f2, %f5
	fmov	%f1, %f4

	sw	%ra, 6(%sp)
	nop
	addi	%v0, %a0, 0
	fmov	%f0, %f3

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	quadratic.2798

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.17040

	nop
	nop
	nop
	j	bnei_cont.17041

bnei_else.17040:
	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.17041:
	lw	%v0, 6(%v0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17042

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17043

fbgt_else.17042:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17043:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17044

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17046

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17047

bnei_else.17046:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17047:
	nop
	nop
	nop
	j	bnei_cont.17045

bnei_else.17044:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bnei_cont.17045:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17048

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17049

bnei_else.17048:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17049:
	nop
	nop
	nop
	j	bnei_cont.17039

bnei_else.17038:
	lw	%a1, 4(%a0)
	nop
	nop
	nop

	flw	%f6, 0(%a1)
	lw	%a0, 6(%a0)
	nop
	nop

	nop
	nop
	fmul	%f3, %f6, %f3
	nop

	flw	%f6, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f6, %f4
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17050

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17051

fbgt_else.17050:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.17051:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17052

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.17054

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17055

bnei_else.17054:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.17055:
	nop
	nop
	nop
	j	bnei_cont.17053

bnei_else.17052:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.17053:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17056

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17057

bnei_else.17056:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17057:
bnei_cont.17039:
	nop
	nop
	nop
	j	bnei_cont.17037

bnei_else.17036:
	sw	%ra, 6(%sp)
	nop
	addi	%v0, %a0, 0
	fmov	%f2, %f5

	nop
	nop
	fmov	%f1, %f4
	fmov	%f0, %f3

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	is_rect_outside.2880

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.17037:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17058

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17058:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17059

	flw	%f0, 2(%sp)
	nop
	addi	%a1, %zero, 1
	nop

	flw	%f1, 1(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	flw	%f2, 0(%sp)
	nop
	nop

	sw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	is_outside.2895

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17060

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17060:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	flw	%f0, 2(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	flw	%f1, 1(%sp)
	nop
	nop
	nop

	flw	%f2, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	check_all_inside.2900

bnei_else.17059:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17035:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_and_group.2906:
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
	beqi	%a0, -1, bnei_else.17061

	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 1

	lw	%a0, 0(%at)
	sw	%v1, 0(%sp)
	addi	%a2, %zero, 127
	nop

	flw	%f0, 0(%a2)
	sw	%v0, 1(%sp)
	add	%at, %a1, %a0
	nop

	lw	%a1, 0(%at)
	sw	%a0, 2(%sp)
	nop
	nop

	lw	%a2, 5(%a1)
	nop
	nop
	nop

	flw	%f1, 0(%a2)
	lw	%a3, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%a2, %zero, 127

	flw	%f1, 1(%a2)
	nop
	nop
	nop

	lw	%a2, 5(%a1)
	nop
	nop
	nop

	flw	%f2, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	addi	%a2, %zero, 127

	flw	%f2, 2(%a2)
	nop
	nop
	nop

	lw	%a2, 5(%a1)
	nop
	nop
	nop

	flw	%f3, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	addi	%a2, %zero, 174

	nop
	nop
	add	%at, %a2, %a0
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17062

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17064

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solver_second_fast.2834

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17065

bnei_else.17064:
	flw	%f3, 0(%a2)
	flw	%f4, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17066

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17067

fbgt_else.17066:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.17067:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.17068

	flw	%f3, 1(%a2)
	nop
	addi	%a1, %zero, 124
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 1

	flw	%f3, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 3(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17069

bnei_else.17068:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17069:
bnei_cont.17065:
	nop
	nop
	nop
	j	bnei_cont.17063

bnei_else.17062:
	sw	%ra, 3(%sp)
	nop
	addi	%a3, %zero, 171
	addi	%a0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solver_rect_fast.2821

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

bnei_cont.17063:
	nop
	nop
	addi	%v1, %zero, 124
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17070

	flw	%f1, 439(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17072

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17073

fbgt_else.17072:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17073:
	nop
	nop
	nop
	j	bnei_cont.17071

bnei_else.17070:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17071:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17074

	flw	%f1, 438(%zero)
	lw	%v1, 0(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%v0, %zero, 67

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 127

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	addi	%v0, %zero, 67

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f0
	addi	%v0, %zero, 127

	flw	%f3, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 67

	flw	%f3, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	addi	%v0, %zero, 127

	flw	%f3, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 0(%v1)
	nop
	fadd	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.17075

	fsw	%f0, 3(%sp)
	nop
	addi	%a0, %zero, 1
	fmov	%f29, %f2

	fsw	%f2, 4(%sp)
	nop
	add	%at, %a0, %v0
	nop

	lw	%v0, 0(%at)
	fsw	%f1, 5(%sp)
	fmov	%f2, %f0
	nop

	sw	%ra, 6(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f29
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	is_outside.2895

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17077

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17078

bnei_else.17077:
	flw	%f0, 5(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	flw	%f1, 4(%sp)
	nop
	nop
	nop

	flw	%f2, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	check_all_inside.2900

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.17078:
	nop
	nop
	nop
	j	bnei_cont.17076

bnei_else.17075:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17076:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17079

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17079:
	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2906

bnei_else.17074:
	lw	%v1, 2(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	add	%at, %v0, %v1
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17080

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2906

bnei_else.17080:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17061:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2909:
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
	beqi	%a0, -1, bnei_else.17081

	sw	%v1, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 1(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 2(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17082

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17082:
	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17083

	sw	%v0, 2(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	addi	%a1, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17084

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17084:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17085

	sw	%v0, 3(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	addi	%a1, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17086

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17086:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17087

	sw	%v0, 4(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%ra, 5(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	addi	%a1, %zero, 0
	addi	%sp, %sp, 6

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17088

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17088:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_group.2909

bnei_else.17087:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17085:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17083:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17081:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2912:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17089

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

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.17090

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	addi	%a3, %zero, 127

	lw	%a2, 0(%at)
	flw	%f0, 0(%a3)
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f1, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 127

	flw	%f1, 1(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f2, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 127

	flw	%f2, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f3, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	addi	%a3, %zero, 174

	nop
	nop
	add	%at, %a3, %a1
	nop

	lw	%a1, 0(%at)
	lw	%a3, 1(%a2)
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17092

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17094

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solver_second_fast.2834

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17095

bnei_else.17094:
	flw	%f3, 0(%a1)
	flw	%f4, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17096

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17097

fbgt_else.17096:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.17097:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.17098

	flw	%f3, 1(%a1)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	flw	%f3, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 3(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%a1, %zero, 124

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17099

bnei_else.17098:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17099:
bnei_cont.17095:
	nop
	nop
	nop
	j	bnei_cont.17093

bnei_else.17092:
	sw	%ra, 3(%sp)
	nop
	addi	%a3, %zero, 171
	addi	%a0, %a1, 0

	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solver_rect_fast.2821

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

bnei_cont.17093:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17100

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17102

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17103

fbgt_else.17102:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17103:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17104

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17106

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17108

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17109

bnei_else.17108:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17110

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17112

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17113

bnei_else.17112:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17114

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17116

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17117

bnei_else.17116:
	lw	%v1, 0(%sp)
	nop
	addi	%v0, %zero, 4
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2909

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

bnei_cont.17117:
	nop
	nop
	nop
	j	bnei_cont.17115

bnei_else.17114:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17115:
bnei_cont.17113:
	nop
	nop
	nop
	j	bnei_cont.17111

bnei_else.17110:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17111:
bnei_cont.17109:
	nop
	nop
	nop
	j	bnei_cont.17107

bnei_else.17106:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17107:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17118

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17119

bnei_else.17118:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17119:
	nop
	nop
	nop
	j	bnei_cont.17105

bnei_else.17104:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17105:
	nop
	nop
	nop
	j	bnei_cont.17101

bnei_else.17100:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17101:
	nop
	nop
	nop
	j	bnei_cont.17091

bnei_else.17090:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17091:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17120

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17121

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17123

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17124

bnei_else.17123:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17125

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17127

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17128

bnei_else.17127:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17129

	sw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%sp, %sp, 4

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2906

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17131

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17132

bnei_else.17131:
	lw	%v1, 0(%sp)
	nop
	addi	%v0, %zero, 4
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2909

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

bnei_cont.17132:
	nop
	nop
	nop
	j	bnei_cont.17130

bnei_else.17129:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17130:
bnei_cont.17128:
	nop
	nop
	nop
	j	bnei_cont.17126

bnei_else.17125:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17126:
bnei_cont.17124:
	nop
	nop
	nop
	j	bnei_cont.17122

bnei_else.17121:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17122:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17133

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17133:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2912

bnei_else.17120:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2912

bnei_else.17089:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solve_each_element.2915:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17134

	sw	%a0, 0(%sp)
	nop
	addi	%a2, %zero, 1
	nop

	sw	%v1, 1(%sp)
	nop
	add	%at, %a2, %a1
	addi	%a3, %zero, 148

	lw	%a2, 0(%at)
	flw	%f0, 0(%a3)
	nop
	nop

	lw	%a3, 5(%a2)
	sw	%v0, 2(%sp)
	nop
	nop

	flw	%f1, 0(%a3)
	sw	%a1, 3(%sp)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 148

	flw	%f1, 1(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f2, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 148

	flw	%f2, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f3, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17135

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17137

	sw	%ra, 4(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solver_second.2811

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17138

bnei_else.17137:
	sw	%ra, 4(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solver_surface.2792

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.17138:
	nop
	nop
	nop
	j	bnei_cont.17136

bnei_else.17135:
	fsw	%f0, 4(%sp)
	nop
	addi	%a3, %zero, 0
	addi	%v1, %a0, 0

	fsw	%f2, 5(%sp)
	nop
	addi	%t0, %zero, 1
	addi	%v0, %a2, 0

	fsw	%f1, 6(%sp)
	nop
	addi	%t1, %zero, 2
	addi	%a1, %t0, 0

	sw	%a2, 7(%sp)
	nop
	addi	%a0, %a3, 0
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%a2, %t1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17139

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17140

bnei_else.17139:
	flw	%f0, 6(%sp)
	nop
	addi	%a0, %zero, 1
	nop

	flw	%f1, 5(%sp)
	nop
	addi	%a1, %zero, 2
	nop

	flw	%f2, 4(%sp)
	nop
	addi	%a2, %zero, 0
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17141

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.17142

bnei_else.17141:
	flw	%f0, 5(%sp)
	nop
	addi	%a0, %zero, 2
	nop

	flw	%f1, 4(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	flw	%f2, 6(%sp)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17143

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.17144

bnei_else.17143:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17144:
bnei_cont.17142:
bnei_cont.17140:
bnei_cont.17136:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17145

	nop
	nop
	addi	%v1, %zero, 124
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17146

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17147

fbgt_else.17146:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17147:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17148

	nop
	nop
	addi	%v1, %zero, 126
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17150

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17151

fbgt_else.17150:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17151:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17152

	flw	%f1, 438(%zero)
	lw	%a0, 0(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%v1, %zero, 148

	flw	%f1, 0(%a0)
	flw	%f2, 0(%v1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 148

	flw	%f3, 1(%v1)
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 1(%a0)
	nop
	addi	%v1, %zero, 148
	nop

	flw	%f4, 2(%v1)
	nop
	fmul	%f2, %f2, %f0
	nop

	lw	%v1, 1(%sp)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 2(%a0)
	lw	%a1, 0(%v1)
	nop
	nop

	sw	%v0, 8(%sp)
	nop
	fmul	%f3, %f3, %f0
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	fsw	%f3, 9(%sp)
	nop
	nop
	nop

	fsw	%f2, 10(%sp)
	nop
	nop
	nop

	fsw	%f1, 11(%sp)
	nop
	nop
	nop

	fsw	%f0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17154

	sw	%ra, 13(%sp)
	nop
	addi	%a2, %zero, 1
	fmov	%f0, %f1

	nop
	nop
	add	%at, %a2, %a1
	fmov	%f1, %f2

	lw	%a1, 0(%at)
	nop
	fmov	%f2, %f3
	addi	%sp, %sp, 14

	nop
	nop
	addi	%v0, %a1, 0
	nop

	nop
	nop
	nop
	jal	is_outside.2895

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17156

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17157

bnei_else.17156:
	flw	%f0, 11(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	flw	%f1, 10(%sp)
	nop
	nop
	nop

	flw	%f2, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	check_all_inside.2900

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

bnei_cont.17157:
	nop
	nop
	nop
	j	bnei_cont.17155

bnei_else.17154:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17155:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17158

	flw	%f0, 12(%sp)
	nop
	addi	%v0, %zero, 126
	nop

	fsw	%f0, 0(%v0)
	lw	%v1, 3(%sp)
	nop
	nop

	flw	%f0, 11(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 10(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	flw	%f0, 9(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 130
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	lw	%v1, 8(%sp)
	nop
	addi	%v0, %zero, 125
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17159

bnei_else.17158:
bnei_cont.17159:
	nop
	nop
	nop
	j	bnei_cont.17153

bnei_else.17152:
bnei_cont.17153:
	nop
	nop
	nop
	j	bnei_cont.17149

bnei_else.17148:
bnei_cont.17149:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_each_element.2915

bnei_else.17145:
	lw	%v1, 3(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	add	%at, %v0, %v1
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17160

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_each_element.2915

bnei_else.17160:
	nop
	nop
	nop
	jr	%ra

bnei_else.17134:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2919:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17163

	sw	%a0, 0(%sp)
	nop
	addi	%a2, %zero, 72
	nop

	sw	%v1, 1(%sp)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	sw	%v0, 2(%sp)
	addi	%a2, %zero, 0
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17164

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 3(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 4(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17165

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 4(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17166

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 5(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 6(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_one_or_network.2919

bnei_else.17166:
	nop
	nop
	nop
	jr	%ra

bnei_else.17165:
	nop
	nop
	nop
	jr	%ra

bnei_else.17164:
	nop
	nop
	nop
	jr	%ra

bnei_else.17163:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2923:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.17171

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

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.17172

	sw	%a1, 3(%sp)
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	addi	%a3, %zero, 148
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f1, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%a3, %zero, 148

	flw	%f1, 1(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f2, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	addi	%a3, %zero, 148

	flw	%f2, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 5(%a2)
	nop
	nop
	nop

	flw	%f3, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17174

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17176

	sw	%ra, 4(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solver_second.2811

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17177

bnei_else.17176:
	sw	%ra, 4(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solver_surface.2792

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.17177:
	nop
	nop
	nop
	j	bnei_cont.17175

bnei_else.17174:
	fsw	%f0, 4(%sp)
	nop
	addi	%a3, %zero, 0
	addi	%v1, %a0, 0

	fsw	%f2, 5(%sp)
	nop
	addi	%t0, %zero, 1
	addi	%v0, %a2, 0

	fsw	%f1, 6(%sp)
	nop
	addi	%t1, %zero, 2
	addi	%a1, %t0, 0

	sw	%a2, 7(%sp)
	nop
	addi	%a0, %a3, 0
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%a2, %t1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17178

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.17179

bnei_else.17178:
	flw	%f0, 6(%sp)
	nop
	addi	%a0, %zero, 1
	nop

	flw	%f1, 5(%sp)
	nop
	addi	%a1, %zero, 2
	nop

	flw	%f2, 4(%sp)
	nop
	addi	%a2, %zero, 0
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17180

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.17181

bnei_else.17180:
	flw	%f0, 5(%sp)
	nop
	addi	%a0, %zero, 2
	nop

	flw	%f1, 4(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	flw	%f2, 6(%sp)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solver_rect_surface.2777

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17182

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.17183

bnei_else.17182:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17183:
bnei_cont.17181:
bnei_cont.17179:
bnei_cont.17175:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17184

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17186

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17187

fbgt_else.17186:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17187:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17188

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17190

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17192

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17194

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v0, %zero, 4

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2919

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17195

bnei_else.17194:
bnei_cont.17195:
	nop
	nop
	nop
	j	bnei_cont.17193

bnei_else.17192:
bnei_cont.17193:
	nop
	nop
	nop
	j	bnei_cont.17191

bnei_else.17190:
bnei_cont.17191:
	nop
	nop
	nop
	j	bnei_cont.17189

bnei_else.17188:
bnei_cont.17189:
	nop
	nop
	nop
	j	bnei_cont.17185

bnei_else.17184:
bnei_cont.17185:
	nop
	nop
	nop
	j	bnei_cont.17173

bnei_else.17172:
	lw	%a2, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.17196

	sw	%a1, 3(%sp)
	nop
	addi	%a3, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	addi	%a3, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17198

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17200

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 8(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v0, %zero, 4

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2919

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17201

bnei_else.17200:
bnei_cont.17201:
	nop
	nop
	nop
	j	bnei_cont.17199

bnei_else.17198:
bnei_cont.17199:
	nop
	nop
	nop
	j	bnei_cont.17197

bnei_else.17196:
bnei_cont.17197:
bnei_cont.17173:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17202

	sw	%v0, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.17203

	lw	%a3, 0(%sp)
	nop
	addi	%a2, %zero, 148
	addi	%v0, %a1, 0

	sw	%a0, 9(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	solver.2817

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17205

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17207

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17208

fbgt_else.17207:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17208:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17209

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17211

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 10(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17213

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 10(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %zero, 3

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2919

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17214

bnei_else.17213:
bnei_cont.17214:
	nop
	nop
	nop
	j	bnei_cont.17212

bnei_else.17211:
bnei_cont.17212:
	nop
	nop
	nop
	j	bnei_cont.17210

bnei_else.17209:
bnei_cont.17210:
	nop
	nop
	nop
	j	bnei_cont.17206

bnei_else.17205:
bnei_cont.17206:
	nop
	nop
	nop
	j	bnei_cont.17204

bnei_else.17203:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17215

	lw	%a3, 0(%sp)
	nop
	addi	%a2, %zero, 72
	nop

	sw	%a0, 9(%sp)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	sw	%ra, 10(%sp)
	addi	%a2, %zero, 0
	addi	%a0, %a3, 0

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17217

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 10(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element.2915

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %zero, 3

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2919

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17218

bnei_else.17217:
bnei_cont.17218:
	nop
	nop
	nop
	j	bnei_cont.17216

bnei_else.17215:
bnei_cont.17216:
bnei_cont.17204:
	lw	%v0, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	trace_or_matrix.2923

bnei_else.17202:
	nop
	nop
	nop
	jr	%ra

bnei_else.17171:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2929:
	lw	%a1, 0(%a0)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.17221

	lw	%t1, 1(%a0)
	sw	%a1, 0(%sp)
	addi	%a3, %zero, 1
	nop

	sw	%a0, 1(%sp)
	nop
	add	%at, %a3, %a2
	nop

	lw	%a3, 0(%at)
	sw	%v1, 2(%sp)
	nop
	nop

	lw	%t0, 10(%a3)
	sw	%v0, 3(%sp)
	add	%at, %t1, %a2
	nop

	flw	%f0, 0(%t0)
	lw	%t1, 0(%at)
	nop
	nop

	flw	%f1, 1(%t0)
	lw	%t2, 1(%a3)
	nop
	nop

	flw	%f2, 2(%t0)
	sw	%a2, 4(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.17222

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.17224

	sw	%ra, 5(%sp)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %a3, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solver_second_fast2.2851

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17225

bnei_else.17224:
	flw	%f0, 0(%t1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17226

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17227

fbgt_else.17226:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.17227:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.17228

	flw	%f0, 0(%t1)
	flw	%f1, 3(%t0)
	addi	%a3, %zero, 124
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 1

	fsw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17229

bnei_else.17228:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17229:
bnei_cont.17225:
	nop
	nop
	nop
	j	bnei_cont.17223

bnei_else.17222:
	lw	%t0, 0(%a0)
	sw	%ra, 5(%sp)
	addi	%v0, %a3, 0
	nop

	nop
	nop
	addi	%a0, %t1, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solver_rect_fast.2821

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.17223:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17230

	nop
	nop
	addi	%v1, %zero, 124
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17231

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17232

fbgt_else.17231:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17232:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17233

	nop
	nop
	addi	%v1, %zero, 126
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17235

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17236

fbgt_else.17235:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17236:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17237

	flw	%f1, 438(%zero)
	lw	%v1, 0(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 151

	flw	%f1, 0(%v1)
	flw	%f2, 0(%a0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	addi	%a0, %zero, 151

	flw	%f3, 1(%a0)
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f0
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f0
	addi	%v1, %zero, 151

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	fadd	%f3, %f3, %f4
	nop

	lw	%a0, 0(%v1)
	sw	%v0, 5(%sp)
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

	fsw	%f1, 8(%sp)
	nop
	nop
	nop

	fsw	%f0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.17239

	sw	%ra, 10(%sp)
	nop
	addi	%a1, %zero, 1
	fmov	%f0, %f1

	nop
	nop
	add	%at, %a1, %a0
	fmov	%f1, %f2

	lw	%a0, 0(%at)
	nop
	fmov	%f2, %f3
	addi	%sp, %sp, 11

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	is_outside.2895

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17241

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.17242

bnei_else.17241:
	flw	%f0, 8(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	flw	%f1, 7(%sp)
	nop
	nop
	nop

	flw	%f2, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	check_all_inside.2900

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.17242:
	nop
	nop
	nop
	j	bnei_cont.17240

bnei_else.17239:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.17240:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17243

	flw	%f0, 9(%sp)
	nop
	addi	%v0, %zero, 126
	nop

	fsw	%f0, 0(%v0)
	lw	%v1, 4(%sp)
	nop
	nop

	flw	%f0, 8(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	flw	%f0, 7(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	flw	%f0, 6(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 130
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%v0, %zero, 125
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17244

bnei_else.17243:
bnei_cont.17244:
	nop
	nop
	nop
	j	bnei_cont.17238

bnei_else.17237:
bnei_cont.17238:
	nop
	nop
	nop
	j	bnei_cont.17234

bnei_else.17233:
bnei_cont.17234:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2929

bnei_else.17230:
	lw	%v1, 4(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	add	%at, %v0, %v1
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%v0, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17245

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2929

bnei_else.17245:
	nop
	nop
	nop
	jr	%ra

bnei_else.17221:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2933:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17248

	sw	%a0, 0(%sp)
	nop
	addi	%a2, %zero, 72
	nop

	sw	%v1, 1(%sp)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	sw	%v0, 2(%sp)
	addi	%a2, %zero, 0
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17249

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 3(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 4(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17250

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 4(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 5(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

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
	beqi	%a0, -1, bnei_else.17251

	lw	%a2, 0(%sp)
	nop
	addi	%a1, %zero, 72
	nop

	sw	%v0, 5(%sp)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	sw	%ra, 6(%sp)
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%a0, %a2, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	solve_one_or_network_fast.2933

bnei_else.17251:
	nop
	nop
	nop
	jr	%ra

bnei_else.17250:
	nop
	nop
	nop
	jr	%ra

bnei_else.17249:
	nop
	nop
	nop
	jr	%ra

bnei_else.17248:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2937:
	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.17256

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

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.17257

	lw	%t1, 1(%a0)
	sw	%a1, 3(%sp)
	addi	%a3, %zero, 1
	nop

	nop
	nop
	add	%at, %a3, %a2
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%t0, 10(%a3)
	nop
	add	%at, %t1, %a2
	nop

	flw	%f0, 0(%t0)
	lw	%a2, 0(%at)
	nop
	nop

	flw	%f1, 1(%t0)
	lw	%t1, 1(%a3)
	nop
	nop

	flw	%f2, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.17259

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.17261

	sw	%ra, 4(%sp)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %a2, 0

	nop
	nop
	addi	%v0, %a3, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solver_second_fast2.2851

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17262

bnei_else.17261:
	flw	%f0, 0(%a2)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17263

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17264

fbgt_else.17263:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.17264:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.17265

	flw	%f0, 0(%a2)
	flw	%f1, 3(%t0)
	addi	%v0, %zero, 1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%a2, %zero, 124

	fsw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17266

bnei_else.17265:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17266:
bnei_cont.17262:
	nop
	nop
	nop
	j	bnei_cont.17260

bnei_else.17259:
	lw	%t0, 0(%a0)
	sw	%ra, 4(%sp)
	addi	%v0, %a3, 0
	nop

	nop
	nop
	addi	%a0, %a2, 0
	addi	%v1, %t0, 0

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solver_rect_fast.2821

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.17260:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17267

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17269

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17270

fbgt_else.17269:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17270:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17271

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17273

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17275

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17277

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 4

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17278

bnei_else.17277:
bnei_cont.17278:
	nop
	nop
	nop
	j	bnei_cont.17276

bnei_else.17275:
bnei_cont.17276:
	nop
	nop
	nop
	j	bnei_cont.17274

bnei_else.17273:
bnei_cont.17274:
	nop
	nop
	nop
	j	bnei_cont.17272

bnei_else.17271:
bnei_cont.17272:
	nop
	nop
	nop
	j	bnei_cont.17268

bnei_else.17267:
bnei_cont.17268:
	nop
	nop
	nop
	j	bnei_cont.17258

bnei_else.17257:
	lw	%a2, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.17279

	sw	%a1, 3(%sp)
	nop
	addi	%a3, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a3, %a2
	nop

	lw	%a2, 0(%at)
	nop
	addi	%a3, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v1, %a2, 0
	addi	%v0, %a3, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17281

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17283

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 4(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 4

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17284

bnei_else.17283:
bnei_cont.17284:
	nop
	nop
	nop
	j	bnei_cont.17282

bnei_else.17281:
bnei_cont.17282:
	nop
	nop
	nop
	j	bnei_cont.17280

bnei_else.17279:
bnei_cont.17280:
bnei_cont.17258:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17285

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.17286

	lw	%a2, 0(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%a0, 5(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solver_fast2.2858

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17288

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17290

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17291

fbgt_else.17290:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17291:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17292

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17294

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 6(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17296

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 6(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 3

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17297

bnei_else.17296:
bnei_cont.17297:
	nop
	nop
	nop
	j	bnei_cont.17295

bnei_else.17294:
bnei_cont.17295:
	nop
	nop
	nop
	j	bnei_cont.17293

bnei_else.17292:
bnei_cont.17293:
	nop
	nop
	nop
	j	bnei_cont.17289

bnei_else.17288:
bnei_cont.17289:
	nop
	nop
	nop
	j	bnei_cont.17287

bnei_else.17286:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17298

	lw	%a3, 0(%sp)
	nop
	addi	%a2, %zero, 72
	nop

	sw	%a0, 5(%sp)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a1, 0(%at)
	sw	%ra, 6(%sp)
	addi	%a2, %zero, 0
	addi	%a0, %a3, 0

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17300

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 6(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 7

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 3

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17301

bnei_else.17300:
bnei_cont.17301:
	nop
	nop
	nop
	j	bnei_cont.17299

bnei_else.17298:
bnei_cont.17299:
bnei_cont.17287:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	trace_or_matrix_fast.2937

bnei_else.17285:
	nop
	nop
	nop
	jr	%ra

bnei_else.17256:
	nop
	nop
	nop
	jr	%ra

judge_intersection_fast.2941:
	flw	%f0, 436(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 126
	nop

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 123
	nop

	lw	%v1, 0(%v1)
	nop
	nop
	nop

	lw	%a0, 0(%v1)
	nop
	nop
	nop

	lw	%a1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17304

	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.17306

	sw	%a0, 2(%sp)
	nop
	addi	%v1, %v0, 0
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	solver_fast2.2858

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17308

	nop
	nop
	addi	%v0, %zero, 124
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17310

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17311

fbgt_else.17310:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17311:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17312

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17314

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17316

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 3

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17317

bnei_else.17316:
bnei_cont.17317:
	nop
	nop
	nop
	j	bnei_cont.17315

bnei_else.17314:
bnei_cont.17315:
	nop
	nop
	nop
	j	bnei_cont.17313

bnei_else.17312:
bnei_cont.17313:
	nop
	nop
	nop
	j	bnei_cont.17309

bnei_else.17308:
bnei_cont.17309:
	nop
	nop
	nop
	j	bnei_cont.17307

bnei_else.17306:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.17318

	sw	%a0, 2(%sp)
	nop
	addi	%a2, %zero, 72
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %a2, %a1
	addi	%a0, %v0, 0

	lw	%a1, 0(%at)
	nop
	addi	%a2, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.17320

	lw	%a1, 0(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%v1, 0(%at)
	nop
	addi	%a0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2929

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 3

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2933

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17321

bnei_else.17320:
bnei_cont.17321:
	nop
	nop
	nop
	j	bnei_cont.17319

bnei_else.17318:
bnei_cont.17319:
bnei_cont.17307:
	lw	%v1, 1(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	lw	%a0, 0(%sp)
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
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2937

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17305

bnei_else.17304:
bnei_cont.17305:
	nop
	nop
	addi	%v0, %zero, 126
	nop

	flw	%f0, 0(%v0)
	flw	%f1, 437(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17322

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17323

fbgt_else.17322:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17323:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17324

	flw	%f1, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17325

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.17325:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17324:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

get_nvector_second.2947:
	nop
	nop
	addi	%v1, %zero, 127
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 127

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	flw	%f2, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	addi	%v1, %zero, 127

	flw	%f2, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f2, %f2, %f3
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f4, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fmul	%f4, %f1, %f4
	nop

	flw	%f5, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17326

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f6, %f1, %f6
	nop

	flw	%f7, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	addi	%v1, %zero, 131

	nop
	nop
	fadd	%f6, %f6, %f7
	nop

	flw	%f7, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f6
	addi	%v1, %zero, 131

	nop
	nop
	fadd	%f2, %f3, %f2
	nop

	flw	%f3, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	nop
	nop
	fadd	%f2, %f4, %f2
	nop

	fsw	%f2, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f2, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f0, %f0, %f2
	nop

	flw	%f2, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v1, %zero, 131

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fadd	%f0, %f5, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17327

bnei_else.17326:
	nop
	nop
	addi	%v1, %zero, 131
	nop

	fsw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 131
	nop

	fsw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 131
	nop

	fsw	%f5, 2(%v1)
	nop
	nop
	nop

bnei_cont.17327:
	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 131
	nop

	nop
	nop
	nop
	j	vecunit_sgn.2655

get_nvector.2949:
	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.17328

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.17329

	nop
	nop
	nop
	j	get_nvector_second.2947

bnei_else.17329:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 1(%v1)
	lw	%v0, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	fsw	%f0, 1(%v1)
	nop
	nop
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v0, %zero, 131

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17328:
	nop
	nop
	addi	%v0, %zero, 125
	nop

	lw	%v0, 0(%v0)
	flw	%f0, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 131
	nop

	fsw	%f0, 0(%a0)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 131
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 131
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %v0, -1
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.17331

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.17332

fbeq_else.17331:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbeq_cont.17332:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17333

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17334

bnei_else.17333:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17335

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17336

fbgt_else.17335:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17336:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17337

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17338

bnei_else.17337:
	flw	%f0, 443(%zero)
	nop
	nop
	nop

bnei_cont.17338:
bnei_cont.17334:
	nop
	nop
	fneg	%f0, %f0
	addi	%v0, %zero, 131

	nop
	nop
	add	%at, %v0, %a0
	nop

	fsw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

utexture.2952:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	lw	%a1, 8(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 134
	nop

	fsw	%f0, 0(%a1)
	nop
	nop
	nop

	lw	%a1, 8(%v0)
	nop
	nop
	nop

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 134
	nop

	fsw	%f0, 1(%a1)
	nop
	nop
	nop

	lw	%a1, 8(%v0)
	nop
	nop
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 134
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.17340

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.17341

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.17342

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.17343

	nop
	nop
	nop
	jr	%ra

bnei_else.17343:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	flw	%f4, 434(%zero)
	nop
	nop

	lw	%a0, 4(%v0)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 0(%a0)
	nop
	nop
	nop

	lw	%a0, 5(%v0)
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f2, 2(%a0)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	lw	%a0, 4(%v0)
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	nop
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17345

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17346

fbgt_else.17345:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.17346:
	fsw	%f2, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17347

	flw	%f0, 433(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17348

bnei_else.17347:
	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	flw	%f1, 444(%zero)
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17349

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.17350

fbgt_else.17349:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbgt_cont.17350:
	flw	%f3, 432(%zero)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.17351

	flw	%f0, 431(%zero)
	sw	%a0, 3(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17353

	flw	%f0, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 448(%zero)
	fsw	%f0, 4(%sp)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	fdiv	%f1, %f3, %f1
	nop

	nop
	nop
	fmov	%f0, %f1
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	flw	%f1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17354

fbgt_else.17353:
	flw	%f0, 452(%zero)
	nop
	nop
	nop

	flw	%f3, 448(%zero)
	fsw	%f0, 5(%sp)
	nop
	nop

	flw	%f4, 448(%zero)
	sw	%ra, 6(%sp)
	fsub	%f3, %f1, %f3
	nop

	nop
	nop
	fadd	%f1, %f1, %f4
	addi	%sp, %sp, 7

	nop
	nop
	fdiv	%f1, %f3, %f1
	nop

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	flw	%f1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.17354:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17355

	nop
	nop
	nop
	j	bnei_cont.17356

bnei_else.17355:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.17356:
	nop
	nop
	nop
	j	fbgt_cont.17352

fbgt_else.17351:
	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

fbgt_cont.17352:
	flw	%f1, 430(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 429(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.17348:
	lw	%v0, 2(%sp)
	flw	%f4, 434(%zero)
	floor	%f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	flw	%f2, 1(%v1)
	lw	%v0, 4(%v0)
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	fabs	%f3, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17357

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17358

fbgt_else.17357:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17358:
	fsw	%f0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17359

	flw	%f0, 433(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17360

bnei_else.17359:
	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

	flw	%f2, 444(%zero)
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.17361

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.17362

fbgt_else.17361:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.17362:
	flw	%f3, 432(%zero)
	nop
	fabs	%f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.17363

	flw	%f1, 431(%zero)
	sw	%v0, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.17365

	flw	%f1, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 448(%zero)
	fsw	%f1, 8(%sp)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	fdiv	%f2, %f3, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	flw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17366

fbgt_else.17365:
	flw	%f1, 452(%zero)
	nop
	nop
	nop

	flw	%f3, 448(%zero)
	fsw	%f1, 9(%sp)
	nop
	nop

	flw	%f4, 448(%zero)
	sw	%ra, 10(%sp)
	fsub	%f3, %f2, %f3
	nop

	nop
	nop
	fadd	%f2, %f2, %f4
	addi	%sp, %sp, 11

	nop
	nop
	fdiv	%f2, %f3, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	flw	%f1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.17366:
	lw	%v0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17367

	nop
	nop
	nop
	j	bnei_cont.17368

bnei_else.17367:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.17368:
	nop
	nop
	nop
	j	fbgt_cont.17364

fbgt_else.17363:
	sw	%ra, 10(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

fbgt_cont.17364:
	flw	%f1, 430(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 429(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.17360:
	flw	%f2, 447(%zero)
	flw	%f3, 6(%sp)
	floor	%f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	fsub	%f2, %f2, %f3

	flw	%f1, 428(%zero)
	nop
	fmul	%f2, %f2, %f2
	nop

	nop
	nop
	fsub	%f1, %f1, %f2
	nop

	flw	%f2, 447(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17369

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17370

fbgt_else.17369:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17370:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17371

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17372

bnei_else.17371:
bnei_cont.17372:
	flw	%f1, 427(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134

	flw	%f1, 426(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17342:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	lw	%v0, 5(%v0)
	nop
	nop

	flw	%f2, 2(%v0)
	sw	%ra, 10(%sp)
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	fmul	%f0, %f0, %f0
	addi	%sp, %sp, 11

	nop
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 425(%zero)
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
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 429(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	jal	cos.2616

	flw	%f1, 427(%zero)
	nop
	addi	%sp, %sp, -11
	fmul	%f0, %f0, %f0

	lw	%ra, 10(%sp)
	nop
	fmul	%f1, %f0, %f1
	addi	%v0, %zero, 134

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	flw	%f1, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	addi	%v0, %zero, 134

	flw	%f1, 427(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17341:
	flw	%f0, 1(%v1)
	flw	%f1, 424(%zero)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	sin.2618

	flw	%f1, 427(%zero)
	nop
	addi	%sp, %sp, -11
	fmul	%f0, %f0, %f0

	lw	%ra, 10(%sp)
	nop
	fmul	%f1, %f1, %f0
	addi	%v0, %zero, 134

	fsw	%f1, 0(%v0)
	flw	%f2, 448(%zero)
	nop
	nop

	flw	%f1, 427(%zero)
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	addi	%v0, %zero, 134

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17340:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	flw	%f2, 422(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 423(%zero)
	nop
	nop
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
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 425(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17376

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17377

fbgt_else.17376:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.17377:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	nop
	nop

	flw	%f1, 2(%v0)
	flw	%f2, 422(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 423(%zero)
	nop
	nop
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
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 425(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17378

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17379

fbgt_else.17378:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17379:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17380

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17382

	flw	%f0, 427(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17383

bnei_else.17382:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

bnei_cont.17383:
	nop
	nop
	nop
	j	bnei_cont.17381

bnei_else.17380:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17384

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17385

bnei_else.17384:
	flw	%f0, 427(%zero)
	nop
	nop
	nop

bnei_cont.17385:
bnei_cont.17381:
	nop
	nop
	addi	%v0, %zero, 134
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

trace_reflections.2959:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17387

	sw	%v0, 0(%sp)
	nop
	addi	%a0, %zero, 234
	nop

	flw	%f2, 436(%zero)
	fsw	%f1, 1(%sp)
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v1, 2(%sp)
	addi	%a2, %zero, 126
	nop

	lw	%a1, 1(%a0)
	fsw	%f2, 0(%a2)
	addi	%a3, %zero, 123
	nop

	lw	%a3, 0(%a3)
	fsw	%f0, 3(%sp)
	addi	%a2, %zero, 0
	nop

	sw	%a1, 4(%sp)
	nop
	addi	%v1, %a3, 0
	addi	%v0, %a2, 0

	sw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2937

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 126

	lw	%ra, 6(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17388

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17389

fbgt_else.17388:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17389:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17390

	flw	%f1, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17392

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17393

fbgt_else.17392:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17393:
	nop
	nop
	nop
	j	bnei_cont.17391

bnei_else.17390:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17391:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17394

	nop
	nop
	addi	%v0, %zero, 130
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 125
	nop

	lw	%v1, 0(%v1)
	nop
	sll	%v0, %v0, 2
	nop

	nop
	nop
	add	%v0, %v0, %v1
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%v0, %a0, beq_else.17396

	sw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%a0, %zero, 123
	addi	%sp, %sp, 7

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2912

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17398

	nop
	nop
	nop
	j	bnei_cont.17399

bnei_else.17398:
	lw	%v0, 4(%sp)
	nop
	addi	%a0, %zero, 131
	nop

	lw	%v1, 0(%v0)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v0, 0(%v0)
	addi	%a0, %zero, 131
	nop

	flw	%f2, 1(%v1)
	flw	%f4, 0(%v0)
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%a0)
	flw	%f5, 1(%v0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%a0, %zero, 131

	flw	%f2, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%a0)
	lw	%v1, 5(%sp)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	fmul	%f3, %f1, %f2
	nop

	nop
	nop
	fmul	%f0, %f3, %f0
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f5, 2(%v0)
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f4, 2(%v1)
	nop
	nop
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
	fmul	%f1, %f1, %f3
	nop

	flw	%f3, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.17400

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17401

fbgt_else.17400:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17401:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17402

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f3, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f4, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f0, %f4
	addi	%v0, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	fsw	%f3, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f3, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f4, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f0, %f4
	addi	%v0, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	fsw	%f3, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f3, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f4, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f4
	addi	%v0, %zero, 140

	nop
	nop
	fadd	%f0, %f3, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17403

bnei_else.17402:
bnei_cont.17403:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17404

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17405

fbgt_else.17404:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17405:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17406

	nop
	nop
	fmul	%f0, %f1, %f1
	addi	%v0, %zero, 140

	flw	%f1, 1(%sp)
	flw	%f3, 0(%v0)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f0
	nop

	fsw	%f3, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f3, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f3, %f3, %f0
	addi	%v0, %zero, 140

	fsw	%f3, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f3, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f3, %f0
	addi	%v0, %zero, 140

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17407

bnei_else.17406:
bnei_cont.17407:
bnei_cont.17399:
	nop
	nop
	nop
	j	beq_cont.17397

beq_else.17396:
beq_cont.17397:
	nop
	nop
	nop
	j	bnei_cont.17395

bnei_else.17394:
bnei_cont.17395:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	flw	%f0, 3(%sp)
	nop
	addi	%v0, %v0, -1
	nop

	flw	%f1, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	trace_reflections.2959

bgti_else.17387:
	nop
	nop
	nop
	jr	%ra

trace_ray.2964:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17409

	lw	%a1, 2(%a0)
	flw	%f2, 436(%zero)
	nop
	nop

	fsw	%f1, 0(%sp)
	nop
	addi	%a2, %zero, 126
	nop

	fsw	%f2, 0(%a2)
	sw	%a0, 1(%sp)
	addi	%a3, %zero, 123
	nop

	lw	%a3, 0(%a3)
	fsw	%f0, 2(%sp)
	addi	%a2, %zero, 0
	addi	%a0, %v1, 0

	sw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	sw	%a1, 5(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	trace_or_matrix.2923

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 126

	lw	%ra, 6(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17410

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17411

fbgt_else.17410:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17411:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17412

	flw	%f1, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17414

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17415

fbgt_else.17414:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17415:
	nop
	nop
	nop
	j	bnei_cont.17413

bnei_else.17412:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17413:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17416

	flw	%f1, 2(%sp)
	nop
	addi	%v0, %zero, 130
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%v1)
	nop
	nop
	nop

	lw	%a1, 7(%v1)
	sw	%a0, 6(%sp)
	nop
	nop

	flw	%f0, 0(%a1)
	nop
	nop
	nop

	lw	%a1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 7(%sp)
	nop
	nop
	nop

	sw	%v0, 8(%sp)
	nop
	nop
	nop

	sw	%v1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.17417

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.17419

	sw	%ra, 10(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	get_nvector_second.2947

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17420

bnei_else.17419:
	lw	%a1, 4(%v1)
	nop
	nop
	nop

	flw	%f2, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f2, %f2
	addi	%a1, %zero, 131

	fsw	%f2, 0(%a1)
	nop
	nop
	nop

	lw	%a1, 4(%v1)
	nop
	nop
	nop

	flw	%f2, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f2, %f2
	addi	%a1, %zero, 131

	fsw	%f2, 1(%a1)
	nop
	nop
	nop

	lw	%a1, 4(%v1)
	nop
	nop
	nop

	flw	%f2, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f2, %f2
	addi	%a1, %zero, 131

	fsw	%f2, 2(%a1)
	nop
	nop
	nop

bnei_cont.17420:
	nop
	nop
	nop
	j	bnei_cont.17418

bnei_else.17417:
	lw	%a3, 3(%sp)
	nop
	addi	%a1, %zero, 125
	nop

	lw	%a1, 0(%a1)
	flw	%f2, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 131
	nop

	fsw	%f2, 0(%a2)
	flw	%f3, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 131
	nop

	fsw	%f2, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 131
	nop

	fsw	%f2, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %a1, -1
	nop

	nop
	nop
	addi	%a1, %a1, -1
	nop

	nop
	nop
	add	%at, %a3, %a1
	nop

	flw	%f2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f2, %f3, fbeq_else.17421

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.17422

fbeq_else.17421:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.17422:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.17423

	flw	%f2, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17424

bnei_else.17423:
	flw	%f3, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.17425

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17426

fbgt_else.17425:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.17426:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.17427

	flw	%f2, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17428

bnei_else.17427:
	flw	%f2, 443(%zero)
	nop
	nop
	nop

bnei_cont.17428:
bnei_cont.17424:
	nop
	nop
	fneg	%f2, %f2
	addi	%a1, %zero, 131

	nop
	nop
	add	%at, %a1, %a2
	nop

	fsw	%f2, 0(%at)
	nop
	nop
	nop

bnei_cont.17418:
	nop
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 0(%v0)
	nop
	addi	%v1, %zero, 127
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	utexture.2952

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %zero, 125

	lw	%ra, 10(%sp)
	lw	%v1, 0(%v1)
	addi	%a2, %zero, 127
	nop

	lw	%v0, 8(%sp)
	flw	%f0, 0(%a2)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	sll	%v0, %v0, 2
	addi	%a2, %zero, 127

	flw	%f1, 447(%zero)
	nop
	add	%v0, %v0, %v1
	nop

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%a1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a1, %v1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a1)
	nop
	nop
	nop

	flw	%f0, 1(%a2)
	nop
	nop
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%a2, %zero, 127
	nop

	flw	%f0, 2(%a2)
	nop
	nop
	nop

	fsw	%f0, 2(%a1)
	lw	%a2, 9(%sp)
	nop
	nop

	lw	%a1, 3(%v0)
	lw	%a3, 7(%a2)
	nop
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17429

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17430

fbgt_else.17429:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.17430:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.17431

	nop
	nop
	addi	%a3, %zero, 0
	add	%at, %a1, %v1

	sw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17432

bnei_else.17431:
	flw	%f1, 7(%sp)
	nop
	addi	%a3, %zero, 1
	add	%at, %a1, %v1

	sw	%a3, 0(%at)
	lw	%a1, 4(%v0)
	addi	%t0, %zero, 134
	nop

	flw	%f0, 0(%t0)
	nop
	add	%at, %a1, %v1
	nop

	lw	%a3, 0(%at)
	nop
	addi	%t0, %zero, 134
	nop

	fsw	%f0, 0(%a3)
	nop
	add	%at, %a1, %v1
	nop

	flw	%f0, 1(%t0)
	lw	%a1, 0(%at)
	nop
	nop

	fsw	%f0, 1(%a3)
	flw	%f2, 0(%a1)
	addi	%t0, %zero, 134
	nop

	flw	%f0, 2(%t0)
	nop
	nop
	nop

	fsw	%f0, 2(%a3)
	nop
	nop
	nop

	flw	%f0, 421(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%a3, %zero, 131

	nop
	nop
	fmul	%f2, %f2, %f0
	nop

	fsw	%f2, 0(%a1)
	nop
	nop
	nop

	flw	%f2, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f0
	nop

	fsw	%f2, 1(%a1)
	nop
	nop
	nop

	flw	%f2, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f2, %f0
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	lw	%a1, 7(%v0)
	flw	%f0, 0(%a3)
	nop
	nop

	nop
	nop
	add	%at, %a1, %v1
	addi	%a3, %zero, 131

	lw	%a1, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%a1)
	nop
	nop
	nop

	flw	%f0, 1(%a3)
	nop
	nop
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%a3, %zero, 131
	nop

	flw	%f0, 2(%a3)
	nop
	nop
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

bnei_cont.17432:
	flw	%f0, 420(%zero)
	lw	%a1, 3(%sp)
	nop
	nop

	flw	%f1, 0(%a1)
	nop
	addi	%a3, %zero, 131
	nop

	flw	%f2, 0(%a3)
	nop
	addi	%t0, %zero, 123
	nop

	lw	%t0, 0(%t0)
	nop
	fmul	%f1, %f1, %f2
	addi	%a3, %zero, 131

	flw	%f2, 1(%a1)
	flw	%f3, 1(%a3)
	addi	%v1, %t0, 0
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	addi	%a3, %zero, 131

	flw	%f3, 2(%a3)
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a1)
	nop
	addi	%a3, %zero, 131
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 0(%a3)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 0(%a1)
	nop
	fmul	%f2, %f0, %f2
	addi	%a3, %zero, 131

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 0(%a1)
	flw	%f2, 1(%a3)
	nop
	nop

	flw	%f1, 1(%a1)
	nop
	fmul	%f2, %f0, %f2
	addi	%a3, %zero, 131

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 1(%a1)
	flw	%f2, 2(%a3)
	nop
	nop

	flw	%f1, 2(%a1)
	lw	%a3, 7(%a2)
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%a1)
	flw	%f1, 2(%sp)
	nop
	nop

	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	addi	%a3, %zero, 0

	fsw	%f0, 10(%sp)
	nop
	addi	%v0, %a3, 0
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2912

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17433

	nop
	nop
	nop
	j	bnei_cont.17434

bnei_else.17433:
	nop
	nop
	addi	%v0, %zero, 131
	nop

	flw	%f0, 0(%v0)
	nop
	addi	%v1, %zero, 67
	nop

	flw	%f3, 0(%v1)
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f1, 0(%v0)
	nop
	addi	%v1, %zero, 67
	nop

	flw	%f4, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131

	flw	%f1, 1(%v0)
	nop
	addi	%v1, %zero, 67
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 131

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 0(%v0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 7(%sp)
	nop
	fneg	%f0, %f0
	fmul	%f2, %f2, %f3

	flw	%f3, 1(%v0)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f4, 2(%v1)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 444(%zero)
	nop
	fneg	%f2, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.17435

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17436

fbgt_else.17435:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17436:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17437

	nop
	nop
	addi	%v1, %zero, 140
	nop

	flw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 134
	nop

	flw	%f4, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f0, %f4
	addi	%v1, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	fsw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 134
	nop

	flw	%f4, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f0, %f4
	addi	%v1, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	fsw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 134
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f4
	addi	%v1, %zero, 140

	nop
	nop
	fadd	%f0, %f3, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17438

bnei_else.17437:
bnei_cont.17438:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.17439

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17440

fbgt_else.17439:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17440:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17441

	nop
	nop
	fmul	%f0, %f2, %f2
	addi	%v1, %zero, 140

	flw	%f2, 10(%sp)
	flw	%f3, 0(%v1)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	addi	%v1, %zero, 140

	nop
	nop
	fadd	%f3, %f3, %f0
	nop

	fsw	%f3, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fadd	%f3, %f3, %f0
	addi	%v1, %zero, 140

	fsw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	nop

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f3, %f0
	addi	%v1, %zero, 140

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17442

bnei_else.17441:
bnei_cont.17442:
bnei_cont.17434:
	sw	%ra, 11(%sp)
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 0(%v0)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	addi	%v0, %zero, 151
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 151
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 127
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 151
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, -1
	nop

	nop
	nop
	addi	%v0, %zero, 127
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v0, %zero, 414

	lw	%ra, 11(%sp)
	lw	%v0, 0(%v0)
	nop
	nop

	flw	%f0, 7(%sp)
	nop
	addi	%v0, %v0, -1
	nop

	flw	%f1, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	trace_reflections.2959

	flw	%f0, 419(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17443

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17444

fbgt_else.17443:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17444:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17445

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.17446

	nop
	nop
	nop
	j	bgti_cont.17447

bgti_else.17446:
	lw	%a1, 5(%sp)
	nop
	addi	%v1, %v0, 1
	addi	%a0, %zero, -1

	nop
	nop
	add	%at, %a1, %v1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

bgti_cont.17447:
	lw	%v1, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.17448

	nop
	nop
	nop
	jr	%ra

bnei_else.17448:
	flw	%f0, 448(%zero)
	lw	%v1, 9(%sp)
	addi	%v0, %v0, 1
	nop

	lw	%v1, 7(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	flw	%f2, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f2
	addi	%v1, %zero, 126

	flw	%f2, 0(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	fadd	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	trace_ray.2964

bnei_else.17445:
	nop
	nop
	nop
	jr	%ra

bnei_else.17416:
	lw	%v1, 4(%sp)
	nop
	addi	%v0, %zero, -1
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17451

	lw	%v0, 3(%sp)
	nop
	addi	%v1, %zero, 67
	nop

	flw	%f0, 0(%v0)
	flw	%f1, 0(%v1)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 67

	flw	%f1, 1(%v0)
	flw	%f2, 1(%v1)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17452

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17453

fbgt_else.17452:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17453:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17454

	nop
	nop
	fmul	%f1, %f0, %f0
	addi	%v0, %zero, 70

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 140

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	addi	%v0, %zero, 140

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	addi	%v0, %zero, 140

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17454:
	nop
	nop
	nop
	jr	%ra

bnei_else.17451:
	nop
	nop
	nop
	jr	%ra

bgt_else.17409:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2970:
	flw	%f1, 436(%zero)
	fsw	%f0, 0(%sp)
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	addi	%v1, %zero, 126
	nop

	fsw	%f1, 0(%v1)
	sw	%ra, 2(%sp)
	addi	%a0, %zero, 123
	nop

	lw	%a0, 0(%a0)
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 3

	nop
	nop
	addi	%k0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %v0, 0
	nop

	nop
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %k0, 0
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2937

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 126

	lw	%ra, 2(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17459

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17460

fbgt_else.17459:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17460:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17461

	flw	%f1, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17463

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17464

fbgt_else.17463:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17464:
	nop
	nop
	nop
	j	bnei_cont.17462

bnei_else.17461:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.17462:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17465

	nop
	nop
	addi	%v0, %zero, 130
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v0, 0(%at)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	lw	%a0, 1(%v0)
	nop
	nop

	sw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.17466

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.17468

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	get_nvector_second.2947

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17469

bnei_else.17468:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	fsw	%f0, 1(%v1)
	nop
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

bnei_cont.17469:
	nop
	nop
	nop
	j	bnei_cont.17467

bnei_else.17466:
	nop
	nop
	addi	%a0, %zero, 125
	nop

	lw	%a0, 0(%a0)
	flw	%f0, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 131
	nop

	fsw	%f0, 0(%a1)
	flw	%f1, 444(%zero)
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 131
	nop

	fsw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 131
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, -1
	nop

	nop
	nop
	addi	%a0, %a0, -1
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.17470

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.17471

fbeq_else.17470:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.17471:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17472

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17473

bnei_else.17472:
	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17474

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17475

fbgt_else.17474:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17475:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17476

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17477

bnei_else.17476:
	flw	%f0, 443(%zero)
	nop
	nop
	nop

bnei_cont.17477:
bnei_cont.17473:
	nop
	nop
	fneg	%f0, %f0
	addi	%v1, %zero, 131

	nop
	nop
	add	%at, %v1, %a1
	nop

	fsw	%f0, 0(%at)
	nop
	nop
	nop

bnei_cont.17467:
	lw	%v0, 2(%sp)
	nop
	addi	%v1, %zero, 127
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	utexture.2952

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 0

	lw	%ra, 3(%sp)
	nop
	addi	%v1, %zero, 123
	nop

	lw	%v1, 0(%v1)
	sw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2912

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17478

	nop
	nop
	nop
	jr	%ra

bnei_else.17478:
	nop
	nop
	addi	%v0, %zero, 131
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 131

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17480

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17481

fbgt_else.17480:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17481:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17482

	nop
	nop
	nop
	j	bnei_cont.17483

bnei_else.17482:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

bnei_cont.17483:
	flw	%f1, 0(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	lw	%v0, 7(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.17465:
	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2973:
	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17486

	flw	%f1, 0(%v1)
	nop
	add	%at, %v0, %a1
	nop

	lw	%a2, 0(%at)
	flw	%f2, 1(%v1)
	nop
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17487

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17488

fbgt_else.17487:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.17488:
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

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.17489

	flw	%f1, 418(%zero)
	nop
	addi	%a2, %a1, 1
	nop

	nop
	nop
	add	%at, %v0, %a2
	fdiv	%f0, %f0, %f1

	lw	%a2, 0(%at)
	fsw	%f0, 4(%sp)
	nop
	nop

	sw	%a2, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	judge_intersection_fast.2941

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17491

	nop
	nop
	addi	%v0, %zero, 130
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v0, 0(%at)
	lw	%v1, 5(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	sw	%v0, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	get_nvector.2949

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 127

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	utexture.2952

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v0, %zero, 0

	lw	%ra, 7(%sp)
	nop
	addi	%v1, %zero, 123
	nop

	lw	%v1, 0(%v1)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2912

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17493

	nop
	nop
	nop
	j	bnei_cont.17494

bnei_else.17493:
	nop
	nop
	addi	%v0, %zero, 131
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 131

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17495

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17496

fbgt_else.17495:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17496:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17497

	nop
	nop
	nop
	j	bnei_cont.17498

bnei_else.17497:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

bnei_cont.17498:
	flw	%f1, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	lw	%v0, 7(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

bnei_cont.17494:
	nop
	nop
	nop
	j	bnei_cont.17492

bnei_else.17491:
bnei_cont.17492:
	nop
	nop
	nop
	j	bnei_cont.17490

bnei_else.17489:
	flw	%f1, 417(%zero)
	nop
	add	%at, %v0, %a1
	nop

	lw	%a2, 0(%at)
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 7(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a2, 8(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	judge_intersection_fast.2941

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17499

	nop
	nop
	addi	%v0, %zero, 130
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v0, 0(%at)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	sw	%v0, 9(%sp)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	get_nvector.2949

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %zero, 127

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	utexture.2952

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v0, %zero, 0

	lw	%ra, 10(%sp)
	nop
	addi	%v1, %zero, 123
	nop

	lw	%v1, 0(%v1)
	sw	%ra, 10(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2912

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17501

	nop
	nop
	nop
	j	bnei_cont.17502

bnei_else.17501:
	nop
	nop
	addi	%v0, %zero, 131
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 131

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	addi	%v0, %zero, 131

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.17503

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17504

fbgt_else.17503:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.17504:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17505

	nop
	nop
	nop
	j	bnei_cont.17506

bnei_else.17505:
	flw	%f0, 444(%zero)
	nop
	nop
	nop

bnei_cont.17506:
	flw	%f1, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	lw	%v0, 7(%v0)
	nop
	nop
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %zero, 137

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 137
	nop

	flw	%f1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 134
	nop

	flw	%f2, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	addi	%v0, %zero, 137

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

bnei_cont.17502:
	nop
	nop
	nop
	j	bnei_cont.17500

bnei_else.17499:
bnei_cont.17500:
bnei_cont.17490:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -2
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17507

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a1, 1(%sp)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	flw	%f1, 0(%a1)
	nop
	nop

	lw	%a0, 0(%a0)
	flw	%f2, 1(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a1)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17508

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17509

fbgt_else.17508:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.17509:
	sw	%v0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17510

	flw	%f1, 418(%zero)
	sw	%ra, 11(%sp)
	addi	%a0, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %a0
	fdiv	%f0, %f0, %f1

	lw	%a0, 0(%at)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17511

bnei_else.17510:
	flw	%f1, 417(%zero)
	sw	%ra, 11(%sp)
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	fdiv	%f0, %f0, %f1
	addi	%sp, %sp, 12

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

bnei_cont.17511:
	lw	%v0, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%a1, %v0, -2
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2973

bgti_else.17507:
	nop
	nop
	nop
	jr	%ra

bgti_else.17486:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray_80percent.2982:
	sw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17514

	flw	%f0, 0(%a0)
	nop
	addi	%a1, %zero, 166
	nop

	lw	%a1, 0(%a1)
	nop
	addi	%a2, %zero, 151
	addi	%v0, %a0, 0

	fsw	%f0, 0(%a2)
	sw	%a1, 3(%sp)
	nop
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 4(%sp)
	addi	%a2, %zero, 151
	nop

	fsw	%f0, 1(%a2)
	nop
	addi	%sp, %sp, 5
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a2, %zero, 151
	nop

	fsw	%f0, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 0
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %a2, -1
	nop

	nop
	nop
	addi	%v1, %a2, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %zero, 118

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17515

bnei_else.17514:
bnei_cont.17515:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.17516

	lw	%a0, 1(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 1(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 4(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 5(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 6
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a1, %zero, 118

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17517

bnei_else.17516:
bnei_cont.17517:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.17518

	lw	%a0, 1(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 2(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 5(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 6(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 7
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 118

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17519

bnei_else.17518:
bnei_cont.17519:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.17520

	lw	%a0, 1(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 3(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 6(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 7(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 8
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a1, %zero, 118

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17521

bnei_else.17520:
bnei_cont.17521:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.17522

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %zero, 166
	nop

	lw	%v0, 4(%v0)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 0(%a0)
	sw	%v0, 7(%sp)
	nop
	nop

	flw	%f0, 1(%v1)
	sw	%ra, 8(%sp)
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 1(%a0)
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 9

	flw	%f0, 2(%v1)
	nop
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 0
	nop

	lw	%a0, 0(%a0)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -9
	addi	%a1, %zero, 118

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2973

bnei_else.17522:
	nop
	nop
	nop
	jr	%ra

calc_diffuse_using_1point.2986:
	lw	%a0, 5(%v0)
	sw	%v1, 0(%sp)
	addi	%t0, %zero, 137
	nop

	lw	%a1, 7(%v0)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a2, 1(%v0)
	lw	%a0, 0(%at)
	nop
	nop

	lw	%a3, 4(%v0)
	flw	%f0, 0(%a0)
	add	%at, %a1, %v1
	nop

	fsw	%f0, 0(%t0)
	lw	%v0, 6(%v0)
	nop
	nop

	flw	%f0, 1(%a0)
	lw	%v0, 0(%v0)
	addi	%t0, %zero, 137
	nop

	fsw	%f0, 1(%t0)
	sw	%a3, 1(%sp)
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 137
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	add	%at, %a2, %v1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17524

	flw	%f0, 0(%a1)
	nop
	addi	%a2, %zero, 166
	nop

	lw	%a2, 0(%a2)
	nop
	addi	%t0, %zero, 151
	addi	%v0, %a1, 0

	fsw	%f0, 0(%t0)
	sw	%a2, 5(%sp)
	nop
	nop

	flw	%f0, 1(%a1)
	sw	%ra, 6(%sp)
	addi	%t0, %zero, 151
	nop

	fsw	%f0, 1(%t0)
	nop
	addi	%sp, %sp, 7
	nop

	flw	%f0, 2(%a1)
	nop
	addi	%t0, %zero, 151
	nop

	fsw	%f0, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 0
	nop

	lw	%t0, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %t0, -1
	nop

	nop
	nop
	addi	%v1, %t0, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17526

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17527

fbgt_else.17526:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17527:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17528

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17529

bnei_else.17528:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.17529:
	lw	%v0, 5(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17525

bnei_else.17524:
bnei_cont.17525:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.17530

	lw	%a0, 3(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 1(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 6(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 7(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 8
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17532

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17533

fbgt_else.17532:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17533:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17534

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17535

bnei_else.17534:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

bnei_cont.17535:
	lw	%v0, 6(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17531

bnei_else.17530:
bnei_cont.17531:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.17536

	lw	%a0, 3(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 2(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 7(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 8(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 9
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17538

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17539

fbgt_else.17538:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17539:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17540

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17541

bnei_else.17540:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bnei_cont.17541:
	lw	%v0, 7(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
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
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17537

bnei_else.17536:
bnei_cont.17537:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.17542

	lw	%a0, 3(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	lw	%v1, 3(%v1)
	flw	%f0, 0(%a0)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 0(%a1)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0
	nop

	flw	%f0, 1(%a0)
	sw	%ra, 9(%sp)
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 1(%a1)
	nop
	addi	%sp, %sp, 10
	nop

	flw	%f0, 2(%a0)
	nop
	addi	%a1, %zero, 151
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17544

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17545

fbgt_else.17544:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17545:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17546

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17547

bnei_else.17546:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.17547:
	lw	%v0, 8(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17543

bnei_else.17542:
bnei_cont.17543:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.17548

	lw	%v1, 3(%sp)
	nop
	addi	%v0, %zero, 166
	nop

	lw	%v0, 4(%v0)
	flw	%f0, 0(%v1)
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 0(%a0)
	sw	%v0, 9(%sp)
	nop
	nop

	flw	%f0, 1(%v1)
	sw	%ra, 10(%sp)
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 1(%a0)
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 11

	flw	%f0, 2(%v1)
	nop
	addi	%a0, %zero, 151
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 0
	nop

	lw	%a0, 0(%a0)
	nop
	nop
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
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17550

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17551

fbgt_else.17550:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17551:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17552

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17553

bnei_else.17552:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.17553:
	lw	%v0, 9(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17549

bnei_else.17548:
bnei_cont.17549:
	lw	%v0, 0(%sp)
	nop
	addi	%a0, %zero, 137
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	addi	%v0, %zero, 140
	nop

	nop
	nop
	nop
	j	vecaccumv.2679

calc_diffuse_using_5points.2989:
	nop
	nop
	add	%at, %v1, %v0
	addi	%t2, %zero, 137

	lw	%v1, 0(%at)
	nop
	addi	%a3, %v0, -1
	nop

	lw	%v1, 5(%v1)
	nop
	add	%at, %a0, %a3
	addi	%t1, %v0, 1

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 5(%a3)
	nop
	add	%at, %a0, %v0
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	lw	%t0, 5(%t0)
	nop
	add	%at, %a0, %t1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 5(%t1)
	nop
	add	%at, %a1, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a1, 5(%a1)
	nop
	add	%at, %v1, %a2
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	add	%at, %a3, %a2
	nop

	fsw	%f0, 0(%t2)
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 1(%v1)
	nop
	addi	%t2, %zero, 137
	nop

	fsw	%f0, 1(%t2)
	nop
	nop
	nop

	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 137
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%at)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	addi	%a3, %zero, 137
	add	%at, %t0, %a2

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a3)
	flw	%f1, 1(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137

	fsw	%f0, 1(%a3)
	flw	%f1, 2(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 2(%a3)
	nop
	addi	%v1, %zero, 137
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%at)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	addi	%a3, %zero, 137
	add	%at, %t1, %a2

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a3)
	flw	%f1, 1(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137

	fsw	%f0, 1(%a3)
	flw	%f1, 2(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 2(%a3)
	nop
	addi	%v1, %zero, 137
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%at)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	addi	%a3, %zero, 137
	add	%at, %a1, %a2

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 137

	fsw	%f0, 0(%a3)
	flw	%f1, 1(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a3, %zero, 137

	fsw	%f0, 1(%a3)
	flw	%f1, 2(%v1)
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 137
	nop

	flw	%f0, 2(%a3)
	nop
	addi	%v1, %zero, 137
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%at)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	addi	%a1, %zero, 137
	add	%at, %a0, %v0

	lw	%v0, 0(%at)
	nop
	fadd	%f0, %f0, %f1
	addi	%a0, %zero, 137

	fsw	%f0, 0(%a1)
	flw	%f1, 1(%v1)
	nop
	nop

	lw	%v0, 4(%v0)
	nop
	addi	%a1, %zero, 137
	nop

	flw	%f0, 1(%a1)
	nop
	add	%at, %v0, %a2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	addi	%a1, %zero, 137

	fsw	%f0, 1(%a1)
	flw	%f1, 2(%v1)
	addi	%v0, %zero, 140
	nop

	nop
	nop
	addi	%a1, %zero, 137
	nop

	flw	%f0, 2(%a1)
	nop
	addi	%v1, %zero, 137
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	vecaccumv.2679

do_without_neighbors.2995:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17554

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
	blti	%a0, 0, bgti_else.17555

	lw	%a0, 3(%v0)
	nop
	nop
	nop

	sw	%v0, 0(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%v1, 1(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17556

	lw	%a0, 5(%v0)
	nop
	addi	%t0, %zero, 137
	nop

	lw	%a1, 7(%v0)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a2, 1(%v0)
	lw	%a0, 0(%at)
	nop
	nop

	lw	%a3, 4(%v0)
	flw	%f0, 0(%a0)
	add	%at, %a1, %v1
	nop

	fsw	%f0, 0(%t0)
	lw	%a1, 0(%at)
	nop
	nop

	flw	%f0, 1(%a0)
	sw	%a3, 2(%sp)
	addi	%t0, %zero, 137
	add	%at, %a2, %v1

	fsw	%f0, 1(%t0)
	lw	%a2, 0(%at)
	addi	%v1, %a1, 0
	nop

	flw	%f0, 2(%a0)
	sw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 137
	addi	%sp, %sp, 4

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

	lw	%a0, 6(%v0)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray_80percent.2982

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %zero, 137

	lw	%ra, 3(%sp)
	nop
	addi	%a1, %zero, 140
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	vecaccumv.2679

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17557

bnei_else.17556:
bnei_cont.17557:
	lw	%v0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17558

	lw	%v0, 0(%sp)
	nop
	nop
	nop

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
	blti	%a0, 0, bgti_else.17559

	lw	%a0, 3(%v0)
	sw	%v1, 3(%sp)
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
	beqi	%a0, 0, bnei_else.17560

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.2986

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17561

bnei_else.17560:
bnei_cont.17561:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, 1
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	do_without_neighbors.2995

bgti_else.17559:
	nop
	nop
	nop
	jr	%ra

bgt_else.17558:
	nop
	nop
	nop
	jr	%ra

bgti_else.17555:
	nop
	nop
	nop
	jr	%ra

bgt_else.17554:
	nop
	nop
	nop
	jr	%ra

try_exploit_neighbors.3011:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.17566

	lw	%t1, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t1, %a3
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.17567

	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t1, %a3
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t2, %a3
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17568

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t2, %a3
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17570

	nop
	nop
	addi	%t2, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t2, %a3
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17572

	nop
	nop
	addi	%t2, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t2, %a3
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17574

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.17575

beq_else.17574:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17575:
	nop
	nop
	nop
	j	beq_cont.17573

beq_else.17572:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17573:
	nop
	nop
	nop
	j	beq_cont.17571

beq_else.17570:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17571:
	nop
	nop
	nop
	j	beq_cont.17569

beq_else.17568:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17569:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.17576

	lw	%t0, 3(%t0)
	sw	%v1, 0(%sp)
	nop
	nop

	sw	%a2, 1(%sp)
	nop
	add	%at, %t0, %a3
	nop

	lw	%t0, 0(%at)
	sw	%a0, 2(%sp)
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	nop
	nop

	sw	%a3, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.17577

	sw	%ra, 6(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	addi	%a1, %a2, 0
	nop

	nop
	nop
	addi	%a2, %a3, 0
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_5points.2989

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17578

bnei_else.17577:
bnei_cont.17578:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17579

	lw	%a2, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.17580

	lw	%a3, 2(%sp)
	nop
	add	%at, %a0, %v0
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a2, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a3, %v0
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	lw	%t0, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t0, %v1
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t0, %a2, beq_else.17581

	lw	%t0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t0, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t1, %v1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t1, %a2, beq_else.17583

	nop
	nop
	addi	%t1, %v0, -1
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t1, %v1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t1, %a2, beq_else.17585

	nop
	nop
	addi	%t1, %v0, 1
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t1, %v1
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t1, %a2, beq_else.17587

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.17588

beq_else.17587:
	nop
	nop
	addi	%a2, %zero, 0
	nop

beq_cont.17588:
	nop
	nop
	nop
	j	beq_cont.17586

beq_else.17585:
	nop
	nop
	addi	%a2, %zero, 0
	nop

beq_cont.17586:
	nop
	nop
	nop
	j	beq_cont.17584

beq_else.17583:
	nop
	nop
	addi	%a2, %zero, 0
	nop

beq_cont.17584:
	nop
	nop
	nop
	j	beq_cont.17582

beq_else.17581:
	nop
	nop
	addi	%a2, %zero, 0
	nop

beq_cont.17582:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.17589

	lw	%a1, 3(%a1)
	sw	%v1, 6(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %v1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.17590

	lw	%a1, 1(%sp)
	nop
	addi	%a2, %v1, 0
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_5points.2989

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17591

bnei_else.17590:
bnei_cont.17591:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%a3, %v0, 1
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	lw	%a1, 4(%sp)
	nop
	nop
	nop

	lw	%a2, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	try_exploit_neighbors.3011

bnei_else.17589:
	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	do_without_neighbors.2995

bgti_else.17580:
	nop
	nop
	nop
	jr	%ra

bgt_else.17579:
	nop
	nop
	nop
	jr	%ra

bnei_else.17576:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.17594

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v1, %a3
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.17595

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	sw	%v0, 7(%sp)
	nop
	add	%at, %v1, %a3
	nop

	lw	%v1, 0(%at)
	sw	%a3, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17596

	sw	%ra, 8(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.2986

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17597

bnei_else.17596:
bnei_cont.17597:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, 1
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	do_without_neighbors.2995

bgti_else.17595:
	nop
	nop
	nop
	jr	%ra

bgt_else.17594:
	nop
	nop
	nop
	jr	%ra

bgti_else.17567:
	nop
	nop
	nop
	jr	%ra

bgt_else.17566:
	nop
	nop
	nop
	jr	%ra

write_rgb.3022:
	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f0, 0(%v0)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17602

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17604

	nop
	nop
	nop
	j	bgti_cont.17605

bgti_else.17604:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17605:
	nop
	nop
	nop
	j	bgt_cont.17603

bgt_else.17602:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17603:
	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 32

	lw	%ra, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 140

	lw	%ra, 0(%sp)
	flw	%f0, 1(%v0)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17606

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17608

	nop
	nop
	nop
	j	bgti_cont.17609

bgti_else.17608:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17609:
	nop
	nop
	nop
	j	bgt_cont.17607

bgt_else.17606:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17607:
	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 32

	lw	%ra, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 140

	lw	%ra, 0(%sp)
	flw	%f0, 2(%v0)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17610

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17612

	nop
	nop
	nop
	j	bgti_cont.17613

bgti_else.17612:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17613:
	nop
	nop
	nop
	j	bgt_cont.17611

bgt_else.17610:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17611:
	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 10

	lw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	min_caml_print_char

pretrace_diffuse_rays.3024:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17614

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
	blti	%a0, 0, bgti_else.17615

	lw	%a0, 3(%v0)
	sw	%v1, 0(%sp)
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
	beqi	%a0, 0, bnei_else.17616

	lw	%a0, 6(%v0)
	flw	%f0, 444(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	lw	%a2, 1(%v0)
	addi	%a1, %zero, 137
	nop

	fsw	%f0, 0(%a1)
	sw	%v0, 1(%sp)
	addi	%a3, %zero, 166
	nop

	nop
	nop
	addi	%a1, %zero, 137
	add	%at, %a3, %a0

	fsw	%f0, 1(%a1)
	lw	%a0, 0(%at)
	addi	%a3, %zero, 151
	nop

	nop
	nop
	addi	%a1, %zero, 137
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	lw	%a1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a1, %v1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%a2)
	nop
	nop
	nop

	fsw	%f0, 0(%a3)
	sw	%a2, 2(%sp)
	nop
	nop

	flw	%f0, 1(%a2)
	sw	%a1, 3(%sp)
	addi	%a3, %zero, 151
	nop

	fsw	%f0, 1(%a3)
	sw	%a0, 4(%sp)
	addi	%v0, %a2, 0
	nop

	flw	%f0, 2(%a2)
	sw	%ra, 5(%sp)
	addi	%a3, %zero, 151
	nop

	fsw	%f0, 2(%a3)
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	addi	%a3, %zero, 0
	nop

	lw	%a3, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %a3, -1
	nop

	nop
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a1, %zero, 118

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a1, %zero, 137

	lw	%ra, 5(%sp)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	addi	%a1, %zero, 137
	nop

	lw	%v1, 5(%v0)
	lw	%a0, 0(%sp)
	nop
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	fsw	%f0, 1(%v1)
	nop
	addi	%a1, %zero, 137
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17617

bnei_else.17616:
bnei_cont.17617:
	lw	%v1, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17618

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
	blti	%a0, 0, bgti_else.17619

	lw	%a0, 3(%v0)
	sw	%v1, 5(%sp)
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
	beqi	%a0, 0, bnei_else.17620

	lw	%a0, 6(%v0)
	flw	%f0, 444(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	lw	%a2, 1(%v0)
	addi	%a1, %zero, 137
	nop

	fsw	%f0, 0(%a1)
	sw	%v0, 1(%sp)
	addi	%a3, %zero, 166
	nop

	nop
	nop
	addi	%a1, %zero, 137
	add	%at, %a3, %a0

	fsw	%f0, 1(%a1)
	lw	%a0, 0(%at)
	addi	%a3, %zero, 151
	nop

	nop
	nop
	addi	%a1, %zero, 137
	nop

	fsw	%f0, 2(%a1)
	nop
	nop
	nop

	lw	%a1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a1, %v1
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%a2)
	nop
	nop
	nop

	fsw	%f0, 0(%a3)
	sw	%a2, 6(%sp)
	nop
	nop

	flw	%f0, 1(%a2)
	sw	%a1, 7(%sp)
	addi	%a3, %zero, 151
	nop

	fsw	%f0, 1(%a3)
	sw	%a0, 8(%sp)
	addi	%v0, %a2, 0
	nop

	flw	%f0, 2(%a2)
	sw	%ra, 9(%sp)
	addi	%a3, %zero, 151
	nop

	fsw	%f0, 2(%a3)
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	addi	%a3, %zero, 0
	nop

	lw	%a3, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %a3, -1
	nop

	nop
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 7(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17622

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17623

fbgt_else.17622:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17623:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17624

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17625

bnei_else.17624:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.17625:
	lw	%v0, 8(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 7(%sp)
	nop
	nop
	nop

	lw	%a0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a1, %zero, 137

	lw	%ra, 9(%sp)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	addi	%a1, %zero, 137
	nop

	lw	%v1, 5(%v0)
	lw	%a0, 5(%sp)
	nop
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	fsw	%f0, 0(%v1)
	nop
	nop
	nop

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	fsw	%f0, 1(%v1)
	nop
	addi	%a1, %zero, 137
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17621

bnei_else.17620:
bnei_cont.17621:
	lw	%v1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	j	pretrace_diffuse_rays.3024

bgti_else.17619:
	nop
	nop
	nop
	jr	%ra

bgt_else.17618:
	nop
	nop
	nop
	jr	%ra

bgti_else.17615:
	nop
	nop
	nop
	jr	%ra

bgt_else.17614:
	nop
	nop
	nop
	jr	%ra

pretrace_pixels.3027:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.17630

	fsw	%f2, 0(%sp)
	nop
	addi	%a1, %zero, 147
	nop

	flw	%f3, 0(%a1)
	fsw	%f1, 1(%sp)
	addi	%a2, %zero, 163
	nop

	fsw	%f0, 2(%sp)
	nop
	addi	%a1, %zero, 145
	nop

	lw	%a1, 0(%a1)
	sw	%a0, 3(%sp)
	nop
	nop

	nop
	nop
	sub	%a1, %v1, %a1
	nop

	sw	%v1, 4(%sp)
	nop
	itof	%f4, %a1
	nop

	sw	%v0, 5(%sp)
	nop
	fmul	%f3, %f3, %f4
	addi	%a1, %zero, 154

	flw	%f4, 0(%a1)
	sw	%ra, 6(%sp)
	addi	%v0, %a2, 0
	nop

	nop
	nop
	fmul	%f4, %f3, %f4
	addi	%a1, %zero, 163

	nop
	nop
	fadd	%f4, %f4, %f0
	addi	%sp, %sp, 7

	fsw	%f4, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 154
	nop

	flw	%f4, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f3, %f4
	addi	%a1, %zero, 163

	nop
	nop
	fadd	%f4, %f4, %f1
	nop

	fsw	%f4, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 154
	nop

	flw	%f4, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	addi	%a1, %zero, 163

	nop
	nop
	fadd	%f3, %f3, %f2
	nop

	fsw	%f3, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	nop
	jal	vecunit_sgn.2655

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 140
	nop

	fsw	%f0, 0(%v0)
	lw	%v1, 4(%sp)
	addi	%a2, %zero, 163
	nop

	lw	%a0, 5(%sp)
	nop
	addi	%v0, %zero, 140
	nop

	fsw	%f0, 1(%v0)
	flw	%f1, 444(%zero)
	add	%at, %a0, %v1
	nop

	lw	%a1, 0(%at)
	sw	%ra, 6(%sp)
	addi	%v0, %zero, 140
	addi	%v1, %a2, 0

	fsw	%f0, 2(%v0)
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	addi	%v0, %zero, 64
	nop

	flw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 64
	nop

	flw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 64
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 148
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 0
	nop

	flw	%f0, 448(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jal	trace_ray.2964

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a1, %zero, 140

	lw	%ra, 6(%sp)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	addi	%a1, %zero, 140
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	add	%at, %v1, %v0
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%a1)
	nop
	nop
	nop

	fsw	%f0, 1(%a0)
	nop
	addi	%a1, %zero, 140
	nop

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	fsw	%f0, 2(%a0)
	lw	%a1, 3(%sp)
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 6(%a0)
	nop
	add	%at, %v1, %v0
	nop

	sw	%a1, 0(%a0)
	nop
	nop
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a2, 2(%a0)
	nop
	nop
	nop

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.17631

	lw	%a2, 3(%a0)
	nop
	nop
	nop

	lw	%a2, 0(%a2)
	sw	%a0, 6(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.17633

	lw	%a2, 6(%a0)
	flw	%f0, 444(%zero)
	nop
	nop

	lw	%a2, 0(%a2)
	lw	%t0, 1(%a0)
	addi	%a3, %zero, 137
	nop

	fsw	%f0, 0(%a3)
	lw	%t0, 0(%t0)
	addi	%t1, %zero, 166
	nop

	sw	%t0, 7(%sp)
	nop
	addi	%a3, %zero, 137
	add	%at, %t1, %a2

	fsw	%f0, 1(%a3)
	lw	%a2, 0(%at)
	addi	%t1, %zero, 151
	addi	%v0, %t0, 0

	nop
	nop
	addi	%a3, %zero, 137
	nop

	fsw	%f0, 2(%a3)
	nop
	nop
	nop

	lw	%a3, 7(%a0)
	flw	%f0, 0(%t0)
	nop
	nop

	lw	%a3, 0(%a3)
	fsw	%f0, 0(%t1)
	nop
	nop

	flw	%f0, 1(%t0)
	sw	%a3, 8(%sp)
	addi	%t1, %zero, 151
	nop

	fsw	%f0, 1(%t1)
	sw	%a2, 9(%sp)
	nop
	nop

	flw	%f0, 2(%t0)
	sw	%ra, 10(%sp)
	addi	%t1, %zero, 151
	nop

	fsw	%f0, 2(%t1)
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	addi	%t1, %zero, 0
	nop

	lw	%t1, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	addi	%t1, %t1, -1
	nop

	nop
	nop
	addi	%v1, %t1, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2875

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 8(%sp)
	nop
	nop

	lw	%v1, 0(%v1)
	flw	%f1, 0(%a0)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17635

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17636

fbgt_else.17635:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.17636:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17637

	lw	%v1, 119(%v0)
	flw	%f1, 418(%zero)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17638

bnei_else.17637:
	lw	%v1, 118(%v0)
	flw	%f1, 417(%zero)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2970

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.17638:
	lw	%v0, 9(%sp)
	nop
	addi	%a1, %zero, 116
	nop

	lw	%v1, 8(%sp)
	nop
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2973

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %zero, 137

	lw	%ra, 10(%sp)
	flw	%f0, 0(%a0)
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	addi	%a0, %zero, 137
	nop

	lw	%v1, 5(%v0)
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

	flw	%f0, 1(%a0)
	nop
	nop
	nop

	fsw	%f0, 1(%v1)
	nop
	addi	%a0, %zero, 137
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17634

bnei_else.17633:
bnei_cont.17634:
	lw	%v0, 6(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	pretrace_diffuse_rays.3024

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17632

bgti_else.17631:
bgti_cont.17632:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, -1
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.17639

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17640

bgti_else.17639:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.17640:
	flw	%f0, 2(%sp)
	nop
	nop
	nop

	flw	%f1, 1(%sp)
	nop
	nop
	nop

	flw	%f2, 0(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	pretrace_pixels.3027

bgti_else.17630:
	nop
	nop
	nop
	jr	%ra

pretrace_line.3034:
	nop
	nop
	addi	%a1, %zero, 147
	nop

	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 145
	nop

	lw	%a1, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	sub	%v1, %v1, %a1
	nop

	nop
	nop
	itof	%f1, %v1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%v1, %zero, 157

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %zero, 160

	flw	%f2, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	addi	%v1, %zero, 157

	flw	%f2, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%v1, %zero, 160

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	addi	%v1, %zero, 157

	flw	%f3, 2(%v1)
	nop
	fmov	%f29, %f2
	nop

	nop
	nop
	fmul	%f0, %f0, %f3
	addi	%v1, %zero, 160

	flw	%f3, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f3
	addi	%v1, %zero, 143

	lw	%v1, 0(%v1)
	nop
	fmov	%f2, %f0
	nop

	nop
	nop
	addi	%v1, %v1, -1
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f29
	nop

	nop
	nop
	nop
	j	pretrace_pixels.3027

scan_pixel.3038:
	nop
	nop
	addi	%a3, %zero, 143
	nop

	lw	%a3, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v0, %a3, bgt_else.17642

	nop
	nop
	nop
	jr	%ra

bgt_else.17642:
	nop
	nop
	add	%at, %a1, %v0
	addi	%t0, %zero, 140

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%a3, 0(%a3)
	nop
	nop
	nop

	flw	%f0, 0(%a3)
	nop
	nop
	nop

	fsw	%f0, 0(%t0)
	nop
	nop
	nop

	flw	%f0, 1(%a3)
	nop
	addi	%t0, %zero, 140
	nop

	fsw	%f0, 1(%t0)
	nop
	nop
	nop

	flw	%f0, 2(%a3)
	nop
	addi	%t0, %v1, 1
	nop

	nop
	nop
	addi	%a3, %zero, 140
	nop

	fsw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 143
	nop

	lw	%a3, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t0, %a3, bgt_else.17644

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17645

bgt_else.17644:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17646

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17647

bgt_else.17646:
	nop
	nop
	addi	%a3, %zero, 143
	addi	%t0, %v0, 1

	lw	%a3, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t0, %a3, bgt_else.17648

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17649

bgt_else.17648:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17650

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17651

bgt_else.17650:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bgt_cont.17651:
bgt_cont.17649:
bgt_cont.17647:
bgt_cont.17645:
	sw	%a2, 0(%sp)
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

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.17652

	nop
	nop
	addi	%a3, %zero, 0
	add	%at, %a1, %v0

	lw	%t0, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t0)
	nop
	nop
	nop

	lw	%t1, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.17654

	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%t1)
	nop
	add	%at, %a0, %v0
	nop

	lw	%t1, 0(%t1)
	lw	%t2, 0(%at)
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	lw	%t2, 0(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17656

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	lw	%t2, 0(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17658

	nop
	nop
	addi	%t2, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	lw	%t2, 0(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17660

	nop
	nop
	addi	%t2, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t2, 2(%t2)
	nop
	nop
	nop

	lw	%t2, 0(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t2, %t1, beq_else.17662

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.17663

beq_else.17662:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17663:
	nop
	nop
	nop
	j	beq_cont.17661

beq_else.17660:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17661:
	nop
	nop
	nop
	j	beq_cont.17659

beq_else.17658:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17659:
	nop
	nop
	nop
	j	beq_cont.17657

beq_else.17656:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.17657:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.17664

	lw	%t0, 3(%t0)
	nop
	nop
	nop

	lw	%t0, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.17666

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 6

	nop
	nop
	addi	%a1, %a2, 0
	nop

	nop
	nop
	addi	%a2, %a3, 0
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_5points.2989

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17667

bnei_else.17666:
bnei_cont.17667:
	lw	%v0, 4(%sp)
	nop
	addi	%a3, %zero, 1
	nop

	lw	%v1, 2(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	lw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a2, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	try_exploit_neighbors.3011

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17665

bnei_else.17664:
	sw	%ra, 5(%sp)
	nop
	add	%at, %a1, %v0
	addi	%v1, %a3, 0

	lw	%t0, 0(%at)
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	addi	%v0, %t0, 0
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.2995

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.17665:
	nop
	nop
	nop
	j	bgti_cont.17655

bgti_else.17654:
bgti_cont.17655:
	nop
	nop
	nop
	j	bnei_cont.17653

bnei_else.17652:
	nop
	nop
	add	%at, %a1, %v0
	addi	%t0, %zero, 0

	lw	%a3, 0(%at)
	nop
	nop
	nop

	lw	%t1, 2(%a3)
	nop
	nop
	nop

	lw	%t1, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t1, 0, bgti_else.17668

	lw	%t1, 3(%a3)
	nop
	nop
	nop

	lw	%t1, 0(%t1)
	sw	%a3, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.17670

	sw	%ra, 6(%sp)
	nop
	addi	%v1, %t0, 0
	addi	%v0, %a3, 0

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	calc_diffuse_using_1point.2986

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17671

bnei_else.17670:
bnei_cont.17671:
	lw	%v0, 5(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.2995

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17669

bgti_else.17668:
bgti_cont.17669:
bnei_cont.17653:
	nop
	nop
	addi	%v0, %zero, 140
	nop

	flw	%f0, 0(%v0)
	nop
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17672

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17674

	nop
	nop
	nop
	j	bgti_cont.17675

bgti_else.17674:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17675:
	nop
	nop
	nop
	j	bgt_cont.17673

bgt_else.17672:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17673:
	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 32

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 140

	lw	%ra, 6(%sp)
	flw	%f0, 1(%v0)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17676

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17678

	nop
	nop
	nop
	j	bgti_cont.17679

bgti_else.17678:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17679:
	nop
	nop
	nop
	j	bgt_cont.17677

bgt_else.17676:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17677:
	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 32

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 140

	lw	%ra, 6(%sp)
	flw	%f0, 2(%v0)
	addi	%at, %zero, 255
	nop

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17680

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17682

	nop
	nop
	nop
	j	bgti_cont.17683

bgti_else.17682:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.17683:
	nop
	nop
	nop
	j	bgt_cont.17681

bgt_else.17680:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.17681:
	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 10

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 143

	lw	%ra, 6(%sp)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%v0, %v1, bgt_else.17684

	nop
	nop
	nop
	jr	%ra

bgt_else.17684:
	lw	%a1, 3(%sp)
	nop
	addi	%a0, %zero, 140
	nop

	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	lw	%v1, 0(%v1)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%v1)
	nop
	addi	%a0, %zero, 140
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 2(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	addi	%a2, %a0, 1

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 143
	nop

	lw	%v1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a2, %v1, bgt_else.17686

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17687

bgt_else.17686:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a0, bgt_else.17688

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17689

bgt_else.17688:
	nop
	nop
	addi	%v1, %zero, 143
	addi	%a2, %v0, 1

	lw	%v1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a2, %v1, bgt_else.17690

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17691

bgt_else.17690:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17692

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17693

bgt_else.17692:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bgt_cont.17693:
bgt_cont.17691:
bgt_cont.17689:
bgt_cont.17687:
	sw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17694

	lw	%v1, 1(%sp)
	nop
	addi	%a3, %zero, 0
	addi	%k0, %a0, 0

	lw	%a2, 0(%sp)
	nop
	addi	%a0, %v1, 0
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v1, %k0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	try_exploit_neighbors.3011

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17695

bnei_else.17694:
	sw	%ra, 7(%sp)
	nop
	add	%at, %a1, %v0
	addi	%a2, %zero, 0

	lw	%v1, 0(%at)
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a2, 0
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.2995

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

bnei_cont.17695:
	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	write_rgb.3022

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	lw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a2, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	scan_pixel.3038

scan_line.3044:
	nop
	nop
	addi	%a3, %zero, 143
	nop

	lw	%a3, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v0, %a3, bgt_else.17696

	nop
	nop
	nop
	jr	%ra

bgt_else.17696:
	sw	%a2, 0(%sp)
	nop
	addi	%a3, %zero, 143
	nop

	lw	%a3, 1(%a3)
	sw	%a1, 1(%sp)
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%a3, %a3, -1
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v0, %a3, bgt_else.17698

	nop
	nop
	nop
	j	bgt_cont.17699

bgt_else.17698:
	sw	%ra, 5(%sp)
	nop
	addi	%a3, %v0, 1
	addi	%a0, %a2, 0

	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	pretrace_line.3034

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bgt_cont.17699:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %zero, 143
	nop

	lw	%v1, 0(%v1)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17700

	nop
	nop
	nop
	j	bgt_cont.17701

bgt_else.17700:
	lw	%a1, 4(%sp)
	nop
	addi	%a0, %zero, 140
	nop

	lw	%v1, 0(%a1)
	nop
	nop
	nop

	lw	%v1, 0(%v1)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 1(%v1)
	nop
	addi	%a0, %zero, 140
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 2(%v1)
	lw	%a0, 3(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 140
	addi	%a2, %a0, 1

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 143
	nop

	lw	%v1, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a2, %v1, bgt_else.17702

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17703

bgt_else.17702:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a0, bgt_else.17704

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17705

bgt_else.17704:
	nop
	nop
	addi	%v1, %zero, 143
	nop

	lw	%v1, 0(%v1)
	nop
	addi	%at, %zero, 1
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.17706

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.17707

bgt_else.17706:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bgt_cont.17707:
bgt_cont.17705:
bgt_cont.17703:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.17708

	lw	%v1, 2(%sp)
	nop
	addi	%a3, %zero, 0
	addi	%k0, %a0, 0

	lw	%a2, 1(%sp)
	nop
	addi	%a0, %v1, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %k0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	try_exploit_neighbors.3011

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17709

bnei_else.17708:
	lw	%v0, 0(%a1)
	sw	%ra, 5(%sp)
	addi	%v1, %zero, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.2995

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.17709:
	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	write_rgb.3022

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 1

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	lw	%a1, 4(%sp)
	nop
	nop
	nop

	lw	%a2, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	scan_pixel.3038

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bgt_cont.17701:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, 1
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 2
	nop

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.17710

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17711

bgti_else.17710:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.17711:
	nop
	nop
	addi	%v0, %zero, 143
	nop

	lw	%v0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.17712

	nop
	nop
	nop
	jr	%ra

bgt_else.17712:
	sw	%a0, 5(%sp)
	nop
	addi	%v0, %zero, 143
	nop

	lw	%v0, 1(%v0)
	sw	%v1, 6(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.17714

	nop
	nop
	nop
	j	bgt_cont.17715

bgt_else.17714:
	lw	%a1, 2(%sp)
	nop
	addi	%v0, %v1, 1
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v1, %v0, 0
	nop

	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	pretrace_line.3034

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

bgt_cont.17715:
	lw	%v1, 6(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	lw	%a1, 1(%sp)
	nop
	nop
	nop

	lw	%a2, 2(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	scan_pixel.3038

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	addi	%v1, %v1, 2
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.17716

	nop
	nop
	addi	%a2, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17717

bgti_else.17716:
	nop
	nop
	add	%a2, %zero, %v1
	nop

bgti_cont.17717:
	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	lw	%a1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	scan_line.3044

create_float5x3array.3050:
	sw	%ra, 0(%sp)
	nop
	addi	%v0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %v0, 0

	lw	%ra, 0(%sp)
	nop
	addi	%v0, %zero, 5
	nop

	sw	%ra, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %zero, 3

	lw	%ra, 0(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%v1)
	sw	%ra, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	sw	%ra, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	sw	%ra, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 2

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -2
	nop

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

init_line_elements.3054:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.17718

	sw	%v1, 0(%sp)
	nop
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
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

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 5

	lw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 5

	lw	%ra, 4(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
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

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1

	lw	%ra, 7(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 7(%sp)
	nop
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
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

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	lw	%ra, 9(%sp)
	sw	%v0, 7(%v1)
	addi	%hp, %hp, 8
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	sw	%v0, 6(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%v1)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%v1)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17719

	sw	%v0, 9(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 10(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
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

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %zero, 5

	lw	%ra, 11(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %zero, 5

	lw	%ra, 12(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %v1, 0
	nop

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
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
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

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	sw	%v0, 14(%sp)
	nop
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -16
	addi	%v1, %zero, 1

	lw	%ra, 15(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 15(%sp)
	nop
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
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

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -18
	add	%v1, %zero, %hp

	lw	%ra, 17(%sp)
	sw	%v0, 7(%v1)
	addi	%hp, %hp, 8
	nop

	lw	%v0, 16(%sp)
	nop
	nop
	nop

	sw	%v0, 6(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%v0, 15(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%v1)
	nop
	nop
	nop

	lw	%v0, 14(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	lw	%v0, 13(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	nop
	nop
	nop

	lw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	nop
	nop
	nop

	lw	%v0, 11(%sp)
	nop
	nop
	nop

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
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	j	init_line_elements.3054

bgti_else.17719:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.17718:
	nop
	nop
	nop
	jr	%ra

calc_dirvec.3064:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.17720

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1

	nop
	nop
	fadd	%f2, %f2, %f3
	addi	%v0, %zero, 166

	flw	%f3, 448(%zero)
	nop
	add	%at, %v0, %v1
	nop

	lw	%v0, 0(%at)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 448(%zero)
	nop
	fsqrt	%f2, %f2
	add	%at, %v0, %a0

	lw	%v1, 0(%at)
	nop
	fdiv	%f0, %f0, %f2
	nop

	lw	%v1, 0(%v1)
	nop
	fdiv	%f1, %f1, %f2
	nop

	fsw	%f0, 0(%v1)
	nop
	fdiv	%f2, %f3, %f2
	fneg	%f4, %f1

	fsw	%f1, 1(%v1)
	nop
	fneg	%f5, %f2
	nop

	fsw	%f2, 2(%v1)
	nop
	fneg	%f3, %f1
	nop

	nop
	nop
	addi	%v1, %a0, 40
	nop

	nop
	nop
	add	%at, %v0, %v1
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
	nop

	fsw	%f3, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 80
	fneg	%f3, %f0

	nop
	nop
	add	%at, %v0, %v1
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
	nop

	fsw	%f3, 1(%v1)
	nop
	nop
	nop

	fsw	%f4, 2(%v1)
	nop
	fneg	%f3, %f0
	nop

	nop
	nop
	addi	%v1, %a0, 1
	fneg	%f4, %f1

	nop
	nop
	add	%at, %v0, %v1
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
	fneg	%f3, %f0
	nop

	fsw	%f5, 2(%v1)
	nop
	fneg	%f4, %f2
	nop

	nop
	nop
	addi	%v1, %a0, 41
	fneg	%f2, %f2

	nop
	nop
	add	%at, %v0, %v1
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

	nop
	nop
	addi	%v1, %a0, 81
	nop

	nop
	nop
	add	%at, %v0, %v1
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

	nop
	nop
	nop
	jr	%ra

bgti_else.17720:
	flw	%f4, 444(%zero)
	nop
	fmul	%f0, %f1, %f1
	nop

	flw	%f1, 419(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.17722

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.17723

fbgt_else.17722:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.17723:
	flw	%f5, 432(%zero)
	sw	%a0, 0(%sp)
	fabs	%f4, %f1
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	fsw	%f3, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	nop
	nop

	fsw	%f2, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.17724

	flw	%f1, 431(%zero)
	sw	%a1, 6(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.17726

	flw	%f1, 453(%zero)
	nop
	nop
	nop

	flw	%f5, 448(%zero)
	fsw	%f1, 7(%sp)
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	fdiv	%f4, %f5, %f4
	nop

	nop
	nop
	fmov	%f0, %f4
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	flw	%f1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17727

fbgt_else.17726:
	flw	%f1, 452(%zero)
	nop
	nop
	nop

	flw	%f5, 448(%zero)
	fsw	%f1, 8(%sp)
	nop
	nop

	flw	%f6, 448(%zero)
	sw	%ra, 9(%sp)
	fsub	%f5, %f4, %f5
	nop

	nop
	nop
	fadd	%f4, %f4, %f6
	addi	%sp, %sp, 10

	nop
	nop
	fdiv	%f4, %f5, %f4
	nop

	nop
	nop
	fmov	%f0, %f4
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

	flw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.17727:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17728

	nop
	nop
	nop
	j	bnei_cont.17729

bnei_else.17728:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.17729:
	nop
	nop
	nop
	j	fbgt_cont.17725

fbgt_else.17724:
	sw	%ra, 9(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

fbgt_cont.17725:
	flw	%f1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	flw	%f1, 9(%sp)
	nop
	nop
	nop

	fsw	%f0, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	cos.2616

	flw	%f2, 419(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	flw	%f1, 4(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 448(%zero)
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	fdiv	%f2, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.17730

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.17731

fbgt_else.17730:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.17731:
	flw	%f4, 432(%zero)
	fsw	%f0, 11(%sp)
	fabs	%f3, %f2
	nop

	sw	%v0, 12(%sp)
	nop
	nop
	nop

	fsw	%f1, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.17732

	flw	%f2, 431(%zero)
	sw	%v1, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.17734

	flw	%f2, 453(%zero)
	nop
	nop
	nop

	flw	%f4, 448(%zero)
	fsw	%f2, 15(%sp)
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	fdiv	%f3, %f4, %f3
	nop

	nop
	nop
	fmov	%f0, %f3
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	flw	%f1, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17735

fbgt_else.17734:
	flw	%f2, 452(%zero)
	nop
	nop
	nop

	flw	%f4, 448(%zero)
	fsw	%f2, 16(%sp)
	nop
	nop

	flw	%f5, 448(%zero)
	sw	%ra, 17(%sp)
	fsub	%f4, %f3, %f4
	nop

	nop
	nop
	fadd	%f3, %f3, %f5
	addi	%sp, %sp, 18

	nop
	nop
	fdiv	%f3, %f4, %f3
	nop

	nop
	nop
	fmov	%f0, %f3
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	nop
	nop
	nop

	flw	%f1, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.17735:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17736

	nop
	nop
	nop
	j	bnei_cont.17737

bnei_else.17736:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.17737:
	nop
	nop
	nop
	j	fbgt_cont.17733

fbgt_else.17732:
	sw	%ra, 17(%sp)
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	kernel_atan.2612

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	nop
	nop
	nop

fbgt_cont.17733:
	flw	%f1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 17(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	sin.2618

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	flw	%f1, 17(%sp)
	nop
	nop
	nop

	fsw	%f0, 18(%sp)
	nop
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	cos.2616

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	flw	%f1, 18(%sp)
	nop
	nop
	nop

	flw	%f2, 5(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	flw	%f1, 13(%sp)
	nop
	nop
	nop

	flw	%f3, 2(%sp)
	nop
	fmul	%f1, %f0, %f1
	nop

	flw	%f0, 11(%sp)
	nop
	nop
	nop

	lw	%v0, 12(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	calc_dirvec.3064

calc_dirvecs.3072:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17738

	flw	%f2, 476(%zero)
	fsw	%f0, 0(%sp)
	itof	%f1, %v0
	nop

	sw	%v1, 1(%sp)
	nop
	fmul	%f1, %f1, %f2
	addi	%a1, %zero, 0

	flw	%f2, 416(%zero)
	sw	%a0, 2(%sp)
	nop
	nop

	flw	%f3, 444(%zero)
	sw	%v0, 3(%sp)
	fsub	%f2, %f1, %f2
	nop

	flw	%f1, 444(%zero)
	sw	%ra, 4(%sp)
	addi	%v0, %a1, 0
	fmov	%f29, %f3

	nop
	nop
	fmov	%f3, %f0
	addi	%sp, %sp, 5

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f29
	nop

	nop
	nop
	nop
	jal	calc_dirvec.3064

	flw	%f1, 476(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	itof	%f0, %v0
	nop

	flw	%f3, 0(%sp)
	nop
	fmul	%f0, %f0, %f1
	addi	%a1, %a0, 2

	flw	%f1, 419(%zero)
	lw	%a2, 1(%sp)
	addi	%a0, %a1, 0
	addi	%v0, %v1, 0

	sw	%ra, 4(%sp)
	nop
	fadd	%f2, %f0, %f1
	addi	%v1, %a2, 0

	flw	%f0, 444(%zero)
	nop
	addi	%sp, %sp, 5
	nop

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jal	calc_dirvec.3064

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	addi	%v1, %v1, 1
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.17739

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17740

bgti_else.17739:
bgti_cont.17740:
	flw	%f0, 0(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	calc_dirvecs.3072

bgti_else.17738:
	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3077:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17742

	flw	%f1, 476(%zero)
	sw	%a0, 0(%sp)
	itof	%f0, %v0
	nop

	sw	%v1, 1(%sp)
	nop
	fmul	%f0, %f0, %f1
	addi	%a1, %zero, 4

	flw	%f1, 416(%zero)
	sw	%v0, 2(%sp)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	calc_dirvecs.3072

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	addi	%v1, %v1, 2
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.17743

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17744

bgti_else.17743:
bgti_cont.17744:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 4
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17745

	flw	%f1, 476(%zero)
	sw	%a0, 3(%sp)
	itof	%f0, %v0
	nop

	sw	%v1, 4(%sp)
	nop
	fmul	%f0, %f0, %f1
	addi	%a1, %zero, 4

	flw	%f1, 416(%zero)
	sw	%v0, 5(%sp)
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	fsub	%f0, %f0, %f1
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	calc_dirvecs.3072

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 4(%sp)
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	addi	%v1, %v1, 2
	nop

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.17746

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.17747

bgti_else.17746:
bgti_cont.17747:
	lw	%a0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 4
	nop

	nop
	nop
	nop
	j	calc_dirvec_rows.3077

bgti_else.17745:
	nop
	nop
	nop
	jr	%ra

bgti_else.17742:
	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3083:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.17750

	sw	%v1, 0(%sp)
	nop
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	lw	%ra, 2(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 2(%sp)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	add	%v1, %zero, %hp

	lw	%ra, 3(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17751

	sw	%v0, 3(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 4(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0

	lw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 4(%sp)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	add	%v1, %zero, %hp

	lw	%ra, 5(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17752

	sw	%v0, 5(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 6(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	lw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%v1, %zero, %hp

	lw	%ra, 7(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17753

	sw	%v0, 7(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 8(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0

	lw	%ra, 8(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	lw	%ra, 9(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	j	create_dirvec_elements.3083

bgti_else.17753:
	nop
	nop
	nop
	jr	%ra

bgti_else.17752:
	nop
	nop
	nop
	jr	%ra

bgti_else.17751:
	nop
	nop
	nop
	jr	%ra

bgti_else.17750:
	nop
	nop
	nop
	jr	%ra

create_dirvecs.3086:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17758

	sw	%v0, 0(%sp)
	nop
	addi	%v1, %zero, 120
	nop

	sw	%v1, 1(%sp)
	nop
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 2(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %v0, 0

	lw	%ra, 2(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 2(%sp)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	add	%v1, %zero, %hp

	lw	%ra, 3(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
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
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 166

	lw	%ra, 3(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %zero, 3
	nop

	nop
	nop
	addi	%v0, %zero, 166
	nop

	nop
	nop
	add	%at, %v0, %a0
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0

	lw	%ra, 4(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 4(%sp)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	add	%v1, %zero, %hp

	lw	%ra, 5(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 4(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 118(%v1)
	sw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %v0, 0

	lw	%ra, 5(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 5(%sp)
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	lw	%ra, 6(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 5(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 117(%v1)
	sw	%ra, 6(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	lw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%v1, %zero, %hp

	lw	%ra, 7(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 116(%v1)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 115
	addi	%k0, %v1, 0

	nop
	nop
	addi	%v1, %v0, 0
	addi	%sp, %sp, 8

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	create_dirvec_elements.3083

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17759

	sw	%v0, 7(%sp)
	nop
	addi	%v1, %zero, 120
	nop

	sw	%v1, 8(%sp)
	nop
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%ra, 9(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0

	lw	%ra, 9(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 9(%sp)
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	add	%v1, %zero, %hp

	lw	%ra, 10(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %zero, 166

	lw	%ra, 10(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %zero, 3
	nop

	nop
	nop
	addi	%v0, %zero, 166
	nop

	nop
	nop
	add	%at, %v0, %a0
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	sw	%v0, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v1, %v0, 0

	lw	%ra, 11(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 11(%sp)
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -13
	add	%v1, %zero, %hp

	lw	%ra, 12(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 11(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 118(%v1)
	sw	%ra, 12(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	lw	%ra, 12(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 12(%sp)
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -14
	add	%v1, %zero, %hp

	lw	%ra, 13(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 117(%v1)
	sw	%ra, 13(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 116
	addi	%k0, %v1, 0

	nop
	nop
	addi	%v1, %v0, 0
	addi	%sp, %sp, 14

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	create_dirvec_elements.3083

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	j	create_dirvecs.3086

bgti_else.17759:
	nop
	nop
	nop
	jr	%ra

bgti_else.17758:
	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3088:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.17762

	nop
	nop
	add	%at, %v0, %v1
	addi	%a1, %zero, 0

	lw	%a0, 0(%at)
	lw	%a1, 0(%a1)
	nop
	nop

	sw	%v0, 0(%sp)
	nop
	addi	%a1, %a1, -1
	nop

	sw	%v1, 1(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17763

	lw	%v1, 0(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v0, 2(%sp)
	addi	%a1, %a1, -1
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17764

	lw	%a3, 1(%a0)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%t0, 0(%a0)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	sw	%a0, 3(%sp)
	nop
	nop

	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.17766

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.17768

	sw	%a1, 4(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17769

bnei_else.17768:
	sw	%a1, 4(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17769:
	nop
	nop
	nop
	j	bnei_cont.17767

bnei_else.17766:
	sw	%a1, 4(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	lw	%v1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17767:
	lw	%v0, 3(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17765

bgti_else.17764:
bgti_cont.17765:
	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17770

	lw	%v1, 0(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v0, 6(%sp)
	addi	%a1, %a1, -1
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17771

	lw	%v1, 0(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	lw	%a1, 0(%a1)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v0, 7(%sp)
	addi	%a1, %a1, -1
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17772

	lw	%a3, 1(%a0)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%t0, 0(%a0)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	sw	%a0, 8(%sp)
	nop
	nop

	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.17774

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.17776

	sw	%a1, 9(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17777

bnei_else.17776:
	sw	%a1, 9(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17777:
	nop
	nop
	nop
	j	bnei_cont.17775

bnei_else.17774:
	sw	%a1, 9(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	lw	%v1, 9(%sp)
	nop
	nop
	nop

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17775:
	lw	%v0, 8(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17773

bgti_else.17772:
bgti_cont.17773:
	lw	%v0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, -1
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	init_dirvec_constants.3088

bgti_else.17771:
	nop
	nop
	nop
	jr	%ra

bgti_else.17770:
	nop
	nop
	nop
	jr	%ra

bgti_else.17763:
	nop
	nop
	nop
	jr	%ra

bgti_else.17762:
	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3091:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17782

	sw	%v0, 0(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	nop
	nop

	lw	%a0, 119(%v1)
	nop
	addi	%a1, %a1, -1
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17783

	lw	%a3, 1(%a0)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%t0, 0(%a0)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	sw	%a0, 2(%sp)
	nop
	nop

	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.17785

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.17787

	sw	%a1, 3(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17788

bnei_else.17787:
	sw	%a1, 3(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17788:
	nop
	nop
	nop
	j	bnei_cont.17786

bnei_else.17785:
	sw	%a1, 3(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	lw	%v1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17786:
	lw	%v0, 2(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17784

bgti_else.17783:
bgti_cont.17784:
	lw	%v0, 1(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	lw	%v1, 118(%v0)
	lw	%a0, 0(%a0)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%a0, %a0, -1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -6
	addi	%a0, %zero, 0

	lw	%ra, 5(%sp)
	lw	%a0, 0(%a0)
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	addi	%a0, %a0, -1
	nop

	lw	%v1, 117(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.17789

	lw	%a2, 1(%v1)
	nop
	addi	%a1, %zero, 1
	nop

	lw	%a3, 0(%v1)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a1, 0(%at)
	sw	%v1, 5(%sp)
	nop
	nop

	lw	%t0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.17791

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.17793

	sw	%a0, 6(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 7(%sp)
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
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17794

bnei_else.17793:
	sw	%a0, 6(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 7(%sp)
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
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17794:
	nop
	nop
	nop
	j	bnei_cont.17792

bnei_else.17791:
	sw	%a0, 6(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 7(%sp)
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
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17792:
	lw	%v0, 5(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17790

bgti_else.17789:
bgti_cont.17790:
	lw	%v0, 1(%sp)
	nop
	addi	%v1, %zero, 116
	nop

	sw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17795

	sw	%v0, 8(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	nop
	nop

	lw	%a0, 119(%v1)
	nop
	addi	%a1, %a1, -1
	nop

	sw	%v1, 9(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %zero, 0

	lw	%ra, 10(%sp)
	lw	%a0, 0(%a0)
	nop
	nop

	lw	%v0, 9(%sp)
	nop
	addi	%a0, %a0, -1
	nop

	lw	%v1, 118(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.17796

	lw	%a2, 1(%v1)
	nop
	addi	%a1, %zero, 1
	nop

	lw	%a3, 0(%v1)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a1, 0(%at)
	sw	%v1, 10(%sp)
	nop
	nop

	lw	%t0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.17798

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.17800

	sw	%a0, 11(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 12(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	lw	%v1, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17801

bnei_else.17800:
	sw	%a0, 11(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 12(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	lw	%v1, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17801:
	nop
	nop
	nop
	j	bnei_cont.17799

bnei_else.17798:
	sw	%a0, 11(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 12(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	lw	%v1, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17799:
	lw	%v0, 10(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17797

bgti_else.17796:
bgti_cont.17797:
	lw	%v0, 9(%sp)
	nop
	addi	%v1, %zero, 117
	nop

	sw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17802

	sw	%v0, 13(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	lw	%v1, 0(%at)
	lw	%a1, 0(%a1)
	nop
	nop

	lw	%a0, 119(%v1)
	nop
	addi	%a1, %a1, -1
	nop

	sw	%v1, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17803

	lw	%a3, 1(%a0)
	nop
	addi	%a2, %zero, 1
	nop

	lw	%t0, 0(%a0)
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	sw	%a0, 15(%sp)
	nop
	nop

	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.17805

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.17807

	sw	%a1, 16(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 17(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	lw	%v1, 16(%sp)
	nop
	nop
	nop

	lw	%a0, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17808

bnei_else.17807:
	sw	%a1, 16(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 17(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	lw	%v1, 16(%sp)
	nop
	nop
	nop

	lw	%a0, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17808:
	nop
	nop
	nop
	j	bnei_cont.17806

bnei_else.17805:
	sw	%a1, 16(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %t0, 0

	sw	%a3, 17(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	lw	%v1, 16(%sp)
	nop
	nop
	nop

	lw	%a0, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17806:
	lw	%v0, 15(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17804

bgti_else.17803:
bgti_cont.17804:
	lw	%v0, 14(%sp)
	nop
	addi	%v1, %zero, 118
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	lw	%v0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17809

	sw	%v0, 18(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	sw	%ra, 19(%sp)
	nop
	add	%at, %v1, %v0
	addi	%a0, %zero, 119

	lw	%v1, 0(%at)
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	lw	%v0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	j	init_vecset_constants.3091

bgti_else.17809:
	nop
	nop
	nop
	jr	%ra

bgti_else.17802:
	nop
	nop
	nop
	jr	%ra

bgti_else.17795:
	nop
	nop
	nop
	jr	%ra

bgti_else.17782:
	nop
	nop
	nop
	jr	%ra

setup_rect_reflection.3102:
	lw	%v1, 7(%v1)
	nop
	sll	%v0, %v0, 2
	addi	%a0, %zero, 414

	lw	%a0, 0(%a0)
	flw	%f0, 448(%zero)
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	addi	%a1, %zero, 67
	nop

	flw	%f4, 0(%a1)
	nop
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 67

	flw	%f1, 0(%v1)
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	fneg	%f1, %f1
	addi	%v1, %zero, 67

	flw	%f2, 1(%v1)
	flw	%f5, 444(%zero)
	nop
	nop

	fsw	%f1, 0(%sp)
	nop
	fneg	%f2, %f2
	addi	%v1, %zero, 67

	flw	%f3, 2(%v1)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%a0, 2(%sp)
	nop
	fneg	%f3, %f3
	addi	%v1, %v0, 1

	sw	%v1, 3(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	fsw	%f0, 4(%sp)
	nop
	nop
	nop

	fsw	%f3, 5(%sp)
	nop
	fmov	%f0, %f5
	nop

	fsw	%f2, 6(%sp)
	nop
	nop
	nop

	fsw	%f4, 7(%sp)
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
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %v0, 0

	lw	%ra, 8(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 8(%sp)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	lw	%ra, 9(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a1, %zero, 0

	lw	%a0, 8(%sp)
	lw	%a1, 0(%a1)
	nop
	nop

	sw	%a0, 0(%v1)
	flw	%f0, 7(%sp)
	addi	%a1, %a1, -1
	nop

	fsw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	nop
	nop

	flw	%f0, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%a0)
	sw	%v1, 9(%sp)
	nop
	nop

	fsw	%f1, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17814

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17816

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17818

	sw	%a1, 10(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17819

bnei_else.17818:
	sw	%a1, 10(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17819:
	nop
	nop
	nop
	j	bnei_cont.17817

bnei_else.17816:
	sw	%a1, 10(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	lw	%a0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17817:
	lw	%v0, 9(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17815

bgti_else.17814:
bgti_cont.17815:
	flw	%f0, 4(%sp)
	nop
	add	%v0, %zero, %hp
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 9(%sp)
	addi	%hp, %hp, 3
	addi	%a2, %zero, 67

	sw	%v1, 1(%v0)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%v1, 3(%sp)
	flw	%f1, 1(%a2)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	addi	%a2, %zero, 3
	nop

	nop
	nop
	addi	%v1, %zero, 234
	nop

	flw	%f2, 444(%zero)
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	lw	%v1, 1(%sp)
	fmov	%f0, %f2
	nop

	nop
	nop
	addi	%v0, %a0, 1
	addi	%a1, %v1, 2

	sw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%a1, 13(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	fsw	%f1, 14(%sp)
	nop
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -16
	addi	%v1, %v0, 0

	lw	%ra, 15(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 15(%sp)
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	lw	%ra, 16(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a1, %zero, 0

	lw	%a0, 15(%sp)
	lw	%a1, 0(%a1)
	nop
	nop

	sw	%a0, 0(%v1)
	flw	%f0, 0(%sp)
	addi	%a1, %a1, -1
	nop

	fsw	%f0, 0(%a0)
	flw	%f1, 14(%sp)
	nop
	nop

	fsw	%f1, 1(%a0)
	nop
	nop
	nop

	flw	%f1, 5(%sp)
	nop
	nop
	nop

	fsw	%f1, 2(%a0)
	sw	%v1, 16(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17820

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17822

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17824

	sw	%a1, 17(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 18(%sp)
	nop
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	lw	%v1, 17(%sp)
	nop
	nop
	nop

	lw	%a0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17825

bnei_else.17824:
	sw	%a1, 17(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 18(%sp)
	nop
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	lw	%v1, 17(%sp)
	nop
	nop
	nop

	lw	%a0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17825:
	nop
	nop
	nop
	j	bnei_cont.17823

bnei_else.17822:
	sw	%a1, 17(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 18(%sp)
	nop
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	lw	%v1, 17(%sp)
	nop
	nop
	nop

	lw	%a0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17823:
	lw	%v0, 16(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17821

bgti_else.17820:
bgti_cont.17821:
	flw	%f0, 4(%sp)
	nop
	add	%v0, %zero, %hp
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 16(%sp)
	addi	%hp, %hp, 3
	addi	%a1, %zero, 67

	sw	%v1, 1(%v0)
	lw	%a0, 12(%sp)
	nop
	nop

	lw	%v1, 13(%sp)
	flw	%f1, 2(%a1)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	addi	%v1, %zero, 234
	nop

	flw	%f2, 444(%zero)
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	lw	%a0, 1(%sp)
	fmov	%f0, %f2
	nop

	lw	%v0, 2(%sp)
	nop
	addi	%a0, %a0, 3
	nop

	nop
	nop
	addi	%v1, %v0, 2
	nop

	sw	%v1, 19(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%a0, 20(%sp)
	nop
	nop
	nop

	fsw	%f1, 21(%sp)
	nop
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -23
	addi	%v1, %v0, 0

	lw	%ra, 22(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 22(%sp)
	nop
	nop

	sw	%ra, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 24
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -24
	add	%v1, %zero, %hp

	lw	%ra, 23(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a1, %zero, 0

	lw	%a0, 22(%sp)
	lw	%a1, 0(%a1)
	nop
	nop

	sw	%a0, 0(%v1)
	flw	%f0, 0(%sp)
	addi	%a1, %a1, -1
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 21(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%a0)
	sw	%v1, 23(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17826

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17828

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17830

	sw	%a1, 24(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 25(%sp)
	nop
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	lw	%v1, 24(%sp)
	nop
	nop
	nop

	lw	%a0, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17831

bnei_else.17830:
	sw	%a1, 24(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 25(%sp)
	nop
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	lw	%v1, 24(%sp)
	nop
	nop
	nop

	lw	%a0, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17831:
	nop
	nop
	nop
	j	bnei_cont.17829

bnei_else.17828:
	sw	%a1, 24(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 25(%sp)
	nop
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	lw	%v1, 24(%sp)
	nop
	nop
	nop

	lw	%a0, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17829:
	lw	%v0, 23(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17827

bgti_else.17826:
bgti_cont.17827:
	flw	%f0, 4(%sp)
	nop
	add	%v0, %zero, %hp
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 23(%sp)
	addi	%hp, %hp, 3
	nop

	sw	%v1, 1(%v0)
	lw	%a0, 19(%sp)
	nop
	nop

	lw	%v1, 20(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 234
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %zero, 414
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 3
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

setup_surface_reflection.3105:
	lw	%a1, 7(%v1)
	nop
	sll	%v0, %v0, 2
	addi	%a0, %zero, 414

	lw	%a0, 0(%a0)
	flw	%f0, 448(%zero)
	addi	%v0, %v0, 1
	nop

	flw	%f1, 0(%a1)
	sw	%a0, 0(%sp)
	addi	%a2, %zero, 67
	nop

	lw	%a1, 4(%v1)
	sw	%v0, 1(%sp)
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 0(%a2)
	flw	%f2, 0(%a1)
	nop
	nop

	flw	%f3, 1(%a1)
	fsw	%f0, 2(%sp)
	fmul	%f1, %f1, %f2
	addi	%a2, %zero, 67

	flw	%f2, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	addi	%a2, %zero, 67

	flw	%f3, 2(%a1)
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 2(%a2)
	lw	%a1, 4(%v1)
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	flw	%f3, 0(%a1)
	nop
	fadd	%f1, %f1, %f2
	nop

	flw	%f2, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	addi	%a1, %zero, 67

	flw	%f3, 0(%a1)
	nop
	fmul	%f2, %f2, %f1
	nop

	lw	%a1, 4(%v1)
	nop
	fsub	%f2, %f2, %f3
	nop

	flw	%f3, 471(%zero)
	flw	%f4, 1(%a1)
	nop
	nop

	lw	%v1, 4(%v1)
	nop
	fmul	%f3, %f3, %f4
	addi	%a1, %zero, 67

	flw	%f4, 1(%a1)
	flw	%f5, 2(%v1)
	fmul	%f3, %f3, %f1
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	addi	%v1, %zero, 67

	flw	%f4, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fmul	%f1, %f4, %f1
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f4
	addi	%v1, %zero, 3

	flw	%f4, 444(%zero)
	fsw	%f1, 3(%sp)
	addi	%v0, %v1, 0
	nop

	fsw	%f3, 4(%sp)
	nop
	fmov	%f0, %f4
	nop

	fsw	%f2, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	lw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	sw	%v1, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	add	%v1, %zero, %hp

	lw	%ra, 7(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a1, %zero, 0

	lw	%a0, 6(%sp)
	lw	%a1, 0(%a1)
	nop
	nop

	sw	%a0, 0(%v1)
	flw	%f0, 5(%sp)
	addi	%a1, %a1, -1
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 4(%sp)
	nop
	nop
	nop

	fsw	%f0, 1(%a0)
	nop
	nop
	nop

	flw	%f0, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%a0)
	sw	%v1, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.17833

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	add	%at, %a2, %a1
	nop

	lw	%a2, 0(%at)
	nop
	nop
	nop

	lw	%a3, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.17835

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.17837

	sw	%a1, 8(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 8(%sp)
	nop
	nop
	nop

	lw	%a0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17838

bnei_else.17837:
	sw	%a1, 8(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 8(%sp)
	nop
	nop
	nop

	lw	%a0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17838:
	nop
	nop
	nop
	j	bnei_cont.17836

bnei_else.17835:
	sw	%a1, 8(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	sw	%v0, 9(%sp)
	nop
	nop
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	lw	%v1, 8(%sp)
	nop
	nop
	nop

	lw	%a0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17836:
	lw	%v0, 7(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17834

bgti_else.17833:
bgti_cont.17834:
	flw	%f0, 2(%sp)
	nop
	add	%v0, %zero, %hp
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 7(%sp)
	addi	%hp, %hp, 3
	nop

	sw	%v1, 1(%v0)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 234
	nop

	nop
	nop
	add	%at, %v1, %a0
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v1, %zero, 414
	nop

	nop
	nop
	addi	%v0, %a0, 1
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

rt.3110:
	lw	%a0, 1(%k1)
	nop
	addi	%a1, %zero, 143
	itof	%f1, %v0

	sw	%v0, 0(%a1)
	sw	%a0, 0(%sp)
	addi	%a2, %zero, 145
	nop

	nop
	nop
	addi	%a1, %zero, 143
	nop

	sw	%v1, 1(%a1)
	flw	%f0, 415(%zero)
	nop
	nop

	nop
	nop
	srl	%a1, %v0, 1
	srl	%v1, %v1, 1

	sw	%a1, 0(%a2)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %zero, 147

	fsw	%f0, 0(%v0)
	nop
	addi	%a1, %zero, 145
	nop

	sw	%v1, 1(%a1)
	nop
	addi	%v0, %zero, 143
	nop

	lw	%v0, 0(%v0)
	nop
	addi	%v1, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
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

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 5

	lw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 5

	lw	%ra, 4(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
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

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1

	lw	%ra, 7(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 7(%sp)
	nop
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
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

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -10
	add	%v1, %zero, %hp

	lw	%ra, 9(%sp)
	sw	%v0, 7(%v1)
	addi	%hp, %hp, 8
	nop

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	sw	%v0, 6(%v1)
	nop
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%v1)
	nop
	nop
	nop

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	lw	%v0, 5(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	nop
	nop
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	nop
	nop
	nop

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%v1)
	nop
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 143

	lw	%ra, 9(%sp)
	lw	%v1, 0(%v1)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	addi	%v1, %v1, -2
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	init_line_elements.3054

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 143

	lw	%ra, 9(%sp)
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 9(%sp)
	nop
	nop

	sw	%v1, 10(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%ra, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %zero, 5

	lw	%ra, 12(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %v1, 0
	nop

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
	addi	%sp, %sp, -14
	addi	%v1, %zero, 5

	lw	%ra, 13(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 13(%sp)
	nop
	nop
	nop

	sw	%ra, 14(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	sw	%v0, 14(%sp)
	nop
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	sw	%v0, 15(%sp)
	nop
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -17
	addi	%v1, %zero, 1

	lw	%ra, 16(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 16(%sp)
	nop
	nop
	nop

	sw	%ra, 17(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 18

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	nop
	nop
	nop

	sw	%v0, 17(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -19
	add	%v1, %zero, %hp

	lw	%ra, 18(%sp)
	sw	%v0, 7(%v1)
	addi	%hp, %hp, 8
	nop

	lw	%v0, 17(%sp)
	nop
	nop
	nop

	sw	%v0, 6(%v1)
	nop
	nop
	nop

	lw	%v0, 16(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%v1)
	nop
	nop
	nop

	lw	%v0, 15(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	lw	%v0, 14(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	nop
	nop
	nop

	lw	%v0, 13(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	nop
	nop
	nop

	lw	%v0, 12(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%v1)
	nop
	nop
	nop

	lw	%v0, 11(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -19
	addi	%v1, %zero, 143

	lw	%ra, 18(%sp)
	lw	%v1, 0(%v1)
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	addi	%v1, %v1, -2
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	init_line_elements.3054

	nop
	nop
	addi	%sp, %sp, -19
	addi	%v1, %zero, 143

	lw	%ra, 18(%sp)
	lw	%v1, 0(%v1)
	addi	%a0, %zero, 3
	nop

	flw	%f0, 444(%zero)
	sw	%v0, 18(%sp)
	nop
	nop

	sw	%v1, 19(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	sw	%v0, 20(%sp)
	nop
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -22
	addi	%v1, %zero, 5

	lw	%ra, 21(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 21(%sp)
	nop
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	addi	%v0, %v1, 0
	nop

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
	addi	%sp, %sp, -23
	addi	%v1, %zero, 5

	lw	%ra, 22(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 22(%sp)
	nop
	nop
	nop

	sw	%ra, 23(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 24

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	nop
	nop
	nop

	sw	%v0, 23(%sp)
	nop
	nop
	nop

	sw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	sw	%v0, 24(%sp)
	nop
	nop
	nop

	sw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -26
	addi	%v1, %zero, 1

	lw	%ra, 25(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	sw	%v0, 25(%sp)
	nop
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	sw	%v0, 26(%sp)
	nop
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	create_float5x3array.3050

	nop
	nop
	addi	%sp, %sp, -28
	add	%v1, %zero, %hp

	lw	%ra, 27(%sp)
	sw	%v0, 7(%v1)
	addi	%hp, %hp, 8
	nop

	lw	%v0, 26(%sp)
	nop
	nop
	nop

	sw	%v0, 6(%v1)
	nop
	nop
	nop

	lw	%v0, 25(%sp)
	nop
	nop
	nop

	sw	%v0, 5(%v1)
	nop
	nop
	nop

	lw	%v0, 24(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	nop
	nop

	lw	%v0, 23(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%v1)
	nop
	nop
	nop

	lw	%v0, 22(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%v1)
	nop
	nop
	nop

	lw	%v0, 21(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%v1)
	nop
	nop
	nop

	lw	%v0, 20(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v0, 19(%sp)
	nop
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -28
	addi	%v1, %zero, 143

	lw	%ra, 27(%sp)
	lw	%v1, 0(%v1)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v1, %v1, -2
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	init_line_elements.3054

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

	sw	%v0, 27(%sp)
	nop
	nop
	nop

	sw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	read_screen_settings.2756

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	sw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	read_light.2758

	nop
	nop
	addi	%sp, %sp, -29
	addi	%v0, %zero, 0

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	sw	%v0, 28(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	read_nth_object.2763

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.17840

	sw	%ra, 29(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	read_object.2765

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17841

bnei_else.17840:
	lw	%v1, 28(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

bnei_cont.17841:
	sw	%ra, 29(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	read_and_network.2773

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 0

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	read_or_network.2771

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v1, %zero, 123

	lw	%ra, 29(%sp)
	sw	%v0, 0(%v1)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	addi	%v0, %zero, 80
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 51

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 10

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 143

	lw	%ra, 29(%sp)
	lw	%v0, 0(%v0)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 32

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 143

	lw	%ra, 29(%sp)
	lw	%v0, 1(%v0)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 32

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 255

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	print_int.2627

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 10

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 4

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	create_dirvecs.3086

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 9

	lw	%ra, 29(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 29(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	calc_dirvec_rows.3077

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v0, %zero, 166

	lw	%ra, 29(%sp)
	lw	%v0, 4(%v0)
	addi	%a0, %zero, 0
	nop

	lw	%v1, 119(%v0)
	lw	%a0, 0(%a0)
	nop
	nop

	sw	%v0, 29(%sp)
	nop
	addi	%a0, %a0, -1
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.17842

	lw	%a2, 1(%v1)
	nop
	addi	%a1, %zero, 1
	nop

	lw	%a3, 0(%v1)
	nop
	add	%at, %a1, %a0
	nop

	lw	%a1, 0(%at)
	sw	%v1, 30(%sp)
	nop
	nop

	lw	%t0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.17844

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.17846

	sw	%a0, 31(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 32(%sp)
	nop
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	setup_second_table.2867

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	lw	%v1, 31(%sp)
	nop
	nop
	nop

	lw	%a0, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.17847

bnei_else.17846:
	sw	%a0, 31(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 32(%sp)
	nop
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	setup_surface_table.2864

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	lw	%v1, 31(%sp)
	nop
	nop
	nop

	lw	%a0, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17847:
	nop
	nop
	nop
	j	bnei_cont.17845

bnei_else.17844:
	sw	%a0, 31(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a3, 0

	sw	%a2, 32(%sp)
	nop
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	setup_rect_table.2861

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	lw	%v1, 31(%sp)
	nop
	nop
	nop

	lw	%a0, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.17845:
	lw	%v0, 30(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.17843

bgti_else.17842:
bgti_cont.17843:
	lw	%v0, 29(%sp)
	nop
	addi	%v1, %zero, 118
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v0, %zero, 166

	lw	%ra, 33(%sp)
	lw	%v0, 3(%v0)
	addi	%v1, %zero, 119
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3088

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v0, %zero, 2

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	init_vecset_constants.3091

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v0, %zero, 67

	lw	%ra, 33(%sp)
	flw	%f0, 0(%v0)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 171
	nop

	fsw	%f0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 171
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 67
	nop

	flw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 171
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 0
	nop

	lw	%v0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v0, -1
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2870

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v0, %zero, 0

	lw	%ra, 33(%sp)
	lw	%v0, 0(%v0)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.17848

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	lw	%a0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.17850

	nop
	nop
	nop
	j	bnei_cont.17851

bnei_else.17850:
	lw	%a0, 7(%v1)
	flw	%f1, 448(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.17852

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.17853

fbgt_else.17852:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.17853:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.17854

	lw	%a0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.17856

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.17858

	nop
	nop
	nop
	j	bnei_cont.17859

bnei_else.17858:
	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	setup_surface_reflection.3105

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

bnei_cont.17859:
	nop
	nop
	nop
	j	bnei_cont.17857

bnei_else.17856:
	sw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	setup_rect_reflection.3102

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

bnei_cont.17857:
	nop
	nop
	nop
	j	bnei_cont.17855

bnei_else.17854:
bnei_cont.17855:
bnei_cont.17851:
	nop
	nop
	nop
	j	bgti_cont.17849

bgti_else.17848:
bgti_cont.17849:
	lw	%v0, 18(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 33(%sp)
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	pretrace_line.3034

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v1, %zero, 0

	lw	%ra, 33(%sp)
	nop
	addi	%a0, %zero, 2
	nop

	nop
	nop
	addi	%v0, %zero, 143
	nop

	lw	%v0, 1(%v0)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17860

	nop
	nop
	nop
	jr	%ra

bgt_else.17860:
	sw	%v1, 33(%sp)
	nop
	addi	%v0, %zero, 143
	nop

	lw	%v0, 1(%v0)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.17862

	nop
	nop
	nop
	j	bgt_cont.17863

bgt_else.17862:
	lw	%a1, 27(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	sw	%ra, 34(%sp)
	nop
	addi	%v1, %v0, 0
	nop

	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	pretrace_line.3034

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

bgt_cont.17863:
	lw	%v1, 33(%sp)
	nop
	addi	%v0, %zero, 0
	nop

	lw	%a0, 9(%sp)
	nop
	nop
	nop

	lw	%a1, 18(%sp)
	nop
	nop
	nop

	lw	%a2, 27(%sp)
	nop
	nop
	nop

	sw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	scan_pixel.3038

	nop
	nop
	addi	%sp, %sp, -35
	addi	%v0, %zero, 1

	lw	%ra, 34(%sp)
	nop
	addi	%a2, %zero, 4
	nop

	lw	%v1, 18(%sp)
	nop
	nop
	nop

	lw	%a0, 27(%sp)
	nop
	nop
	nop

	lw	%a1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	scan_line.3044

min_caml_start:
	sw	%ra, 0(%sp)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 1

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 0

	lw	%ra, 0(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v1, %zero, 60

	lw	%ra, 0(%sp)
	nop
	addi	%a0, %zero, 0
	addi	%k0, %v1, 0

	sw	%ra, 0(%sp)
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	addi	%a2, %zero, 0
	addi	%sp, %sp, 1

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	add	%t1, %zero, %hp
	nop

	sw	%v0, 10(%t1)
	nop
	addi	%hp, %hp, 11
	nop

	sw	%v0, 9(%t1)
	nop
	nop
	nop

	sw	%v0, 8(%t1)
	nop
	nop
	nop

	sw	%v0, 7(%t1)
	nop
	nop
	nop

	sw	%t0, 6(%t1)
	nop
	nop
	nop

	sw	%v0, 5(%t1)
	nop
	nop
	nop

	sw	%v0, 4(%t1)
	nop
	nop
	nop

	sw	%a3, 3(%t1)
	nop
	nop
	nop

	sw	%a2, 2(%t1)
	nop
	nop
	nop

	sw	%a1, 1(%t1)
	nop
	nop
	nop

	sw	%a0, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %t1
	nop

	nop
	nop
	addi	%a0, %zero, 1
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	lw	%ra, 0(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 61
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	lw	%ra, 0(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 64
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 3

	lw	%ra, 0(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 67
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 1

	lw	%ra, 0(%sp)
	flw	%f0, 427(%zero)
	nop
	nop

	sw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 70
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -1
	addi	%v0, %zero, 50

	lw	%ra, 0(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	sw	%v0, 0(%sp)
	nop
	addi	%a0, %zero, -1
	nop

	sw	%ra, 1(%sp)
	nop
	addi	%a1, %zero, 71
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 2

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a0, %zero, 72

	lw	%ra, 1(%sp)
	nop
	addi	%v1, %zero, 71
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -2
	addi	%v0, %zero, 1

	lw	%ra, 1(%sp)
	nop
	addi	%v1, %zero, 1
	nop

	sw	%v0, 1(%sp)
	nop
	addi	%a0, %zero, 72
	nop

	lw	%a0, 0(%a0)
	sw	%ra, 2(%sp)
	addi	%a1, %zero, 122
	addi	%v0, %v1, 0

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 3

	nop
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a0, %zero, 123

	lw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 122
	nop

	lw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 1

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 124
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 1

	lw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%a0, %zero, 125
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 1

	lw	%ra, 2(%sp)
	flw	%f0, 436(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 126
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 127
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 1

	lw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%a0, %zero, 130
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 131
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 134
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 137
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 140
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 2

	lw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%a0, %zero, 143
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 2

	lw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%a0, %zero, 145
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 1

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 147
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 148
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 151
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 154
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 157
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 160
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 3

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 163
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 0

	lw	%ra, 2(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 2(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, 0

	lw	%ra, 2(%sp)
	nop
	addi	%a0, %zero, 166
	nop

	sw	%v0, 2(%sp)
	nop
	addi	%a1, %zero, 166
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 0

	lw	%ra, 3(%sp)
	nop
	add	%a0, %zero, %hp
	addi	%k0, %v1, 0

	sw	%v0, 1(%a0)
	nop
	addi	%hp, %hp, 2
	nop

	lw	%v0, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%a0)
	sw	%ra, 3(%sp)
	nop
	nop

	nop
	nop
	add	%v0, %zero, %a0
	addi	%sp, %sp, 4

	nop
	nop
	addi	%a0, %zero, 166
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 5

	lw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 166
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %zero, 166
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 0

	lw	%ra, 3(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %zero, 171
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 3

	lw	%ra, 3(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%ra, 3(%sp)
	nop
	addi	%v1, %zero, 171
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 60

	lw	%ra, 3(%sp)
	nop
	addi	%a0, %zero, 174
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%a1, %zero, 171
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -5
	add	%v1, %zero, %hp

	lw	%ra, 4(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a0, %zero, 234

	lw	%v0, 3(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %v1
	nop

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 0

	lw	%ra, 5(%sp)
	nop
	addi	%a0, %zero, 234
	nop

	sw	%v0, 5(%sp)
	nop
	addi	%a1, %zero, 234
	nop

	sw	%ra, 6(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	add	%v1, %zero, %hp

	lw	%ra, 6(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	addi	%a0, %zero, 0

	lw	%v0, 5(%sp)
	flw	%f0, 444(%zero)
	nop
	nop

	sw	%v0, 0(%v1)
	sw	%ra, 6(%sp)
	add	%a1, %zero, %hp
	nop

	fsw	%f0, 2(%a1)
	nop
	add	%v0, %zero, %v1
	addi	%hp, %hp, 3

	sw	%v0, 1(%a1)
	nop
	addi	%v1, %zero, 180
	addi	%sp, %sp, 7

	sw	%a0, 0(%a1)
	nop
	addi	%k0, %v1, 0
	nop

	nop
	nop
	add	%v0, %zero, %a1
	nop

	nop
	nop
	addi	%a0, %zero, 234
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 1

	lw	%ra, 6(%sp)
	nop
	addi	%v1, %zero, 0
	nop

	sw	%ra, 6(%sp)
	nop
	addi	%a0, %zero, 414
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	add	%k1, %zero, %hp

	lw	%ra, 6(%sp)
	nop
	addi	%hp, %hp, 2
	addi	%v0, %zero, rt.3110

	sw	%v0, 0(%k1)
	nop
	addi	%v1, %zero, 128
	nop

	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%k1)
	sw	%ra, 6(%sp)
	nop
	nop

	lw	%at, 0(%k1)
	nop
	addi	%v0, %zero, 128
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jalr	%at

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	ret

