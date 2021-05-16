	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 44464
	ori	%hp, %hp, 483

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
	lui	%at, 15395
	nop

	flw	%f30, 0(%hp)
	nop
	ori	%at, %at, 55050
	nop

	sw	%at, 0(%hp)
	nop
	lui	%at, 48716
	nop

	flw	%f9, 0(%hp)
	nop
	ori	%at, %at, 52429
	nop

	sw	%at, 0(%hp)
	nop
	nop
	nop

	flw	%f10, 0(%hp)
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
	beqi	%a0, 0, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 1, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 2, create_array_exit

	sw	%v1, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%a0, 3, create_array_exit

	sw	%v1, 0(%hp)
	nop
	addi	%a0, %a0, -4
	nop

	nop
	nop
	addi	%hp, %hp, 1
	j	create_array_loop

create_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_array:
	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %hp, 0

create_float_array_loop:
	nop
	nop
	nop
	beqi	%v1, 0, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 1, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 2, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	nop
	nop

	nop
	nop
	addi	%hp, %hp, 1
	nop

	nop
	nop
	nop
	beqi	%v1, 3, create_float_array_exit

	fsw	%f0, 0(%hp)
	nop
	addi	%v1, %v1, -4
	nop

	nop
	nop
	addi	%hp, %hp, 1
	j	create_float_array_loop

create_float_array_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_extarray:
	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %a0, 0

create_extarray_loop:
	nop
	nop
	nop
	beqi	%a1, 0, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 1, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 2, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a0, 1
	nop

	nop
	nop
	nop
	beqi	%a1, 3, create_extarray_exit

	sw	%v1, 0(%a0)
	nop
	addi	%a1, %a1, -4
	nop

	nop
	nop
	addi	%a0, %a0, 1
	j	create_extarray_loop

create_extarray_exit:
	nop
	nop
	nop
	jr	%ra

min_caml_create_float_extarray:
	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %v1, 0

create_float_extarray_loop:
	nop
	nop
	nop
	beqi	%a0, 0, create_float_extarray_exit

	fsw	%f0, 0(%v1)
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
	beqi	%a0, 1, create_float_extarray_exit

	fsw	%f0, 0(%v1)
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
	beqi	%a0, 2, create_float_extarray_exit

	fsw	%f0, 0(%v1)
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
	beqi	%a0, 3, create_float_extarray_exit

	fsw	%f0, 0(%v1)
	nop
	addi	%a0, %a0, -4
	nop

	nop
	nop
	addi	%v1, %v1, 1
	j	create_float_extarray_loop

create_float_extarray_exit:
	nop
	nop
	nop
	jr	%ra

atan.2627:
	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.28395

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.28396

fbgt_else.28395:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.28396:
	flw	%f1, 481(%zero)
	nop
	fabs	%f12, %f0
	nop

	nop
	nop
	nop
	fblt	%f12, %f1, fbgt_else.28397

	flw	%f0, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.28398

	flw	%f11, 471(%zero)
	flw	%f0, 480(%zero)
	fdiv	%f14, %f30, %f12
	nop

	nop
	nop
	fmul	%f15, %f14, %f14
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f13, %f15, %f15
	fmul	%f0, %f0, %f15

	flw	%f0, 479(%zero)
	nop
	fmul	%f12, %f13, %f13
	fsub	%f1, %f14, %f0

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.28399

fbgt_else.28398:
	flw	%f11, 473(%zero)
	nop
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30

	flw	%f0, 480(%zero)
	nop
	fdiv	%f14, %f1, %f0
	nop

	nop
	nop
	fmul	%f15, %f14, %f14
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f13, %f15, %f15
	fmul	%f0, %f0, %f15

	flw	%f0, 479(%zero)
	nop
	fmul	%f12, %f13, %f13
	fsub	%f1, %f14, %f0

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

fbgt_cont.28399:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.28400

	nop
	nop
	nop
	jr	%ra

bnei_else.28400:
	nop
	nop
	fneg	%f0, %f0
	jr	%ra

fbgt_else.28397:
	flw	%f1, 480(%zero)
	nop
	fmul	%f14, %f0, %f0
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f14

	flw	%f1, 479(%zero)
	nop
	fsub	%f11, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 478(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 477(%zero)
	nop
	fsub	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 476(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 475(%zero)
	nop
	fsub	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	jr	%ra

print_int_sub1.2629:
	nop
	nop
	add	%a0, %zero, %v0
	add	%v0, %zero, %v1

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28462

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28463

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28464

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28465

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28466

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28467

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28468

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28469

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28470

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28471

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28472

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28473

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v0, %v0, 4

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28474

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28475

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28476

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28477

	nop
	nop
	addi	%a0, %a0, -40
	addi	%v1, %v0, 4

	nop
	nop
	addi	%v0, %a0, 0
	j	print_int_sub1.2629

bgti_else.28477:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.28476:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.28475:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.28474:
	nop
	nop
	nop
	jr	%ra

bgti_else.28473:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.28472:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.28471:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.28470:
	nop
	nop
	nop
	jr	%ra

bgti_else.28469:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.28468:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.28467:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.28466:
	nop
	nop
	nop
	jr	%ra

bgti_else.28465:
	nop
	nop
	addi	%v0, %v0, 3
	jr	%ra

bgti_else.28464:
	nop
	nop
	addi	%v0, %v0, 2
	jr	%ra

bgti_else.28463:
	nop
	nop
	addi	%v0, %v0, 1
	jr	%ra

bgti_else.28462:
	nop
	nop
	nop
	jr	%ra

print_int_sub2.2632:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28587

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28588

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28589

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28590

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28591

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28592

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28593

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28594

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28595

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28596

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28597

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28598

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28599

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28600

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28601

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28602

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28603

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28604

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28605

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28606

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28607

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28608

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28609

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28610

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28611

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28612

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28613

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28614

	nop
	nop
	addi	%v0, %v0, -40
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.28615

	nop
	nop
	nop
	blti	%v0, 20, bgti_else.28616

	nop
	nop
	nop
	blti	%v0, 30, bgti_else.28617

	nop
	nop
	nop
	blti	%v0, 40, bgti_else.28618

	nop
	nop
	addi	%v0, %v0, -40
	j	print_int_sub2.2632

bgti_else.28618:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28617:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28616:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28615:
	nop
	nop
	nop
	jr	%ra

bgti_else.28614:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28613:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28612:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28611:
	nop
	nop
	nop
	jr	%ra

bgti_else.28610:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28609:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28608:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28607:
	nop
	nop
	nop
	jr	%ra

bgti_else.28606:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28605:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28604:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28603:
	nop
	nop
	nop
	jr	%ra

bgti_else.28602:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28601:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28600:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28599:
	nop
	nop
	nop
	jr	%ra

bgti_else.28598:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28597:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28596:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28595:
	nop
	nop
	nop
	jr	%ra

bgti_else.28594:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28593:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28592:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28591:
	nop
	nop
	nop
	jr	%ra

bgti_else.28590:
	nop
	nop
	addi	%v0, %v0, -30
	jr	%ra

bgti_else.28589:
	nop
	nop
	addi	%v0, %v0, -20
	jr	%ra

bgti_else.28588:
	nop
	nop
	addi	%v0, %v0, -10
	jr	%ra

bgti_else.28587:
	nop
	nop
	nop
	jr	%ra

print_int.2634:
	nop
	nop
	add	%a1, %zero, %v0
	add	%a2, %zero, %ra

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.28962

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.28964

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.28966

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.28968

	nop
	nop
	addi	%a0, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28970

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28972

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28974

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28976

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.28978

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.28980

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.28982

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.28984

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%a3, %v0, 0
	j	bgti_cont.28963

bgti_else.28984:
	nop
	nop
	addi	%a3, %zero, 11
	nop

bgti_cont.28985:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28982:
	nop
	nop
	addi	%a3, %zero, 10
	nop

bgti_cont.28983:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28980:
	nop
	nop
	addi	%a3, %zero, 9
	nop

bgti_cont.28981:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28978:
	nop
	nop
	addi	%a3, %zero, 8
	nop

bgti_cont.28979:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28976:
	nop
	nop
	addi	%a3, %zero, 7
	nop

bgti_cont.28977:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28974:
	nop
	nop
	addi	%a3, %zero, 6
	nop

bgti_cont.28975:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28972:
	nop
	nop
	addi	%a3, %zero, 5
	nop

bgti_cont.28973:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28970:
	nop
	nop
	addi	%a3, %zero, 4
	nop

bgti_cont.28971:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28968:
	nop
	nop
	addi	%a3, %zero, 3
	nop

bgti_cont.28969:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28966:
	nop
	nop
	addi	%a3, %zero, 2
	nop

bgti_cont.28967:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28964:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bgti_cont.28965:
	nop
	nop
	nop
	j	bgti_cont.28963

bgti_else.28962:
	nop
	nop
	add	%a3, %zero, %zero
	nop

bgti_cont.28963:
	nop
	nop
	nop
	blti	%a1, 10, bgti_else.28986

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.28988

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.28990

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.28992

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.28996

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.28998

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29000

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.29004

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.29006

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29008

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.29012

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.29014

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29016

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.29020

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.29022

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29024

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.29028

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.29030

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29032

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.28987

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.29036

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.29038

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.29040

	nop
	nop
	addi	%v0, %a1, -40
	jal	print_int_sub2.2632

	nop
	nop
	addi	%a1, %v0, 0
	j	bgti_cont.28987

bgti_else.29040:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29041:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29038:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.29039:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29036:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.29037:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29034:
bgti_cont.29035:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29032:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29033:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29030:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.29031:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29028:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.29029:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29026:
bgti_cont.29027:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29024:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29025:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29022:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.29023:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29020:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.29021:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29018:
bgti_cont.29019:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29016:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29017:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29014:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.29015:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29012:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.29013:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29010:
bgti_cont.29011:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29008:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29009:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29006:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.29007:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29004:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.29005:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29002:
bgti_cont.29003:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.29000:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.29001:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28998:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.28999:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28996:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.28997:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28994:
bgti_cont.28995:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28992:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.28993:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28990:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.28991:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28988:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.28989:
	nop
	nop
	nop
	j	bgti_cont.28987

bgti_else.28986:
bgti_cont.28987:
	nop
	nop
	nop
	blt	%zero, %a3, bgt_else.29042

	nop
	nop
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.29042:
	nop
	nop
	nop
	blti	%a3, 10, bgti_else.29043

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29045

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29047

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29049

	nop
	nop
	addi	%a0, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.29051

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29053

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29055

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29057

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.29059

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29061

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29063

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29065

	nop
	nop
	addi	%v0, %a0, -40
	addi	%v1, %zero, 12

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%a0, %v0, 0
	j	bgti_cont.29044

bgti_else.29065:
	nop
	nop
	addi	%a0, %zero, 11
	nop

bgti_cont.29066:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29063:
	nop
	nop
	addi	%a0, %zero, 10
	nop

bgti_cont.29064:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29061:
	nop
	nop
	addi	%a0, %zero, 9
	nop

bgti_cont.29062:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29059:
	nop
	nop
	addi	%a0, %zero, 8
	nop

bgti_cont.29060:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29057:
	nop
	nop
	addi	%a0, %zero, 7
	nop

bgti_cont.29058:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29055:
	nop
	nop
	addi	%a0, %zero, 6
	nop

bgti_cont.29056:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29053:
	nop
	nop
	addi	%a0, %zero, 5
	nop

bgti_cont.29054:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29051:
	nop
	nop
	addi	%a0, %zero, 4
	nop

bgti_cont.29052:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29049:
	nop
	nop
	addi	%a0, %zero, 3
	nop

bgti_cont.29050:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29047:
	nop
	nop
	addi	%a0, %zero, 2
	nop

bgti_cont.29048:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29045:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgti_cont.29046:
	nop
	nop
	nop
	j	bgti_cont.29044

bgti_else.29043:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bgti_cont.29044:
	nop
	nop
	nop
	blti	%a3, 10, bgti_else.29067

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29069

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29071

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29073

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29077

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29079

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29081

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29085

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29087

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29089

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29093

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29095

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29097

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29101

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29103

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29105

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29109

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29111

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29113

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.29068

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.29117

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.29119

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.29121

	nop
	nop
	addi	%v0, %a3, -40
	jal	print_int_sub2.2632

	nop
	nop
	addi	%a3, %v0, 0
	j	bgti_cont.29068

bgti_else.29121:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29122:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29119:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29120:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29117:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29118:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29115:
bgti_cont.29116:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29113:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29114:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29111:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29112:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29109:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29110:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29107:
bgti_cont.29108:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29105:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29106:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29103:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29104:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29101:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29102:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29099:
bgti_cont.29100:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29097:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29098:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29095:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29096:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29093:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29094:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29091:
bgti_cont.29092:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29089:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29090:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29087:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29088:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29085:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29086:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29083:
bgti_cont.29084:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29081:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29082:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29079:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29080:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29077:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29078:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29075:
bgti_cont.29076:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29073:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.29074:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29071:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.29072:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29069:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.29070:
	nop
	nop
	nop
	j	bgti_cont.29068

bgti_else.29067:
bgti_cont.29068:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.29123

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2

	nop
	nop
	nop
	j	min_caml_print_char

bgt_else.29123:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.29124

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29126

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29128

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29130

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29134

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29136

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29138

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29142

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29144

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29146

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29150

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29152

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29154

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29158

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29160

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29162

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29166

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29168

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29170

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.29125

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.29174

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.29176

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.29178

	nop
	nop
	addi	%v0, %a0, -40
	jal	print_int_sub2.2632

	nop
	nop
	addi	%a0, %v0, 0
	j	bgti_cont.29125

bgti_else.29178:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29179:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29176:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29177:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29174:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29175:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29172:
bgti_cont.29173:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29170:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29171:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29168:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29169:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29166:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29167:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29164:
bgti_cont.29165:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29162:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29163:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29160:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29161:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29158:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29159:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29156:
bgti_cont.29157:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29154:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29155:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29152:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29153:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29150:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29151:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29148:
bgti_cont.29149:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29146:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29147:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29144:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29145:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29142:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29143:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29140:
bgti_cont.29141:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29138:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29139:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29136:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29137:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29134:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29135:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29132:
bgti_cont.29133:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29130:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.29131:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29128:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.29129:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29126:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.29127:
	nop
	nop
	nop
	j	bgti_cont.29125

bgti_else.29124:
bgti_cont.29125:
	nop
	nop
	addi	%v0, %a0, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	add	%ra, %zero, %a2

	nop
	nop
	nop
	j	min_caml_print_char

rotate_quadratic_matrix.2767:
	flw	%f12, 0(%v1)
	flw	%f14, 470(%zero)
	nop
	nop

	flw	%f15, 469(%zero)
	nop
	fabs	%f1, %f12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f15
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.29320

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29321

fbgt_else.29320:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29321:
	nop
	nop
	nop
	fblt	%f0, %f14, fbgt_else.29322

	nop
	nop
	fsub	%f0, %f0, %f14
	j	fbgt_cont.29323

fbgt_else.29322:
fbgt_cont.29323:
	flw	%f16, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.29324

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29326

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29325

bnei_else.29326:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29327:
	nop
	nop
	nop
	j	fbgt_cont.29325

fbgt_else.29324:
fbgt_cont.29325:
	nop
	nop
	nop
	fblt	%f0, %f16, fbgt_else.29328

	nop
	nop
	fsub	%f0, %f14, %f0
	j	fbgt_cont.29329

fbgt_else.29328:
fbgt_cont.29329:
	flw	%f13, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f13, %f0, fbgt_else.29330

	flw	%f0, 465(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.29331

fbgt_else.29330:
	flw	%f0, 468(%zero)
	nop
	fsub	%f18, %f16, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 467(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 466(%zero)
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
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.29331:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29332

	nop
	nop
	nop
	j	bnei_cont.29333

bnei_else.29332:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.29333:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.29334

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.29335

fbgt_else.29334:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.29335:
	nop
	nop
	fabs	%f11, %f12
	nop

	nop
	nop
	fdiv	%f1, %f11, %f15
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f15
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.29336

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29338

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29337

bnei_else.29338:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29339:
	nop
	nop
	nop
	j	fbgt_cont.29337

fbgt_else.29336:
fbgt_cont.29337:
	nop
	nop
	nop
	fblt	%f1, %f14, fbgt_else.29340

	nop
	nop
	fsub	%f1, %f1, %f14
	j	fbgt_cont.29341

fbgt_else.29340:
fbgt_cont.29341:
	nop
	nop
	nop
	fblt	%f1, %f16, fbgt_else.29342

	nop
	nop
	fsub	%f1, %f14, %f1
	j	fbgt_cont.29343

fbgt_else.29342:
fbgt_cont.29343:
	nop
	nop
	nop
	fblt	%f13, %f1, fbgt_else.29344

	flw	%f11, 468(%zero)
	nop
	fmul	%f18, %f1, %f1
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f11, %f11, %f1

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 467(%zero)
	nop
	fsub	%f12, %f1, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	flw	%f11, 466(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.29345

fbgt_else.29344:
	nop
	nop
	fsub	%f1, %f16, %f1
	nop

	flw	%f1, 465(%zero)
	nop
	fmul	%f17, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f17, %f17
	fmul	%f1, %f1, %f17

	flw	%f1, 464(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 463(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.29345:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29346

	nop
	nop
	nop
	j	bnei_cont.29347

bnei_else.29346:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.29347:
	flw	%f17, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f12, %f17
	nop

	nop
	nop
	fdiv	%f11, %f12, %f15
	nop

	nop
	nop
	floor	%f11, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.29348

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29349

fbgt_else.29348:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29349:
	nop
	nop
	nop
	fblt	%f11, %f14, fbgt_else.29350

	nop
	nop
	fsub	%f11, %f11, %f14
	j	fbgt_cont.29351

fbgt_else.29350:
fbgt_cont.29351:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.29352

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29354

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29353

bnei_else.29354:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29355:
	nop
	nop
	nop
	j	fbgt_cont.29353

fbgt_else.29352:
fbgt_cont.29353:
	nop
	nop
	nop
	fblt	%f11, %f16, fbgt_else.29356

	nop
	nop
	fsub	%f11, %f14, %f11
	j	fbgt_cont.29357

fbgt_else.29356:
fbgt_cont.29357:
	nop
	nop
	nop
	fblt	%f13, %f11, fbgt_else.29358

	flw	%f11, 465(%zero)
	nop
	fmul	%f19, %f11, %f11
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 464(%zero)
	nop
	fsub	%f12, %f30, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 463(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	j	fbgt_cont.29359

fbgt_else.29358:
	flw	%f11, 468(%zero)
	nop
	fsub	%f2, %f16, %f11
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f11, %f11, %f2

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f19

	flw	%f11, 467(%zero)
	nop
	fsub	%f12, %f2, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 466(%zero)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f2
	nop

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

fbgt_cont.29359:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29360

	nop
	nop
	nop
	j	bnei_cont.29361

bnei_else.29360:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.29361:
	nop
	nop
	nop
	fblt	%f17, %fzero, fbgt_else.29362

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.29363

fbgt_else.29362:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.29363:
	nop
	nop
	fabs	%f17, %f17
	nop

	nop
	nop
	fdiv	%f12, %f17, %f15
	nop

	nop
	nop
	floor	%f12, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f15
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.29364

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29366

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29365

bnei_else.29366:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29367:
	nop
	nop
	nop
	j	fbgt_cont.29365

fbgt_else.29364:
fbgt_cont.29365:
	nop
	nop
	nop
	fblt	%f12, %f14, fbgt_else.29368

	nop
	nop
	fsub	%f12, %f12, %f14
	j	fbgt_cont.29369

fbgt_else.29368:
fbgt_cont.29369:
	nop
	nop
	nop
	fblt	%f12, %f16, fbgt_else.29370

	nop
	nop
	fsub	%f12, %f14, %f12
	j	fbgt_cont.29371

fbgt_else.29370:
fbgt_cont.29371:
	nop
	nop
	nop
	fblt	%f13, %f12, fbgt_else.29372

	flw	%f17, 468(%zero)
	nop
	fmul	%f2, %f12, %f12
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f17, %f17, %f12

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 467(%zero)
	nop
	fsub	%f18, %f12, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	flw	%f17, 466(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f12, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f2
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fsub	%f12, %f18, %f12
	j	fbgt_cont.29373

fbgt_else.29372:
	nop
	nop
	fsub	%f12, %f16, %f12
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f19, %f12, %f12
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f12, %f12, %f19

	flw	%f12, 464(%zero)
	nop
	fsub	%f17, %f30, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	flw	%f12, 463(%zero)
	nop
	fadd	%f17, %f17, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f19
	nop

	nop
	nop
	fmul	%f12, %f12, %f18
	nop

	nop
	nop
	fsub	%f12, %f17, %f12
	nop

fbgt_cont.29373:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29374

	nop
	nop
	nop
	j	bnei_cont.29375

bnei_else.29374:
	nop
	nop
	fneg	%f12, %f12
	nop

bnei_cont.29375:
	flw	%f19, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fabs	%f18, %f19
	nop

	nop
	nop
	fdiv	%f17, %f18, %f15
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f15
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.29376

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29377

fbgt_else.29376:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29377:
	nop
	nop
	nop
	fblt	%f17, %f14, fbgt_else.29378

	nop
	nop
	fsub	%f17, %f17, %f14
	j	fbgt_cont.29379

fbgt_else.29378:
fbgt_cont.29379:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.29380

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29382

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29381

bnei_else.29382:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29383:
	nop
	nop
	nop
	j	fbgt_cont.29381

fbgt_else.29380:
fbgt_cont.29381:
	nop
	nop
	nop
	fblt	%f17, %f16, fbgt_else.29384

	nop
	nop
	fsub	%f17, %f14, %f17
	j	fbgt_cont.29385

fbgt_else.29384:
fbgt_cont.29385:
	nop
	nop
	nop
	fblt	%f13, %f17, fbgt_else.29386

	flw	%f17, 465(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 464(%zero)
	nop
	fsub	%f18, %f30, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 463(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	j	fbgt_cont.29387

fbgt_else.29386:
	flw	%f17, 468(%zero)
	nop
	fsub	%f21, %f16, %f17
	nop

	nop
	nop
	fmul	%f20, %f21, %f21
	fmul	%f17, %f17, %f21

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f17, %f17, %f20

	flw	%f17, 467(%zero)
	nop
	fsub	%f18, %f21, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	flw	%f17, 466(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f21
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

fbgt_cont.29387:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29388

	nop
	nop
	nop
	j	bnei_cont.29389

bnei_else.29388:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.29389:
	nop
	nop
	nop
	fblt	%f19, %fzero, fbgt_else.29390

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.29391

fbgt_else.29390:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.29391:
	nop
	nop
	fabs	%f19, %f19
	nop

	nop
	nop
	fdiv	%f18, %f19, %f15
	nop

	nop
	nop
	floor	%f18, %f18
	nop

	nop
	nop
	fmul	%f15, %f18, %f15
	nop

	nop
	nop
	fsub	%f15, %f19, %f15
	nop

	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.29392

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29394

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29393

bnei_else.29394:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29395:
	nop
	nop
	nop
	j	fbgt_cont.29393

fbgt_else.29392:
fbgt_cont.29393:
	nop
	nop
	nop
	fblt	%f15, %f14, fbgt_else.29396

	nop
	nop
	fsub	%f15, %f15, %f14
	j	fbgt_cont.29397

fbgt_else.29396:
fbgt_cont.29397:
	nop
	nop
	nop
	fblt	%f15, %f16, fbgt_else.29398

	nop
	nop
	fsub	%f15, %f14, %f15
	j	fbgt_cont.29399

fbgt_else.29398:
fbgt_cont.29399:
	nop
	nop
	nop
	fblt	%f13, %f15, fbgt_else.29400

	flw	%f13, 468(%zero)
	nop
	fmul	%f18, %f15, %f15
	nop

	nop
	nop
	fmul	%f16, %f18, %f18
	fmul	%f13, %f13, %f15

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	flw	%f13, 467(%zero)
	nop
	fsub	%f14, %f15, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	flw	%f13, 466(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fmul	%f13, %f13, %f18
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	j	fbgt_cont.29401

fbgt_else.29400:
	nop
	nop
	fsub	%f13, %f16, %f15
	nop

	flw	%f13, 465(%zero)
	nop
	fmul	%f16, %f13, %f13
	nop

	nop
	nop
	fmul	%f15, %f16, %f16
	fmul	%f13, %f13, %f16

	flw	%f13, 464(%zero)
	nop
	fsub	%f14, %f30, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	flw	%f13, 463(%zero)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fmul	%f13, %f13, %f15
	nop

	nop
	nop
	fsub	%f13, %f14, %f13
	nop

fbgt_cont.29401:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29402

	nop
	nop
	nop
	j	bnei_cont.29403

bnei_else.29402:
	nop
	nop
	fneg	%f13, %f13
	nop

bnei_cont.29403:
	nop
	nop
	fmul	%f18, %f11, %f17
	fmul	%f21, %f1, %f12

	nop
	nop
	fmul	%f15, %f21, %f17
	fmul	%f14, %f0, %f13

	nop
	nop
	fsub	%f16, %f15, %f14
	fmul	%f20, %f0, %f12

	nop
	nop
	fmul	%f15, %f20, %f17
	fmul	%f14, %f1, %f13

	nop
	nop
	fadd	%f19, %f15, %f14
	fmul	%f2, %f11, %f13

	nop
	nop
	fmul	%f15, %f21, %f13
	fmul	%f14, %f0, %f17

	nop
	nop
	fadd	%f15, %f15, %f14
	fmul	%f14, %f20, %f13

	flw	%f12, 1(%v0)
	flw	%f17, 462(%zero)
	fmul	%f13, %f1, %f17
	fneg	%f20, %f12

	flw	%f13, 0(%v0)
	nop
	fsub	%f21, %f14, %f13
	fmul	%f14, %f1, %f11

	flw	%f11, 2(%v0)
	nop
	fmul	%f22, %f0, %f11
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f20, %f20

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%v0)
	nop
	fmul	%f0, %f16, %f16
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f15, %f15

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f14, %f14

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fmul	%f0, %f19, %f19
	nop

	nop
	nop
	fmul	%f1, %f13, %f0
	fmul	%f0, %f21, %f21

	nop
	nop
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f22, %f22

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fmul	%f0, %f13, %f16
	fmul	%f13, %f13, %f18

	nop
	nop
	fmul	%f1, %f0, %f19
	fmul	%f0, %f12, %f15

	nop
	nop
	fmul	%f0, %f0, %f21
	fmul	%f12, %f12, %f2

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fmul	%f0, %f0, %f22
	fmul	%f11, %f11, %f20

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f19

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 0(%v1)
	nop
	fmul	%f0, %f12, %f21
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f22

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f16

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 1(%v1)
	nop
	fmul	%f0, %f12, %f15
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f14

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f17, %f0
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	jr	%ra

read_nth_object.2770:
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
	beqi	%a2, -1, bnei_else.29505

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
	addi	%fp, %v0, 0
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
	fblt	%f0, %fzero, fbgt_else.29506

	nop
	nop
	add	%s3, %zero, %zero
	j	fbgt_cont.29507

fbgt_else.29506:
	nop
	nop
	add	%s3, %zero, %k1
	nop

fbgt_cont.29507:
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
	beqi	%k0, 0, bnei_else.29508

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 461(%zero)
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
	j	bnei_cont.29509

bnei_else.29508:
bnei_cont.29509:
	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.29510

	nop
	nop
	add	%s6, %zero, %s3
	j	bnei_cont.29511

bnei_else.29510:
	nop
	nop
	add	%s6, %zero, %k1
	nop

bnei_cont.29511:
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

	sw	%fp, 2(%ra)
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
	beqi	%a3, 3, bnei_else.29512

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.29514

	nop
	nop
	nop
	j	bnei_cont.29513

bnei_else.29514:
	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.29516

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.29517

bnei_else.29516:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.29517:
	flw	%f13, 0(%s1)
	flw	%f12, 1(%s1)
	nop
	nop

	flw	%f11, 2(%s1)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.29518

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.29519

fbeq_else.29518:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.29519:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.29520

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.29521

bnei_else.29520:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29522

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.29523

bnei_else.29522:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.29523:
bnei_cont.29521:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 0(%s1)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 1(%s1)
	nop
	nop
	nop

	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.29515:
	nop
	nop
	nop
	j	bnei_cont.29513

bnei_else.29512:
	flw	%f1, 0(%s1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.29524

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29525

fbeq_else.29524:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29525:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29526

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29527

bnei_else.29526:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.29528

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29529

fbeq_else.29528:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29529:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29530

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29531

bnei_else.29530:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.29532

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29533

fbgt_else.29532:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29533:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29534

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.29535

bnei_else.29534:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.29535:
bnei_cont.29531:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.29527:
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
	fbne	%f1, %fzero, fbeq_else.29536

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29537

fbeq_else.29536:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29537:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29538

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29539

bnei_else.29538:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.29540

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29541

fbeq_else.29540:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29541:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29542

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29543

bnei_else.29542:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.29544

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29545

fbgt_else.29544:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29545:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29546

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.29547

bnei_else.29546:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.29547:
bnei_cont.29543:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.29539:
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
	fbne	%f1, %fzero, fbeq_else.29548

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29549

fbeq_else.29548:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29549:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29550

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29551

bnei_else.29550:
	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.29552

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29553

fbeq_else.29552:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29553:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29554

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.29555

bnei_else.29554:
	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.29556

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29557

fbgt_else.29556:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29557:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29558

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.29559

bnei_else.29558:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.29559:
bnei_cont.29555:
	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.29551:
	fsw	%f0, 2(%s1)
	nop
	nop
	nop

bnei_cont.29513:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.29560

	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2767

	nop
	nop
	nop
	j	bnei_cont.29561

bnei_else.29560:
bnei_cont.29561:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.29505:
	nop
	nop
	add	%ra, %zero, %a1
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

read_object.2772:
	nop
	nop
	add	%s7, %zero, %v0
	add	%t7, %zero, %ra

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29639

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29639:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29641

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29642

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29642:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29644

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29645

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29645:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29647

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29648

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29648:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29650

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29651

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29651:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29653

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29654

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29654:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29656

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29657

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29657:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29659

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	nop
	blti	%s7, 60, bgti_else.29660

	nop
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.29660:
	nop
	nop
	addi	%v0, %s7, 0
	jal	read_nth_object.2770

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.29662

	nop
	nop
	addi	%v0, %s7, 1
	add	%ra, %zero, %t7

	nop
	nop
	nop
	j	read_object.2772

bnei_else.29662:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29659:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29656:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29653:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29650:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29647:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29644:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29641:
	sw	%s7, 0(%zero)
	nop
	add	%ra, %zero, %t7
	nop

	nop
	nop
	nop
	jr	%ra

read_net_item.2776:
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
	beqi	%t0, -1, bnei_else.29736

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
	beqi	%t2, -1, bnei_else.29737

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
	beqi	%t4, -1, bnei_else.29739

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
	beqi	%t6, -1, bnei_else.29741

	nop
	nop
	addi	%v0, %t5, 1
	addi	%sp, %sp, 9

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -9
	add	%at, %v0, %t5

	sw	%t6, 0(%at)
	nop
	nop
	j	bnei_cont.29742

bnei_else.29741:
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

bnei_cont.29742:
	nop
	nop
	add	%at, %v0, %t3
	nop

	sw	%t4, 0(%at)
	nop
	nop
	j	bnei_cont.29740

bnei_else.29739:
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

bnei_cont.29740:
	nop
	nop
	add	%at, %v0, %t1
	nop

	sw	%t2, 0(%at)
	nop
	nop
	j	bnei_cont.29738

bnei_else.29737:
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

bnei_cont.29738:
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

bnei_else.29736:
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

read_or_network.2778:
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
	beqi	%a2, -1, bnei_else.29813

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.29815

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
	beqi	%k0, -1, bnei_else.29817

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

	sw	%k0, 2(%v1)
	nop
	nop
	j	bnei_cont.29818

bnei_else.29817:
	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.29818:
	sw	%fp, 1(%v1)
	nop
	nop
	j	bnei_cont.29816

bnei_else.29815:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.29816:
	sw	%a2, 0(%v1)
	nop
	nop
	j	bnei_cont.29814

bnei_else.29813:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %v0, 0

bnei_cont.29814:
	sw	%v1, 4(%sp)
	lw	%a0, 0(%v1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29819

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
	beqi	%a2, -1, bnei_else.29820

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -5
	addi	%fp, %v0, 0

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.29822

	nop
	nop
	addi	%v0, %zero, 2
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

	sw	%fp, 1(%t1)
	nop
	nop
	j	bnei_cont.29823

bnei_else.29822:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %a3, 0

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%t1, %v0, 0

bnei_cont.29823:
	sw	%a2, 0(%t1)
	nop
	nop
	j	bnei_cont.29821

bnei_else.29820:
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

bnei_cont.29821:
	lw	%a0, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29824

	nop
	nop
	addi	%v0, %t0, 1
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	read_or_network.2778

	nop
	nop
	addi	%sp, %sp, -5
	add	%at, %v0, %t0

	sw	%t1, 0(%at)
	nop
	nop
	j	bnei_cont.29825

bnei_else.29824:
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

bnei_cont.29825:
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

bnei_else.29819:
	lw	%a0, 0(%sp)
	lw	%t1, 1(%sp)
	nop
	nop

	lw	%t0, 2(%sp)
	lw	%ra, 3(%sp)
	addi	%v0, %a0, 1
	j	min_caml_create_array

read_and_network.2780:
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
	addi	%fp, %v0, 0
	addi	%k0, %zero, -1

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.29873

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%s0, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.29875

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
	beqi	%s1, -1, bnei_else.29877

	nop
	nop
	addi	%v0, %zero, 3
	jal	read_net_item.2776

	sw	%s1, 2(%v0)
	nop
	nop
	j	bnei_cont.29878

bnei_else.29877:
	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29878:
	sw	%s0, 1(%v0)
	nop
	nop
	j	bnei_cont.29876

bnei_else.29875:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29876:
	sw	%fp, 0(%v0)
	nop
	nop
	j	bnei_cont.29874

bnei_else.29873:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29874:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29879

	sw	%v0, 83(%a2)
	nop
	nop
	nop

	nop
	nop
	addi	%s0, %a2, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.29880

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%fp, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%fp, -1, bnei_else.29882

	nop
	nop
	addi	%v0, %zero, 2
	jal	read_net_item.2776

	sw	%fp, 1(%v0)
	nop
	nop
	j	bnei_cont.29883

bnei_else.29882:
	nop
	nop
	addi	%v0, %zero, 2
	addi	%v1, %k0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29883:
	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.29881

bnei_else.29880:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29881:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29884

	sw	%v0, 83(%s0)
	nop
	nop
	nop

	nop
	nop
	addi	%fp, %s0, 1
	jal	min_caml_read_int

	nop
	nop
	addi	%a2, %v0, 0
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.29885

	nop
	nop
	addi	%v0, %k1, 0
	jal	read_net_item.2776

	sw	%a2, 0(%v0)
	nop
	nop
	j	bnei_cont.29886

bnei_else.29885:
	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

bnei_cont.29886:
	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29887

	sw	%v0, 83(%fp)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%a2, %fp, 1
	jal	read_net_item.2776

	lw	%a0, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.29888

	sw	%v0, 83(%a2)
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	addi	%v0, %a2, 1
	j	read_and_network.2780

bnei_else.29888:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29887:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29884:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.29879:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

solver_second.2818:
	flw	%f20, 0(%v1)
	flw	%f19, 1(%v1)
	nop
	nop

	flw	%f21, 2(%v1)
	lw	%a2, 9(%v0)
	fmul	%f11, %f20, %f20
	nop

	lw	%fp, 6(%v0)
	lw	%a0, 4(%v0)
	nop
	nop

	lw	%a3, 3(%v0)
	lw	%a1, 1(%v0)
	nop
	nop

	flw	%f18, 0(%a0)
	flw	%f17, 1(%a0)
	nop
	nop

	flw	%f16, 2(%a0)
	nop
	fmul	%f12, %f11, %f18
	fmul	%f11, %f19, %f19

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	fmul	%f11, %f21, %f21

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.29933

	flw	%f12, 0(%a2)
	nop
	fmul	%f13, %f19, %f21
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a2)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f21, %f20

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f20, %f19

	flw	%f11, 2(%a2)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.29934

bnei_else.29933:
bnei_cont.29934:
	nop
	nop
	nop
	fbne	%f11, %fzero, fbeq_else.29935

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.29936

fbeq_else.29935:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.29936:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29937

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.29937:
	nop
	nop
	fmul	%f12, %f20, %f0
	nop

	nop
	nop
	fmul	%f13, %f12, %f18
	fmul	%f12, %f19, %f1

	nop
	nop
	fmul	%f12, %f12, %f17
	nop

	nop
	nop
	fadd	%f13, %f13, %f12
	fmul	%f12, %f21, %f2

	nop
	nop
	fmul	%f12, %f12, %f16
	nop

	nop
	nop
	fadd	%f12, %f13, %f12
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.29938

	nop
	nop
	fmul	%f14, %f21, %f1
	fmul	%f13, %f19, %f2

	flw	%f13, 0(%a2)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f15, %f14, %f13
	fmul	%f14, %f20, %f2

	nop
	nop
	fmul	%f13, %f21, %f0
	nop

	flw	%f13, 1(%a2)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f14, %f13
	fmul	%f14, %f20, %f1

	nop
	nop
	fadd	%f15, %f15, %f13
	fmul	%f13, %f19, %f0

	flw	%f13, 2(%a2)
	nop
	fadd	%f14, %f14, %f13
	nop

	nop
	nop
	fmul	%f13, %f14, %f13
	nop

	flw	%f13, 465(%zero)
	nop
	fadd	%f14, %f15, %f13
	nop

	nop
	nop
	fmul	%f13, %f14, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f13
	j	bnei_cont.29939

bnei_else.29938:
bnei_cont.29939:
	nop
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f14, %f13, %f18
	fmul	%f13, %f1, %f1

	nop
	nop
	fmul	%f13, %f13, %f17
	nop

	nop
	nop
	fadd	%f14, %f14, %f13
	fmul	%f13, %f2, %f2

	nop
	nop
	fmul	%f13, %f13, %f16
	nop

	nop
	nop
	fadd	%f13, %f14, %f13
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.29940

	flw	%f14, 0(%a2)
	nop
	fmul	%f15, %f1, %f2
	fmul	%f1, %f0, %f1

	nop
	nop
	fmul	%f14, %f15, %f14
	nop

	flw	%f13, 1(%a2)
	flw	%f0, 2(%a2)
	fadd	%f15, %f13, %f14
	fmul	%f14, %f2, %f0

	nop
	nop
	fmul	%f13, %f14, %f13
	fmul	%f0, %f1, %f0

	nop
	nop
	fadd	%f13, %f15, %f13
	nop

	nop
	nop
	fadd	%f13, %f13, %f0
	j	bnei_cont.29941

bnei_else.29940:
bnei_cont.29941:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.29942

	nop
	nop
	nop
	j	bnei_cont.29943

bnei_else.29942:
	nop
	nop
	fsub	%f13, %f13, %f30
	nop

bnei_cont.29943:
	nop
	nop
	fmul	%f1, %f12, %f12
	fmul	%f0, %f11, %f13

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.29944

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.29945

fbgt_else.29944:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.29945:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.29946

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.29947

	nop
	nop
	nop
	j	bnei_cont.29948

bnei_else.29947:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.29948:
	nop
	nop
	fsub	%f0, %f0, %f12
	nop

	nop
	nop
	fdiv	%f0, %f0, %f11
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.29946:
	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

solver_fast2.2865:
	lw	%a0, 12(%v0)
	lw	%k0, 0(%v1)
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%a0, 1(%v1)
	nop
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%s0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.30052

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.30053

	flw	%f12, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.30054

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.30055

fbeq_else.30054:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.30055:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30056

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.30056:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	flw	%f0, 2(%s0)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%s0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.30057

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30058

fbgt_else.30057:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30058:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30059

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30060

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%s0)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.30061

bnei_else.30060:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%s0)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.30061:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.30059:
	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.30053:
	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30062

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30063

fbgt_else.30062:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30063:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30064

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
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.30064:
	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.30052:
	flw	%f0, 0(%s0)
	flw	%f17, 1(%s0)
	nop
	nop

	flw	%f14, 1(%k0)
	flw	%f12, 1(%fp)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.30065

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30066

fbgt_else.30065:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30066:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30067

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
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.30069

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30070

fbgt_else.30069:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30070:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30071

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.30073

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.30074

fbeq_else.30073:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.30074:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30075

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30068

bnei_else.30075:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30076:
	nop
	nop
	nop
	j	bnei_cont.30068

bnei_else.30071:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30072:
	nop
	nop
	nop
	j	bnei_cont.30068

bnei_else.30067:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30068:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30077

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.30077:
	flw	%f0, 2(%s0)
	flw	%f19, 3(%s0)
	nop
	nop

	flw	%f18, 0(%k0)
	flw	%f17, 0(%fp)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.30078

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30079

fbgt_else.30078:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30079:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30080

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
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.30082

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30083

fbgt_else.30082:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30083:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30084

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.30086

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.30087

fbeq_else.30086:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.30087:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30088

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30081

bnei_else.30088:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30089:
	nop
	nop
	nop
	j	bnei_cont.30081

bnei_else.30084:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30085:
	nop
	nop
	nop
	j	bnei_cont.30081

bnei_else.30080:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30081:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30090

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 2
	jr	%ra

bnei_else.30090:
	flw	%f0, 4(%s0)
	nop
	nop
	nop

	flw	%f13, 5(%s0)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.30091

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30092

fbgt_else.30091:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30092:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30093

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.30095

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30096

fbgt_else.30095:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30096:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30097

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.30099

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.30100

fbeq_else.30099:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.30100:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30101

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30094

bnei_else.30101:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30102:
	nop
	nop
	nop
	j	bnei_cont.30094

bnei_else.30097:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30098:
	nop
	nop
	nop
	j	bnei_cont.30094

bnei_else.30093:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30094:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30103

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 3
	jr	%ra

bnei_else.30103:
	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

iter_setup_dirvec_constants.2877:
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
	blti	%a1, 0, bgti_else.30281

	lw	%a3, 12(%a1)
	lw	%k0, 1(%a0)
	nop
	nop

	lw	%fp, 0(%a0)
	lw	%s2, 9(%a3)
	nop
	nop

	lw	%s1, 6(%a3)
	lw	%s0, 4(%a3)
	nop
	nop

	lw	%s3, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.30282

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.30284

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f18, 2(%fp)
	flw	%f14, 0(%s0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%s0)
	flw	%f13, 2(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30286

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.30287

bnei_else.30286:
bnei_cont.30287:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30288

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 465(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.30289

bnei_else.30288:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.30289:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.30290

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.30291

fbeq_else.30290:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.30291:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30292

	nop
	nop
	nop
	j	bnei_cont.30293

bnei_else.30292:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.30293:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.30283

bnei_else.30284:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%s0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.30294

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.30295

fbgt_else.30294:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.30295:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30296

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.30297

bnei_else.30296:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.30297:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30285:
	nop
	nop
	nop
	j	bnei_cont.30283

bnei_else.30282:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30298

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.30299

fbeq_else.30298:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.30299:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30300

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.30301

bnei_else.30300:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30302

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.30303

fbgt_else.30302:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.30303:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30304

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30306

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.30305

bnei_else.30306:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.30307:
	nop
	nop
	nop
	j	bnei_cont.30305

bnei_else.30304:
bnei_cont.30305:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30308

	nop
	nop
	nop
	j	bnei_cont.30309

bnei_else.30308:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30309:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.30301:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30310

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.30311

fbeq_else.30310:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.30311:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30312

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.30313

bnei_else.30312:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30314

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.30315

fbgt_else.30314:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.30315:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30316

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30318

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.30317

bnei_else.30318:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.30319:
	nop
	nop
	nop
	j	bnei_cont.30317

bnei_else.30316:
bnei_cont.30317:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30320

	nop
	nop
	nop
	j	bnei_cont.30321

bnei_else.30320:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30321:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.30313:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30322

	nop
	nop
	add	%a3, %zero, %k1
	j	fbeq_cont.30323

fbeq_else.30322:
	nop
	nop
	add	%a3, %zero, %zero
	nop

fbeq_cont.30323:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30324

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.30325

bnei_else.30324:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30326

	nop
	nop
	add	%a3, %zero, %zero
	j	fbgt_cont.30327

fbgt_else.30326:
	nop
	nop
	add	%a3, %zero, %k1
	nop

fbgt_cont.30327:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30328

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30330

	nop
	nop
	add	%a3, %zero, %zero
	j	bnei_cont.30329

bnei_else.30330:
	nop
	nop
	add	%a3, %zero, %k1
	nop

bnei_cont.30331:
	nop
	nop
	nop
	j	bnei_cont.30329

bnei_else.30328:
bnei_cont.30329:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30332

	nop
	nop
	nop
	j	bnei_cont.30333

bnei_else.30332:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30333:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.30325:
	nop
	nop
	add	%at, %k0, %a1
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30283:
	nop
	nop
	addi	%a3, %a1, -1
	nop

	nop
	nop
	nop
	blti	%a3, 0, bgti_else.30334

	lw	%a1, 12(%a3)
	nop
	nop
	nop

	lw	%s2, 9(%a1)
	lw	%s1, 6(%a1)
	nop
	nop

	lw	%s0, 4(%a1)
	lw	%s3, 3(%a1)
	nop
	nop

	lw	%a1, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.30335

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.30337

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f18, 2(%fp)
	flw	%f14, 0(%s0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%s0)
	flw	%f13, 2(%s0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30339

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.30340

bnei_else.30339:
bnei_cont.30340:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30341

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 465(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.30342

bnei_else.30341:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.30342:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.30343

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.30344

fbeq_else.30343:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.30344:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30345

	nop
	nop
	nop
	j	bnei_cont.30346

bnei_else.30345:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.30346:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.30336

bnei_else.30337:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%fp)
	flw	%f13, 0(%s0)
	nop
	nop

	flw	%f0, 1(%fp)
	flw	%f12, 1(%s0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%s0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.30347

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.30348

fbgt_else.30347:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.30348:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30349

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.30350

bnei_else.30349:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.30350:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30338:
	nop
	nop
	nop
	j	bnei_cont.30336

bnei_else.30335:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30351

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.30352

fbeq_else.30351:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.30352:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30353

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.30354

bnei_else.30353:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30355

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.30356

fbgt_else.30355:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.30356:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30357

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30359

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30358

bnei_else.30359:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30360:
	nop
	nop
	nop
	j	bnei_cont.30358

bnei_else.30357:
bnei_cont.30358:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30361

	nop
	nop
	nop
	j	bnei_cont.30362

bnei_else.30361:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30362:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.30354:
	flw	%f1, 1(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30363

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.30364

fbeq_else.30363:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.30364:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30365

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.30366

bnei_else.30365:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30367

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.30368

fbgt_else.30367:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.30368:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30369

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30371

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30370

bnei_else.30371:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30372:
	nop
	nop
	nop
	j	bnei_cont.30370

bnei_else.30369:
bnei_cont.30370:
	flw	%f0, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30373

	nop
	nop
	nop
	j	bnei_cont.30374

bnei_else.30373:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30374:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.30366:
	flw	%f1, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30375

	nop
	nop
	add	%a1, %zero, %k1
	j	fbeq_cont.30376

fbeq_else.30375:
	nop
	nop
	add	%a1, %zero, %zero
	nop

fbeq_cont.30376:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30377

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.30378

bnei_else.30377:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30379

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.30380

fbgt_else.30379:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.30380:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30381

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30383

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30382

bnei_else.30383:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30384:
	nop
	nop
	nop
	j	bnei_cont.30382

bnei_else.30381:
bnei_cont.30382:
	flw	%f0, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30385

	nop
	nop
	nop
	j	bnei_cont.30386

bnei_else.30385:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30386:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.30378:
	nop
	nop
	add	%at, %k0, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30336:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a2

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.30334:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.30281:
	nop
	nop
	add	%ra, %zero, %a2
	nop

	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2880:
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
	blti	%a3, 0, bgti_else.30484

	lw	%a2, 12(%a3)
	lw	%fp, 1(%a0)
	nop
	nop

	lw	%s0, 0(%a0)
	lw	%s2, 9(%a2)
	nop
	nop

	lw	%s1, 6(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%s3, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.30485

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.30487

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%s0)
	flw	%f17, 1(%s0)
	nop
	nop

	flw	%f18, 2(%s0)
	flw	%f14, 0(%k0)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%k0)
	flw	%f13, 2(%k0)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30489

	flw	%f1, 0(%s2)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.30490

bnei_else.30489:
bnei_cont.30490:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s3, 0, bnei_else.30491

	flw	%f15, 1(%s2)
	flw	%f14, 2(%s2)
	nop
	nop

	flw	%f13, 465(%zero)
	flw	%f12, 0(%s2)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.30492

bnei_else.30491:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.30492:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.30493

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.30494

fbeq_else.30493:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.30494:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30495

	nop
	nop
	nop
	j	bnei_cont.30496

bnei_else.30495:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.30496:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.30486

bnei_else.30487:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%s0)
	flw	%f13, 0(%k0)
	nop
	nop

	flw	%f0, 1(%s0)
	flw	%f12, 1(%k0)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%k0)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%s0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.30497

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.30498

fbgt_else.30497:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.30498:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30499

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.30500

bnei_else.30499:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.30500:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30488:
	nop
	nop
	nop
	j	bnei_cont.30486

bnei_else.30485:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f1, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30501

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.30502

fbeq_else.30501:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.30502:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30503

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.30504

bnei_else.30503:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30505

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.30506

fbgt_else.30505:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.30506:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30507

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30509

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.30508

bnei_else.30509:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.30510:
	nop
	nop
	nop
	j	bnei_cont.30508

bnei_else.30507:
bnei_cont.30508:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30511

	nop
	nop
	nop
	j	bnei_cont.30512

bnei_else.30511:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30512:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.30504:
	flw	%f1, 1(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30513

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.30514

fbeq_else.30513:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.30514:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30515

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.30516

bnei_else.30515:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30517

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.30518

fbgt_else.30517:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.30518:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30519

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30521

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.30520

bnei_else.30521:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.30522:
	nop
	nop
	nop
	j	bnei_cont.30520

bnei_else.30519:
bnei_cont.30520:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30523

	nop
	nop
	nop
	j	bnei_cont.30524

bnei_else.30523:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30524:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.30516:
	flw	%f1, 2(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.30525

	nop
	nop
	add	%a2, %zero, %k1
	j	fbeq_cont.30526

fbeq_else.30525:
	nop
	nop
	add	%a2, %zero, %zero
	nop

fbeq_cont.30526:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30527

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.30528

bnei_else.30527:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.30529

	nop
	nop
	add	%a2, %zero, %zero
	j	fbgt_cont.30530

fbgt_else.30529:
	nop
	nop
	add	%a2, %zero, %k1
	nop

fbgt_cont.30530:
	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.30531

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30533

	nop
	nop
	add	%a2, %zero, %zero
	j	bnei_cont.30532

bnei_else.30533:
	nop
	nop
	add	%a2, %zero, %k1
	nop

bnei_cont.30534:
	nop
	nop
	nop
	j	bnei_cont.30532

bnei_else.30531:
bnei_cont.30532:
	flw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.30535

	nop
	nop
	nop
	j	bnei_cont.30536

bnei_else.30535:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.30536:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.30528:
	nop
	nop
	add	%at, %fp, %a3
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.30486:
	nop
	nop
	addi	%v1, %a3, -1
	add	%ra, %zero, %a1

	nop
	nop
	addi	%v0, %a0, 0
	j	iter_setup_dirvec_constants.2877

bgti_else.30484:
	nop
	nop
	add	%ra, %zero, %a1
	nop

	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.30567

	lw	%a1, 12(%v1)
	flw	%f1, 0(%v0)
	nop
	nop

	lw	%k0, 10(%a1)
	lw	%a2, 9(%a1)
	nop
	nop

	lw	%a0, 5(%a1)
	lw	%fp, 4(%a1)
	nop
	nop

	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 0(%k0)
	flw	%f0, 1(%a0)
	nop
	nop

	flw	%f1, 2(%v0)
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 1(%k0)
	flw	%f0, 2(%a0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	fsw	%f0, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.30568

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a1, bgt_else.30570

	nop
	nop
	nop
	j	bnei_cont.30569

bgt_else.30570:
	flw	%f14, 0(%k0)
	flw	%f13, 1(%k0)
	nop
	nop

	flw	%f12, 2(%k0)
	flw	%f0, 0(%fp)
	fmul	%f1, %f14, %f14
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f11, %f1, %f0
	fmul	%f1, %f13, %f13

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f12, %f12

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.30572

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f13, %f12
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f12, %f14

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.30573

bnei_else.30572:
bnei_cont.30573:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.30574

	nop
	nop
	nop
	j	bnei_cont.30575

bnei_else.30574:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.30575:
	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bgt_cont.30571:
	nop
	nop
	nop
	j	bnei_cont.30569

bnei_else.30568:
	flw	%f1, 0(%k0)
	flw	%f12, 1(%k0)
	nop
	nop

	flw	%f11, 2(%k0)
	flw	%f0, 0(%fp)
	nop
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 3(%k0)
	nop
	nop
	nop

bnei_cont.30569:
	nop
	nop
	addi	%v1, %v1, -1
	j	setup_startp_constants.2882

bgti_else.30567:
	nop
	nop
	nop
	jr	%ra

check_all_inside.2907:
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
	beqi	%a0, -1, bnei_else.30716

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.30717

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.30719

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.30721

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.30722

bnei_else.30721:
bnei_cont.30722:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.30723

	nop
	nop
	nop
	j	bnei_cont.30724

bnei_else.30723:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.30724:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.30725

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30726

fbgt_else.30725:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30726:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30727

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30729

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30728

bnei_else.30729:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30730:
	nop
	nop
	nop
	j	bnei_cont.30728

bnei_else.30727:
bnei_cont.30728:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30731

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30718

bnei_else.30731:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30732:
	nop
	nop
	nop
	j	bnei_cont.30718

bnei_else.30719:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.30733

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30734

fbgt_else.30733:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30734:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30735

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30737

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30736

bnei_else.30737:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30738:
	nop
	nop
	nop
	j	bnei_cont.30736

bnei_else.30735:
bnei_cont.30736:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30739

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30718

bnei_else.30739:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30740:
bnei_cont.30720:
	nop
	nop
	nop
	j	bnei_cont.30718

bnei_else.30717:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30741

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30742

fbgt_else.30741:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30742:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30743

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30745

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30746

fbgt_else.30745:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30746:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30747

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30749

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30744

fbgt_else.30749:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30750:
	nop
	nop
	nop
	j	bnei_cont.30744

bnei_else.30747:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30748:
	nop
	nop
	nop
	j	bnei_cont.30744

bnei_else.30743:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30744:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30751

	nop
	nop
	nop
	j	bnei_cont.30752

bnei_else.30751:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30753

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30754

bnei_else.30753:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30754:
bnei_cont.30752:
bnei_cont.30718:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30755

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.30755:
	nop
	nop
	addi	%s0, %v0, 1
	nop

	nop
	nop
	add	%at, %v1, %s0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.30756

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.30757

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.30759

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.30761

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.30762

bnei_else.30761:
bnei_cont.30762:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.30763

	nop
	nop
	nop
	j	bnei_cont.30764

bnei_else.30763:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.30764:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.30765

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30766

fbgt_else.30765:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30766:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30767

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30769

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30768

bnei_else.30769:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30770:
	nop
	nop
	nop
	j	bnei_cont.30768

bnei_else.30767:
bnei_cont.30768:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30771

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30758

bnei_else.30771:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30772:
	nop
	nop
	nop
	j	bnei_cont.30758

bnei_else.30759:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.30773

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30774

fbgt_else.30773:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30774:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30775

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30777

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30776

bnei_else.30777:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.30778:
	nop
	nop
	nop
	j	bnei_cont.30776

bnei_else.30775:
bnei_cont.30776:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30779

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30758

bnei_else.30779:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30780:
bnei_cont.30760:
	nop
	nop
	nop
	j	bnei_cont.30758

bnei_else.30757:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30781

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30782

fbgt_else.30781:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30782:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30783

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30785

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.30786

fbgt_else.30785:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30786:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30787

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.30789

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30784

fbgt_else.30789:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.30790:
	nop
	nop
	nop
	j	bnei_cont.30784

bnei_else.30787:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30788:
	nop
	nop
	nop
	j	bnei_cont.30784

bnei_else.30783:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.30784:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30791

	nop
	nop
	nop
	j	bnei_cont.30792

bnei_else.30791:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30793

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.30794

bnei_else.30793:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.30794:
bnei_cont.30792:
bnei_cont.30758:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.30795

	nop
	nop
	add	%v0, %zero, %zero
	jr	%ra

bnei_else.30795:
	nop
	nop
	addi	%a0, %s0, 1
	nop

	nop
	nop
	addi	%v0, %a0, 0
	j	check_all_inside.2907

bnei_else.30756:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

bnei_else.30716:
	nop
	nop
	add	%v0, %zero, %k1
	jr	%ra

shadow_check_and_group.2913:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra

	nop
	nop
	add	%at, %v1, %s1
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%ra, -1, bnei_else.30986

	lw	%a2, 12(%ra)
	flw	%f14, 138(%zero)
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f11, 139(%zero)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f13, 140(%zero)
	fsub	%f17, %f14, %f0
	nop

	flw	%f0, 2(%a0)
	lw	%ra, 187(%ra)
	fsub	%f18, %f11, %f0
	nop

	nop
	nop
	fsub	%f19, %f13, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.30987

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.30989

	flw	%f16, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.30991

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.30992

fbeq_else.30991:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.30992:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.30993

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.30988

bnei_else.30993:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 0(%k0)
	nop
	fadd	%f15, %f1, %f0
	fmul	%f1, %f17, %f17

	flw	%f0, 1(%k0)
	nop
	fmul	%f12, %f1, %f0
	fmul	%f1, %f18, %f18

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f19, %f19

	flw	%f0, 2(%k0)
	nop
	fadd	%f12, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.30995

	flw	%f1, 0(%a3)
	nop
	fmul	%f12, %f18, %f19
	nop

	nop
	nop
	fmul	%f1, %f12, %f1
	nop

	flw	%f0, 1(%a3)
	nop
	fadd	%f12, %f0, %f1
	fmul	%f1, %f19, %f17

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f17, %f18

	flw	%f0, 2(%a3)
	nop
	fadd	%f12, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	j	bnei_cont.30996

bnei_else.30995:
bnei_cont.30996:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.30997

	nop
	nop
	nop
	j	bnei_cont.30998

bnei_else.30997:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.30998:
	nop
	nop
	fmul	%f1, %f15, %f15
	fmul	%f0, %f16, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.30999

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31000

fbgt_else.30999:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31000:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31001

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31003

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.31004

bnei_else.31003:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.31004:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.30988

bnei_else.31001:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31002:
bnei_cont.30994:
	nop
	nop
	nop
	j	bnei_cont.30988

bnei_else.30989:
	flw	%f0, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.31005

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31006

fbgt_else.31005:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31006:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31007

	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
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
	j	bnei_cont.30988

bnei_else.31007:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31008:
bnei_cont.30990:
	nop
	nop
	nop
	j	bnei_cont.30988

bnei_else.30987:
	flw	%f0, 0(%ra)
	flw	%f2, 1(%ra)
	nop
	nop

	flw	%f15, 185(%zero)
	flw	%f12, 1(%k0)
	fsub	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f16, %f0, %f2
	nop

	nop
	nop
	fmul	%f0, %f16, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.31009

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31010

fbgt_else.31009:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31010:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31011

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31013

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31014

fbgt_else.31013:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31014:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31015

	nop
	nop
	nop
	fbne	%f2, %fzero, fbeq_else.31017

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31018

fbeq_else.31017:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31018:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31019

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31012

bnei_else.31019:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31020:
	nop
	nop
	nop
	j	bnei_cont.31012

bnei_else.31015:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31016:
	nop
	nop
	nop
	j	bnei_cont.31012

bnei_else.31011:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31012:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31021

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31022

bnei_else.31021:
	flw	%f0, 2(%ra)
	flw	%f21, 3(%ra)
	nop
	nop

	flw	%f20, 184(%zero)
	flw	%f2, 0(%k0)
	fsub	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f16, %f0, %f21
	nop

	nop
	nop
	fmul	%f0, %f16, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31023

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31024

fbgt_else.31023:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31024:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31025

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f19
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31027

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31028

fbgt_else.31027:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31028:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31029

	nop
	nop
	nop
	fbne	%f21, %fzero, fbeq_else.31031

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31032

fbeq_else.31031:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31032:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31033

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31026

bnei_else.31033:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31034:
	nop
	nop
	nop
	j	bnei_cont.31026

bnei_else.31029:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31030:
	nop
	nop
	nop
	j	bnei_cont.31026

bnei_else.31025:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31026:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31035

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.31036

bnei_else.31035:
	flw	%f0, 4(%ra)
	flw	%f16, 5(%ra)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f19
	nop

	nop
	nop
	fmul	%f1, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f1, %f20
	nop

	nop
	nop
	fadd	%f0, %f0, %f17
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31037

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31038

fbgt_else.31037:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31038:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31039

	nop
	nop
	fmul	%f0, %f1, %f15
	nop

	nop
	nop
	fadd	%f0, %f0, %f18
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.31041

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31042

fbgt_else.31041:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31042:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31043

	nop
	nop
	nop
	fbne	%f16, %fzero, fbeq_else.31045

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31046

fbeq_else.31045:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31046:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31047

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31040

bnei_else.31047:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31048:
	nop
	nop
	nop
	j	bnei_cont.31040

bnei_else.31043:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31044:
	nop
	nop
	nop
	j	bnei_cont.31040

bnei_else.31039:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31040:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31049

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.31050

bnei_else.31049:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31050:
bnei_cont.31036:
bnei_cont.31022:
bnei_cont.30988:
	flw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31051

	nop
	nop
	nop
	fblt	%f0, %f10, fbgt_else.31053

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31052

fbgt_else.31053:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31054:
	nop
	nop
	nop
	j	bnei_cont.31052

bnei_else.31051:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31052:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31055

	flw	%f0, 78(%zero)
	flw	%f1, 79(%zero)
	fadd	%f12, %f0, %f9
	nop

	lw	%a0, 0(%v1)
	nop
	fmul	%f0, %f0, %f12
	fmul	%f1, %f1, %f12

	flw	%f11, 80(%zero)
	nop
	fadd	%f0, %f0, %f14
	fadd	%f1, %f1, %f11

	nop
	nop
	fmul	%f11, %f11, %f12
	nop

	nop
	nop
	fadd	%f2, %f11, %f13
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31056

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.31058

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.31060

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.31062

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.31063

bnei_else.31062:
bnei_cont.31063:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.31064

	nop
	nop
	nop
	j	bnei_cont.31065

bnei_else.31064:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.31065:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.31066

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31067

fbgt_else.31066:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31067:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31068

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31070

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31069

bnei_else.31070:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31071:
	nop
	nop
	nop
	j	bnei_cont.31069

bnei_else.31068:
bnei_cont.31069:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31072

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31059

bnei_else.31072:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31073:
	nop
	nop
	nop
	j	bnei_cont.31059

bnei_else.31060:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.31074

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31075

fbgt_else.31074:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31075:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31076

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31078

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31077

bnei_else.31078:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31079:
	nop
	nop
	nop
	j	bnei_cont.31077

bnei_else.31076:
bnei_cont.31077:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31080

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31059

bnei_else.31080:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31081:
bnei_cont.31061:
	nop
	nop
	nop
	j	bnei_cont.31059

bnei_else.31058:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31082

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31083

fbgt_else.31082:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31083:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31084

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31086

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31087

fbgt_else.31086:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31087:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31088

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31090

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31085

fbgt_else.31090:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31091:
	nop
	nop
	nop
	j	bnei_cont.31085

bnei_else.31088:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31089:
	nop
	nop
	nop
	j	bnei_cont.31085

bnei_else.31084:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31085:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31092

	nop
	nop
	nop
	j	bnei_cont.31093

bnei_else.31092:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31094

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31095

bnei_else.31094:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31095:
bnei_cont.31093:
bnei_cont.31059:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31096

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.31057

bnei_else.31096:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2907

bnei_cont.31097:
	nop
	nop
	nop
	j	bnei_cont.31057

bnei_else.31056:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.31057:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31098

	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31098:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.31055:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31099

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.31099:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.30986:
	nop
	nop
	add	%ra, %zero, %s2
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2916:
	nop
	nop
	add	%s3, %zero, %v0
	add	%s4, %zero, %v1

	nop
	nop
	add	%s5, %zero, %ra
	add	%at, %s4, %s3

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31137

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31138

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31138:
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
	beqi	%a0, -1, bnei_else.31139

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31140

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31140:
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
	beqi	%a0, -1, bnei_else.31141

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31142

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31142:
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
	beqi	%a0, -1, bnei_else.31143

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31144

	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31144:
	nop
	nop
	addi	%v0, %s3, 1
	add	%ra, %zero, %s5

	nop
	nop
	addi	%v1, %s4, 0
	j	shadow_check_one_or_group.2916

bnei_else.31143:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.31141:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.31139:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

bnei_else.31137:
	nop
	nop
	add	%ra, %zero, %s5
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2919:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1

	nop
	nop
	add	%t7, %zero, %ra
	add	%at, %s7, %s6

	lw	%t8, 0(%at)
	nop
	nop
	nop

	lw	%k0, 0(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, -1, bnei_else.31314

	nop
	nop
	nop
	beqi	%k0, 99, bnei_else.31315

	lw	%a1, 12(%k0)
	flw	%f1, 138(%zero)
	nop
	nop

	lw	%a2, 9(%a1)
	lw	%fp, 6(%a1)
	nop
	nop

	lw	%a0, 5(%a1)
	lw	%ra, 4(%a1)
	nop
	nop

	lw	%a3, 3(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%k0, 187(%k0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	nop
	nop
	fsub	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.31317

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.31319

	flw	%f13, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.31321

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31322

fbeq_else.31321:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31322:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31323

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31318

bnei_else.31323:
	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 3(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	flw	%f0, 0(%ra)
	nop
	fadd	%f12, %f1, %f0
	fmul	%f1, %f14, %f14

	flw	%f0, 1(%ra)
	nop
	fmul	%f11, %f1, %f0
	fmul	%f1, %f15, %f15

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f16

	flw	%f0, 2(%ra)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.31325

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f15, %f16
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f16, %f14

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f14, %f15

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.31326

bnei_else.31325:
bnei_cont.31326:
	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.31327

	nop
	nop
	nop
	j	bnei_cont.31328

bnei_else.31327:
	nop
	nop
	fsub	%f0, %f0, %f30
	nop

bnei_cont.31328:
	nop
	nop
	fmul	%f1, %f12, %f12
	fmul	%f0, %f13, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.31329

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31330

fbgt_else.31329:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31330:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31331

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.31333

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fadd	%f1, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.31334

bnei_else.31333:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%k0)
	nop
	fsub	%f1, %f12, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.31334:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31318

bnei_else.31331:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31332:
bnei_cont.31324:
	nop
	nop
	nop
	j	bnei_cont.31318

bnei_else.31319:
	flw	%f0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.31335

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31336

fbgt_else.31335:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31336:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31337

	flw	%f0, 1(%k0)
	nop
	nop
	nop

	flw	%f0, 2(%k0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 3(%k0)
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

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31318

bnei_else.31337:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31338:
bnei_cont.31320:
	nop
	nop
	nop
	j	bnei_cont.31318

bnei_else.31317:
	flw	%f0, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f12, 185(%zero)
	flw	%f11, 1(%ra)
	fsub	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f13, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.31339

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31340

fbgt_else.31339:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31340:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31341

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31343

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31344

fbgt_else.31343:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31344:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31345

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.31347

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31348

fbeq_else.31347:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31348:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31349

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31342

bnei_else.31349:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31350:
	nop
	nop
	nop
	j	bnei_cont.31342

bnei_else.31345:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31346:
	nop
	nop
	nop
	j	bnei_cont.31342

bnei_else.31341:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31342:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31351

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31352

bnei_else.31351:
	flw	%f0, 2(%k0)
	flw	%f19, 3(%k0)
	nop
	nop

	flw	%f18, 184(%zero)
	flw	%f17, 0(%ra)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f13, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f13, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.31353

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31354

fbgt_else.31353:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31354:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31355

	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%ra)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31357

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31358

fbgt_else.31357:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31358:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31359

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.31361

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31362

fbeq_else.31361:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31362:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31363

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31356

bnei_else.31363:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31364:
	nop
	nop
	nop
	j	bnei_cont.31356

bnei_else.31359:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31360:
	nop
	nop
	nop
	j	bnei_cont.31356

bnei_else.31355:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31356:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31365

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.31366

bnei_else.31365:
	flw	%f0, 4(%k0)
	flw	%f13, 5(%k0)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.31367

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31368

fbgt_else.31367:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31368:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31369

	nop
	nop
	fmul	%f0, %f1, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.31371

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31372

fbgt_else.31371:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31372:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31373

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.31375

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31376

fbeq_else.31375:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31376:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31377

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31370

bnei_else.31377:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31378:
	nop
	nop
	nop
	j	bnei_cont.31370

bnei_else.31373:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31374:
	nop
	nop
	nop
	j	bnei_cont.31370

bnei_else.31369:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31370:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31379

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.31380

bnei_else.31379:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31380:
bnei_cont.31366:
bnei_cont.31352:
bnei_cont.31318:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31381

	flw	%f1, 135(%zero)
	flw	%f0, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31383

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31384

fbgt_else.31383:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31384:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31385

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31387

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31389

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31388

bnei_else.31389:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31391

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31393

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31388

bnei_else.31393:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31395

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31397

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31388

bnei_else.31397:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.31398:
	nop
	nop
	nop
	j	bnei_cont.31388

bnei_else.31395:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31396:
bnei_cont.31394:
	nop
	nop
	nop
	j	bnei_cont.31388

bnei_else.31391:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31392:
bnei_cont.31390:
	nop
	nop
	nop
	j	bnei_cont.31388

bnei_else.31387:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31388:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31399

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31316

bnei_else.31399:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31400:
	nop
	nop
	nop
	j	bnei_cont.31316

bnei_else.31385:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31386:
	nop
	nop
	nop
	j	bnei_cont.31316

bnei_else.31381:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31382:
	nop
	nop
	nop
	j	bnei_cont.31316

bnei_else.31315:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31316:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31401

	lw	%a0, 1(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31402

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31404

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31403

bnei_else.31404:
	lw	%a0, 2(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31406

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31408

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31403

bnei_else.31408:
	lw	%a0, 3(%t8)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31410

	lw	%v1, 83(%a0)
	nop
	addi	%v0, %zero, 0
	jal	shadow_check_and_group.2913

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31412

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.31403

bnei_else.31412:
	nop
	nop
	addi	%v0, %zero, 4
	addi	%v1, %t8, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

bnei_cont.31413:
	nop
	nop
	nop
	j	bnei_cont.31403

bnei_else.31410:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31411:
bnei_cont.31409:
	nop
	nop
	nop
	j	bnei_cont.31403

bnei_else.31406:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31407:
bnei_cont.31405:
	nop
	nop
	nop
	j	bnei_cont.31403

bnei_else.31402:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.31403:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31414

	nop
	nop
	add	%ra, %zero, %t7
	add	%v0, %zero, %k1

	nop
	nop
	nop
	jr	%ra

bnei_else.31414:
	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7

	nop
	nop
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.31401:
	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t7

	nop
	nop
	addi	%v1, %s7, 0
	j	shadow_check_one_or_matrix.2919

bnei_else.31314:
	nop
	nop
	add	%ra, %zero, %t7
	add	%v0, %zero, %zero

	nop
	nop
	nop
	jr	%ra

solve_each_element.2922:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %v1

	nop
	nop
	add	%s3, %zero, %a0
	add	%s4, %zero, %ra

	nop
	nop
	add	%at, %s2, %s1
	nop

	lw	%s5, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s5, -1, bnei_else.31628

	lw	%v0, 12(%s5)
	flw	%f22, 159(%zero)
	nop
	nop

	lw	%k0, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%a1, 4(%v0)
	lw	%a2, 1(%v0)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f23, 160(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	flw	%f24, 161(%zero)
	fsub	%f0, %f22, %f0
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f1, %f23, %f1
	nop

	nop
	nop
	fsub	%f2, %f24, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.31629

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.31631

	nop
	nop
	addi	%v1, %s3, 0
	jal	solver_second.2818

	nop
	nop
	addi	%s6, %v0, 0
	j	bnei_cont.31630

bnei_else.31631:
	flw	%f11, 0(%s3)
	flw	%f15, 0(%a1)
	nop
	nop

	flw	%f11, 1(%s3)
	flw	%f14, 1(%a1)
	fmul	%f12, %f11, %f15
	nop

	flw	%f13, 2(%a1)
	nop
	fmul	%f11, %f11, %f14
	nop

	flw	%f11, 2(%s3)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.31633

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31634

fbgt_else.31633:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31634:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31635

	nop
	nop
	fmul	%f11, %f15, %f0
	fmul	%f0, %f14, %f1

	nop
	nop
	fadd	%f1, %f11, %f0
	fmul	%f0, %f13, %f2

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
	fdiv	%f0, %f0, %f12
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s6, %zero, %k1
	j	bnei_cont.31630

bnei_else.31635:
	nop
	nop
	add	%s6, %zero, %zero
	nop

bnei_cont.31636:
bnei_cont.31632:
	nop
	nop
	nop
	j	bnei_cont.31630

bnei_else.31629:
	flw	%f14, 0(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f14, %fzero, fbeq_else.31637

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31638

fbeq_else.31637:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31638:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31639

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31640

bnei_else.31639:
	nop
	nop
	nop
	fblt	%f14, %fzero, fbgt_else.31641

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31642

fbgt_else.31641:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31642:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.31643

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31645

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31644

bnei_else.31645:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31646:
	nop
	nop
	nop
	j	bnei_cont.31644

bnei_else.31643:
bnei_cont.31644:
	flw	%f11, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31647

	nop
	nop
	nop
	j	bnei_cont.31648

bnei_else.31647:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.31648:
	nop
	nop
	fsub	%f11, %f11, %f0
	nop

	flw	%f11, 1(%s3)
	nop
	fdiv	%f13, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f13, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	nop

	flw	%f11, 1(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31649

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31650

fbgt_else.31649:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31650:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31651

	flw	%f11, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f11, %f13, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f2
	nop

	flw	%f11, 2(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31653

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31654

fbgt_else.31653:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31654:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31655

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31652

bnei_else.31655:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31656:
	nop
	nop
	nop
	j	bnei_cont.31652

bnei_else.31651:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31652:
bnei_cont.31640:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31657

	nop
	nop
	add	%s6, %zero, %k1
	j	bnei_cont.31658

bnei_else.31657:
	flw	%f13, 1(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.31659

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31660

fbeq_else.31659:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31660:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31661

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31662

bnei_else.31661:
	nop
	nop
	nop
	fblt	%f13, %fzero, fbgt_else.31663

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31664

fbgt_else.31663:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31664:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.31665

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31667

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31666

bnei_else.31667:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31668:
	nop
	nop
	nop
	j	bnei_cont.31666

bnei_else.31665:
bnei_cont.31666:
	flw	%f11, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31669

	nop
	nop
	nop
	j	bnei_cont.31670

bnei_else.31669:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.31670:
	nop
	nop
	fsub	%f11, %f11, %f1
	nop

	flw	%f11, 2(%s3)
	nop
	fdiv	%f15, %f11, %f13
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f2
	nop

	flw	%f11, 2(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31671

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31672

fbgt_else.31671:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31672:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31673

	nop
	nop
	fmul	%f11, %f15, %f14
	nop

	nop
	nop
	fadd	%f11, %f11, %f0
	nop

	flw	%f11, 0(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31675

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31676

fbgt_else.31675:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31676:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31677

	fsw	%f15, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31674

bnei_else.31677:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31678:
	nop
	nop
	nop
	j	bnei_cont.31674

bnei_else.31673:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31674:
bnei_cont.31662:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31679

	nop
	nop
	addi	%s6, %zero, 2
	j	bnei_cont.31680

bnei_else.31679:
	flw	%f12, 2(%s3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.31681

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.31682

fbeq_else.31681:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.31682:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31683

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31684

bnei_else.31683:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.31685

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31686

fbgt_else.31685:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31686:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.31687

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31689

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31688

bnei_else.31689:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31690:
	nop
	nop
	nop
	j	bnei_cont.31688

bnei_else.31687:
bnei_cont.31688:
	flw	%f11, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31691

	nop
	nop
	nop
	j	bnei_cont.31692

bnei_else.31691:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.31692:
	nop
	nop
	fsub	%f11, %f11, %f2
	nop

	nop
	nop
	fdiv	%f12, %f11, %f12
	nop

	nop
	nop
	fmul	%f11, %f12, %f14
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f11, %f0, fbgt_else.31693

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31694

fbgt_else.31693:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31694:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31695

	nop
	nop
	fmul	%f0, %f12, %f13
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31697

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31698

fbgt_else.31697:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31698:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31699

	fsw	%f12, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.31696

bnei_else.31699:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31700:
	nop
	nop
	nop
	j	bnei_cont.31696

bnei_else.31695:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31696:
bnei_cont.31684:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31701

	nop
	nop
	addi	%s6, %zero, 3
	j	bnei_cont.31702

bnei_else.31701:
	nop
	nop
	add	%s6, %zero, %zero
	nop

bnei_cont.31702:
bnei_cont.31680:
bnei_cont.31658:
bnei_cont.31630:
	nop
	nop
	nop
	beqi	%s6, 0, bnei_else.31703

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.31704

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31705

fbgt_else.31704:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31705:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31706

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31708

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31709

fbgt_else.31708:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31709:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.31707

	flw	%f0, 0(%s3)
	flw	%f1, 1(%s3)
	fadd	%f17, %f1, %f9
	nop

	flw	%f11, 2(%s3)
	lw	%a0, 0(%s2)
	fmul	%f0, %f0, %f17
	fmul	%f1, %f1, %f17

	nop
	nop
	fadd	%f0, %f0, %f22
	fadd	%f1, %f1, %f23

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f2, %f11, %f24
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31712

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.31714

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.31716

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.31718

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.31719

bnei_else.31718:
bnei_cont.31719:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.31720

	nop
	nop
	nop
	j	bnei_cont.31721

bnei_else.31720:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.31721:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.31722

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31723

fbgt_else.31722:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31723:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31724

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31726

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31725

bnei_else.31726:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31727:
	nop
	nop
	nop
	j	bnei_cont.31725

bnei_else.31724:
bnei_cont.31725:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31728

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31715

bnei_else.31728:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31729:
	nop
	nop
	nop
	j	bnei_cont.31715

bnei_else.31716:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.31730

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31731

fbgt_else.31730:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31731:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31732

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31734

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31733

bnei_else.31734:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.31735:
	nop
	nop
	nop
	j	bnei_cont.31733

bnei_else.31732:
bnei_cont.31733:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31736

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31715

bnei_else.31736:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31737:
bnei_cont.31717:
	nop
	nop
	nop
	j	bnei_cont.31715

bnei_else.31714:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31738

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31739

fbgt_else.31738:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31739:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31740

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31742

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.31743

fbgt_else.31742:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31743:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31744

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.31746

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.31741

fbgt_else.31746:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.31747:
	nop
	nop
	nop
	j	bnei_cont.31741

bnei_else.31744:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31745:
	nop
	nop
	nop
	j	bnei_cont.31741

bnei_else.31740:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.31741:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.31748

	nop
	nop
	nop
	j	bnei_cont.31749

bnei_else.31748:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31750

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.31751

bnei_else.31750:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.31751:
bnei_cont.31749:
bnei_cont.31715:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.31752

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.31713

bnei_else.31752:
	nop
	nop
	addi	%v1, %s2, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	check_all_inside.2907

bnei_cont.31753:
	nop
	nop
	nop
	j	bnei_cont.31713

bnei_else.31712:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.31713:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.31707

	fsw	%f17, 137(%zero)
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

	sw	%s5, 141(%zero)
	nop
	nop
	nop

	sw	%s6, 136(%zero)
	nop
	nop
	j	bnei_cont.31707

bnei_else.31754:
bnei_cont.31755:
	nop
	nop
	nop
	j	bnei_cont.31707

bnei_else.31710:
bnei_cont.31711:
	nop
	nop
	nop
	j	bnei_cont.31707

bnei_else.31706:
bnei_cont.31707:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s4

	nop
	nop
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.31703:
	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.31756

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s4

	nop
	nop
	addi	%a0, %s3, 0
	addi	%v1, %s2, 0

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.31756:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31628:
	nop
	nop
	add	%ra, %zero, %s4
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2926:
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

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31804

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31805

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31806

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31807

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31808

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31809

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31810

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%s7, %s7, 1
	nop

	nop
	nop
	add	%at, %t7, %s7
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.31811

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t8, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element.2922

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
	j	solve_one_or_network.2926

bnei_else.31811:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31810:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31809:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31808:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31807:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31806:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31805:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.31804:
	nop
	nop
	add	%ra, %zero, %t9
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2930:
	sw	%v0, 0(%sp)
	nop
	add	%a1, %zero, %v1
	add	%v1, %zero, %a0

	sw	%a1, 1(%sp)
	nop
	add	%at, %a1, %v0
	nop

	sw	%v1, 2(%sp)
	lw	%s7, 0(%at)
	nop
	nop

	sw	%ra, 3(%sp)
	lw	%a0, 0(%s7)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32605

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.32606

	lw	%v0, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%a2, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%a1, 4(%v0)
	lw	%a3, 1(%v0)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f11, 160(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	flw	%f12, 161(%zero)
	fsub	%f0, %f1, %f0
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	fsub	%f2, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.32608

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32610

	nop
	nop
	addi	%sp, %sp, 4
	jal	solver_second.2818

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.32609

bnei_else.32610:
	flw	%f11, 0(%v1)
	flw	%f15, 0(%a1)
	nop
	nop

	flw	%f11, 1(%v1)
	flw	%f14, 1(%a1)
	fmul	%f12, %f11, %f15
	nop

	flw	%f13, 2(%a1)
	nop
	fmul	%f11, %f11, %f14
	nop

	flw	%f11, 2(%v1)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f13
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.32612

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32613

fbgt_else.32612:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32613:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32614

	nop
	nop
	fmul	%f11, %f15, %f0
	fmul	%f0, %f14, %f1

	nop
	nop
	fadd	%f1, %f11, %f0
	fmul	%f0, %f13, %f2

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
	fdiv	%f0, %f0, %f12
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.32609

bnei_else.32614:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.32615:
bnei_cont.32611:
	nop
	nop
	nop
	j	bnei_cont.32609

bnei_else.32608:
	flw	%f14, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f14, %fzero, fbeq_else.32616

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32617

fbeq_else.32616:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32617:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32618

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32619

bnei_else.32618:
	nop
	nop
	nop
	fblt	%f14, %fzero, fbgt_else.32620

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32621

fbgt_else.32620:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32621:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32622

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32624

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32623

bnei_else.32624:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32625:
	nop
	nop
	nop
	j	bnei_cont.32623

bnei_else.32622:
bnei_cont.32623:
	flw	%f11, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32626

	nop
	nop
	nop
	j	bnei_cont.32627

bnei_else.32626:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.32627:
	lw	%a0, 2(%sp)
	nop
	fsub	%f11, %f11, %f0
	nop

	flw	%f11, 1(%a0)
	nop
	fdiv	%f13, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f13, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	nop

	flw	%f11, 1(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.32628

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32629

fbgt_else.32628:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32629:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32630

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f11, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f11, %f13, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f2
	nop

	flw	%f11, 2(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.32632

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32633

fbgt_else.32632:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32633:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32634

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32631

bnei_else.32634:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32635:
	nop
	nop
	nop
	j	bnei_cont.32631

bnei_else.32630:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32631:
bnei_cont.32619:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32636

	nop
	nop
	add	%v0, %zero, %k1
	j	bnei_cont.32637

bnei_else.32636:
	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f13, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.32638

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32639

fbeq_else.32638:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32639:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32640

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32641

bnei_else.32640:
	nop
	nop
	nop
	fblt	%f13, %fzero, fbgt_else.32642

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32643

fbgt_else.32642:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32643:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32644

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32646

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32645

bnei_else.32646:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32647:
	nop
	nop
	nop
	j	bnei_cont.32645

bnei_else.32644:
bnei_cont.32645:
	flw	%f11, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32648

	nop
	nop
	nop
	j	bnei_cont.32649

bnei_else.32648:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.32649:
	lw	%a0, 2(%sp)
	nop
	fsub	%f11, %f11, %f1
	nop

	flw	%f11, 2(%a0)
	nop
	fdiv	%f15, %f11, %f13
	nop

	nop
	nop
	fmul	%f11, %f15, %f11
	nop

	nop
	nop
	fadd	%f11, %f11, %f2
	nop

	flw	%f11, 2(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.32650

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32651

fbgt_else.32650:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32652

	nop
	nop
	fmul	%f11, %f15, %f14
	nop

	nop
	nop
	fadd	%f11, %f11, %f0
	nop

	flw	%f11, 0(%a1)
	nop
	fabs	%f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.32654

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32655

fbgt_else.32654:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32655:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32656

	fsw	%f15, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32653

bnei_else.32656:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32657:
	nop
	nop
	nop
	j	bnei_cont.32653

bnei_else.32652:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32653:
bnei_cont.32641:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32658

	nop
	nop
	addi	%v0, %zero, 2
	j	bnei_cont.32659

bnei_else.32658:
	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f12, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.32660

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32661

fbeq_else.32660:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32661:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32662

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32663

bnei_else.32662:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.32664

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32665

fbgt_else.32664:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32665:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32666

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32668

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32667

bnei_else.32668:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32669:
	nop
	nop
	nop
	j	bnei_cont.32667

bnei_else.32666:
bnei_cont.32667:
	flw	%f11, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32670

	nop
	nop
	nop
	j	bnei_cont.32671

bnei_else.32670:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.32671:
	nop
	nop
	fsub	%f11, %f11, %f2
	nop

	nop
	nop
	fdiv	%f12, %f11, %f12
	nop

	nop
	nop
	fmul	%f11, %f12, %f14
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f11, %f0, fbgt_else.32672

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32673

fbgt_else.32672:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32673:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32674

	nop
	nop
	fmul	%f0, %f12, %f13
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32676

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32677

fbgt_else.32676:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32677:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32678

	fsw	%f12, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32675

bnei_else.32678:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32679:
	nop
	nop
	nop
	j	bnei_cont.32675

bnei_else.32674:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32675:
bnei_cont.32663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32680

	nop
	nop
	addi	%v0, %zero, 3
	j	bnei_cont.32681

bnei_else.32680:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bnei_cont.32681:
bnei_cont.32659:
bnei_cont.32637:
bnei_cont.32609:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.32607

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32684

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32685

fbgt_else.32684:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.32607

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 2(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 3(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 4(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 5(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 6(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 7(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32607

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8

	lw	%a0, 2(%sp)
	nop
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.32607

bnei_else.32700:
bnei_cont.32701:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32698:
bnei_cont.32699:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32696:
bnei_cont.32697:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32694:
bnei_cont.32695:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32692:
bnei_cont.32693:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32690:
bnei_cont.32691:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32688:
bnei_cont.32689:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32686:
bnei_cont.32687:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32682:
bnei_cont.32683:
	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32606:
	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32702

	lw	%a1, 83(%a0)
	nop
	addi	%a0, %v1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 2(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 3(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 4(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 5(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 6(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 7(%s7)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32703

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v0, %zero, 8

	lw	%a0, 2(%sp)
	nop
	addi	%v1, %s7, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.32703

bnei_else.32714:
bnei_cont.32715:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32712:
bnei_cont.32713:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32710:
bnei_cont.32711:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32708:
bnei_cont.32709:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32706:
bnei_cont.32707:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32704:
bnei_cont.32705:
	nop
	nop
	nop
	j	bnei_cont.32703

bnei_else.32702:
bnei_cont.32703:
bnei_cont.32607:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, 1
	nop

	sw	%a1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%s7, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32716

	nop
	nop
	nop
	beqi	%a0, 99, bnei_else.32717

	lw	%a3, 12(%a0)
	flw	%f1, 159(%zero)
	nop
	nop

	lw	%fp, 9(%a3)
	lw	%a2, 6(%a3)
	nop
	nop

	lw	%a0, 5(%a3)
	lw	%a1, 4(%a3)
	nop
	nop

	lw	%k0, 3(%a3)
	lw	%a3, 1(%a3)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 161(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	nop
	nop
	fsub	%f16, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.32719

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32721

	lw	%a0, 2(%sp)
	flw	%f19, 0(%a1)
	nop
	nop

	flw	%f20, 0(%a0)
	flw	%f2, 1(%a0)
	nop
	nop

	flw	%f21, 2(%a0)
	flw	%f18, 1(%a1)
	fmul	%f0, %f20, %f20
	nop

	flw	%f17, 2(%a1)
	nop
	fmul	%f1, %f0, %f19
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f21, %f21

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
	nop
	beqi	%k0, 0, bnei_else.32723

	flw	%f1, 0(%fp)
	nop
	fmul	%f11, %f2, %f21
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%fp)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f21, %f20

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f20, %f2

	flw	%f0, 2(%fp)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.32724

bnei_else.32723:
bnei_cont.32724:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.32725

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32726

fbeq_else.32725:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32726:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32727

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32720

bnei_else.32727:
	nop
	nop
	fmul	%f1, %f20, %f14
	nop

	nop
	nop
	fmul	%f11, %f1, %f19
	fmul	%f1, %f2, %f15

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fadd	%f11, %f11, %f1
	fmul	%f1, %f21, %f16

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32729

	nop
	nop
	fmul	%f12, %f21, %f15
	fmul	%f11, %f2, %f16

	flw	%f11, 0(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f20, %f16

	nop
	nop
	fmul	%f11, %f21, %f14
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f20, %f15

	nop
	nop
	fadd	%f13, %f13, %f11
	fmul	%f11, %f2, %f14

	flw	%f11, 2(%fp)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	flw	%f11, 465(%zero)
	nop
	fadd	%f12, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f11
	j	bnei_cont.32730

bnei_else.32729:
bnei_cont.32730:
	nop
	nop
	fmul	%f11, %f14, %f14
	nop

	nop
	nop
	fmul	%f12, %f11, %f19
	fmul	%f11, %f15, %f15

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	nop
	nop
	fadd	%f12, %f12, %f11
	fmul	%f11, %f16, %f16

	nop
	nop
	fmul	%f11, %f11, %f17
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%k0, 0, bnei_else.32731

	flw	%f12, 0(%fp)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%fp)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%fp)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.32732

bnei_else.32731:
bnei_cont.32732:
	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.32733

	nop
	nop
	nop
	j	bnei_cont.32734

bnei_else.32733:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.32734:
	nop
	nop
	fmul	%f12, %f1, %f1
	fmul	%f11, %f0, %f11

	nop
	nop
	fsub	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.32735

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32736

fbgt_else.32735:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32736:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32737

	nop
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32739

	nop
	nop
	nop
	j	bnei_cont.32740

bnei_else.32739:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.32740:
	nop
	nop
	fsub	%f1, %f11, %f1
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
	add	%a0, %zero, %k1
	j	bnei_cont.32720

bnei_else.32737:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32738:
bnei_cont.32728:
	nop
	nop
	nop
	j	bnei_cont.32720

bnei_else.32721:
	lw	%a0, 2(%sp)
	flw	%f17, 0(%a1)
	nop
	nop

	flw	%f0, 0(%a0)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f0, 1(%a0)
	flw	%f12, 2(%a1)
	fmul	%f1, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.32741

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32742

fbgt_else.32741:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32742:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32743

	nop
	nop
	fmul	%f1, %f17, %f14
	fmul	%f0, %f13, %f15

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f12, %f16

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
	fdiv	%f0, %f0, %f11
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32720

bnei_else.32743:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32744:
bnei_cont.32722:
	nop
	nop
	nop
	j	bnei_cont.32720

bnei_else.32719:
	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f12, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.32745

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32746

fbeq_else.32745:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32746:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32747

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32748

bnei_else.32747:
	nop
	nop
	nop
	fblt	%f12, %fzero, fbgt_else.32749

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32750

fbgt_else.32749:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32750:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32751

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32753

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32752

bnei_else.32753:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32754:
	nop
	nop
	nop
	j	bnei_cont.32752

bnei_else.32751:
bnei_cont.32752:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32755

	nop
	nop
	nop
	j	bnei_cont.32756

bnei_else.32755:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32756:
	lw	%a0, 2(%sp)
	nop
	fsub	%f0, %f0, %f14
	nop

	flw	%f0, 1(%a0)
	nop
	fdiv	%f11, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32757

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32758

fbgt_else.32757:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32758:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32759

	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f0, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32761

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32762

fbgt_else.32761:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32762:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32763

	fsw	%f11, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32760

bnei_else.32763:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32764:
	nop
	nop
	nop
	j	bnei_cont.32760

bnei_else.32759:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32760:
bnei_cont.32748:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32765

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32766

bnei_else.32765:
	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f11, %fzero, fbeq_else.32767

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32768

fbeq_else.32767:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32768:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32769

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32770

bnei_else.32769:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.32771

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32772

fbgt_else.32771:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32772:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32773

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32775

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32774

bnei_else.32775:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32776:
	nop
	nop
	nop
	j	bnei_cont.32774

bnei_else.32773:
bnei_cont.32774:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32777

	nop
	nop
	nop
	j	bnei_cont.32778

bnei_else.32777:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32778:
	lw	%a0, 2(%sp)
	nop
	fsub	%f0, %f0, %f15
	nop

	flw	%f0, 2(%a0)
	nop
	fdiv	%f13, %f0, %f11
	nop

	nop
	nop
	fmul	%f0, %f13, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	flw	%f0, 2(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32779

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32780

fbgt_else.32779:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32780:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32781

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32783

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32784

fbgt_else.32783:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32784:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32785

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32782

bnei_else.32785:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32786:
	nop
	nop
	nop
	j	bnei_cont.32782

bnei_else.32781:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32782:
bnei_cont.32770:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32787

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.32788

bnei_else.32787:
	lw	%a0, 2(%sp)
	nop
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.32789

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.32790

fbeq_else.32789:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.32790:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32791

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32792

bnei_else.32791:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.32793

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32794

fbgt_else.32793:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32794:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32795

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32797

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.32796

bnei_else.32797:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.32798:
	nop
	nop
	nop
	j	bnei_cont.32796

bnei_else.32795:
bnei_cont.32796:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32799

	nop
	nop
	nop
	j	bnei_cont.32800

bnei_else.32799:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32800:
	nop
	nop
	fsub	%f0, %f0, %f16
	nop

	nop
	nop
	fdiv	%f13, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f13, %f12
	nop

	nop
	nop
	fadd	%f0, %f0, %f14
	nop

	flw	%f0, 0(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32801

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32802

fbgt_else.32801:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32802:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32803

	nop
	nop
	fmul	%f0, %f13, %f11
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	flw	%f0, 1(%a1)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32805

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32806

fbgt_else.32805:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32806:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32807

	fsw	%f13, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.32804

bnei_else.32807:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32808:
	nop
	nop
	nop
	j	bnei_cont.32804

bnei_else.32803:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32804:
bnei_cont.32792:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32809

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.32810

bnei_else.32809:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.32810:
bnei_cont.32788:
bnei_cont.32766:
bnei_cont.32720:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.32718

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32813

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.32814

fbgt_else.32813:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.32814:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.32718

	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 2(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 3(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 4(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 5(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 6(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32718

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7

	lw	%a0, 2(%sp)
	nop
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -5
	j	bnei_cont.32718

bnei_else.32827:
bnei_cont.32828:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32825:
bnei_cont.32826:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32823:
bnei_cont.32824:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32821:
bnei_cont.32822:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32819:
bnei_cont.32820:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32817:
bnei_cont.32818:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32815:
bnei_cont.32816:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32811:
bnei_cont.32812:
	nop
	nop
	nop
	j	bnei_cont.32718

bnei_else.32717:
	lw	%a0, 1(%s7)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.32829

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 2(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32830

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 3(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32830

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 4(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32830

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 5(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32830

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	lw	%a0, 6(%s7)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.32830

	lw	%v1, 83(%a0)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 7

	lw	%a0, 2(%sp)
	nop
	addi	%v1, %s7, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	solve_one_or_network.2926

	nop
	nop
	addi	%sp, %sp, -5
	j	bnei_cont.32830

bnei_else.32839:
bnei_cont.32840:
	nop
	nop
	nop
	j	bnei_cont.32830

bnei_else.32837:
bnei_cont.32838:
	nop
	nop
	nop
	j	bnei_cont.32830

bnei_else.32835:
bnei_cont.32836:
	nop
	nop
	nop
	j	bnei_cont.32830

bnei_else.32833:
bnei_cont.32834:
	nop
	nop
	nop
	j	bnei_cont.32830

bnei_else.32831:
bnei_cont.32832:
	nop
	nop
	nop
	j	bnei_cont.32830

bnei_else.32829:
bnei_cont.32830:
bnei_cont.32718:
	lw	%a0, 4(%sp)
	lw	%ra, 3(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%v0, %a0, 1
	j	trace_or_matrix.2930

bnei_else.32716:
	lw	%ra, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32605:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2936:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %a0

	lw	%fp, 1(%s2)
	lw	%a1, 0(%s2)
	add	%s3, %zero, %ra
	add	%at, %v1, %s1

	lw	%s4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%s4, -1, bnei_else.33035

	lw	%a0, 12(%s4)
	nop
	add	%at, %fp, %s4
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%k0, 4(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%fp, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.33036

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.33038

	flw	%f12, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.33040

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33041

fbeq_else.33040:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33041:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33042

	nop
	nop
	add	%s5, %zero, %zero
	j	bnei_cont.33037

bnei_else.33042:
	flw	%f0, 1(%fp)
	nop
	nop
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%fp)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33044

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33045

fbgt_else.33044:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33045:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33046

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33048

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.33049

bnei_else.33048:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%fp)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.33049:
	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.33037

bnei_else.33046:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.33047:
bnei_cont.33043:
	nop
	nop
	nop
	j	bnei_cont.33037

bnei_else.33038:
	flw	%f1, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33050

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33051

fbgt_else.33050:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33051:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33052

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
	add	%s5, %zero, %k1
	j	bnei_cont.33037

bnei_else.33052:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.33053:
bnei_cont.33039:
	nop
	nop
	nop
	j	bnei_cont.33037

bnei_else.33036:
	flw	%f0, 0(%fp)
	flw	%f17, 1(%fp)
	nop
	nop

	flw	%f14, 1(%a1)
	flw	%f12, 1(%k0)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33054

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33055

fbgt_else.33054:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33055:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33056

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33058

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33059

fbgt_else.33058:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33059:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33060

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.33062

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33063

fbeq_else.33062:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33063:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33064

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33057

bnei_else.33064:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33065:
	nop
	nop
	nop
	j	bnei_cont.33057

bnei_else.33060:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33061:
	nop
	nop
	nop
	j	bnei_cont.33057

bnei_else.33056:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33057:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33066

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%s5, %zero, %k1
	j	bnei_cont.33067

bnei_else.33066:
	flw	%f0, 2(%fp)
	flw	%f19, 3(%fp)
	nop
	nop

	flw	%f18, 0(%a1)
	flw	%f17, 0(%k0)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33068

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33069

fbgt_else.33068:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33069:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33070

	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f16, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%k0)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33072

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33073

fbgt_else.33072:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33073:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33074

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.33076

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33077

fbeq_else.33076:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33077:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33078

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33071

bnei_else.33078:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33079:
	nop
	nop
	nop
	j	bnei_cont.33071

bnei_else.33074:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33075:
	nop
	nop
	nop
	j	bnei_cont.33071

bnei_else.33070:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33071:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33080

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s5, %zero, 2
	j	bnei_cont.33081

bnei_else.33080:
	flw	%f0, 4(%fp)
	nop
	nop
	nop

	flw	%f13, 5(%fp)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33082

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33083

fbgt_else.33082:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33083:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33084

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33086

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33087

fbgt_else.33086:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33087:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33088

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.33090

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33091

fbeq_else.33090:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33091:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33092

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33085

bnei_else.33092:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33093:
	nop
	nop
	nop
	j	bnei_cont.33085

bnei_else.33088:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33089:
	nop
	nop
	nop
	j	bnei_cont.33085

bnei_else.33084:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33085:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33094

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%s5, %zero, 3
	j	bnei_cont.33095

bnei_else.33094:
	nop
	nop
	add	%s5, %zero, %zero
	nop

bnei_cont.33095:
bnei_cont.33081:
bnei_cont.33067:
bnei_cont.33037:
	nop
	nop
	nop
	beqi	%s5, 0, bnei_else.33096

	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.33097

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33098

fbgt_else.33097:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33098:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33099

	flw	%f0, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33101

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33102

fbgt_else.33101:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33102:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.33100

	flw	%f0, 0(%a1)
	lw	%a0, 0(%v1)
	fadd	%f17, %f1, %f9
	nop

	flw	%f0, 162(%zero)
	nop
	fmul	%f1, %f0, %f17
	nop

	flw	%f1, 1(%a1)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 163(%zero)
	nop
	fmul	%f11, %f1, %f17
	nop

	flw	%f11, 2(%a1)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 164(%zero)
	nop
	fmul	%f12, %f11, %f17
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33105

	lw	%a2, 12(%a0)
	nop
	nop
	nop

	lw	%a3, 9(%a2)
	lw	%a1, 6(%a2)
	nop
	nop

	lw	%a0, 5(%a2)
	lw	%k0, 4(%a2)
	nop
	nop

	lw	%fp, 3(%a2)
	lw	%a2, 1(%a2)
	nop
	nop

	flw	%f11, 0(%a0)
	nop
	nop
	nop

	flw	%f11, 1(%a0)
	nop
	fsub	%f14, %f0, %f11
	nop

	flw	%f11, 2(%a0)
	nop
	fsub	%f15, %f1, %f11
	nop

	nop
	nop
	fsub	%f16, %f2, %f11
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33107

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33109

	flw	%f11, 0(%k0)
	nop
	fmul	%f12, %f14, %f14
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f13, %f12, %f11
	fmul	%f12, %f15, %f15

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f16, %f16

	flw	%f11, 2(%k0)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	nop

	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.33111

	flw	%f12, 0(%a3)
	nop
	fmul	%f13, %f15, %f16
	nop

	nop
	nop
	fmul	%f12, %f13, %f12
	nop

	flw	%f11, 1(%a3)
	nop
	fadd	%f13, %f11, %f12
	fmul	%f12, %f16, %f14

	nop
	nop
	fmul	%f11, %f12, %f11
	fmul	%f12, %f14, %f15

	flw	%f11, 2(%a3)
	nop
	fadd	%f13, %f13, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f11, %f13, %f11
	j	bnei_cont.33112

bnei_else.33111:
bnei_cont.33112:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33113

	nop
	nop
	nop
	j	bnei_cont.33114

bnei_else.33113:
	nop
	nop
	fsub	%f11, %f11, %f30
	nop

bnei_cont.33114:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33115

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33116

fbgt_else.33115:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33116:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33117

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33119

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33118

bnei_else.33119:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33120:
	nop
	nop
	nop
	j	bnei_cont.33118

bnei_else.33117:
bnei_cont.33118:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33121

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33108

bnei_else.33121:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33122:
	nop
	nop
	nop
	j	bnei_cont.33108

bnei_else.33109:
	flw	%f11, 0(%k0)
	nop
	nop
	nop

	flw	%f11, 1(%k0)
	nop
	fmul	%f12, %f11, %f14
	nop

	nop
	nop
	fmul	%f11, %f11, %f15
	nop

	flw	%f11, 2(%k0)
	nop
	fadd	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f16
	nop

	nop
	nop
	fadd	%f11, %f12, %f11
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.33123

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33124

fbgt_else.33123:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33124:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33125

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33127

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33126

bnei_else.33127:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33128:
	nop
	nop
	nop
	j	bnei_cont.33126

bnei_else.33125:
bnei_cont.33126:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33129

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33108

bnei_else.33129:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33130:
bnei_cont.33110:
	nop
	nop
	nop
	j	bnei_cont.33108

bnei_else.33107:
	flw	%f11, 0(%k0)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33131

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33132

fbgt_else.33131:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33132:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33133

	flw	%f11, 1(%k0)
	nop
	fabs	%f12, %f15
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33135

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33136

fbgt_else.33135:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33136:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33137

	flw	%f11, 2(%k0)
	nop
	fabs	%f12, %f16
	nop

	nop
	nop
	nop
	fblt	%f12, %f11, fbgt_else.33139

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33134

fbgt_else.33139:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33140:
	nop
	nop
	nop
	j	bnei_cont.33134

bnei_else.33137:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33138:
	nop
	nop
	nop
	j	bnei_cont.33134

bnei_else.33133:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33134:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33141

	nop
	nop
	nop
	j	bnei_cont.33142

bnei_else.33141:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33143

	nop
	nop
	add	%a1, %zero, %zero
	j	bnei_cont.33144

bnei_else.33143:
	nop
	nop
	add	%a1, %zero, %k1
	nop

bnei_cont.33144:
bnei_cont.33142:
bnei_cont.33108:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33145

	nop
	nop
	add	%v0, %zero, %zero
	j	bnei_cont.33106

bnei_else.33145:
	nop
	nop
	addi	%v0, %k1, 0
	jal	check_all_inside.2907

bnei_cont.33146:
	nop
	nop
	nop
	j	bnei_cont.33106

bnei_else.33105:
	nop
	nop
	add	%v0, %zero, %k1
	nop

bnei_cont.33106:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.33100

	fsw	%f17, 137(%zero)
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

	sw	%s4, 141(%zero)
	nop
	nop
	nop

	sw	%s5, 136(%zero)
	nop
	nop
	j	bnei_cont.33100

bnei_else.33147:
bnei_cont.33148:
	nop
	nop
	nop
	j	bnei_cont.33100

bnei_else.33103:
bnei_cont.33104:
	nop
	nop
	nop
	j	bnei_cont.33100

bnei_else.33099:
bnei_cont.33100:
	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.33096:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33149

	nop
	nop
	addi	%v0, %s1, 1
	add	%ra, %zero, %s3

	nop
	nop
	addi	%a0, %s2, 0
	j	solve_each_element_fast.2936

bnei_else.33149:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33035:
	nop
	nop
	add	%ra, %zero, %s3
	nop

	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2940:
	nop
	nop
	add	%s6, %zero, %v0
	add	%s7, %zero, %v1

	nop
	nop
	add	%t7, %zero, %a0
	add	%t8, %zero, %ra

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33197

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33198

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33199

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33200

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33201

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33202

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33203

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%s6, %s6, 1
	nop

	nop
	nop
	add	%at, %s7, %s6
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33204

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t7, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %s6, 1
	add	%ra, %zero, %t8

	nop
	nop
	addi	%a0, %t7, 0
	addi	%v1, %s7, 0

	nop
	nop
	nop
	j	solve_one_or_network_fast.2940

bnei_else.33204:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33203:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33202:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33201:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33200:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33199:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33198:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33197:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2944:
	sw	%v0, 0(%sp)
	nop
	add	%t9, %zero, %a0
	add	%at, %v1, %v0

	sw	%v1, 1(%sp)
	lw	%s6, 0(%at)
	nop
	nop

	sw	%ra, 2(%sp)
	lw	%s0, 0(%s6)
	nop
	nop

	nop
	nop
	nop
	beqi	%s0, -1, bnei_else.33636

	nop
	nop
	nop
	beqi	%s0, 99, bnei_else.33637

	lw	%a0, 12(%s0)
	lw	%k0, 0(%t9)
	nop
	nop

	lw	%a3, 10(%a0)
	lw	%a2, 6(%a0)
	nop
	nop

	lw	%fp, 4(%a0)
	lw	%a1, 1(%a0)
	nop
	nop

	flw	%f15, 0(%a3)
	flw	%f11, 1(%a3)
	nop
	nop

	flw	%f13, 2(%a3)
	lw	%a0, 1(%t9)
	nop
	nop

	nop
	nop
	add	%at, %a0, %s0
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.33639

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33641

	flw	%f12, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f12, %fzero, fbeq_else.33643

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33644

fbeq_else.33643:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33644:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33645

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33640

bnei_else.33645:
	flw	%f0, 1(%ra)
	nop
	nop
	nop

	flw	%f0, 2(%ra)
	nop
	fmul	%f1, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 3(%ra)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 3(%a3)
	nop
	fadd	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f11, %f11
	fmul	%f0, %f12, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.33647

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33648

fbgt_else.33647:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33648:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33649

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33651

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	j	bnei_cont.33652

bnei_else.33651:
	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f0, 4(%ra)
	nop
	fsub	%f1, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.33652:
	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33640

bnei_else.33649:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33650:
bnei_cont.33646:
	nop
	nop
	nop
	j	bnei_cont.33640

bnei_else.33641:
	flw	%f1, 0(%ra)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.33653

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33654

fbgt_else.33653:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33654:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33655

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
	j	bnei_cont.33640

bnei_else.33655:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33656:
bnei_cont.33642:
	nop
	nop
	nop
	j	bnei_cont.33640

bnei_else.33639:
	flw	%f0, 0(%ra)
	flw	%f17, 1(%ra)
	nop
	nop

	flw	%f14, 1(%k0)
	flw	%f12, 1(%fp)
	fsub	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f16, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f16, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33657

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33658

fbgt_else.33657:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33658:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33659

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
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33661

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33662

fbgt_else.33661:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33662:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33663

	nop
	nop
	nop
	fbne	%f17, %fzero, fbeq_else.33665

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33666

fbeq_else.33665:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33666:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33667

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33660

bnei_else.33667:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33668:
	nop
	nop
	nop
	j	bnei_cont.33660

bnei_else.33663:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33664:
	nop
	nop
	nop
	j	bnei_cont.33660

bnei_else.33659:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33660:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33669

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	add	%a0, %zero, %k1
	j	bnei_cont.33670

bnei_else.33669:
	flw	%f0, 2(%ra)
	flw	%f19, 3(%ra)
	nop
	nop

	flw	%f18, 0(%k0)
	flw	%f17, 0(%fp)
	fsub	%f0, %f0, %f11
	nop

	nop
	nop
	fmul	%f16, %f0, %f19
	nop

	nop
	nop
	fmul	%f0, %f16, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33671

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33672

fbgt_else.33671:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33672:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33673

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
	fadd	%f0, %f0, %f13
	nop

	flw	%f0, 2(%fp)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33675

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33676

fbgt_else.33675:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33676:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33677

	nop
	nop
	nop
	fbne	%f19, %fzero, fbeq_else.33679

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33680

fbeq_else.33679:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33680:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33681

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33674

bnei_else.33681:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33682:
	nop
	nop
	nop
	j	bnei_cont.33674

bnei_else.33677:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33678:
	nop
	nop
	nop
	j	bnei_cont.33674

bnei_else.33673:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33674:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33683

	fsw	%f16, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	j	bnei_cont.33684

bnei_else.33683:
	flw	%f0, 4(%ra)
	nop
	nop
	nop

	flw	%f13, 5(%ra)
	nop
	fsub	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f1, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f1, %f18
	nop

	nop
	nop
	fadd	%f0, %f0, %f15
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f17, fbgt_else.33685

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33686

fbgt_else.33685:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33686:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33687

	nop
	nop
	fmul	%f0, %f1, %f14
	nop

	nop
	nop
	fadd	%f0, %f0, %f11
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33689

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33690

fbgt_else.33689:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33690:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33691

	nop
	nop
	nop
	fbne	%f13, %fzero, fbeq_else.33693

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.33694

fbeq_else.33693:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.33694:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33695

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.33688

bnei_else.33695:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33696:
	nop
	nop
	nop
	j	bnei_cont.33688

bnei_else.33691:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33692:
	nop
	nop
	nop
	j	bnei_cont.33688

bnei_else.33687:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33688:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33697

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	j	bnei_cont.33698

bnei_else.33697:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.33698:
bnei_cont.33684:
bnei_cont.33670:
bnei_cont.33640:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.33638

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33701

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33702

fbgt_else.33701:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33702:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.33638

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33638

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.33638

bnei_else.33717:
bnei_cont.33718:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33715:
bnei_cont.33716:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33713:
bnei_cont.33714:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33711:
bnei_cont.33712:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33709:
bnei_cont.33710:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33707:
bnei_cont.33708:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33705:
bnei_cont.33706:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33703:
bnei_cont.33704:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33699:
bnei_cont.33700:
	nop
	nop
	nop
	j	bnei_cont.33638

bnei_else.33637:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33719

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	lw	%a0, 7(%s6)
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33720

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 3
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -3
	j	bnei_cont.33720

bnei_else.33731:
bnei_cont.33732:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33729:
bnei_cont.33730:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33727:
bnei_cont.33728:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33725:
bnei_cont.33726:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33723:
bnei_cont.33724:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33721:
bnei_cont.33722:
	nop
	nop
	nop
	j	bnei_cont.33720

bnei_else.33719:
bnei_cont.33720:
bnei_cont.33638:
	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %a0, 1
	nop

	sw	%a1, 3(%sp)
	nop
	nop
	nop

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%s6, 0(%at)
	nop
	nop
	nop

	lw	%v0, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.33733

	nop
	nop
	nop
	beqi	%v0, 99, bnei_else.33734

	nop
	nop
	addi	%v1, %t9, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	solver_fast2.2865

	nop
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.33735

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33738

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33739

fbgt_else.33738:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33739:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.33735

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33735

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.33735

bnei_else.33752:
bnei_cont.33753:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33750:
bnei_cont.33751:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33748:
bnei_cont.33749:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33746:
bnei_cont.33747:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33744:
bnei_cont.33745:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33742:
bnei_cont.33743:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33740:
bnei_cont.33741:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33736:
bnei_cont.33737:
	nop
	nop
	nop
	j	bnei_cont.33735

bnei_else.33734:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.33754

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33755

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33755

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33755

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 5(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33755

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	lw	%a0, 6(%s6)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.33755

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t9, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 7
	addi	%a0, %t9, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.33755

bnei_else.33764:
bnei_cont.33765:
	nop
	nop
	nop
	j	bnei_cont.33755

bnei_else.33762:
bnei_cont.33763:
	nop
	nop
	nop
	j	bnei_cont.33755

bnei_else.33760:
bnei_cont.33761:
	nop
	nop
	nop
	j	bnei_cont.33755

bnei_else.33758:
bnei_cont.33759:
	nop
	nop
	nop
	j	bnei_cont.33755

bnei_else.33756:
bnei_cont.33757:
	nop
	nop
	nop
	j	bnei_cont.33755

bnei_else.33754:
bnei_cont.33755:
bnei_cont.33735:
	lw	%a0, 3(%sp)
	lw	%ra, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%v0, %a0, 1
	addi	%a0, %t9, 0

	nop
	nop
	nop
	j	trace_or_matrix_fast.2944

bnei_else.33733:
	lw	%ra, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33636:
	nop
	nop
	nop
	jr	%ra

utexture.2959:
	lw	%a0, 8(%v0)
	lw	%a3, 5(%v0)
	nop
	nop

	lw	%a1, 4(%v0)
	lw	%a2, 0(%v0)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 145(%zero)
	flw	%f0, 1(%a0)
	nop
	nop

	fsw	%f0, 146(%zero)
	flw	%f0, 2(%a0)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33897

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33898

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33899

	nop
	nop
	nop
	beqi	%a2, 4, bnei_else.33900

	nop
	nop
	nop
	jr	%ra

bnei_else.33900:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f0, 0(%a1)
	flw	%f11, 456(%zero)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fmul	%f14, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f13, %f1, %f0
	fmul	%f1, %f14, %f14

	nop
	nop
	fmul	%f0, %f13, %f13
	nop

	nop
	nop
	fadd	%f12, %f1, %f0
	fabs	%f0, %f14

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33902

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33903

fbgt_else.33902:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33903:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33904

	flw	%f1, 455(%zero)
	nop
	nop
	j	bnei_cont.33905

bnei_else.33904:
	nop
	nop
	fdiv	%f0, %f13, %f14
	nop

	nop
	nop
	fabs	%f15, %f0
	nop

	nop
	nop
	nop
	fblt	%f15, %fzero, fbgt_else.33906

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.33907

fbgt_else.33906:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.33907:
	flw	%f0, 481(%zero)
	nop
	fabs	%f14, %f15
	nop

	nop
	nop
	nop
	fblt	%f14, %f0, fbgt_else.33908

	flw	%f0, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f14, %f0, fbgt_else.33910

	flw	%f13, 471(%zero)
	flw	%f0, 480(%zero)
	fdiv	%f16, %f30, %f14
	nop

	nop
	nop
	fmul	%f17, %f16, %f16
	fmul	%f0, %f0, %f16

	nop
	nop
	fmul	%f15, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 479(%zero)
	nop
	fmul	%f14, %f15, %f15
	fsub	%f1, %f16, %f0

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f13, %f0
	j	fbgt_cont.33911

fbgt_else.33910:
	flw	%f13, 473(%zero)
	nop
	fsub	%f1, %f14, %f30
	fadd	%f0, %f14, %f30

	flw	%f0, 480(%zero)
	nop
	fdiv	%f16, %f1, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f16
	fmul	%f0, %f0, %f16

	nop
	nop
	fmul	%f15, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 479(%zero)
	nop
	fmul	%f14, %f15, %f15
	fsub	%f1, %f16, %f0

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f13, %f0
	nop

fbgt_cont.33911:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33912

	nop
	nop
	nop
	j	fbgt_cont.33909

bnei_else.33912:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33913:
	nop
	nop
	nop
	j	fbgt_cont.33909

fbgt_else.33908:
	flw	%f0, 480(%zero)
	nop
	fmul	%f16, %f15, %f15
	nop

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f0, %f0, %f16

	flw	%f0, 479(%zero)
	nop
	fsub	%f1, %f15, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.33909:
	flw	%f1, 454(%zero)
	nop
	nop
	nop

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.33905:
	nop
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 1(%v1)
	flw	%f0, 1(%a3)
	fsub	%f13, %f1, %f0
	nop

	flw	%f0, 1(%a1)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	fabs	%f0, %f12

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33914

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33915

fbgt_else.33914:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33915:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33916

	flw	%f1, 455(%zero)
	nop
	nop
	j	bnei_cont.33917

bnei_else.33916:
	nop
	nop
	fdiv	%f0, %f1, %f12
	nop

	nop
	nop
	fabs	%f14, %f0
	nop

	nop
	nop
	nop
	fblt	%f14, %fzero, fbgt_else.33918

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.33919

fbgt_else.33918:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.33919:
	flw	%f0, 481(%zero)
	nop
	fabs	%f12, %f14
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.33920

	flw	%f0, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f12, %f0, fbgt_else.33922

	flw	%f11, 471(%zero)
	flw	%f0, 480(%zero)
	fdiv	%f15, %f30, %f12
	nop

	nop
	nop
	fmul	%f16, %f15, %f15
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 479(%zero)
	nop
	fmul	%f12, %f14, %f14
	fsub	%f1, %f15, %f0

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.33923

fbgt_else.33922:
	flw	%f11, 473(%zero)
	nop
	fsub	%f1, %f12, %f30
	fadd	%f0, %f12, %f30

	flw	%f0, 480(%zero)
	nop
	fdiv	%f15, %f1, %f0
	nop

	nop
	nop
	fmul	%f16, %f15, %f15
	fmul	%f0, %f0, %f15

	nop
	nop
	fmul	%f14, %f16, %f16
	fmul	%f0, %f0, %f16

	flw	%f0, 479(%zero)
	nop
	fmul	%f12, %f14, %f14
	fsub	%f1, %f15, %f0

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f16
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

fbgt_cont.33923:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33924

	nop
	nop
	nop
	j	fbgt_cont.33921

bnei_else.33924:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33925:
	nop
	nop
	nop
	j	fbgt_cont.33921

fbgt_else.33920:
	flw	%f0, 480(%zero)
	nop
	fmul	%f15, %f14, %f14
	nop

	nop
	nop
	fmul	%f12, %f15, %f15
	fmul	%f0, %f0, %f14

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f15

	flw	%f0, 479(%zero)
	nop
	fsub	%f1, %f14, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 478(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 477(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 476(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f15
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 475(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.33921:
	flw	%f1, 454(%zero)
	nop
	nop
	nop

	flw	%f0, 453(%zero)
	nop
	fmul	%f1, %f0, %f1
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

bnei_cont.33917:
	flw	%f11, 465(%zero)
	nop
	floor	%f0, %f1
	nop

	flw	%f1, 452(%zero)
	nop
	fsub	%f12, %f1, %f0
	fsub	%f0, %f11, %f13

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	fsub	%f0, %f11, %f12

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
	fblt	%f0, %fzero, fbgt_else.33926

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33927

fbgt_else.33926:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33927:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33928

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.33929

bnei_else.33928:
bnei_cont.33929:
	flw	%f1, 451(%zero)
	nop
	nop
	nop

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

bnei_else.33899:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	fsub	%f11, %f1, %f0
	nop

	flw	%f12, 470(%zero)
	nop
	fsub	%f0, %f1, %f0
	fmul	%f1, %f11, %f11

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

	flw	%f1, 469(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33931

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33932

fbgt_else.33931:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33932:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33933

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.33934

fbgt_else.33933:
fbgt_cont.33934:
	flw	%f11, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33935

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33937

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33936

bnei_else.33937:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33938:
	nop
	nop
	nop
	j	fbgt_cont.33936

fbgt_else.33935:
fbgt_cont.33936:
	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33939

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.33940

fbgt_else.33939:
fbgt_cont.33940:
	flw	%f1, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33941

	flw	%f0, 465(%zero)
	nop
	fmul	%f12, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.33942

fbgt_else.33941:
	flw	%f0, 468(%zero)
	nop
	fsub	%f13, %f11, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f0, %f0, %f13

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 467(%zero)
	nop
	fsub	%f1, %f13, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 466(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.33942:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33943

	nop
	nop
	nop
	j	bnei_cont.33944

bnei_else.33943:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33944:
	flw	%f1, 451(%zero)
	nop
	fmul	%f11, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f1
	nop

	fsw	%f0, 146(%zero)
	nop
	fsub	%f0, %f30, %f11
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	jr	%ra

bnei_else.33898:
	flw	%f1, 1(%v1)
	flw	%f0, 448(%zero)
	nop
	nop

	flw	%f12, 470(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %fzero, fbgt_else.33946

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.33947

fbgt_else.33946:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.33947:
	flw	%f1, 469(%zero)
	nop
	fabs	%f11, %f0
	nop

	nop
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33948

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33950

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33949

bnei_else.33950:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.33951:
	nop
	nop
	nop
	j	fbgt_cont.33949

fbgt_else.33948:
fbgt_cont.33949:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.33952

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.33953

fbgt_else.33952:
fbgt_cont.33953:
	flw	%f11, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33954

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.33955

fbgt_else.33954:
fbgt_cont.33955:
	flw	%f1, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33956

	flw	%f1, 468(%zero)
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 467(%zero)
	nop
	fsub	%f11, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	j	fbgt_cont.33957

fbgt_else.33956:
	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	flw	%f0, 465(%zero)
	nop
	fmul	%f12, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f12, %f12
	fmul	%f0, %f0, %f12

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.33957:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33958

	nop
	nop
	nop
	j	bnei_cont.33959

bnei_else.33958:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33959:
	flw	%f1, 451(%zero)
	nop
	fmul	%f11, %f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f11
	nop

	fsw	%f0, 145(%zero)
	nop
	fsub	%f0, %f30, %f11
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

bnei_else.33897:
	flw	%f1, 0(%v1)
	flw	%f0, 0(%a3)
	nop
	nop

	flw	%f13, 447(%zero)
	flw	%f12, 446(%zero)
	fsub	%f1, %f1, %f0
	nop

	flw	%f11, 449(%zero)
	nop
	fmul	%f0, %f1, %f13
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33961

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.33962

fbgt_else.33961:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.33962:
	flw	%f1, 2(%v1)
	flw	%f0, 2(%a3)
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f13
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f11, fbgt_else.33963

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.33964

fbgt_else.33963:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.33964:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33965

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33967

	flw	%f0, 451(%zero)
	nop
	nop
	j	bnei_cont.33966

bnei_else.33967:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.33968:
	nop
	nop
	nop
	j	bnei_cont.33966

bnei_else.33965:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33969

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.33970

bnei_else.33969:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.33970:
bnei_cont.33966:
	fsw	%f0, 146(%zero)
	nop
	nop
	jr	%ra

trace_reflections.2966:
	sw	%v0, 0(%sp)
	nop
	fmov	%f22, %f0
	fmov	%f23, %f1

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
	blti	%v0, 0, bgti_else.34066

	lw	%a0, 254(%v0)
	flw	%f0, 445(%zero)
	nop
	nop

	flw	%f24, 2(%a0)
	lw	%t0, 1(%a0)
	nop
	nop

	lw	%a0, 0(%a0)
	fsw	%f0, 137(%zero)
	nop
	nop

	sw	%a0, 5(%sp)
	lw	%t1, 134(%zero)
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%sp, %sp, 6

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34067

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34068

fbgt_else.34067:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34068:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34069

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34071

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34070

fbgt_else.34071:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34072:
	nop
	nop
	nop
	j	bnei_cont.34070

bnei_else.34069:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34070:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34073

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%a0, 136(%zero)
	nop
	sll	%a1, %a0, 2
	nop

	lw	%a0, 5(%sp)
	nop
	add	%a1, %a1, %a0
	nop

	nop
	nop
	nop
	bne	%a1, %a0, bnei_cont.34074

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 6
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -6
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34077

	nop
	nop
	nop
	j	bnei_cont.34074

bnei_else.34077:
	lw	%a0, 0(%t0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f14, 0(%a0)
	flw	%f13, 1(%a0)
	nop
	nop

	flw	%f0, 143(%zero)
	flw	%f11, 2(%a0)
	fmul	%f1, %f0, %f14
	nop

	lw	%a0, 1(%sp)
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 144(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f24, %f22

	flw	%f0, 0(%a0)
	nop
	fmul	%f12, %f0, %f1
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f11, %f24, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.34079

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34080

fbgt_else.34079:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34080:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34081

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f12, %f0
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
	fmul	%f0, %f12, %f0
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
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.34082

bnei_else.34081:
bnei_cont.34082:
	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.34083

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34084

fbgt_else.34083:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34084:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.34074

	nop
	nop
	fmul	%f0, %f11, %f11
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	flw	%f0, 151(%zero)
	nop
	fmul	%f1, %f0, %f23
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
	j	bnei_cont.34074

bnei_else.34085:
bnei_cont.34086:
bnei_cont.34078:
	nop
	nop
	nop
	j	bnei_cont.34074

beq_else.34075:
beq_cont.34076:
	nop
	nop
	nop
	j	bnei_cont.34074

bnei_else.34073:
bnei_cont.34074:
	lw	%a0, 0(%sp)
	lw	%t1, 2(%sp)
	fmov	%f1, %f23
	fmov	%f0, %f22

	lw	%t0, 3(%sp)
	lw	%ra, 4(%sp)
	addi	%v0, %a0, -1
	nop

	lw	%v1, 1(%sp)
	nop
	nop
	j	trace_reflections.2966

bgti_else.34066:
	nop
	nop
	nop
	jr	%ra

trace_ray.2971:
	fsw	%f1, 0(%sp)
	nop
	fmov	%f25, %f0
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

	sw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.34335

	lw	%a2, 7(%a0)
	flw	%f0, 445(%zero)
	nop
	nop

	sw	%a2, 5(%sp)
	lw	%a2, 4(%a0)
	nop
	nop

	sw	%a2, 6(%sp)
	lw	%a2, 3(%a0)
	nop
	nop

	sw	%a2, 7(%sp)
	lw	%a2, 2(%a0)
	nop
	nop

	sw	%a2, 8(%sp)
	lw	%a0, 1(%a0)
	nop
	nop

	sw	%a0, 9(%sp)
	fsw	%f0, 137(%zero)
	addi	%a0, %a1, 0
	nop

	lw	%v1, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	sw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 11
	jal	trace_or_matrix.2930

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -11
	nop

	fsw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34336

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34337

fbgt_else.34336:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34337:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34338

	flw	%f1, 444(%zero)
	flw	%f0, 11(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34340

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34339

fbgt_else.34340:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34341:
	nop
	nop
	nop
	j	bnei_cont.34339

bnei_else.34338:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34339:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34342

	lw	%k0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%k0)
	nop
	nop
	nop

	lw	%a2, 9(%v0)
	lw	%fp, 7(%v0)
	nop
	nop

	lw	%ra, 6(%v0)
	lw	%a1, 5(%v0)
	nop
	nop

	lw	%s0, 4(%v0)
	lw	%a3, 3(%v0)
	nop
	nop

	lw	%a0, 2(%v0)
	flw	%f26, 0(%fp)
	nop
	nop

	sw	%a0, 12(%sp)
	lw	%a0, 1(%v0)
	fmul	%f22, %f26, %f25
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.34343

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34345

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a1)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a1)
	fsub	%f13, %f1, %f0
	nop

	flw	%f0, 0(%s0)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%s0)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%s0)
	nop
	fmul	%f17, %f13, %f0
	nop

	nop
	nop
	fmul	%f15, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34347

	flw	%f11, 2(%a2)
	flw	%f12, 1(%a2)
	nop
	nop

	flw	%f18, 465(%zero)
	nop
	fmul	%f1, %f13, %f11
	fmul	%f0, %f16, %f12

	flw	%f11, 0(%a2)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f12

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f13, %f11
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
	fadd	%f0, %f15, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.34348

bnei_else.34347:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f17, 143(%zero)
	nop
	nop
	nop

	fsw	%f15, 144(%zero)
	nop
	nop
	nop

bnei_cont.34348:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.34349

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34350

fbeq_else.34349:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34350:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34351

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34352

bnei_else.34351:
	nop
	nop
	nop
	beqi	%ra, 0, bnei_else.34353

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34354

bnei_else.34353:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.34354:
bnei_cont.34352:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.34344

bnei_else.34345:
	flw	%f0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%s0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%s0)
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

bnei_cont.34346:
	nop
	nop
	nop
	j	bnei_cont.34344

bnei_else.34343:
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
	fbne	%f0, %fzero, fbeq_else.34355

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34356

fbeq_else.34355:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34356:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34357

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34358

bnei_else.34357:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.34359

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34360

fbgt_else.34359:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34360:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34361

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34362

bnei_else.34361:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.34362:
bnei_cont.34358:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.34344:
	flw	%f23, 138(%zero)
	nop
	addi	%sp, %sp, 13
	nop

	fsw	%f23, 159(%zero)
	nop
	nop
	nop

	flw	%f24, 139(%zero)
	nop
	nop
	nop

	fsw	%f24, 160(%zero)
	nop
	nop
	nop

	flw	%f27, 140(%zero)
	nop
	nop
	nop

	fsw	%f27, 161(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 138
	jal	utexture.2959

	lw	%a0, 136(%zero)
	flw	%f0, 465(%zero)
	addi	%sp, %sp, -13
	sll	%a1, %k0, 2

	lw	%a0, 8(%sp)
	lw	%a1, 1(%sp)
	add	%a2, %a1, %a0
	nop

	lw	%a0, 9(%sp)
	nop
	add	%at, %a0, %a1
	nop

	sw	%a2, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	fsw	%f23, 0(%a0)
	nop
	nop
	nop

	fsw	%f24, 1(%a0)
	nop
	nop
	nop

	fsw	%f27, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f26, %f0, fbgt_else.34363

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34364

fbgt_else.34363:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34364:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34365

	lw	%a1, 7(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	sw	%zero, 0(%at)
	nop
	nop
	j	bnei_cont.34366

bnei_else.34365:
	lw	%a0, 7(%sp)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a0, 6(%sp)
	flw	%f0, 145(%zero)
	add	%at, %a0, %a1
	nop

	sw	%k1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
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
	fmul	%f1, %f0, %f22
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

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a1
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

bnei_cont.34366:
	flw	%f14, 442(%zero)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	flw	%f13, 0(%a0)
	flw	%f3, 142(%zero)
	nop
	nop

	flw	%f12, 1(%a0)
	flw	%f29, 143(%zero)
	fmul	%f1, %f13, %f3
	nop

	flw	%f11, 2(%a0)
	flw	%f28, 144(%zero)
	fmul	%f0, %f12, %f29
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f28

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f14, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f3
	nop

	nop
	nop
	fadd	%f0, %f13, %f0
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f1, %f29
	nop

	nop
	nop
	fadd	%f0, %f12, %f0
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f1, %f28
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 2(%a0)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f25, %f0
	nop

	fsw	%f0, 13(%sp)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	addi	%sp, %sp, 14
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34367

	nop
	nop
	nop
	j	bnei_cont.34368

bnei_else.34367:
	flw	%f14, 78(%zero)
	flw	%f13, 79(%zero)
	nop
	nop

	flw	%f12, 80(%zero)
	lw	%a0, 2(%sp)
	fmul	%f1, %f3, %f14
	fmul	%f0, %f29, %f13

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f28, %f12

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
	fmul	%f11, %f0, %f22
	nop

	flw	%f0, 1(%a0)
	nop
	fmul	%f1, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fneg	%f12, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f11, fbgt_else.34369

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34370

fbgt_else.34369:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34370:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34371

	flw	%f1, 151(%zero)
	flw	%f0, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.34372

bnei_else.34371:
bnei_cont.34372:
	nop
	nop
	nop
	fblt	%fzero, %f12, fbgt_else.34373

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34374

fbgt_else.34373:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34374:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34375

	nop
	nop
	fmul	%f0, %f12, %f12
	nop

	flw	%f0, 13(%sp)
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
	j	bnei_cont.34376

bnei_else.34375:
bnei_cont.34376:
bnei_cont.34368:
	fsw	%f23, 162(%zero)
	nop
	addi	%sp, %sp, 14
	nop

	fsw	%f24, 163(%zero)
	nop
	nop
	nop

	fsw	%f27, 164(%zero)
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
	jal	setup_startp_constants.2882

	lw	%a0, 434(%zero)
	nop
	addi	%sp, %sp, -14
	fmov	%f0, %f22

	flw	%f1, 13(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %a0, -1
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	trace_reflections.2966

	flw	%f0, 441(%zero)
	nop
	addi	%sp, %sp, -14
	nop

	nop
	nop
	nop
	fblt	%f0, %f25, fbgt_else.34377

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34378

fbgt_else.34377:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34378:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34379

	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 4, bgti_else.34380

	nop
	nop
	nop
	j	bgti_cont.34381

bgti_else.34380:
	lw	%a0, 8(%sp)
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

bgti_cont.34381:
	lw	%a0, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34382

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34382:
	lw	%a0, 1(%sp)
	flw	%f11, 0(%sp)
	fsub	%f0, %f30, %f26
	nop

	flw	%f1, 11(%sp)
	lw	%ra, 4(%sp)
	fmul	%f0, %f25, %f0
	addi	%v0, %a0, 1

	lw	%a0, 3(%sp)
	lw	%v1, 2(%sp)
	fadd	%f1, %f11, %f1
	j	trace_ray.2971

bnei_else.34379:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34342:
	lw	%a1, 8(%sp)
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
	beqi	%a0, 0, bnei_else.34385

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
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.34386

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34387

fbgt_else.34386:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34387:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34388

	lw	%ra, 4(%sp)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f0, 81(%zero)
	nop
	fmul	%f1, %f0, %f25
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

bnei_else.34388:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34385:
	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.34335:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2977:
	flw	%f0, 445(%zero)
	nop
	fmov	%f22, %f0
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
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34522

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34523

fbgt_else.34522:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34523:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34524

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34526

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.34525

fbgt_else.34526:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34527:
	nop
	nop
	nop
	j	bnei_cont.34525

bnei_else.34524:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.34525:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34528

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%ra, 0(%a0)
	lw	%a1, 9(%v0)
	nop
	nop

	lw	%t9, 7(%v0)
	lw	%a3, 6(%v0)
	nop
	nop

	lw	%a0, 5(%v0)
	lw	%fp, 4(%v0)
	nop
	nop

	lw	%a2, 3(%v0)
	lw	%k0, 1(%v0)
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.34529

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.34531

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.34533

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.34534

bnei_else.34533:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.34534:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.34535

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34536

fbeq_else.34535:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34536:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34537

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34538

bnei_else.34537:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34539

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.34540

bnei_else.34539:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.34540:
bnei_cont.34538:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.34530

bnei_else.34531:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.34532:
	nop
	nop
	nop
	j	bnei_cont.34530

bnei_else.34529:
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
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.34541

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.34542

fbeq_else.34541:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.34542:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34543

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.34544

bnei_else.34543:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.34545

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34546

fbgt_else.34545:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34546:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34547

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.34548

bnei_else.34547:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.34548:
bnei_cont.34544:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.34530:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 3

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -3
	addi	%v0, %zero, 0

	lw	%v1, 2(%sp)
	nop
	addi	%sp, %sp, 3
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -3
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34549

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.34549:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.34551

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.34552

fbgt_else.34551:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.34552:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34553

	nop
	nop
	nop
	j	bnei_cont.34554

bnei_else.34553:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.34554:
	flw	%f0, 0(%t9)
	lw	%ra, 1(%sp)
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	jr	%ra

bnei_else.34528:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2980:
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

	sw	%t2, 4(%sp)
	nop
	nop
	nop

	sw	%t1, 5(%sp)
	nop
	nop
	nop

	sw	%t0, 6(%sp)
	nop
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.35198

	flw	%f22, 0(%v1)
	flw	%f23, 1(%v1)
	add	%at, %v0, %a1
	nop

	lw	%t1, 0(%at)
	flw	%f24, 2(%v1)
	nop
	nop

	lw	%t0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 0(%t0)
	nop
	nop
	nop

	flw	%f0, 1(%t0)
	nop
	fmul	%f1, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 2(%t0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35199

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35200

fbgt_else.35199:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35200:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35201

	lw	%a0, 3(%sp)
	flw	%f0, 440(%zero)
	nop
	nop

	lw	%a0, 0(%sp)
	flw	%f0, 445(%zero)
	addi	%a1, %a0, 1
	fdiv	%f25, %f1, %f0

	fsw	%f0, 137(%zero)
	nop
	add	%at, %a0, %a1
	nop

	lw	%t0, 0(%at)
	lw	%t1, 134(%zero)
	nop
	nop

	lw	%s6, 0(%t1)
	nop
	nop
	nop

	lw	%v0, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.35203

	nop
	nop
	nop
	beqi	%v0, 99, bnei_else.35205

	nop
	nop
	addi	%v1, %t0, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_fast2.2865

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.35206

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35209

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35210

fbgt_else.35209:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35210:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35206

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35206

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35206

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35206

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35206

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35206

bnei_else.35219:
bnei_cont.35220:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35217:
bnei_cont.35218:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35215:
bnei_cont.35216:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35213:
bnei_cont.35214:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35211:
bnei_cont.35212:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35207:
bnei_cont.35208:
	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35205:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35221

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35222

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35222

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35222

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t0, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t0, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35222

bnei_else.35227:
bnei_cont.35228:
	nop
	nop
	nop
	j	bnei_cont.35222

bnei_else.35225:
bnei_cont.35226:
	nop
	nop
	nop
	j	bnei_cont.35222

bnei_else.35223:
bnei_cont.35224:
	nop
	nop
	nop
	j	bnei_cont.35222

bnei_else.35221:
bnei_cont.35222:
bnei_cont.35206:
	nop
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35204

bnei_else.35203:
bnei_cont.35204:
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35229

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35230

fbgt_else.35229:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35230:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35231

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35233

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35232

fbgt_else.35233:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35234:
	nop
	nop
	nop
	j	bnei_cont.35232

bnei_else.35231:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35232:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35202

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t0)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35237

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35239

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f13, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f12, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f13, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f16, %f12, %f0
	nop

	nop
	nop
	fmul	%f14, %f15, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35241

	flw	%f11, 2(%a1)
	flw	%f18, 1(%a1)
	nop
	nop

	flw	%f17, 465(%zero)
	nop
	fmul	%f1, %f12, %f11
	fmul	%f0, %f15, %f18

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f11

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f18

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f14, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35242

bnei_else.35241:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f16, 143(%zero)
	nop
	nop
	nop

	fsw	%f14, 144(%zero)
	nop
	nop
	nop

bnei_cont.35242:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35243

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35244

fbeq_else.35243:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35244:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35245

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35246

bnei_else.35245:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35247

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35248

bnei_else.35247:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35248:
bnei_cont.35246:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35238

bnei_else.35239:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35240:
	nop
	nop
	nop
	j	bnei_cont.35238

bnei_else.35237:
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
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35249

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35250

fbeq_else.35249:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35250:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35251

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35252

bnei_else.35251:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35253

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35254

fbgt_else.35253:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35254:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35255

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35256

bnei_else.35255:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35256:
bnei_cont.35252:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35238:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35257

	nop
	nop
	nop
	j	bnei_cont.35202

bnei_else.35257:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35259

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35260

fbgt_else.35259:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35260:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35261

	nop
	nop
	nop
	j	bnei_cont.35262

bnei_else.35261:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35262:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35258:
	nop
	nop
	nop
	j	bnei_cont.35202

bnei_else.35235:
bnei_cont.35236:
	nop
	nop
	nop
	j	bnei_cont.35202

bnei_else.35201:
	flw	%f0, 439(%zero)
	nop
	nop
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f25, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	nop
	nop

	lw	%s6, 0(%t2)
	nop
	nop
	nop

	lw	%v0, 0(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.35263

	nop
	nop
	nop
	beqi	%v0, 99, bnei_else.35265

	nop
	nop
	addi	%v1, %t1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	solver_fast2.2865

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_cont.35266

	flw	%f1, 135(%zero)
	flw	%f0, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35269

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35270

fbgt_else.35269:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35270:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35266

	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35266

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35266

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35266

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35266

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35266

bnei_else.35279:
bnei_cont.35280:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35277:
bnei_cont.35278:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35275:
bnei_cont.35276:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35273:
bnei_cont.35274:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35271:
bnei_cont.35272:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35267:
bnei_cont.35268:
	nop
	nop
	nop
	j	bnei_cont.35266

bnei_else.35265:
	lw	%a0, 1(%s6)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.35281

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 2(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35282

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 3(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35282

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	lw	%a0, 4(%s6)
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_cont.35282

	lw	%v1, 83(%a0)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%sp, %sp, 8
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%v0, %zero, 5
	addi	%a0, %t1, 0

	nop
	nop
	addi	%v1, %s6, 0
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35282

bnei_else.35287:
bnei_cont.35288:
	nop
	nop
	nop
	j	bnei_cont.35282

bnei_else.35285:
bnei_cont.35286:
	nop
	nop
	nop
	j	bnei_cont.35282

bnei_else.35283:
bnei_cont.35284:
	nop
	nop
	nop
	j	bnei_cont.35282

bnei_else.35281:
bnei_cont.35282:
bnei_cont.35266:
	nop
	nop
	addi	%a0, %t1, 0
	addi	%v1, %t2, 0

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	addi	%sp, %sp, -8
	j	bnei_cont.35264

bnei_else.35263:
bnei_cont.35264:
	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35289

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35290

fbgt_else.35289:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35290:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35291

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35293

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35292

fbgt_else.35293:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35294:
	nop
	nop
	nop
	j	bnei_cont.35292

bnei_else.35291:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35292:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35295

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35297

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35299

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f13, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f12, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f13, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f16, %f12, %f0
	nop

	nop
	nop
	fmul	%f14, %f15, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35301

	flw	%f11, 2(%a1)
	flw	%f18, 1(%a1)
	nop
	nop

	flw	%f17, 465(%zero)
	nop
	fmul	%f1, %f12, %f11
	fmul	%f0, %f15, %f18

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f11

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f13, %f18

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f16, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fadd	%f0, %f14, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35302

bnei_else.35301:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f16, 143(%zero)
	nop
	nop
	nop

	fsw	%f14, 144(%zero)
	nop
	nop
	nop

bnei_cont.35302:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35303

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35304

fbeq_else.35303:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35304:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35305

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35306

bnei_else.35305:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35307

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35308

bnei_else.35307:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35308:
bnei_cont.35306:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35298

bnei_else.35299:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35300:
	nop
	nop
	nop
	j	bnei_cont.35298

bnei_else.35297:
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
	add	%at, %t0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35309

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35310

fbeq_else.35309:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35310:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35311

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35312

bnei_else.35311:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35313

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35314

fbgt_else.35313:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35314:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35315

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35316

bnei_else.35315:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35316:
bnei_cont.35312:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35298:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35317

	nop
	nop
	nop
	j	bnei_cont.35296

bnei_else.35317:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35319

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35320

fbgt_else.35319:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35320:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35321

	nop
	nop
	nop
	j	bnei_cont.35322

bnei_else.35321:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35322:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f25, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35318:
	nop
	nop
	nop
	j	bnei_cont.35296

bnei_else.35295:
bnei_cont.35296:
bnei_cont.35202:
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
	blti	%t0, 0, bgti_else.35323

	lw	%a0, 0(%sp)
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

	lw	%t1, 0(%a0)
	nop
	nop
	nop

	flw	%f0, 0(%t1)
	nop
	nop
	nop

	flw	%f0, 1(%t1)
	nop
	fmul	%f1, %f0, %f22
	nop

	nop
	nop
	fmul	%f0, %f0, %f23
	nop

	flw	%f0, 2(%t1)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f24
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35324

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35325

fbgt_else.35324:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35325:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35326

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%a1, %t0, 1
	addi	%sp, %sp, 8

	flw	%f0, 445(%zero)
	nop
	add	%at, %a0, %a1
	fdiv	%f22, %f1, %f0

	lw	%t1, 0(%at)
	fsw	%f0, 137(%zero)
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	addi	%a0, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	addi	%v1, %t2, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35328

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35329

fbgt_else.35328:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35329:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35330

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35332

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35331

fbgt_else.35332:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35333:
	nop
	nop
	nop
	j	bnei_cont.35331

bnei_else.35330:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35331:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35327

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t1)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t1, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35336

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35338

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35340

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35341

bnei_else.35340:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.35341:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35342

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35343

fbeq_else.35342:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35343:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35344

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35345

bnei_else.35344:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35346

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35347

bnei_else.35346:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35347:
bnei_cont.35345:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35337

bnei_else.35338:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35339:
	nop
	nop
	nop
	j	bnei_cont.35337

bnei_else.35336:
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
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35348

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35349

fbeq_else.35348:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35349:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35350

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35351

bnei_else.35350:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35352

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35353

fbgt_else.35352:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35353:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35354

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35355

bnei_else.35354:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35355:
bnei_cont.35351:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35337:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35356

	nop
	nop
	nop
	j	bnei_cont.35327

bnei_else.35356:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35358

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35359

fbgt_else.35358:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35359:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35360

	nop
	nop
	nop
	j	bnei_cont.35361

bnei_else.35360:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35361:
	flw	%f0, 0(%t1)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35357:
	nop
	nop
	nop
	j	bnei_cont.35327

bnei_else.35334:
bnei_cont.35335:
	nop
	nop
	nop
	j	bnei_cont.35327

bnei_else.35326:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 8
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
	nop

	fsw	%f0, 137(%zero)
	nop
	nop
	nop

	lw	%t2, 134(%zero)
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	addi	%v1, %t2, 0
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35362

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35363

fbgt_else.35362:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35363:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35364

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35366

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35365

fbgt_else.35366:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35367:
	nop
	nop
	nop
	j	bnei_cont.35365

bnei_else.35364:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35365:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35368

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t9, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35370

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35372

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35374

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35375

bnei_else.35374:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.35375:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35376

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35377

fbeq_else.35376:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35377:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35378

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35379

bnei_else.35378:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35380

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35381

bnei_else.35380:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35381:
bnei_cont.35379:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35371

bnei_else.35372:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35373:
	nop
	nop
	nop
	j	bnei_cont.35371

bnei_else.35370:
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
	add	%at, %t1, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35382

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35383

fbeq_else.35382:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35383:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35384

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35385

bnei_else.35384:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35386

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35387

fbgt_else.35386:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35387:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35388

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35389

bnei_else.35388:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35389:
bnei_cont.35385:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35371:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -8
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35390

	nop
	nop
	nop
	j	bnei_cont.35369

bnei_else.35390:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35392

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35393

fbgt_else.35392:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35393:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35394

	nop
	nop
	nop
	j	bnei_cont.35395

bnei_else.35394:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35395:
	flw	%f0, 0(%t9)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35391:
	nop
	nop
	nop
	j	bnei_cont.35369

bnei_else.35368:
bnei_cont.35369:
bnei_cont.35327:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	addi	%a1, %t0, -2
	nop

	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	iter_trace_diffuse_rays.2980

bgti_else.35323:
	lw	%t2, 4(%sp)
	lw	%t1, 5(%sp)
	nop
	nop

	lw	%t0, 6(%sp)
	lw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.35198:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2985:
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

	sw	%t2, 3(%sp)
	flw	%f0, 1(%v0)
	nop
	nop

	sw	%t1, 4(%sp)
	fsw	%f0, 163(%zero)
	nop
	nop

	sw	%t0, 5(%sp)
	flw	%f0, 2(%v0)
	nop
	nop

	sw	%ra, 6(%sp)
	fsw	%f0, 164(%zero)
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	addi	%v1, %a0, -1
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%a0, 0(%sp)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a0, 118(%a0)
	flw	%f0, 0(%a1)
	nop
	nop

	lw	%t0, 0(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%t0)
	nop
	nop
	nop

	flw	%f1, 1(%t0)
	flw	%f0, 1(%a1)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%t0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a1)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.35644

	nop
	nop
	add	%a1, %zero, %zero
	j	fbgt_cont.35645

fbgt_else.35644:
	nop
	nop
	add	%a1, %zero, %k1
	nop

fbgt_cont.35645:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35646

	lw	%a0, 0(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 7
	nop

	lw	%t0, 119(%a0)
	flw	%f0, 445(%zero)
	fdiv	%f22, %f1, %f0
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
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35648

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35649

fbgt_else.35648:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35649:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35650

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35652

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35651

fbgt_else.35652:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35653:
	nop
	nop
	nop
	j	bnei_cont.35651

bnei_else.35650:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_cont.35647

	lw	%a0, 141(%zero)
	lw	%ra, 0(%t0)
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t0, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35656

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35658

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35660

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35661

bnei_else.35660:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.35661:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35662

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35663

fbeq_else.35662:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35663:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35664

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35665

bnei_else.35664:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35666

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35667

bnei_else.35666:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35667:
bnei_cont.35665:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35657

bnei_else.35658:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35659:
	nop
	nop
	nop
	j	bnei_cont.35657

bnei_else.35656:
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
	add	%at, %ra, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35668

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35669

fbeq_else.35668:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35669:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35670

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35671

bnei_else.35670:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35672

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35673

fbgt_else.35672:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35673:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35674

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35675

bnei_else.35674:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35675:
bnei_cont.35671:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35657:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35676

	nop
	nop
	nop
	j	bnei_cont.35647

bnei_else.35676:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35678

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35679

fbgt_else.35678:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35679:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35680

	nop
	nop
	nop
	j	bnei_cont.35681

bnei_else.35680:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35681:
	flw	%f0, 0(%t0)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35677:
	nop
	nop
	nop
	j	bnei_cont.35647

bnei_else.35654:
bnei_cont.35655:
	nop
	nop
	nop
	j	bnei_cont.35647

bnei_else.35646:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 7
	nop

	flw	%f0, 445(%zero)
	nop
	fdiv	%f22, %f1, %f0
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
	jal	trace_or_matrix_fast.2944

	flw	%f1, 137(%zero)
	flw	%f0, 457(%zero)
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35682

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35683

fbgt_else.35682:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35683:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35684

	flw	%f0, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35686

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.35685

fbgt_else.35686:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35687:
	nop
	nop
	nop
	j	bnei_cont.35685

bnei_else.35684:
	nop
	nop
	add	%a0, %zero, %zero
	nop

bnei_cont.35685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35688

	lw	%a0, 141(%zero)
	nop
	nop
	nop

	lw	%v0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 9(%v0)
	lw	%t2, 7(%v0)
	nop
	nop

	lw	%a3, 6(%v0)
	lw	%a0, 5(%v0)
	nop
	nop

	lw	%fp, 4(%v0)
	lw	%a2, 3(%v0)
	nop
	nop

	lw	%k0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%k0, 1, bnei_else.35690

	nop
	nop
	nop
	beqi	%k0, 2, bnei_else.35692

	flw	%f1, 138(%zero)
	flw	%f0, 0(%a0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f0, 1(%a0)
	fsub	%f14, %f1, %f0
	nop

	flw	%f1, 140(%zero)
	flw	%f0, 2(%a0)
	fsub	%f15, %f1, %f0
	nop

	flw	%f0, 0(%fp)
	nop
	fsub	%f16, %f1, %f0
	nop

	flw	%f0, 1(%fp)
	nop
	fmul	%f19, %f14, %f0
	nop

	flw	%f0, 2(%fp)
	nop
	fmul	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f16, %f0
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35694

	flw	%f11, 2(%a1)
	flw	%f13, 1(%a1)
	nop
	nop

	flw	%f12, 465(%zero)
	nop
	fmul	%f1, %f15, %f11
	fmul	%f0, %f16, %f13

	flw	%f11, 0(%a1)
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f11

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f19, %f0
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f16, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	fmul	%f1, %f14, %f13

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f18, %f0
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f15, %f11
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f17, %f0
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35695

bnei_else.35694:
	fsw	%f19, 142(%zero)
	nop
	nop
	nop

	fsw	%f18, 143(%zero)
	nop
	nop
	nop

	fsw	%f17, 144(%zero)
	nop
	nop
	nop

bnei_cont.35695:
	flw	%f13, 142(%zero)
	flw	%f12, 143(%zero)
	nop
	nop

	flw	%f11, 144(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f1, %fzero, fbeq_else.35696

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35697

fbeq_else.35696:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35697:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35698

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35699

bnei_else.35698:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35700

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	j	bnei_cont.35701

bnei_else.35700:
	nop
	nop
	fdiv	%f0, %f30, %f1
	nop

bnei_cont.35701:
bnei_cont.35699:
	nop
	nop
	fmul	%f1, %f13, %f0
	nop

	fsw	%f1, 142(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

	fsw	%f1, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	j	bnei_cont.35691

bnei_else.35692:
	flw	%f0, 0(%fp)
	nop
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%fp)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%fp)
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

bnei_cont.35693:
	nop
	nop
	nop
	j	bnei_cont.35691

bnei_else.35690:
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
	add	%at, %t0, %a1
	nop

	flw	%f0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.35702

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.35703

fbeq_else.35702:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.35703:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35704

	nop
	nop
	fmov	%f0, %fzero
	j	bnei_cont.35705

bnei_else.35704:
	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35706

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35707

fbgt_else.35706:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35707:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35708

	nop
	nop
	fmov	%f0, %f30
	j	bnei_cont.35709

bnei_else.35708:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.35709:
bnei_cont.35705:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a1)
	nop
	nop
	nop

bnei_cont.35691:
	nop
	nop
	addi	%v1, %zero, 138
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	utexture.2959

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %zero, 0

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -7
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35710

	nop
	nop
	nop
	j	bnei_cont.35689

bnei_else.35710:
	flw	%f1, 142(%zero)
	flw	%f0, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f0, 79(%zero)
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 144(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 80(%zero)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f0, fbgt_else.35712

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.35713

fbgt_else.35712:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.35713:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35714

	nop
	nop
	nop
	j	bnei_cont.35715

bnei_else.35714:
	nop
	nop
	fmov	%f0, %fzero
	nop

bnei_cont.35715:
	flw	%f0, 0(%t2)
	nop
	fmul	%f1, %f22, %f0
	nop

	flw	%f1, 148(%zero)
	flw	%f0, 145(%zero)
	fmul	%f11, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
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
	fmul	%f0, %f11, %f0
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.35711:
	nop
	nop
	nop
	j	bnei_cont.35689

bnei_else.35688:
bnei_cont.35689:
bnei_cont.35647:
	lw	%t2, 3(%sp)
	lw	%t1, 4(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%t0, 5(%sp)
	lw	%ra, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	nop
	j	iter_trace_diffuse_rays.2980

do_without_neighbors.3002:
	sw	%v0, 0(%sp)
	nop
	add	%a0, %zero, %t0
	addi	%at, %zero, 4

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
	nop
	blt	%at, %v1, bgt_else.35871

	lw	%a2, 7(%v0)
	lw	%fp, 6(%v0)
	nop
	nop

	sw	%a2, 7(%sp)
	lw	%t0, 5(%v0)
	nop
	nop

	sw	%fp, 8(%sp)
	lw	%a1, 4(%v0)
	nop
	nop

	sw	%a1, 9(%sp)
	lw	%k0, 3(%v0)
	nop
	nop

	sw	%k0, 10(%sp)
	lw	%a1, 2(%v0)
	nop
	nop

	sw	%a1, 11(%sp)
	lw	%a3, 1(%v0)
	add	%at, %a1, %v1
	nop

	sw	%a3, 12(%sp)
	lw	%a1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.35872

	nop
	nop
	add	%at, %k0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35873

	lw	%t2, 0(%fp)
	nop
	add	%at, %t0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	add	%at, %a2, %v1
	nop

	flw	%f0, 0(%a0)
	lw	%t1, 0(%at)
	add	%at, %a3, %v1
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
	lw	%t3, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.35875

	lw	%s0, 179(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35876

bnei_else.35875:
bnei_cont.35876:
	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.35877

	lw	%s0, 180(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35878

bnei_else.35877:
bnei_cont.35878:
	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.35879

	lw	%s0, 181(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35880

bnei_else.35879:
bnei_cont.35880:
	nop
	nop
	nop
	beqi	%t2, 3, bnei_else.35881

	lw	%s0, 182(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35882

bnei_else.35881:
bnei_cont.35882:
	nop
	nop
	nop
	beqi	%t2, 4, bnei_else.35883

	lw	%s0, 183(%zero)
	flw	%f0, 0(%t3)
	addi	%v0, %t3, 0
	addi	%sp, %sp, 13

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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %t3, 0

	nop
	nop
	addi	%v1, %t1, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35884

bnei_else.35883:
bnei_cont.35884:
	lw	%a1, 9(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.35874

bnei_else.35873:
bnei_cont.35874:
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
	blt	%at, %t2, bgt_else.35885

	lw	%a0, 11(%sp)
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
	blti	%a0, 0, bgti_else.35886

	lw	%a0, 10(%sp)
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
	beqi	%a0, 0, bnei_else.35887

	nop
	nop
	add	%at, %t0, %t2
	nop

	lw	%a0, 0(%at)
	nop
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
	lw	%a0, 8(%sp)
	nop
	nop

	lw	%t3, 0(%a0)
	lw	%a0, 7(%sp)
	nop
	nop

	lw	%a0, 12(%sp)
	nop
	add	%at, %a0, %t2
	nop

	lw	%t1, 0(%at)
	nop
	add	%at, %a0, %t2
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.35889

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35890

bnei_else.35889:
bnei_cont.35890:
	nop
	nop
	nop
	beqi	%t3, 1, bnei_else.35891

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35892

bnei_else.35891:
bnei_cont.35892:
	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.35893

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35894

bnei_else.35893:
bnei_cont.35894:
	nop
	nop
	nop
	beqi	%t3, 3, bnei_else.35895

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35896

bnei_else.35895:
bnei_cont.35896:
	nop
	nop
	nop
	beqi	%t3, 4, bnei_else.35897

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %t1, 0

	nop
	nop
	addi	%sp, %sp, 13
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -13
	j	bnei_cont.35898

bnei_else.35897:
bnei_cont.35898:
	lw	%a0, 9(%sp)
	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.35888

bnei_else.35887:
bnei_cont.35888:
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
	j	do_without_neighbors.3002

bgti_else.35886:
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

bgt_else.35885:
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

bgti_else.35872:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.35871:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

try_exploit_neighbors.3018:
	sw	%a3, 0(%sp)
	nop
	add	%at, %a1, %v0
	nop

	sw	%ra, 1(%sp)
	lw	%s2, 0(%at)
	addi	%at, %zero, 4
	nop

	sw	%s2, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.36108

	lw	%s5, 7(%s2)
	lw	%s6, 6(%s2)
	nop
	nop

	lw	%s1, 5(%s2)
	lw	%fp, 4(%s2)
	nop
	nop

	sw	%fp, 3(%sp)
	lw	%k0, 3(%s2)
	nop
	nop

	lw	%s0, 2(%s2)
	lw	%s4, 1(%s2)
	nop
	nop

	nop
	nop
	add	%at, %s0, %a3
	nop

	lw	%s7, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.36109

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%s2, 5(%fp)
	lw	%s3, 2(%fp)
	nop
	nop

	nop
	nop
	add	%at, %s3, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.36110

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.36112

	nop
	nop
	addi	%fp, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %fp
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%fp, %s7, beq_else.36114

	nop
	nop
	addi	%fp, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %fp
	nop

	lw	%fp, 0(%at)
	nop
	nop
	nop

	lw	%fp, 2(%fp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %fp, %a3
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %s7, beq_else.36116

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.36111

beq_else.36116:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36117:
	nop
	nop
	nop
	j	beq_cont.36111

beq_else.36114:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36115:
	nop
	nop
	nop
	j	beq_cont.36111

beq_else.36112:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36113:
	nop
	nop
	nop
	j	beq_cont.36111

beq_else.36110:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36111:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36118

	lw	%s4, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %k0, %s4
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36119

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

	lw	%s5, 5(%a3)
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

	lw	%ra, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s2, %s4
	nop

	lw	%fp, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s5, %s4
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
	add	%at, %s1, %s4
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
	add	%at, %ra, %s4
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
	add	%at, %fp, %s4
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
	lw	%a3, 3(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %s4

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.36120

bnei_else.36119:
bnei_cont.36120:
	lw	%a3, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%fp, %a3, 1
	nop

	nop
	nop
	nop
	blt	%at, %fp, bgt_else.36121

	nop
	nop
	add	%at, %s0, %fp
	nop

	lw	%ra, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%ra, 0, bgti_else.36122

	nop
	nop
	add	%at, %s3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.36123

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
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.36125

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
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.36127

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
	add	%at, %a3, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a3, %ra, beq_else.36129

	nop
	nop
	add	%a3, %zero, %k1
	j	beq_cont.36124

beq_else.36129:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36130:
	nop
	nop
	nop
	j	beq_cont.36124

beq_else.36127:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36128:
	nop
	nop
	nop
	j	beq_cont.36124

beq_else.36125:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36126:
	nop
	nop
	nop
	j	beq_cont.36124

beq_else.36123:
	nop
	nop
	add	%a3, %zero, %zero
	nop

beq_cont.36124:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36131

	nop
	nop
	add	%at, %k0, %fp
	nop

	lw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36132

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

	lw	%s0, 5(%a3)
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

	lw	%ra, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s2, %fp
	nop

	lw	%k0, 5(%a3)
	lw	%a3, 0(%at)
	add	%at, %s0, %fp
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
	add	%at, %s1, %fp
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
	add	%at, %ra, %fp
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
	add	%at, %k0, %fp
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
	lw	%a3, 3(%sp)
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	add	%at, %a3, %fp

	fsw	%f0, 150(%zero)
	lw	%a3, 0(%at)
	nop
	nop

	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.36133

bnei_else.36132:
bnei_cont.36133:
	lw	%ra, 1(%sp)
	nop
	addi	%a3, %fp, 1
	j	try_exploit_neighbors.3018

bnei_else.36131:
	lw	%ra, 1(%sp)
	lw	%v0, 2(%sp)
	addi	%v1, %fp, 0
	j	do_without_neighbors.3002

bgti_else.36122:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.36121:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36118:
	lw	%a2, 0(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.36136

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.36137

	nop
	nop
	add	%at, %k0, %a2
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36138

	lw	%a1, 0(%s6)
	nop
	add	%at, %s1, %a2
	nop

	lw	%a0, 0(%at)
	sw	%a1, 4(%sp)
	add	%at, %s5, %a2
	nop

	flw	%f0, 0(%a0)
	lw	%v1, 0(%at)
	add	%at, %s4, %a2
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
	sw	%v1, 5(%sp)
	nop
	nop

	lw	%a0, 0(%at)
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
	beqi	%a1, 0, bnei_else.36140

	lw	%v0, 179(%zero)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.36141

bnei_else.36140:
bnei_cont.36141:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.36142

	lw	%v0, 180(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.36143

bnei_else.36142:
bnei_cont.36143:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.36144

	lw	%v0, 181(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.36145

bnei_else.36144:
bnei_cont.36145:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.36146

	lw	%v0, 182(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.36147

bnei_else.36146:
bnei_cont.36147:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.36148

	lw	%v0, 183(%zero)
	lw	%a0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
	nop
	addi	%sp, %sp, 7
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -7
	j	bnei_cont.36149

bnei_else.36148:
bnei_cont.36149:
	lw	%a1, 3(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.36139

bnei_else.36138:
bnei_cont.36139:
	lw	%a0, 0(%sp)
	lw	%ra, 1(%sp)
	nop
	nop

	lw	%v0, 2(%sp)
	nop
	addi	%v1, %a0, 1
	j	do_without_neighbors.3002

bgti_else.36137:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgt_else.36136:
	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.36109:
	nop
	nop
	nop
	jr	%ra

bgt_else.36108:
	nop
	nop
	nop
	jr	%ra

pretrace_diffuse_rays.3031:
	sw	%v0, 0(%sp)
	nop
	add	%a0, %zero, %t0
	addi	%at, %zero, 4

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%t1, 2(%sp)
	nop
	nop
	nop

	sw	%a0, 3(%sp)
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
	blt	%at, %v1, bgt_else.36258

	lw	%t0, 7(%v0)
	lw	%a3, 6(%v0)
	nop
	nop

	sw	%a3, 5(%sp)
	lw	%a1, 5(%v0)
	nop
	nop

	sw	%a1, 6(%sp)
	lw	%fp, 3(%v0)
	nop
	nop

	sw	%fp, 7(%sp)
	lw	%a1, 2(%v0)
	nop
	nop

	sw	%a1, 8(%sp)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1
	nop

	sw	%a2, 9(%sp)
	lw	%a1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.36259

	nop
	nop
	add	%at, %fp, %v1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36260

	lw	%a0, 0(%a3)
	fsw	%fzero, 148(%zero)
	add	%at, %t0, %v1
	addi	%sp, %sp, 10

	fsw	%fzero, 149(%zero)
	lw	%s1, 179(%a0)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%s0, 0(%at)
	add	%at, %a2, %v1
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%a1, %zero, 118
	addi	%a0, %v0, 0

	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %s1, 0

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -10
	nop

	lw	%a1, 6(%sp)
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
	j	bnei_cont.36261

bnei_else.36260:
bnei_cont.36261:
	lw	%a0, 1(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%t1, %a0, 1
	nop

	nop
	nop
	nop
	blt	%at, %t1, bgt_else.36262

	lw	%a0, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.36263

	lw	%a0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36264

	lw	%a0, 5(%sp)
	fsw	%fzero, 148(%zero)
	add	%at, %t0, %t1
	nop

	lw	%a0, 0(%a0)
	fsw	%fzero, 149(%zero)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%a0, 179(%a0)
	nop
	nop

	sw	%a0, 10(%sp)
	lw	%a0, 0(%at)
	nop
	nop

	sw	%a0, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 9(%sp)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	add	%at, %a0, %t1
	nop

	lw	%t0, 0(%at)
	nop
	nop
	nop

	flw	%f0, 0(%t0)
	nop
	addi	%v0, %t0, 0
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%t0)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%t0)
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	lw	%v0, 118(%a0)
	lw	%a0, 11(%sp)
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
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%a1)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%a0)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36266

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36267

fbgt_else.36266:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36267:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36268

	lw	%a0, 10(%sp)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 12
	nop

	lw	%v0, 119(%a0)
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2977

	nop
	nop
	addi	%sp, %sp, -12
	j	bnei_cont.36269

bnei_else.36268:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2977

	nop
	nop
	addi	%sp, %sp, -12
	nop

bnei_cont.36269:
	lw	%v1, 11(%sp)
	lw	%v0, 10(%sp)
	addi	%a1, %zero, 116
	addi	%a0, %t0, 0

	nop
	nop
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%a0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %t1
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
	j	bnei_cont.36265

bnei_else.36264:
bnei_cont.36265:
	lw	%t1, 2(%sp)
	lw	%t0, 3(%sp)
	addi	%v1, %t1, 1
	nop

	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	nop
	j	pretrace_diffuse_rays.3031

bgti_else.36263:
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

bgt_else.36262:
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

bgti_else.36259:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.36258:
	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

pretrace_pixels.3034:
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
	blti	%v1, 0, bgti_else.36364

	flw	%f12, 158(%zero)
	lw	%a0, 156(%zero)
	nop
	nop

	nop
	nop
	sub	%a0, %v1, %a0
	nop

	nop
	nop
	itof	%f11, %a0
	nop

	flw	%f11, 165(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fmul	%f11, %f12, %f11
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
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
	fmul	%f0, %f12, %f0
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
	fmul	%f0, %f12, %f0
	nop

	nop
	nop
	fadd	%f0, %f0, %f2
	nop

	fsw	%f0, 176(%zero)
	nop
	nop
	nop

	flw	%f13, 174(%zero)
	flw	%f12, 175(%zero)
	nop
	nop

	flw	%f11, 176(%zero)
	nop
	fmul	%f1, %f13, %f13
	fmul	%f0, %f12, %f12

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f11, %f11

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
	fbne	%f0, %fzero, fbeq_else.36365

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
	fmov	%f0, %f30
	j	bnei_cont.36368

bnei_else.36367:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

bnei_cont.36368:
	lw	%a1, 3(%sp)
	lw	%a0, 4(%sp)
	fmul	%f1, %f13, %f0
	addi	%sp, %sp, 11

	fsw	%f1, 174(%zero)
	nop
	fmul	%f1, %f12, %f0
	fmul	%f0, %f11, %f0

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
	jal	trace_ray.2971

	lw	%a2, 7(%t0)
	lw	%fp, 6(%t0)
	addi	%sp, %sp, -11
	nop

	lw	%a0, 5(%t0)
	lw	%k0, 3(%t0)
	nop
	nop

	sw	%a0, 11(%sp)
	lw	%a1, 2(%t0)
	nop
	nop

	lw	%a3, 1(%t0)
	lw	%a0, 0(%t0)
	nop
	nop

	flw	%f0, 151(%zero)
	nop
	nop
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
	nop
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 0(%fp)
	lw	%a0, 0(%a1)
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.36369

	lw	%a0, 0(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36371

	lw	%a0, 0(%fp)
	fsw	%fzero, 148(%zero)
	addi	%sp, %sp, 12
	nop

	fsw	%fzero, 149(%zero)
	lw	%t1, 179(%a0)
	nop
	nop

	fsw	%fzero, 150(%zero)
	lw	%t2, 0(%a2)
	nop
	nop

	lw	%t3, 0(%a3)
	nop
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
	jal	setup_startp_constants.2882

	lw	%v0, 118(%t1)
	flw	%f0, 0(%t2)
	addi	%sp, %sp, -12
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
	fmul	%f11, %f1, %f0
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f0, 2(%t2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.36373

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.36374

fbgt_else.36373:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.36374:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36375

	lw	%v0, 119(%t1)
	flw	%f0, 440(%zero)
	addi	%sp, %sp, 12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2977

	nop
	nop
	addi	%sp, %sp, -12
	j	bnei_cont.36376

bnei_else.36375:
	flw	%f0, 439(%zero)
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	jal	trace_diffuse_ray.2977

	nop
	nop
	addi	%sp, %sp, -12
	nop

bnei_cont.36376:
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
	addi	%sp, %sp, 12
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%a0, 11(%sp)
	nop
	nop
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
	j	bnei_cont.36372

bnei_else.36371:
bnei_cont.36372:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t0, 0

	nop
	nop
	addi	%sp, %sp, 12
	jal	pretrace_diffuse_rays.3031

	nop
	nop
	addi	%sp, %sp, -12
	j	bgti_cont.36370

bgti_else.36369:
bgti_cont.36370:
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
	blti	%a0, 5, bgti_else.36377

	nop
	nop
	addi	%a0, %a0, -5
	j	bgti_cont.36378

bgti_else.36377:
bgti_cont.36378:
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
	j	pretrace_pixels.3034

bgti_else.36364:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3045:
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
	blt	%v0, %t0, bgt_else.37578

	nop
	nop
	add	%t0, %zero, %a0
	jr	%ra

bgt_else.37578:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t1, 0(%at)
	nop
	nop
	nop

	lw	%fp, 7(%t1)
	lw	%s0, 6(%t1)
	nop
	nop

	lw	%k0, 5(%t1)
	lw	%a0, 4(%t1)
	nop
	nop

	sw	%a0, 11(%sp)
	lw	%a1, 3(%t1)
	nop
	nop

	lw	%a3, 2(%t1)
	lw	%ra, 1(%t1)
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

	lw	%a2, 155(%zero)
	nop
	nop
	nop

	sw	%a2, 12(%sp)
	nop
	nop
	nop

	sw	%a0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a2, bgt_else.37580

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37581

bgt_else.37580:
	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.37582

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37583

bgt_else.37582:
	nop
	nop
	addi	%a0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.37584

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37585

bgt_else.37584:
	nop
	nop
	nop
	blt	%zero, %v0, bgt_else.37586

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37587

bgt_else.37586:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.37587:
bgt_cont.37585:
bgt_cont.37583:
bgt_cont.37581:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37588

	lw	%fp, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%fp, 0, bnei_cont.37589

	lw	%a0, 2(%sp)
	lw	%a3, 0(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a0, %a3
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%ra, 5(%a0)
	lw	%a0, 2(%a0)
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%a0, %fp, beq_else.37592

	lw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %a3
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
	bne	%a0, %fp, beq_else.37594

	lw	%a2, 3(%sp)
	nop
	addi	%a0, %a3, -1
	nop

	nop
	nop
	add	%at, %a2, %a0
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
	bne	%a0, %fp, beq_else.37596

	nop
	nop
	addi	%a0, %a3, 1
	nop

	nop
	nop
	add	%at, %a2, %a0
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
	bne	%a0, %fp, beq_else.37598

	nop
	nop
	add	%a0, %zero, %k1
	j	beq_cont.37593

beq_else.37598:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.37599:
	nop
	nop
	nop
	j	beq_cont.37593

beq_else.37596:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.37597:
	nop
	nop
	nop
	j	beq_cont.37593

beq_else.37594:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.37595:
	nop
	nop
	nop
	j	beq_cont.37593

beq_else.37592:
	nop
	nop
	add	%a0, %zero, %zero
	nop

beq_cont.37593:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37600

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37602

	lw	%fp, 0(%sp)
	lw	%a1, 3(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %fp, -1
	nop

	nop
	nop
	add	%at, %a1, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a3, 5(%a0)
	nop
	addi	%a0, %fp, 1
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
	add	%at, %a0, %fp
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	lw	%a0, 0(%ra)
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
	lw	%a0, 0(%a3)
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
	lw	%a0, 0(%k0)
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
	lw	%a0, 11(%sp)
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

	flw	%f11, 151(%zero)
	flw	%f0, 148(%zero)
	nop
	nop

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37603

bnei_else.37602:
bnei_cont.37603:
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
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37589

bnei_else.37600:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	nop

bnei_cont.37601:
	nop
	nop
	nop
	j	bnei_cont.37589

bgti_else.37590:
bgti_cont.37591:
	nop
	nop
	nop
	j	bnei_cont.37589

bnei_else.37588:
	lw	%a0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.37604

	lw	%a0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37606

	lw	%a0, 0(%k0)
	lw	%t4, 0(%s0)
	nop
	nop

	flw	%f0, 0(%a0)
	lw	%t3, 0(%fp)
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
	lw	%t2, 0(%ra)
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.37608

	lw	%v0, 179(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37609

bnei_else.37608:
bnei_cont.37609:
	nop
	nop
	nop
	beqi	%t4, 1, bnei_else.37610

	lw	%v0, 180(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37611

bnei_else.37610:
bnei_cont.37611:
	nop
	nop
	nop
	beqi	%t4, 2, bnei_else.37612

	lw	%v0, 181(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37613

bnei_else.37612:
bnei_cont.37613:
	nop
	nop
	nop
	beqi	%t4, 3, bnei_else.37614

	lw	%v0, 182(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37615

bnei_else.37614:
bnei_cont.37615:
	nop
	nop
	nop
	beqi	%t4, 4, bnei_else.37616

	lw	%v0, 183(%zero)
	nop
	addi	%a0, %t2, 0
	addi	%v1, %t3, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37617

bnei_else.37616:
bnei_cont.37617:
	lw	%a0, 11(%sp)
	flw	%f11, 151(%zero)
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
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f11, 152(%zero)
	flw	%f0, 149(%zero)
	nop
	nop

	flw	%f1, 2(%a0)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f11, 153(%zero)
	flw	%f0, 150(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	j	bnei_cont.37607

bnei_else.37606:
bnei_cont.37607:
	nop
	nop
	addi	%v1, %k1, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	j	bgti_cont.37605

bgti_else.37604:
bgti_cont.37605:
bnei_cont.37589:
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
	blt	%at, %a1, bgt_else.37618

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.37620

	nop
	nop
	nop
	j	bgt_cont.37619

bgti_else.37620:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.37621:
	nop
	nop
	nop
	j	bgt_cont.37619

bgt_else.37618:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.37619:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

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
	blti	%a1, 10, bgti_else.37622

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37624

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37626

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37628

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37623

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37632

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37634

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37636

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37623

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37640

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37642

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37644

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37623

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37648

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37650

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37652

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37652:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37653:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37650:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37651:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37648:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37649:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37646:
bgti_cont.37647:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37644:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37645:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37642:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37643:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37640:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37641:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37638:
bgti_cont.37639:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37636:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37637:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37634:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37635:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37632:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37633:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37630:
bgti_cont.37631:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37628:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37629:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37626:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37627:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37624:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37625:
	nop
	nop
	nop
	j	bgti_cont.37623

bgti_else.37622:
bgti_cont.37623:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.37654

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
	j	bgt_cont.37655

bgt_else.37654:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.37656

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37658

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37660

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37662

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37657

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37666

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37668

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37670

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37657

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37674

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37676

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37678

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37657

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37682

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37684

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37686

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37686:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37687:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37684:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37685:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37682:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37683:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37680:
bgti_cont.37681:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37678:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37679:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37676:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37677:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37674:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37675:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37672:
bgti_cont.37673:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37670:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37671:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37668:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37669:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37666:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37667:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37664:
bgti_cont.37665:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37662:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37663:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37660:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37661:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37658:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37659:
	nop
	nop
	nop
	j	bgti_cont.37657

bgti_else.37656:
bgti_cont.37657:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.37688

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
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.37689

bgt_else.37688:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37690

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37692

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37694

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37696

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37691

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37700

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37702

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37704

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37691

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37708

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37710

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37712

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37691

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37716

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37718

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37720

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37720:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37721:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37718:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37719:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37716:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37717:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37714:
bgti_cont.37715:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37712:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37713:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37710:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37711:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37708:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37709:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37706:
bgti_cont.37707:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37704:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37705:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37702:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37703:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37700:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37701:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37698:
bgti_cont.37699:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37696:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37697:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37694:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37695:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37692:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37693:
	nop
	nop
	nop
	j	bgti_cont.37691

bgti_else.37690:
bgti_cont.37691:
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
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.37689:
bgt_cont.37655:
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
	blt	%at, %a1, bgt_else.37722

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.37724

	nop
	nop
	nop
	j	bgt_cont.37723

bgti_else.37724:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.37725:
	nop
	nop
	nop
	j	bgt_cont.37723

bgt_else.37722:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.37723:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.37726

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37728

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37730

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37732

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37727

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37736

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37738

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37740

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37727

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37744

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37746

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37748

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37727

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37752

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37754

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37756

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37756:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37757:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37754:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37755:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37752:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37753:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37750:
bgti_cont.37751:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37748:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37749:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37746:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37747:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37744:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37745:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37742:
bgti_cont.37743:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37740:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37741:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37738:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37739:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37736:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37737:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37734:
bgti_cont.37735:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37732:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37733:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37730:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37731:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37728:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37729:
	nop
	nop
	nop
	j	bgti_cont.37727

bgti_else.37726:
bgti_cont.37727:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.37758

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
	j	bgt_cont.37759

bgt_else.37758:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.37760

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37762

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37764

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37766

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37761

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37770

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37772

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37774

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37761

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37778

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37780

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37782

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37761

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37786

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37788

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37790

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37790:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37791:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37788:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37789:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37786:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37787:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37784:
bgti_cont.37785:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37782:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37783:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37780:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37781:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37778:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37779:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37776:
bgti_cont.37777:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37774:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37775:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37772:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37773:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37770:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37771:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37768:
bgti_cont.37769:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37766:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37767:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37764:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37765:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37762:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37763:
	nop
	nop
	nop
	j	bgti_cont.37761

bgti_else.37760:
bgti_cont.37761:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.37792

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
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.37793

bgt_else.37792:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37794

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37796

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37798

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37800

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37795

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37804

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37806

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37808

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37795

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37812

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37814

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37816

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37795

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37820

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37822

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37824

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37824:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37825:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37822:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37823:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37820:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37821:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37818:
bgti_cont.37819:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37816:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37817:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37814:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37815:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37812:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37813:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37810:
bgti_cont.37811:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37808:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37809:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37806:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37807:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37804:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37805:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37802:
bgti_cont.37803:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37800:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37801:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37798:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37799:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37796:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37797:
	nop
	nop
	nop
	j	bgti_cont.37795

bgti_else.37794:
bgti_cont.37795:
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
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.37793:
bgt_cont.37759:
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
	blt	%at, %a1, bgt_else.37826

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.37828

	nop
	nop
	nop
	j	bgt_cont.37827

bgti_else.37828:
	nop
	nop
	add	%a1, %zero, %zero
	nop

bgti_cont.37829:
	nop
	nop
	nop
	j	bgt_cont.37827

bgt_else.37826:
	nop
	nop
	addi	%a1, %zero, 255
	nop

bgt_cont.37827:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a1, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	blti	%a1, 10, bgti_else.37830

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37832

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37834

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37836

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37831

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37840

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37842

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37844

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37831

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37848

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37850

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37852

	nop
	nop
	addi	%a1, %a1, -40
	nop

	nop
	nop
	nop
	blti	%a1, 10, bgti_cont.37831

	nop
	nop
	nop
	blti	%a1, 20, bgti_else.37856

	nop
	nop
	nop
	blti	%a1, 30, bgti_else.37858

	nop
	nop
	nop
	blti	%a1, 40, bgti_else.37860

	nop
	nop
	addi	%v0, %a1, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37860:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37861:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37858:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37859:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37856:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37857:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37854:
bgti_cont.37855:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37852:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37853:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37850:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37851:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37848:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37849:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37846:
bgti_cont.37847:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37844:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37845:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37842:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37843:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37840:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37841:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37838:
bgti_cont.37839:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37836:
	nop
	nop
	addi	%a1, %a1, -30
	nop

bgti_cont.37837:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37834:
	nop
	nop
	addi	%a1, %a1, -20
	nop

bgti_cont.37835:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37832:
	nop
	nop
	addi	%a1, %a1, -10
	nop

bgti_cont.37833:
	nop
	nop
	nop
	j	bgti_cont.37831

bgti_else.37830:
bgti_cont.37831:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.37862

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
	j	bgt_cont.37863

bgt_else.37862:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.37864

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37866

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37868

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37870

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37865

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37874

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37876

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37878

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37865

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37882

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37884

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37886

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.37865

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.37890

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.37892

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.37894

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37894:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37895:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37892:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37893:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37890:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37891:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37888:
bgti_cont.37889:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37886:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37887:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37884:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37885:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37882:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37883:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37880:
bgti_cont.37881:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37878:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37879:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37876:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37877:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37874:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37875:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37872:
bgti_cont.37873:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37870:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.37871:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37868:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.37869:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37866:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.37867:
	nop
	nop
	nop
	j	bgti_cont.37865

bgti_else.37864:
bgti_cont.37865:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.37896

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
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	j	bgt_cont.37897

bgt_else.37896:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37898

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37900

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37902

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37904

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37899

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37908

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37910

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37912

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37899

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37916

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37918

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37920

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.37899

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.37924

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.37926

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.37928

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -14
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37928:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37929:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37926:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37927:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37924:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37925:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37922:
bgti_cont.37923:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37920:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37921:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37918:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37919:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37916:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37917:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37914:
bgti_cont.37915:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37912:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37913:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37910:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37911:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37908:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37909:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37906:
bgti_cont.37907:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37904:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.37905:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37902:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.37903:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37900:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.37901:
	nop
	nop
	nop
	j	bgti_cont.37899

bgti_else.37898:
bgti_cont.37899:
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
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a1, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -14
	nop

bgt_cont.37897:
bgt_cont.37863:
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
	blt	%t3, %t0, bgt_else.37930

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

bgt_else.37930:
	lw	%a0, 3(%sp)
	lw	%a1, 12(%sp)
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
	lw	%a0, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	blt	%a0, %a1, bgt_else.37932

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37933

bgt_else.37932:
	lw	%a0, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.37934

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37935

bgt_else.37934:
	nop
	nop
	addi	%a0, %t3, 1
	nop

	nop
	nop
	nop
	blt	%a0, %t0, bgt_else.37936

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37937

bgt_else.37936:
	nop
	nop
	nop
	blt	%zero, %t3, bgt_else.37938

	nop
	nop
	add	%a0, %zero, %zero
	j	bgt_cont.37939

bgt_else.37938:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bgt_cont.37939:
bgt_cont.37937:
bgt_cont.37935:
bgt_cont.37933:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.37940

	lw	%a2, 4(%sp)
	lw	%a1, 3(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %t3, 0

	lw	%a0, 2(%sp)
	lw	%v1, 1(%sp)
	addi	%sp, %sp, 14
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -14
	j	bnei_cont.37941

bnei_else.37940:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 14

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -14
	nop

bnei_cont.37941:
	flw	%f0, 151(%zero)
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
	blt	%at, %v0, bgt_else.37942

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37944

	nop
	nop
	nop
	j	bgt_cont.37943

bgti_else.37944:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.37945:
	nop
	nop
	nop
	j	bgt_cont.37943

bgt_else.37942:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37943:
	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int.2634

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
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37946

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37948

	nop
	nop
	nop
	j	bgt_cont.37947

bgti_else.37948:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.37949:
	nop
	nop
	nop
	j	bgt_cont.37947

bgt_else.37946:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37947:
	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int.2634

	nop
	nop
	addi	%v0, %t2, 0
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -14
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37950

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37952

	nop
	nop
	nop
	j	bgt_cont.37951

bgti_else.37952:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.37953:
	nop
	nop
	nop
	j	bgt_cont.37951

bgt_else.37950:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37951:
	nop
	nop
	addi	%sp, %sp, 14
	jal	print_int.2634

	nop
	nop
	addi	%v0, %t1, 0
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
	j	scan_pixel.3045

scan_line.3051:
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
	blt	%a3, %t0, bgt_else.38114

	nop
	nop
	add	%t0, %zero, %a1
	jr	%ra

bgt_else.38114:
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
	blt	%a3, %a1, bgt_else.38116

	nop
	nop
	nop
	j	bgt_cont.38117

bgt_else.38116:
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
	fmul	%f12, %f1, %f0
	addi	%v1, %a1, -1

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f12, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f11, %f12, %f1
	nop

	flw	%f11, 170(%zero)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 173(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.38117:
	lw	%t1, 154(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %t1, bgt_else.38118

	nop
	nop
	nop
	j	bgt_cont.38119

bgt_else.38118:
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
	blt	%a0, %t0, bgt_else.38120

	nop
	nop
	nop
	j	bgt_cont.38121

bgt_else.38120:
	nop
	nop
	nop
	blt	%zero, %a1, bgt_else.38122

	nop
	nop
	nop
	j	bgt_cont.38123

bgt_else.38122:
	nop
	nop
	nop
	blt	%k1, %t1, bgt_else.38124

	nop
	nop
	nop
	j	bgt_cont.38125

bgt_else.38124:
bgt_cont.38125:
bgt_cont.38123:
bgt_cont.38121:
	nop
	nop
	nop
	beqi	%zero, 0, bnei_else.38126

	lw	%a2, 3(%sp)
	lw	%a1, 2(%sp)
	addi	%a3, %zero, 0
	addi	%v0, %zero, 0

	lw	%a0, 1(%sp)
	lw	%v1, 0(%sp)
	addi	%sp, %sp, 11
	jal	try_exploit_neighbors.3018

	nop
	nop
	addi	%sp, %sp, -11
	j	bnei_cont.38127

bnei_else.38126:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%sp, %sp, 11

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -11
	nop

bnei_cont.38127:
	flw	%f0, 151(%zero)
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
	blt	%at, %v0, bgt_else.38128

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38130

	nop
	nop
	nop
	j	bgt_cont.38129

bgti_else.38130:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.38131:
	nop
	nop
	nop
	j	bgt_cont.38129

bgt_else.38128:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38129:
	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int.2634

	nop
	nop
	addi	%fp, %zero, 32
	nop

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38132

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38134

	nop
	nop
	nop
	j	bgt_cont.38133

bgti_else.38134:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.38135:
	nop
	nop
	nop
	j	bgt_cont.38133

bgt_else.38132:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38133:
	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int.2634

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -11
	addi	%at, %zero, 255

	nop
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38136

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38138

	nop
	nop
	nop
	j	bgt_cont.38137

bgti_else.38138:
	nop
	nop
	add	%v0, %zero, %zero
	nop

bgti_cont.38139:
	nop
	nop
	nop
	j	bgt_cont.38137

bgt_else.38136:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38137:
	nop
	nop
	addi	%sp, %sp, 11
	jal	print_int.2634

	nop
	nop
	addi	%v0, %zero, 10
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
	jal	scan_pixel.3045

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.38119:
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
	blti	%t3, 5, bgti_else.38140

	nop
	nop
	addi	%t3, %t3, -5
	j	bgti_cont.38141

bgti_else.38140:
bgti_cont.38141:
	nop
	nop
	nop
	blt	%t2, %t0, bgt_else.38142

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

bgt_else.38142:
	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t2, %a0, bgt_else.38144

	nop
	nop
	nop
	j	bgt_cont.38145

bgt_else.38144:
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
	fmul	%f12, %f1, %f0
	nop

	flw	%f0, 171(%zero)
	nop
	fmul	%f1, %f12, %f0
	nop

	flw	%f1, 169(%zero)
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 172(%zero)
	nop
	fmul	%f11, %f12, %f1
	nop

	flw	%f11, 170(%zero)
	nop
	fadd	%f1, %f11, %f1
	nop

	flw	%f11, 173(%zero)
	nop
	fmul	%f12, %f12, %f11
	nop

	nop
	nop
	fadd	%f2, %f12, %f11
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -11
	nop

bgt_cont.38145:
	lw	%a2, 1(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %t2, 0
	addi	%v0, %zero, 0

	lw	%a0, 2(%sp)
	nop
	addi	%sp, %sp, 11
	jal	scan_pixel.3045

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
	blti	%a2, 5, bgti_else.38146

	nop
	nop
	addi	%a2, %a2, -5
	j	bgti_cont.38147

bgti_else.38146:
bgti_cont.38147:
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
	j	scan_line.3051

init_line_elements.3061:
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
	blti	%a2, 0, bgti_else.38173

	nop
	nop
	addi	%fp, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_create_float_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%s0, %zero, 5

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

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
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s4, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s4)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
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

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s4, 4(%ra)
	nop
	addi	%s4, %a2, -1
	nop

	sw	%s3, 3(%ra)
	nop
	nop
	nop

	sw	%s2, 2(%ra)
	nop
	nop
	nop

	sw	%s1, 1(%ra)
	nop
	nop
	nop

	sw	%k0, 0(%ra)
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
	blti	%s4, 0, bgti_else.38174

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
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

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s3, 4(%ra)
	nop
	nop
	nop

	sw	%s2, 3(%ra)
	nop
	nop
	nop

	sw	%s1, 2(%ra)
	nop
	nop
	nop

	sw	%k0, 1(%ra)
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
	blti	%s4, 0, bgti_else.38175

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
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

	sw	%s6, 6(%ra)
	nop
	nop
	nop

	sw	%s5, 5(%ra)
	nop
	nop
	nop

	sw	%s3, 4(%ra)
	nop
	nop
	nop

	sw	%s2, 3(%ra)
	nop
	nop
	nop

	sw	%s1, 2(%ra)
	nop
	nop
	nop

	sw	%k0, 1(%ra)
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
	blti	%s4, 0, bgti_else.38176

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v1, %zero, 0

	nop
	nop
	addi	%v0, %s0, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s3, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s3)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s5, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s5)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s5)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s6, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %s0, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %fp, 0

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a0)
	nop
	add	%fp, %zero, %hp
	addi	%hp, %hp, 8

	sw	%a0, 7(%fp)
	nop
	add	%at, %a1, %s4
	addi	%v1, %s4, -1

	sw	%s6, 6(%fp)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%s5, 5(%fp)
	nop
	nop
	nop

	sw	%s3, 4(%fp)
	nop
	nop
	nop

	sw	%s2, 3(%fp)
	nop
	nop
	nop

	sw	%s1, 2(%fp)
	nop
	nop
	nop

	sw	%k0, 1(%fp)
	nop
	nop
	nop

	sw	%a2, 0(%fp)
	nop
	nop
	nop

	sw	%fp, 0(%at)
	nop
	nop
	j	init_line_elements.3061

bgti_else.38176:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.38175:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.38174:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

bgti_else.38173:
	nop
	nop
	add	%ra, %zero, %a3
	add	%v0, %zero, %a1

	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	add	%a1, %zero, %a0
	add	%a2, %zero, %ra

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.38278

	lw	%a3, 179(%v1)
	nop
	fmul	%f12, %f0, %f0
	fmul	%f11, %f1, %f1

	nop
	nop
	fadd	%f11, %f12, %f11
	add	%at, %a3, %a1

	lw	%a0, 0(%at)
	nop
	fadd	%f11, %f11, %f30
	add	%ra, %zero, %a2

	lw	%a0, 0(%a0)
	nop
	fsqrt	%f11, %f11
	nop

	nop
	nop
	fdiv	%f14, %f0, %f11
	fdiv	%f13, %f1, %f11

	fsw	%f14, 0(%a0)
	nop
	fdiv	%f12, %f30, %f11
	fneg	%f0, %f13

	fsw	%f13, 1(%a0)
	nop
	fneg	%f1, %f14
	fneg	%f11, %f14

	fsw	%f12, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a1, 40
	nop

	nop
	nop
	add	%at, %a3, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f14, 0(%a0)
	nop
	nop
	nop

	fsw	%f12, 1(%a0)
	nop
	nop
	nop

	fsw	%f0, 2(%a0)
	nop
	fneg	%f0, %f13
	nop

	nop
	nop
	addi	%a0, %a1, 80
	nop

	nop
	nop
	add	%at, %a3, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f12, 0(%a0)
	nop
	nop
	nop

	fsw	%f1, 1(%a0)
	nop
	fneg	%f1, %f13
	nop

	fsw	%f0, 2(%a0)
	nop
	fneg	%f0, %f12
	nop

	nop
	nop
	addi	%a0, %a1, 1
	nop

	nop
	nop
	add	%at, %a3, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f11, 0(%a0)
	nop
	nop
	nop

	fsw	%f1, 1(%a0)
	nop
	fneg	%f1, %f14
	nop

	fsw	%f0, 2(%a0)
	nop
	fneg	%f0, %f12
	nop

	nop
	nop
	addi	%a0, %a1, 41
	nop

	nop
	nop
	add	%at, %a3, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f1, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 1(%a0)
	nop
	fneg	%f0, %f12
	nop

	fsw	%f13, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %a1, 81
	nop

	nop
	nop
	add	%at, %a3, %a0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a0, 0(%a0)
	nop
	nop
	nop

	fsw	%f0, 0(%a0)
	nop
	nop
	nop

	fsw	%f14, 1(%a0)
	nop
	nop
	nop

	fsw	%f13, 2(%a0)
	nop
	nop
	jr	%ra

bgti_else.38278:
	flw	%f16, 441(%zero)
	nop
	fmul	%f0, %f1, %f1
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fsqrt	%f17, %f0
	nop

	nop
	nop
	fdiv	%f0, %f30, %f17
	jal	atan.2627

	flw	%f18, 470(%zero)
	nop
	fmul	%f11, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.38280

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.38281

fbgt_else.38280:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.38281:
	flw	%f19, 469(%zero)
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38282

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38284

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38283

bnei_else.38284:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38285:
	nop
	nop
	nop
	j	fbgt_cont.38283

fbgt_else.38282:
fbgt_cont.38283:
	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38286

	nop
	nop
	fsub	%f0, %f0, %f18
	j	fbgt_cont.38287

fbgt_else.38286:
fbgt_cont.38287:
	flw	%f20, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.38288

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38289

fbgt_else.38288:
fbgt_cont.38289:
	flw	%f21, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.38290

	flw	%f1, 468(%zero)
	nop
	fmul	%f14, %f0, %f0
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	flw	%f1, 467(%zero)
	nop
	fsub	%f12, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f12, %f12, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.38291

fbgt_else.38290:
	nop
	nop
	fsub	%f0, %f20, %f0
	nop

	flw	%f0, 465(%zero)
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f0, %f0, %f13

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.38291:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38292

	nop
	nop
	nop
	j	bnei_cont.38293

bnei_else.38292:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38293:
	nop
	nop
	fabs	%f11, %f11
	nop

	nop
	nop
	fdiv	%f1, %f11, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.38294

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38295

fbgt_else.38294:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38295:
	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.38296

	nop
	nop
	fsub	%f1, %f1, %f18
	j	fbgt_cont.38297

fbgt_else.38296:
fbgt_cont.38297:
	nop
	nop
	nop
	fblt	%f1, %f20, fbgt_else.38298

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38300

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38299

bnei_else.38300:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38301:
	nop
	nop
	nop
	j	fbgt_cont.38299

fbgt_else.38298:
fbgt_cont.38299:
	nop
	nop
	nop
	fblt	%f1, %f20, fbgt_else.38302

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.38303

fbgt_else.38302:
fbgt_cont.38303:
	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.38304

	flw	%f1, 465(%zero)
	nop
	fmul	%f13, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 464(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 463(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	j	fbgt_cont.38305

fbgt_else.38304:
	flw	%f1, 468(%zero)
	nop
	fsub	%f14, %f20, %f1
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f14

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 467(%zero)
	nop
	fsub	%f11, %f14, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.38305:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38306

	nop
	nop
	nop
	j	bnei_cont.38307

bnei_else.38306:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.38307:
	nop
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v0, 1

	nop
	nop
	fmul	%f17, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f17, %f17
	nop

	nop
	nop
	fadd	%f0, %f0, %f16
	nop

	nop
	nop
	fsqrt	%f16, %f0
	nop

	nop
	nop
	fdiv	%f0, %f30, %f16
	jal	atan.2627

	nop
	nop
	fmul	%f11, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.38308

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.38309

fbgt_else.38308:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.38309:
	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f19
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38310

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38312

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38311

bnei_else.38312:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38313:
	nop
	nop
	nop
	j	fbgt_cont.38311

fbgt_else.38310:
fbgt_cont.38311:
	nop
	nop
	nop
	fblt	%f0, %f18, fbgt_else.38314

	nop
	nop
	fsub	%f0, %f0, %f18
	j	fbgt_cont.38315

fbgt_else.38314:
fbgt_cont.38315:
	nop
	nop
	nop
	fblt	%f0, %f20, fbgt_else.38316

	nop
	nop
	fsub	%f0, %f18, %f0
	j	fbgt_cont.38317

fbgt_else.38316:
fbgt_cont.38317:
	nop
	nop
	nop
	fblt	%f21, %f0, fbgt_else.38318

	flw	%f1, 468(%zero)
	nop
	fmul	%f14, %f0, %f0
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	flw	%f1, 467(%zero)
	nop
	fsub	%f12, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f12, %f12, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.38319

fbgt_else.38318:
	nop
	nop
	fsub	%f0, %f20, %f0
	nop

	flw	%f0, 465(%zero)
	nop
	fmul	%f13, %f0, %f0
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f0, %f0, %f13

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.38319:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38320

	nop
	nop
	nop
	j	bnei_cont.38321

bnei_else.38320:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38321:
	nop
	nop
	fabs	%f11, %f11
	nop

	nop
	nop
	fdiv	%f1, %f11, %f19
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.38322

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38323

fbgt_else.38322:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38323:
	nop
	nop
	nop
	fblt	%f1, %f18, fbgt_else.38324

	nop
	nop
	fsub	%f1, %f1, %f18
	j	fbgt_cont.38325

fbgt_else.38324:
fbgt_cont.38325:
	nop
	nop
	nop
	fblt	%f1, %f20, fbgt_else.38326

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38328

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38327

bnei_else.38328:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38329:
	nop
	nop
	nop
	j	fbgt_cont.38327

fbgt_else.38326:
fbgt_cont.38327:
	nop
	nop
	nop
	fblt	%f1, %f20, fbgt_else.38330

	nop
	nop
	fsub	%f1, %f18, %f1
	j	fbgt_cont.38331

fbgt_else.38330:
fbgt_cont.38331:
	nop
	nop
	nop
	fblt	%f21, %f1, fbgt_else.38332

	flw	%f1, 465(%zero)
	nop
	fmul	%f13, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 464(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 463(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	j	fbgt_cont.38333

fbgt_else.38332:
	flw	%f1, 468(%zero)
	nop
	fsub	%f14, %f20, %f1
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f14

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 467(%zero)
	nop
	fsub	%f11, %f14, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.38333:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38334

	nop
	nop
	nop
	j	bnei_cont.38335

bnei_else.38334:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.38335:
	nop
	nop
	fdiv	%f0, %f0, %f1
	add	%ra, %zero, %a2

	nop
	nop
	fmul	%f1, %f0, %f16
	addi	%a0, %a1, 0

	nop
	nop
	fmov	%f0, %f17
	j	calc_dirvec.3071

calc_dirvecs.3079:
	nop
	nop
	fmov	%f3, %f0
	add	%fp, %zero, %v0

	nop
	nop
	add	%k0, %zero, %a0
	add	%s0, %zero, %ra

	nop
	nop
	nop
	blti	%fp, 0, bgti_else.38363

	flw	%f22, 479(%zero)
	flw	%f24, 438(%zero)
	itof	%f0, %fp
	addi	%a0, %k0, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f24
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	flw	%f23, 441(%zero)
	nop
	itof	%f0, %fp
	addi	%s1, %k0, 2

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%a0, %s1, 0

	nop
	nop
	fadd	%f2, %f0, %f23
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%fp, %fp, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.38364

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.38365

bgti_else.38364:
bgti_cont.38365:
	nop
	nop
	nop
	blti	%fp, 0, bgti_else.38366

	nop
	nop
	itof	%f0, %fp
	addi	%a0, %k0, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fsub	%f2, %f0, %f24
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	nop
	nop
	itof	%f0, %fp
	addi	%a0, %s1, 0

	nop
	nop
	fmul	%f0, %f0, %f22
	addi	%v0, %zero, 0

	nop
	nop
	fadd	%f2, %f0, %f23
	fmov	%f1, %fzero

	nop
	nop
	fmov	%f0, %fzero
	jal	calc_dirvec.3071

	nop
	nop
	addi	%v0, %fp, -1
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.38367

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.38368

bgti_else.38367:
bgti_cont.38368:
	nop
	nop
	add	%ra, %zero, %s0
	addi	%a0, %k0, 0

	nop
	nop
	fmov	%f0, %f3
	j	calc_dirvecs.3079

bgti_else.38366:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38363:
	nop
	nop
	add	%ra, %zero, %s0
	nop

	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3084:
	nop
	nop
	add	%s2, %zero, %v0
	add	%s3, %zero, %v1

	nop
	nop
	add	%s4, %zero, %a0
	add	%s5, %zero, %ra

	nop
	nop
	nop
	blti	%s2, 0, bgti_else.38401

	flw	%f26, 479(%zero)
	flw	%f25, 438(%zero)
	itof	%f0, %s2
	addi	%s6, %zero, 4

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%a0, %s4, 0

	nop
	nop
	fsub	%f3, %f0, %f25
	itof	%f0, %s6

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%v1, %s3, 0

	nop
	nop
	fsub	%f2, %f0, %f25
	addi	%v0, %zero, 0

	nop
	nop
	fmov	%f1, %fzero
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	itof	%f0, %s6
	addi	%a0, %s4, 2

	flw	%f0, 441(%zero)
	nop
	fmul	%f1, %f0, %f26
	addi	%v1, %s3, 0

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
	jal	calc_dirvec.3071

	nop
	nop
	addi	%v0, %zero, 3
	addi	%v1, %s3, 1

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.38402

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.38403

bgti_else.38402:
bgti_cont.38403:
	nop
	nop
	addi	%a0, %s4, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%s7, %s2, -1
	addi	%s2, %s3, 2

	nop
	nop
	nop
	blti	%s2, 5, bgti_else.38404

	nop
	nop
	addi	%s2, %s2, -5
	j	bgti_cont.38405

bgti_else.38404:
bgti_cont.38405:
	nop
	nop
	addi	%s3, %s4, 4
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.38406

	nop
	nop
	itof	%f0, %s7
	addi	%a0, %s3, 0

	nop
	nop
	fmul	%f0, %f0, %f26
	addi	%v1, %s2, 0

	nop
	nop
	fsub	%f0, %f0, %f25
	addi	%v0, %s6, 0

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%v0, %s7, -1
	addi	%v1, %s2, 2

	nop
	nop
	nop
	blti	%v1, 5, bgti_else.38407

	nop
	nop
	addi	%v1, %v1, -5
	j	bgti_cont.38408

bgti_else.38407:
bgti_cont.38408:
	nop
	nop
	addi	%a0, %s3, 4
	add	%ra, %zero, %s5

	nop
	nop
	nop
	j	calc_dirvec_rows.3084

bgti_else.38406:
	nop
	nop
	add	%ra, %zero, %s5
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38401:
	nop
	nop
	add	%ra, %zero, %s5
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
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
	blti	%a2, 0, bgti_else.38440

	nop
	nop
	addi	%fp, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%v0, %fp, 0
	jal	min_caml_create_float_array

	lw	%s0, 0(%zero)
	nop
	addi	%k0, %v0, 0
	nop

	nop
	nop
	addi	%v1, %k0, 0
	addi	%v0, %s0, 0

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

	sw	%k0, 0(%a0)
	nop
	addi	%k0, %a2, -1
	nop

	sw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%k0, 0, bgti_else.38441

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

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
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

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
	blti	%k0, 0, bgti_else.38442

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

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
	add	%at, %a1, %k0
	addi	%k0, %k0, -1

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
	blti	%k0, 0, bgti_else.38443

	nop
	nop
	addi	%v0, %fp, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %s0, 0

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
	add	%at, %a1, %k0
	addi	%v1, %k0, -1

	sw	%a2, 0(%a0)
	nop
	add	%ra, %zero, %a3
	addi	%v0, %a1, 0

	sw	%a0, 0(%at)
	nop
	nop
	j	create_dirvec_elements.3090

bgti_else.38443:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38442:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38441:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38440:
	nop
	nop
	add	%ra, %zero, %a3
	nop

	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	nop
	nop
	add	%s1, %zero, %v0
	add	%s2, %zero, %ra

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.38469

	nop
	nop
	addi	%s5, %zero, 120
	addi	%s3, %zero, 3

	nop
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	lw	%s4, 0(%zero)
	nop
	addi	%a1, %v0, 0
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %s4, 0

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
	addi	%v0, %s5, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

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
	addi	%v0, %s3, 0
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
	addi	%v0, %s4, 0

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
	addi	%s6, %zero, 116
	addi	%v0, %s3, 0

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
	addi	%v0, %s4, 0

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
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%s1, %s1, -1
	nop

	nop
	nop
	nop
	blti	%s1, 0, bgti_else.38470

	nop
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

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
	addi	%v0, %s5, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 179(%s1)
	nop
	addi	%v0, %s3, 0
	fmov	%f0, %fzero

	lw	%a2, 179(%s1)
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%a1, %v0, 0
	addi	%v0, %s4, 0

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
	addi	%v0, %s3, 0
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
	addi	%v0, %s4, 0

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
	addi	%v1, %s6, 0
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
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%v0, %s1, -1
	add	%ra, %zero, %s2

	nop
	nop
	nop
	j	create_dirvecs.3093

bgti_else.38470:
	nop
	nop
	add	%ra, %zero, %s2
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38469:
	nop
	nop
	add	%ra, %zero, %s2
	nop

	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	nop
	nop
	add	%s4, %zero, %v0
	add	%s5, %zero, %v1

	nop
	nop
	add	%s6, %zero, %ra
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.38583

	lw	%a0, 0(%zero)
	nop
	add	%at, %s4, %s5
	nop

	lw	%v0, 0(%at)
	nop
	addi	%s7, %a0, -1
	nop

	nop
	nop
	addi	%v1, %s7, 0
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.38584

	nop
	nop
	add	%at, %s4, %s5
	nop

	lw	%a1, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.38585

	lw	%a0, 12(%s7)
	lw	%a2, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	nop
	nop

	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	nop
	nop

	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38587

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38589

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f18, 2(%k0)
	flw	%f14, 0(%a3)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%a3)
	flw	%f13, 2(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.38591

	flw	%f1, 0(%s0)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s0)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.38592

bnei_else.38591:
bnei_cont.38592:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.38593

	flw	%f15, 1(%s0)
	flw	%f14, 2(%s0)
	nop
	nop

	flw	%f13, 465(%zero)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.38594

bnei_else.38593:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.38594:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38595

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38596

fbeq_else.38595:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38596:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38597

	nop
	nop
	nop
	j	bnei_cont.38598

bnei_else.38597:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.38598:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.38588

bnei_else.38589:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a3)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.38599

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38600

fbgt_else.38599:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38600:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38601

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.38602

bnei_else.38601:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.38602:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.38590:
	nop
	nop
	nop
	j	bnei_cont.38588

bnei_else.38587:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

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
	fbne	%f1, %fzero, fbeq_else.38603

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38604

fbeq_else.38603:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38604:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38605

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.38606

bnei_else.38605:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38607

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38608

fbgt_else.38607:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38608:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38609

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38611

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38610

bnei_else.38611:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38612:
	nop
	nop
	nop
	j	bnei_cont.38610

bnei_else.38609:
bnei_cont.38610:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38613

	nop
	nop
	nop
	j	bnei_cont.38614

bnei_else.38613:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38614:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.38606:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38615

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38616

fbeq_else.38615:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38616:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38617

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.38618

bnei_else.38617:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38619

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38620

fbgt_else.38619:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38620:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38621

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38623

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38622

bnei_else.38623:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38624:
	nop
	nop
	nop
	j	bnei_cont.38622

bnei_else.38621:
bnei_cont.38622:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38625

	nop
	nop
	nop
	j	bnei_cont.38626

bnei_else.38625:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38626:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.38618:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38627

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38628

fbeq_else.38627:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38628:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38629

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.38630

bnei_else.38629:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38631

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38632

fbgt_else.38631:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38632:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38633

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38635

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38634

bnei_else.38635:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38636:
	nop
	nop
	nop
	j	bnei_cont.38634

bnei_else.38633:
bnei_cont.38634:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38637

	nop
	nop
	nop
	j	bnei_cont.38638

bnei_else.38637:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38638:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.38630:
	nop
	nop
	add	%at, %a2, %s7
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.38588:
	nop
	nop
	addi	%v1, %s7, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.38586

bgti_else.38585:
bgti_cont.38586:
	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.38639

	nop
	nop
	add	%at, %s4, %s5
	addi	%v1, %s7, 0

	lw	%v0, 0(%at)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%s5, %s5, -1
	nop

	nop
	nop
	nop
	blti	%s5, 0, bgti_else.38640

	nop
	nop
	add	%at, %s4, %s5
	nop

	lw	%v0, 0(%at)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %s5, -1
	add	%ra, %zero, %s6

	nop
	nop
	addi	%v0, %s4, 0
	j	init_dirvec_constants.3095

bgti_else.38640:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38639:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38584:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38583:
	nop
	nop
	add	%ra, %zero, %s6
	nop

	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	nop
	nop
	add	%t7, %zero, %v0
	add	%t8, %zero, %ra

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.38855

	lw	%s4, 179(%t7)
	nop
	addi	%a0, %zero, 119
	nop

	lw	%a1, 119(%s4)
	lw	%a0, 0(%zero)
	nop
	nop

	nop
	nop
	addi	%t9, %a0, -1
	nop

	nop
	nop
	nop
	blti	%t9, 0, bgti_else.38856

	lw	%a0, 12(%t9)
	lw	%a2, 1(%a1)
	nop
	nop

	lw	%k0, 0(%a1)
	lw	%s0, 9(%a0)
	nop
	nop

	lw	%fp, 6(%a0)
	lw	%a3, 4(%a0)
	nop
	nop

	lw	%s1, 3(%a0)
	lw	%a0, 1(%a0)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.38858

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38860

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f16, 0(%k0)
	flw	%f17, 1(%k0)
	nop
	nop

	flw	%f18, 2(%k0)
	flw	%f14, 0(%a3)
	fmul	%f0, %f16, %f16
	nop

	flw	%f12, 1(%a3)
	flw	%f13, 2(%a3)
	fmul	%f1, %f0, %f14
	fmul	%f0, %f17, %f17

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f18, %f18

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.38862

	flw	%f1, 0(%s0)
	nop
	fmul	%f11, %f17, %f18
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%s0)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f18, %f16

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f16, %f17

	flw	%f0, 2(%s0)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.38863

bnei_else.38862:
bnei_cont.38863:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f17, %f12

	nop
	nop
	fneg	%f2, %f1
	fmul	%f1, %f18, %f13

	nop
	nop
	fneg	%f19, %f1
	nop

	nop
	nop
	nop
	beqi	%s1, 0, bnei_else.38864

	flw	%f15, 1(%s0)
	flw	%f14, 2(%s0)
	nop
	nop

	flw	%f13, 465(%zero)
	flw	%f12, 0(%s0)
	fmul	%f11, %f18, %f15
	fmul	%f1, %f17, %f14

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f18, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f16, %f14
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f17, %f12

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f16, %f15
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.38865

bnei_else.38864:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f2, 2(%v0)
	nop
	nop
	nop

	fsw	%f19, 3(%v0)
	nop
	nop
	nop

bnei_cont.38865:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.38866

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38867

fbeq_else.38866:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38867:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38868

	nop
	nop
	nop
	j	bnei_cont.38869

bnei_else.38868:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.38869:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	j	bnei_cont.38859

bnei_else.38860:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 0(%k0)
	flw	%f13, 0(%a3)
	nop
	nop

	flw	%f0, 1(%k0)
	flw	%f12, 1(%a3)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a3)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 2(%k0)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.38870

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38871

fbgt_else.38870:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38871:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38872

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.38873

bnei_else.38872:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.38873:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.38861:
	nop
	nop
	nop
	j	bnei_cont.38859

bnei_else.38858:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

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
	fbne	%f1, %fzero, fbeq_else.38874

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38875

fbeq_else.38874:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38875:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38876

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.38877

bnei_else.38876:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38878

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38879

fbgt_else.38878:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38879:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38880

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38882

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38881

bnei_else.38882:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38883:
	nop
	nop
	nop
	j	bnei_cont.38881

bnei_else.38880:
bnei_cont.38881:
	flw	%f0, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38884

	nop
	nop
	nop
	j	bnei_cont.38885

bnei_else.38884:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38885:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.38877:
	flw	%f1, 1(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38886

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38887

fbeq_else.38886:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38887:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38888

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.38889

bnei_else.38888:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38890

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38891

fbgt_else.38890:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38891:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38892

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38894

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38893

bnei_else.38894:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38895:
	nop
	nop
	nop
	j	bnei_cont.38893

bnei_else.38892:
bnei_cont.38893:
	flw	%f0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38896

	nop
	nop
	nop
	j	bnei_cont.38897

bnei_else.38896:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38897:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.38889:
	flw	%f1, 2(%k0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.38898

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.38899

fbeq_else.38898:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.38899:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38900

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.38901

bnei_else.38900:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.38902

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.38903

fbgt_else.38902:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.38903:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.38904

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38906

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.38905

bnei_else.38906:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.38907:
	nop
	nop
	nop
	j	bnei_cont.38905

bnei_else.38904:
bnei_cont.38905:
	flw	%f0, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38908

	nop
	nop
	nop
	j	bnei_cont.38909

bnei_else.38908:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38909:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.38901:
	nop
	nop
	add	%at, %a2, %t9
	nop

	sw	%v0, 0(%at)
	nop
	nop
	nop

bnei_cont.38859:
	nop
	nop
	addi	%v1, %t9, -1
	addi	%v0, %a1, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	nop
	j	bgti_cont.38857

bgti_else.38856:
bgti_cont.38857:
	lw	%v0, 118(%s4)
	nop
	addi	%a0, %zero, 118
	addi	%v1, %t9, 0

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	lw	%v0, 117(%s4)
	nop
	addi	%a0, %zero, 117
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 116
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.38910

	lw	%s4, 179(%t7)
	nop
	addi	%v1, %t9, 0
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	lw	%v0, 118(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 117
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.38911

	lw	%s4, 179(%t7)
	nop
	nop
	nop

	lw	%v0, 119(%s4)
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%v1, %zero, 118
	addi	%v0, %s4, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%t7, %t7, -1
	nop

	nop
	nop
	nop
	blti	%t7, 0, bgti_else.38912

	lw	%v0, 179(%t7)
	nop
	addi	%v1, %zero, 119
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%v0, %t7, -1
	add	%ra, %zero, %t8

	nop
	nop
	nop
	j	init_vecset_constants.3098

bgti_else.38912:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38911:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38910:
	nop
	nop
	add	%ra, %zero, %t8
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.38855:
	nop
	nop
	add	%ra, %zero, %t8
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
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%a0, %zero, 4
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

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

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
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
	addi	%s7, %a0, -2
	nop

	nop
	nop
	nop
	blti	%s7, 0, bgti_else.40525

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
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
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
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
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
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -1
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40526

bgti_else.40525:
bgti_cont.40526:
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
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

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

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
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
	blti	%s7, 0, bgti_else.40527

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
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
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
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
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
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -2
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40528

bgti_else.40527:
bgti_cont.40528:
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
	addi	%a1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a2)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a2)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%k0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

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

	sw	%s1, 6(%v1)
	nop
	nop
	nop

	sw	%s0, 5(%v1)
	nop
	nop
	nop

	sw	%k0, 4(%v1)
	nop
	nop
	nop

	sw	%fp, 3(%v1)
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
	blti	%s7, 0, bgti_else.40529

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
	addi	%a2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a3, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a3)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%a3)
	nop
	addi	%v0, %zero, 5
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%fp, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	addi	%v1, %zero, 0
	jal	min_caml_create_array

	nop
	nop
	addi	%k0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s1, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%s1)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 4(%s1)
	nop
	addi	%v1, %zero, 0
	addi	%v0, %k1, 0

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%s2, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%a0, %v0, 0
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	sw	%v0, 1(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	sw	%v0, 3(%a0)
	nop
	addi	%v0, %zero, 3
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
	add	%at, %a1, %s7
	addi	%v1, %s7, -1

	sw	%s2, 6(%ra)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%s1, 5(%ra)
	nop
	nop
	nop

	sw	%s0, 4(%ra)
	nop
	nop
	nop

	sw	%k0, 3(%ra)
	nop
	nop
	nop

	sw	%fp, 2(%ra)
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
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -3
	addi	%a1, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40530

bgti_else.40529:
bgti_cont.40530:
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
	nop
	jal	min_caml_read_float

	fsw	%f0, 73(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 74(%zero)
	nop
	nop
	jal	min_caml_read_float

	flw	%f13, 461(%zero)
	flw	%f12, 470(%zero)
	addi	%sp, %sp, -4
	nop

	flw	%f14, 469(%zero)
	nop
	fmul	%f11, %f0, %f13
	nop

	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40531

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40532

fbgt_else.40531:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40532:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40533

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40534

fbgt_else.40533:
fbgt_cont.40534:
	flw	%f15, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40535

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40537

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40536

bnei_else.40537:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40538:
	nop
	nop
	nop
	j	fbgt_cont.40536

fbgt_else.40535:
fbgt_cont.40536:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40539

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40540

fbgt_else.40539:
fbgt_cont.40540:
	flw	%f16, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.40541

	flw	%f0, 465(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 463(%zero)
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
	fsub	%f1, %f1, %f0
	j	fbgt_cont.40542

fbgt_else.40541:
	flw	%f0, 468(%zero)
	nop
	fsub	%f19, %f15, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f0, %f0, %f19

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 467(%zero)
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

	flw	%f0, 466(%zero)
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
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fsub	%f1, %f1, %f0
	nop

fbgt_cont.40542:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40543

	nop
	nop
	nop
	j	bnei_cont.40544

bnei_else.40543:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.40544:
	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.40545

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.40546

fbgt_else.40545:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.40546:
	nop
	nop
	fabs	%f11, %f11
	nop

	nop
	nop
	fdiv	%f0, %f11, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f11, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40547

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40549

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40548

bnei_else.40549:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40550:
	nop
	nop
	nop
	j	fbgt_cont.40548

fbgt_else.40547:
fbgt_cont.40548:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40551

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40552

fbgt_else.40551:
fbgt_cont.40552:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40553

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40554

fbgt_else.40553:
fbgt_cont.40554:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.40555

	flw	%f11, 468(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f0

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	flw	%f11, 467(%zero)
	nop
	fsub	%f17, %f0, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 466(%zero)
	nop
	fadd	%f17, %f17, %f11
	nop

	nop
	nop
	fmul	%f0, %f11, %f0
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
	fsub	%f11, %f17, %f0
	j	fbgt_cont.40556

fbgt_else.40555:
	nop
	nop
	fsub	%f0, %f15, %f0
	nop

	flw	%f0, 465(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 464(%zero)
	nop
	fsub	%f11, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f11, %f11, %f0
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
	fsub	%f11, %f11, %f0
	nop

fbgt_cont.40556:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40557

	nop
	nop
	nop
	j	bnei_cont.40558

bnei_else.40557:
	nop
	nop
	fneg	%f11, %f11
	nop

bnei_cont.40558:
	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f18, %f0, %f13

	nop
	nop
	fabs	%f17, %f18
	nop

	nop
	nop
	fdiv	%f0, %f17, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f17, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40559

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40560

fbgt_else.40559:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40560:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40561

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40562

fbgt_else.40561:
fbgt_cont.40562:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40563

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40565

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40564

bnei_else.40565:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40566:
	nop
	nop
	nop
	j	fbgt_cont.40564

fbgt_else.40563:
fbgt_cont.40564:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40567

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40568

fbgt_else.40567:
fbgt_cont.40568:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.40569

	flw	%f0, 465(%zero)
	nop
	fmul	%f2, %f0, %f0
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 464(%zero)
	nop
	fsub	%f17, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f17, %f17, %f0
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
	fsub	%f0, %f17, %f0
	j	fbgt_cont.40570

fbgt_else.40569:
	flw	%f0, 468(%zero)
	nop
	fsub	%f20, %f15, %f0
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f0, %f0, %f20

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f0, %f0, %f2

	flw	%f0, 467(%zero)
	nop
	fsub	%f17, %f20, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f20
	nop

	nop
	nop
	fmul	%f0, %f0, %f19
	nop

	flw	%f0, 466(%zero)
	nop
	fadd	%f17, %f17, %f0
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
	fsub	%f0, %f17, %f0
	nop

fbgt_cont.40570:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40571

	nop
	nop
	nop
	j	bnei_cont.40572

bnei_else.40571:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40572:
	nop
	nop
	nop
	fblt	%f18, %fzero, fbgt_else.40573

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.40574

fbgt_else.40573:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.40574:
	nop
	nop
	fabs	%f18, %f18
	nop

	nop
	nop
	fdiv	%f17, %f18, %f14
	nop

	nop
	nop
	floor	%f17, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f14
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

	nop
	nop
	nop
	fblt	%f17, %f12, fbgt_else.40575

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40577

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40576

bnei_else.40577:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40578:
	nop
	nop
	nop
	j	fbgt_cont.40576

fbgt_else.40575:
fbgt_cont.40576:
	nop
	nop
	nop
	fblt	%f17, %f12, fbgt_else.40579

	nop
	nop
	fsub	%f17, %f17, %f12
	j	fbgt_cont.40580

fbgt_else.40579:
fbgt_cont.40580:
	nop
	nop
	nop
	fblt	%f17, %f15, fbgt_else.40581

	nop
	nop
	fsub	%f17, %f12, %f17
	j	fbgt_cont.40582

fbgt_else.40581:
fbgt_cont.40582:
	nop
	nop
	nop
	fblt	%f16, %f17, fbgt_else.40583

	flw	%f18, 468(%zero)
	nop
	fmul	%f20, %f17, %f17
	nop

	nop
	nop
	fmul	%f2, %f20, %f20
	fmul	%f18, %f18, %f17

	nop
	nop
	fmul	%f18, %f18, %f20
	nop

	flw	%f18, 467(%zero)
	nop
	fsub	%f19, %f17, %f18
	nop

	nop
	nop
	fmul	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f18, %f18, %f2
	nop

	flw	%f18, 466(%zero)
	nop
	fadd	%f19, %f19, %f18
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f20
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fsub	%f17, %f19, %f17
	j	fbgt_cont.40584

fbgt_else.40583:
	nop
	nop
	fsub	%f17, %f15, %f17
	nop

	flw	%f17, 465(%zero)
	nop
	fmul	%f2, %f17, %f17
	nop

	nop
	nop
	fmul	%f19, %f2, %f2
	fmul	%f17, %f17, %f2

	flw	%f17, 464(%zero)
	nop
	fsub	%f18, %f30, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	flw	%f17, 463(%zero)
	nop
	fadd	%f18, %f18, %f17
	nop

	nop
	nop
	fmul	%f17, %f17, %f2
	nop

	nop
	nop
	fmul	%f17, %f17, %f19
	nop

	nop
	nop
	fsub	%f17, %f18, %f17
	nop

fbgt_cont.40584:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40585

	nop
	nop
	nop
	j	bnei_cont.40586

bnei_else.40585:
	nop
	nop
	fneg	%f17, %f17
	nop

bnei_cont.40586:
	flw	%f19, 436(%zero)
	nop
	fmul	%f18, %f1, %f17
	addi	%sp, %sp, 4

	nop
	nop
	fmul	%f18, %f18, %f19
	nop

	fsw	%f18, 171(%zero)
	nop
	nop
	nop

	flw	%f18, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f18, %f11, %f18
	nop

	fsw	%f18, 172(%zero)
	nop
	fmul	%f18, %f1, %f0
	fneg	%f1, %f1

	nop
	nop
	fmul	%f18, %f18, %f19
	nop

	fsw	%f18, 173(%zero)
	nop
	fneg	%f18, %f17
	nop

	fsw	%f0, 165(%zero)
	nop
	nop
	nop

	fsw	%fzero, 166(%zero)
	nop
	nop
	nop

	fsw	%f18, 167(%zero)
	nop
	fneg	%f18, %f11
	nop

	nop
	nop
	fmul	%f17, %f18, %f17
	nop

	fsw	%f17, 168(%zero)
	nop
	nop
	nop

	fsw	%f1, 169(%zero)
	nop
	fneg	%f1, %f11
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 170(%zero)
	nop
	nop
	nop

	flw	%f0, 72(%zero)
	flw	%f27, 171(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f27
	nop

	fsw	%f0, 75(%zero)
	nop
	nop
	nop

	flw	%f0, 73(%zero)
	flw	%f28, 172(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f28
	nop

	fsw	%f0, 76(%zero)
	nop
	nop
	nop

	flw	%f0, 74(%zero)
	flw	%f29, 173(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f29
	nop

	fsw	%f0, 77(%zero)
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f11, %f0, %f13

	nop
	nop
	nop
	fblt	%f11, %fzero, fbgt_else.40587

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.40588

fbgt_else.40587:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.40588:
	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40589

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40591

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40590

bnei_else.40591:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40592:
	nop
	nop
	nop
	j	fbgt_cont.40590

fbgt_else.40589:
fbgt_cont.40590:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40593

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40594

fbgt_else.40593:
fbgt_cont.40594:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40595

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40596

fbgt_else.40595:
fbgt_cont.40596:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.40597

	flw	%f1, 468(%zero)
	nop
	fmul	%f19, %f0, %f0
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f1, %f1, %f0

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	flw	%f1, 467(%zero)
	nop
	fsub	%f17, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f17, %f17, %f1
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
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
	fsub	%f0, %f17, %f0
	j	fbgt_cont.40598

fbgt_else.40597:
	nop
	nop
	fsub	%f0, %f15, %f0
	nop

	flw	%f0, 465(%zero)
	nop
	fmul	%f18, %f0, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	flw	%f0, 463(%zero)
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
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.40598:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40599

	nop
	nop
	nop
	j	bnei_cont.40600

bnei_else.40599:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40600:
	nop
	nop
	fneg	%f0, %f0
	addi	%sp, %sp, 4

	fsw	%f0, 79(%zero)
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -4
	fmul	%f13, %f0, %f13

	nop
	nop
	fabs	%f1, %f11
	nop

	nop
	nop
	fdiv	%f0, %f1, %f14
	nop

	nop
	nop
	floor	%f0, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40601

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40602

fbgt_else.40601:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40602:
	nop
	nop
	nop
	fblt	%f0, %f12, fbgt_else.40603

	nop
	nop
	fsub	%f0, %f0, %f12
	j	fbgt_cont.40604

fbgt_else.40603:
fbgt_cont.40604:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40605

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40607

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40606

bnei_else.40607:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40608:
	nop
	nop
	nop
	j	fbgt_cont.40606

fbgt_else.40605:
fbgt_cont.40606:
	nop
	nop
	nop
	fblt	%f0, %f15, fbgt_else.40609

	nop
	nop
	fsub	%f0, %f12, %f0
	j	fbgt_cont.40610

fbgt_else.40609:
fbgt_cont.40610:
	nop
	nop
	nop
	fblt	%f16, %f0, fbgt_else.40611

	flw	%f0, 465(%zero)
	nop
	fmul	%f17, %f0, %f0
	nop

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 464(%zero)
	nop
	fsub	%f1, %f30, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 463(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f17
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	j	fbgt_cont.40612

fbgt_else.40611:
	flw	%f0, 468(%zero)
	nop
	fsub	%f18, %f15, %f0
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f0, %f0, %f18

	nop
	nop
	fmul	%f11, %f17, %f17
	fmul	%f0, %f0, %f17

	flw	%f0, 467(%zero)
	nop
	fsub	%f1, %f18, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f18
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	flw	%f0, 466(%zero)
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
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

fbgt_cont.40612:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40613

	nop
	nop
	nop
	j	bnei_cont.40614

bnei_else.40613:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40614:
	nop
	nop
	nop
	fblt	%f13, %fzero, fbgt_else.40615

	nop
	nop
	add	%a0, %zero, %k1
	j	fbgt_cont.40616

fbgt_else.40615:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbgt_cont.40616:
	nop
	nop
	fabs	%f11, %f13
	nop

	nop
	nop
	fdiv	%f1, %f11, %f14
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.40617

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40619

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40618

bnei_else.40619:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40620:
	nop
	nop
	nop
	j	fbgt_cont.40618

fbgt_else.40617:
fbgt_cont.40618:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.40621

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.40622

fbgt_else.40621:
fbgt_cont.40622:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.40623

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.40624

fbgt_else.40623:
fbgt_cont.40624:
	nop
	nop
	nop
	fblt	%f16, %f1, fbgt_else.40625

	flw	%f11, 468(%zero)
	nop
	fmul	%f19, %f1, %f1
	nop

	nop
	nop
	fmul	%f18, %f19, %f19
	fmul	%f11, %f11, %f1

	nop
	nop
	fmul	%f11, %f11, %f19
	nop

	flw	%f11, 467(%zero)
	nop
	fsub	%f17, %f1, %f11
	nop

	nop
	nop
	fmul	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f11, %f11, %f18
	nop

	flw	%f11, 466(%zero)
	nop
	fadd	%f17, %f17, %f11
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f19
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fsub	%f1, %f17, %f1
	j	fbgt_cont.40626

fbgt_else.40625:
	nop
	nop
	fsub	%f1, %f15, %f1
	nop

	flw	%f1, 465(%zero)
	nop
	fmul	%f18, %f1, %f1
	nop

	nop
	nop
	fmul	%f17, %f18, %f18
	fmul	%f1, %f1, %f18

	flw	%f1, 464(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	flw	%f1, 463(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f18
	nop

	nop
	nop
	fmul	%f1, %f1, %f17
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.40626:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40627

	nop
	nop
	nop
	j	bnei_cont.40628

bnei_else.40627:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.40628:
	nop
	nop
	fmul	%f1, %f0, %f1
	fabs	%f11, %f13

	fsw	%f1, 78(%zero)
	nop
	fdiv	%f1, %f11, %f14
	nop

	nop
	nop
	floor	%f1, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.40629

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40630

fbgt_else.40629:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40630:
	nop
	nop
	nop
	fblt	%f1, %f12, fbgt_else.40631

	nop
	nop
	fsub	%f1, %f1, %f12
	j	fbgt_cont.40632

fbgt_else.40631:
fbgt_cont.40632:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.40633

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40635

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40634

bnei_else.40635:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40636:
	nop
	nop
	nop
	j	fbgt_cont.40634

fbgt_else.40633:
fbgt_cont.40634:
	nop
	nop
	nop
	fblt	%f1, %f15, fbgt_else.40637

	nop
	nop
	fsub	%f1, %f12, %f1
	j	fbgt_cont.40638

fbgt_else.40637:
fbgt_cont.40638:
	nop
	nop
	nop
	fblt	%f16, %f1, fbgt_else.40639

	flw	%f1, 465(%zero)
	nop
	fmul	%f13, %f1, %f1
	nop

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 464(%zero)
	nop
	fsub	%f11, %f30, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 463(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	j	fbgt_cont.40640

fbgt_else.40639:
	flw	%f1, 468(%zero)
	nop
	fsub	%f14, %f15, %f1
	nop

	nop
	nop
	fmul	%f13, %f14, %f14
	fmul	%f1, %f1, %f14

	nop
	nop
	fmul	%f12, %f13, %f13
	fmul	%f1, %f1, %f13

	flw	%f1, 467(%zero)
	nop
	fsub	%f11, %f14, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	flw	%f1, 466(%zero)
	nop
	fadd	%f11, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f14
	nop

	nop
	nop
	fmul	%f1, %f1, %f13
	nop

	nop
	nop
	fmul	%f1, %f1, %f12
	nop

	nop
	nop
	fsub	%f1, %f11, %f1
	nop

fbgt_cont.40640:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40641

	nop
	nop
	nop
	j	bnei_cont.40642

bnei_else.40641:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.40642:
	nop
	nop
	fmul	%f0, %f0, %f1
	addi	%sp, %sp, 4

	fsw	%f0, 80(%zero)
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 81(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 0
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40643

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40645

	nop
	nop
	addi	%v0, %zero, 2
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40647

	nop
	nop
	addi	%v0, %zero, 3
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40649

	nop
	nop
	addi	%v0, %zero, 4
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_object.2772

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.40644

bnei_else.40649:
	nop
	nop
	addi	%a0, %zero, 3
	nop

	sw	%a0, 0(%zero)
	nop
	nop
	nop

bnei_cont.40650:
	nop
	nop
	nop
	j	bnei_cont.40644

bnei_else.40647:
	nop
	nop
	addi	%a0, %zero, 2
	nop

	sw	%a0, 0(%zero)
	nop
	nop
	nop

bnei_cont.40648:
	nop
	nop
	nop
	j	bnei_cont.40644

bnei_else.40645:
	sw	%k1, 0(%zero)
	nop
	nop
	nop

bnei_cont.40646:
	nop
	nop
	nop
	j	bnei_cont.40644

bnei_else.40643:
	sw	%zero, 0(%zero)
	nop
	nop
	nop

bnei_cont.40644:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2776

	lw	%a0, 0(%v0)
	nop
	addi	%sp, %sp, -4
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.40651

	sw	%v0, 83(%zero)
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_and_network.2780

	nop
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.40652

bnei_else.40651:
bnei_cont.40652:
	nop
	nop
	addi	%v0, %zero, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -4
	addi	%s0, %v0, 0

	lw	%a0, 0(%s0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, -1, bnei_else.40653

	nop
	nop
	addi	%v0, %k1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	read_or_network.2778

	sw	%s0, 0(%v0)
	nop
	addi	%sp, %sp, -4
	j	bnei_cont.40654

bnei_else.40653:
	nop
	nop
	addi	%v1, %s0, 0
	addi	%v0, %k1, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -4
	nop

bnei_cont.40654:
	sw	%v0, 134(%zero)
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	addi	%v0, %zero, 80
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %zero, 51
	jal	min_caml_print_char

	nop
	nop
	addi	%a1, %zero, 10
	nop

	nop
	nop
	addi	%v0, %a1, 0
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 0

	lw	%v0, 0(%sp)
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	lw	%a3, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.40655

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40657

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40659

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40661

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40656

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40665

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40667

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40669

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40656

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40673

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40675

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40677

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40656

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40681

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40683

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40685

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40685:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40686:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40683:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40684:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40681:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40682:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40679:
bgti_cont.40680:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40677:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40678:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40675:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40676:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40673:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40674:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40671:
bgti_cont.40672:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40669:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40670:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40667:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40668:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40665:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40666:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40663:
bgti_cont.40664:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40661:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40662:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40659:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40660:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40657:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40658:
	nop
	nop
	nop
	j	bgti_cont.40656

bgti_else.40655:
bgti_cont.40656:
	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.40687

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40688

bgt_else.40687:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.40689

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40691

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40693

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40695

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40690

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40699

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40701

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40703

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40690

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40707

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40709

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40711

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40690

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40715

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40717

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40719

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40719:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40720:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40717:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40718:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40715:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40716:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40713:
bgti_cont.40714:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40711:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40712:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40709:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40710:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40707:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40708:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40705:
bgti_cont.40706:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40703:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40704:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40701:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40702:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40699:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40700:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40697:
bgti_cont.40698:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40695:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40696:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40693:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40694:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40691:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40692:
	nop
	nop
	nop
	j	bgti_cont.40690

bgti_else.40689:
bgti_cont.40690:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.40721

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40722

bgt_else.40721:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.40723

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40725

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40727

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40729

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40724

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40733

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40735

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40737

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40724

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40741

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40743

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40745

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40724

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40749

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40751

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40753

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40753:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40754:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40751:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40752:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40749:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40750:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40747:
bgti_cont.40748:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40745:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40746:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40743:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40744:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40741:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40742:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40739:
bgti_cont.40740:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40737:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40738:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40735:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40736:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40733:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40734:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40731:
bgti_cont.40732:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40729:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40730:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40727:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40728:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40725:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40726:
	nop
	nop
	nop
	j	bgti_cont.40724

bgti_else.40723:
bgti_cont.40724:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.40722:
bgt_cont.40688:
	nop
	nop
	addi	%a2, %zero, 32
	addi	%sp, %sp, 4

	nop
	nop
	addi	%v0, %a2, 0
	jal	min_caml_print_char

	lw	%a3, 155(%zero)
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	addi	%v0, %a3, 0
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	blti	%a3, 10, bgti_else.40755

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40757

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40759

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40761

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40756

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40765

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40767

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40769

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40756

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40773

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40775

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40777

	nop
	nop
	addi	%a3, %a3, -40
	nop

	nop
	nop
	nop
	blti	%a3, 10, bgti_cont.40756

	nop
	nop
	nop
	blti	%a3, 20, bgti_else.40781

	nop
	nop
	nop
	blti	%a3, 30, bgti_else.40783

	nop
	nop
	nop
	blti	%a3, 40, bgti_else.40785

	nop
	nop
	addi	%v0, %a3, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40785:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40786:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40783:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40784:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40781:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40782:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40779:
bgti_cont.40780:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40777:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40778:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40775:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40776:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40773:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40774:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40771:
bgti_cont.40772:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40769:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40770:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40767:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40768:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40765:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40766:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40763:
bgti_cont.40764:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40761:
	nop
	nop
	addi	%a3, %a3, -30
	nop

bgti_cont.40762:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40759:
	nop
	nop
	addi	%a3, %a3, -20
	nop

bgti_cont.40760:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40757:
	nop
	nop
	addi	%a3, %a3, -10
	nop

bgti_cont.40758:
	nop
	nop
	nop
	j	bgti_cont.40756

bgti_else.40755:
bgti_cont.40756:
	nop
	nop
	nop
	blt	%zero, %fp, bgt_else.40787

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40788

bgt_else.40787:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %fp, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%fp, 10, bgti_else.40789

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.40791

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.40793

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.40795

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.40790

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.40799

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.40801

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.40803

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.40790

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.40807

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.40809

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.40811

	nop
	nop
	addi	%fp, %fp, -40
	nop

	nop
	nop
	nop
	blti	%fp, 10, bgti_cont.40790

	nop
	nop
	nop
	blti	%fp, 20, bgti_else.40815

	nop
	nop
	nop
	blti	%fp, 30, bgti_else.40817

	nop
	nop
	nop
	blti	%fp, 40, bgti_else.40819

	nop
	nop
	addi	%v0, %fp, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%fp, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40819:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.40820:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40817:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.40818:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40815:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.40816:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40813:
bgti_cont.40814:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40811:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.40812:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40809:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.40810:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40807:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.40808:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40805:
bgti_cont.40806:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40803:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.40804:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40801:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.40802:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40799:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.40800:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40797:
bgti_cont.40798:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40795:
	nop
	nop
	addi	%fp, %fp, -30
	nop

bgti_cont.40796:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40793:
	nop
	nop
	addi	%fp, %fp, -20
	nop

bgti_cont.40794:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40791:
	nop
	nop
	addi	%fp, %fp, -10
	nop

bgti_cont.40792:
	nop
	nop
	nop
	j	bgti_cont.40790

bgti_else.40789:
bgti_cont.40790:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.40821

	nop
	nop
	addi	%v0, %fp, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40822

bgt_else.40821:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.40823

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40825

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40827

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40829

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40824

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40833

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40835

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40837

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40824

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40841

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40843

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40845

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40824

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40849

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40851

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40853

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40853:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40854:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40851:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40852:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40849:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40850:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40847:
bgti_cont.40848:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40845:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40846:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40843:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40844:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40841:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40842:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40839:
bgti_cont.40840:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40837:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40838:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40835:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40836:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40833:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40834:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40831:
bgti_cont.40832:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40829:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40830:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40827:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40828:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40825:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40826:
	nop
	nop
	nop
	j	bgti_cont.40824

bgti_else.40823:
bgti_cont.40824:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %fp, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.40822:
bgt_cont.40788:
	nop
	nop
	addi	%v0, %a2, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %zero, 255
	addi	%v1, %zero, 0

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%a2, %v0, 0
	addi	%v0, %zero, 95

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a3, %v0, 0

	nop
	nop
	nop
	blt	%zero, %a2, bgt_else.40855

	nop
	nop
	addi	%v0, %a3, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40856

bgt_else.40855:
	nop
	nop
	addi	%v1, %zero, 0
	addi	%v0, %a2, 0

	nop
	nop
	addi	%sp, %sp, 4
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	blti	%a2, 10, bgti_else.40857

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40859

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40861

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40863

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40858

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40867

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40869

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40871

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40858

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40875

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40877

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40879

	nop
	nop
	addi	%a2, %a2, -40
	nop

	nop
	nop
	nop
	blti	%a2, 10, bgti_cont.40858

	nop
	nop
	nop
	blti	%a2, 20, bgti_else.40883

	nop
	nop
	nop
	blti	%a2, 30, bgti_else.40885

	nop
	nop
	nop
	blti	%a2, 40, bgti_else.40887

	nop
	nop
	addi	%v0, %a2, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a2, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40887:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40888:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40885:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40886:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40883:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40884:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40881:
bgti_cont.40882:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40879:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40880:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40877:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40878:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40875:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40876:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40873:
bgti_cont.40874:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40871:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40872:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40869:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40870:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40867:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40868:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40865:
bgti_cont.40866:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40863:
	nop
	nop
	addi	%a2, %a2, -30
	nop

bgti_cont.40864:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40861:
	nop
	nop
	addi	%a2, %a2, -20
	nop

bgti_cont.40862:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40859:
	nop
	nop
	addi	%a2, %a2, -10
	nop

bgti_cont.40860:
	nop
	nop
	nop
	j	bgti_cont.40858

bgti_else.40857:
bgti_cont.40858:
	nop
	nop
	nop
	blt	%zero, %a0, bgt_else.40889

	nop
	nop
	addi	%v0, %a2, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	j	bgt_cont.40890

bgt_else.40889:
	nop
	nop
	nop
	blti	%a0, 10, bgti_else.40891

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40893

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40895

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40897

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40892

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40901

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40903

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40905

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40892

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40909

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40911

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40913

	nop
	nop
	addi	%a0, %a0, -40
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_cont.40892

	nop
	nop
	nop
	blti	%a0, 20, bgti_else.40917

	nop
	nop
	nop
	blti	%a0, 30, bgti_else.40919

	nop
	nop
	nop
	blti	%a0, 40, bgti_else.40921

	nop
	nop
	addi	%v0, %a0, -40
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -4
	addi	%a0, %v0, 0

	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40921:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40922:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40919:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40920:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40917:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40918:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40915:
bgti_cont.40916:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40913:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40914:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40911:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40912:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40909:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40910:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40907:
bgti_cont.40908:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40905:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40906:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40903:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40904:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40901:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40902:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40899:
bgti_cont.40900:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40897:
	nop
	nop
	addi	%a0, %a0, -30
	nop

bgti_cont.40898:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40895:
	nop
	nop
	addi	%a0, %a0, -20
	nop

bgti_cont.40896:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40893:
	nop
	nop
	addi	%a0, %a0, -10
	nop

bgti_cont.40894:
	nop
	nop
	nop
	j	bgti_cont.40892

bgti_else.40891:
bgti_cont.40892:
	nop
	nop
	addi	%v0, %a0, 48
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a2, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%v0, %a3, 48
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -4
	nop

bgt_cont.40890:
bgt_cont.40856:
	nop
	nop
	addi	%v0, %a1, 0
	addi	%sp, %sp, 4

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%a2, %zero, 120
	addi	%v0, %zero, 3

	nop
	nop
	fmov	%f0, %fzero
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -4
	addi	%a1, %v0, 0

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_array

	nop
	nop
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%v1)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 0(%v1)
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 183(%zero)
	nop
	nop
	nop

	lw	%t7, 183(%zero)
	nop
	addi	%v1, %zero, 118
	nop

	nop
	nop
	addi	%v0, %t7, 0
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%v0, %zero, 3
	jal	create_dirvecs.3093

	flw	%f0, 479(%zero)
	nop
	addi	%a0, %zero, 9
	addi	%v0, %zero, 4

	nop
	nop
	itof	%f1, %a0
	addi	%a0, %zero, 0

	flw	%f0, 438(%zero)
	nop
	fmul	%f1, %f1, %f0
	addi	%v1, %zero, 0

	nop
	nop
	fsub	%f0, %f1, %f0
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%v0, %zero, 8
	addi	%a0, %zero, 4

	nop
	nop
	addi	%v1, %zero, 2
	jal	calc_dirvec_rows.3084

	nop
	nop
	addi	%v1, %zero, 119
	addi	%v0, %t7, 0

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%v0, %zero, 3
	jal	init_vecset_constants.3098

	flw	%f21, 78(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	fsw	%f21, 184(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	flw	%f22, 79(%zero)
	nop
	addi	%s4, %a0, -1
	nop

	fsw	%f22, 185(%zero)
	nop
	nop
	nop

	flw	%f23, 80(%zero)
	nop
	nop
	nop

	fsw	%f23, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%s4, 0, bgti_else.40923

	lw	%a0, 12(%s4)
	nop
	nop
	nop

	lw	%a2, 9(%a0)
	lw	%fp, 6(%a0)
	nop
	nop

	lw	%a1, 4(%a0)
	lw	%a3, 3(%a0)
	nop
	nop

	lw	%a0, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.40925

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40927

	nop
	nop
	addi	%v0, %zero, 5
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f15, 184(%zero)
	flw	%f13, 185(%zero)
	addi	%sp, %sp, -5
	nop

	flw	%f2, 186(%zero)
	flw	%f16, 0(%a1)
	fmul	%f0, %f15, %f15
	nop

	flw	%f14, 1(%a1)
	flw	%f12, 2(%a1)
	fmul	%f1, %f0, %f16
	fmul	%f0, %f13, %f13

	nop
	nop
	fmul	%f0, %f0, %f14
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f2, %f2

	nop
	nop
	fmul	%f0, %f0, %f12
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40929

	flw	%f1, 0(%a2)
	nop
	fmul	%f11, %f13, %f2
	nop

	nop
	nop
	fmul	%f1, %f11, %f1
	nop

	flw	%f0, 1(%a2)
	nop
	fadd	%f11, %f0, %f1
	fmul	%f1, %f2, %f15

	nop
	nop
	fmul	%f0, %f1, %f0
	fmul	%f1, %f15, %f13

	flw	%f0, 2(%a2)
	nop
	fadd	%f11, %f11, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f0, %f11, %f0
	j	bnei_cont.40930

bnei_else.40929:
bnei_cont.40930:
	fsw	%f0, 0(%v0)
	nop
	fmul	%f1, %f15, %f16
	nop

	nop
	nop
	fneg	%f20, %f1
	fmul	%f1, %f13, %f14

	nop
	nop
	fneg	%f19, %f1
	fmul	%f1, %f2, %f12

	nop
	nop
	fneg	%f14, %f1
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.40931

	flw	%f17, 1(%a2)
	flw	%f18, 2(%a2)
	nop
	nop

	flw	%f16, 465(%zero)
	flw	%f12, 0(%a2)
	fmul	%f11, %f2, %f17
	fmul	%f1, %f13, %f18

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f2, %f12

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f20, %f1
	nop

	fsw	%f1, 1(%v0)
	nop
	fmul	%f1, %f15, %f18
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	fmul	%f11, %f13, %f12

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f19, %f1
	nop

	fsw	%f1, 2(%v0)
	nop
	fmul	%f1, %f15, %f17
	nop

	nop
	nop
	fadd	%f1, %f11, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f16
	nop

	nop
	nop
	fsub	%f1, %f14, %f1
	nop

	fsw	%f1, 3(%v0)
	nop
	nop
	j	bnei_cont.40932

bnei_else.40931:
	fsw	%f20, 1(%v0)
	nop
	nop
	nop

	fsw	%f19, 2(%v0)
	nop
	nop
	nop

	fsw	%f14, 3(%v0)
	nop
	nop
	nop

bnei_cont.40932:
	nop
	nop
	nop
	fbne	%f0, %fzero, fbeq_else.40933

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40934

fbeq_else.40933:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40934:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40935

	nop
	nop
	nop
	j	bnei_cont.40936

bnei_else.40935:
	nop
	nop
	fdiv	%f0, %f30, %f0
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.40936:
	sw	%v0, 187(%s4)
	nop
	nop
	j	bnei_cont.40926

bnei_else.40927:
	nop
	nop
	addi	%v0, %zero, 4
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f0, 184(%zero)
	flw	%f13, 0(%a1)
	addi	%sp, %sp, -5
	nop

	flw	%f0, 185(%zero)
	flw	%f12, 1(%a1)
	fmul	%f1, %f0, %f13
	nop

	flw	%f11, 2(%a1)
	nop
	fmul	%f0, %f0, %f12
	nop

	flw	%f0, 186(%zero)
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f11
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%fzero, %f1, fbgt_else.40937

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40938

fbgt_else.40937:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40938:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40939

	flw	%f0, 460(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f13, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	fdiv	%f0, %f12, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f11, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	j	bnei_cont.40940

bnei_else.40939:
	fsw	%fzero, 0(%v0)
	nop
	nop
	nop

bnei_cont.40940:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.40928:
	nop
	nop
	nop
	j	bnei_cont.40926

bnei_else.40925:
	nop
	nop
	addi	%v0, %zero, 6
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	flw	%f1, 184(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40941

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40942

fbeq_else.40941:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40942:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40943

	fsw	%fzero, 1(%v0)
	nop
	nop
	j	bnei_cont.40944

bnei_else.40943:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40945

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40946

fbgt_else.40945:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40946:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.40947

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40949

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40948

bnei_else.40949:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40950:
	nop
	nop
	nop
	j	bnei_cont.40948

bnei_else.40947:
bnei_cont.40948:
	flw	%f0, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40951

	nop
	nop
	nop
	j	bnei_cont.40952

bnei_else.40951:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40952:
	fsw	%f0, 0(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.40944:
	flw	%f1, 185(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40953

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40954

fbeq_else.40953:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40954:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40955

	fsw	%fzero, 3(%v0)
	nop
	nop
	j	bnei_cont.40956

bnei_else.40955:
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
	beqi	%fp, 0, bnei_else.40959

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40961

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40960

bnei_else.40961:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40962:
	nop
	nop
	nop
	j	bnei_cont.40960

bnei_else.40959:
bnei_cont.40960:
	flw	%f0, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40963

	nop
	nop
	nop
	j	bnei_cont.40964

bnei_else.40963:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40964:
	fsw	%f0, 2(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.40956:
	flw	%f1, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %fzero, fbeq_else.40965

	nop
	nop
	add	%a0, %zero, %k1
	j	fbeq_cont.40966

fbeq_else.40965:
	nop
	nop
	add	%a0, %zero, %zero
	nop

fbeq_cont.40966:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40967

	fsw	%fzero, 5(%v0)
	nop
	nop
	j	bnei_cont.40968

bnei_else.40967:
	nop
	nop
	nop
	fblt	%f1, %fzero, fbgt_else.40969

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40970

fbgt_else.40969:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40970:
	nop
	nop
	nop
	beqi	%fp, 0, bnei_else.40971

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40973

	nop
	nop
	add	%a0, %zero, %zero
	j	bnei_cont.40972

bnei_else.40973:
	nop
	nop
	add	%a0, %zero, %k1
	nop

bnei_cont.40974:
	nop
	nop
	nop
	j	bnei_cont.40972

bnei_else.40971:
bnei_cont.40972:
	flw	%f0, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40975

	nop
	nop
	nop
	j	bnei_cont.40976

bnei_else.40975:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40976:
	fsw	%f0, 4(%v0)
	nop
	fdiv	%f0, %f30, %f1
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.40968:
	sw	%v0, 187(%s4)
	nop
	nop
	nop

bnei_cont.40926:
	nop
	nop
	addi	%v1, %s4, -1
	addi	%v0, %zero, 247

	nop
	nop
	addi	%sp, %sp, 5
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	j	bgti_cont.40924

bgti_else.40923:
bgti_cont.40924:
	nop
	nop
	nop
	blti	%s4, 0, bgti_else.40977

	lw	%a1, 12(%s4)
	nop
	nop
	nop

	lw	%a2, 7(%a1)
	lw	%a3, 4(%a1)
	nop
	nop

	lw	%a0, 2(%a1)
	lw	%a1, 1(%a1)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.40979

	nop
	nop
	nop
	j	bgti_cont.40978

bnei_else.40979:
	flw	%f0, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f30, fbgt_else.40981

	nop
	nop
	add	%a0, %zero, %zero
	j	fbgt_cont.40982

fbgt_else.40981:
	nop
	nop
	add	%a0, %zero, %k1
	nop

fbgt_cont.40982:
	nop
	nop
	nop
	beqi	%a0, 0, bgti_cont.40978

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.40985

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.40987

	nop
	nop
	nop
	j	bgti_cont.40978

bnei_else.40987:
	lw	%s6, 434(%zero)
	flw	%f12, 0(%a3)
	sll	%a0, %s4, 2
	fsub	%f24, %f30, %f0

	flw	%f11, 1(%a3)
	flw	%f14, 2(%a3)
	addi	%s5, %a0, 1
	fmul	%f1, %f21, %f12

	nop
	nop
	fmul	%f0, %f22, %f11
	addi	%v0, %zero, 3

	nop
	nop
	fadd	%f1, %f1, %f0
	fmul	%f0, %f23, %f14

	flw	%f1, 462(%zero)
	nop
	fadd	%f13, %f1, %f0
	addi	%sp, %sp, 5

	nop
	nop
	fmul	%f0, %f1, %f12
	nop

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f12, %f0, %f21
	fmul	%f0, %f1, %f11

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f11, %f0, %f22
	fmul	%f0, %f1, %f14

	nop
	nop
	fmul	%f0, %f0, %f13
	nop

	nop
	nop
	fsub	%f1, %f0, %f23
	fmov	%f0, %fzero

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%s7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%s7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%s7)
	fsw	%f12, 0(%a1)
	nop
	nop

	fsw	%f11, 1(%a1)
	nop
	addi	%v0, %s7, 0
	nop

	fsw	%f1, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp

	fsw	%f24, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%s7, 1(%a0)
	nop
	nop
	nop

	sw	%s5, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %s6, 1
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.40988:
	nop
	nop
	nop
	j	bgti_cont.40978

bnei_else.40985:
	lw	%s6, 434(%zero)
	nop
	sll	%s5, %s4, 2
	fsub	%f3, %f30, %f0

	nop
	nop
	fneg	%f26, %f21
	fneg	%f25, %f22

	nop
	nop
	fneg	%f24, %f23
	addi	%s7, %s5, 1

	nop
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	nop
	nop
	addi	%sp, %sp, 5
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t7)
	fsw	%f21, 0(%a1)
	nop
	nop

	fsw	%f25, 1(%a1)
	nop
	addi	%v0, %t7, 0
	nop

	fsw	%f24, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3

	fsw	%f3, 2(%a0)
	nop
	addi	%v0, %zero, 3
	fmov	%f0, %fzero

	sw	%t7, 1(%a0)
	nop
	addi	%t7, %s5, 2
	nop

	sw	%s7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s6)
	nop
	nop
	nop

	nop
	nop
	addi	%s7, %s6, 1
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t8, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t8)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t8)
	fsw	%f26, 0(%a1)
	nop
	nop

	fsw	%f22, 1(%a1)
	nop
	addi	%v0, %t8, 0
	nop

	fsw	%f24, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	add	%a0, %zero, %hp
	addi	%hp, %hp, 3

	fsw	%f3, 2(%a0)
	nop
	addi	%s5, %s5, 3
	addi	%v0, %zero, 3

	sw	%t8, 1(%a0)
	nop
	fmov	%f0, %fzero
	nop

	sw	%t7, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s7)
	nop
	nop
	nop

	nop
	nop
	addi	%s7, %s6, 2
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a1, %v0, 0

	lw	%v0, 4(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	add	%t7, %zero, %hp
	addi	%hp, %hp, 2

	sw	%v0, 1(%t7)
	nop
	addi	%v1, %s4, 0
	nop

	sw	%a1, 0(%t7)
	fsw	%f26, 0(%a1)
	nop
	nop

	fsw	%f25, 1(%a1)
	nop
	addi	%v0, %t7, 0
	nop

	fsw	%f23, 2(%a1)
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -5
	add	%a0, %zero, %hp

	fsw	%f3, 2(%a0)
	nop
	addi	%hp, %hp, 3
	nop

	sw	%t7, 1(%a0)
	nop
	nop
	nop

	sw	%s5, 0(%a0)
	nop
	nop
	nop

	sw	%a0, 254(%s7)
	nop
	addi	%a0, %s6, 3
	nop

	sw	%a0, 434(%zero)
	nop
	nop
	nop

bnei_cont.40986:
	nop
	nop
	nop
	j	bgti_cont.40978

bnei_else.40983:
bnei_cont.40984:
bnei_cont.40980:
	nop
	nop
	nop
	j	bgti_cont.40978

bgti_else.40977:
bgti_cont.40978:
	flw	%f1, 158(%zero)
	lw	%a0, 157(%zero)
	nop
	nop

	flw	%f11, 170(%zero)
	lw	%v0, 2(%sp)
	sub	%a0, %zero, %a0
	nop

	lw	%a0, 0(%sp)
	nop
	itof	%f0, %a0
	addi	%sp, %sp, 5

	flw	%f0, 168(%zero)
	flw	%f1, 169(%zero)
	fmul	%f12, %f1, %f0
	addi	%v1, %a0, -1

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f12, %f1

	nop
	nop
	fadd	%f0, %f0, %f27
	fadd	%f1, %f1, %f28

	nop
	nop
	fmul	%f11, %f12, %f11
	addi	%a0, %zero, 0

	nop
	nop
	fadd	%f2, %f11, %f29
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -5
	addi	%a2, %zero, 2

	lw	%a1, 3(%sp)
	lw	%a0, 2(%sp)
	addi	%v0, %zero, 0
	nop

	lw	%v1, 1(%sp)
	nop
	addi	%sp, %sp, 5
	jal	scan_line.3051

	nop
	nop
	addi	%sp, %sp, -5
	ret

