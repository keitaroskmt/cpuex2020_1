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
	nop

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
	addi	%v0, %hp, 0

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
	nop

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

reduction_2pi_sub1.2614:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88978

	flw	%f2, 494(%zero)
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
	fblt	%f0, %f1, fbgt_else.88979

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88980

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88981

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88982

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88983

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88984

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88985

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88986

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88987

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88988

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88989

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88990

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88991

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88992

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88993

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub1.2614

fbgt_else.88993:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88992:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88991:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88990:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88989:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88988:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88987:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88986:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88985:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88984:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88983:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88982:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88981:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88980:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88979:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.88978:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

reduction_2pi_sub2.2617:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.88994

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88995

	flw	%f3, 494(%zero)
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
	fblt	%f0, %f2, fbgt_else.88996

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88997

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.88998

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.88999

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89000

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89001

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89001:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89000:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88999:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89002

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89003

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89003:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89002:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88998:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88997:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89004

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89005

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89006

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89007

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89007:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89006:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89005:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89008

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89009

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89009:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89008:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89004:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88996:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88995:
	flw	%f3, 494(%zero)
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
	fblt	%f0, %f2, fbgt_else.89010

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89011

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89012

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89013

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89014

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89015

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89015:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89014:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89013:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89016

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89017

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89017:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89016:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89012:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89011:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89018

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89019

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89020

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89021

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89021:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89020:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89019:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89022

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89023

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89023:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.89022:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89018:
	nop
	nop
	nop
	jr	%ra

fbgt_else.89010:
	nop
	nop
	nop
	jr	%ra

fbgt_else.88994:
	nop
	nop
	nop
	jr	%ra

print_int_sub1.2629:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89024

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89025

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89026

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89027

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89028

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89029

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89030

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89031

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	print_int_sub1.2629

bgti_else.89031:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89030:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89029:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89028:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89027:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89026:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89025:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.89024:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

print_int_sub2.2632:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89032

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89033

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89034

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89035

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89036

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89037

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89038

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89039

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89040

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89041

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89042

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89043

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89044

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89045

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89046

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.89047

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	j	print_int_sub2.2632

bgti_else.89047:
	nop
	nop
	nop
	jr	%ra

bgti_else.89046:
	nop
	nop
	nop
	jr	%ra

bgti_else.89045:
	nop
	nop
	nop
	jr	%ra

bgti_else.89044:
	nop
	nop
	nop
	jr	%ra

bgti_else.89043:
	nop
	nop
	nop
	jr	%ra

bgti_else.89042:
	nop
	nop
	nop
	jr	%ra

bgti_else.89041:
	nop
	nop
	nop
	jr	%ra

bgti_else.89040:
	nop
	nop
	nop
	jr	%ra

bgti_else.89039:
	nop
	nop
	nop
	jr	%ra

bgti_else.89038:
	nop
	nop
	nop
	jr	%ra

bgti_else.89037:
	nop
	nop
	nop
	jr	%ra

bgti_else.89036:
	nop
	nop
	nop
	jr	%ra

bgti_else.89035:
	nop
	nop
	nop
	jr	%ra

bgti_else.89034:
	nop
	nop
	nop
	jr	%ra

bgti_else.89033:
	nop
	nop
	nop
	jr	%ra

bgti_else.89032:
	nop
	nop
	nop
	jr	%ra

read_object.2772:
	nop
	nop
	nop
	blti	%v0, 60, bgti_else.89048

	nop
	nop
	nop
	jr	%ra

bgti_else.89048:
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
	beqi	%v0, -1, bnei_else.89050

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
	sw	%v0, 2(%sp)
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
	sw	%v0, 3(%sp)
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

	flw	%f0, 493(%zero)
	nop
	addi	%sp, %sp, -5
	addi	%v1, %zero, 3

	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
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

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	sw	%v0, 7(%sp)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -9
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
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v1, %zero, 2

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	fsw	%f0, 1(%v0)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -10
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
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -11
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
	lw	%v0, 9(%sp)
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
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89052

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89053

fbgt_else.89052:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89053:
	lw	%v1, 8(%sp)
	sw	%v0, 10(%sp)
	fmov	%f0, %f1
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
	nop

	lw	%ra, 11(%sp)
	sw	%v0, 11(%sp)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -13
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
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -13
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
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -14
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
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -14
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
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -14
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
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89054

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
	jal	min_caml_read_float

	flw	%f1, 492(%zero)
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	fsw	%f1, 14(%sp)
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
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	nop
	nop

	lw	%v0, 13(%sp)
	sw	%ra, 15(%sp)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	nop
	nop

	lw	%v0, 13(%sp)
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
	j	bnei_cont.89055

bnei_else.89054:
bnei_cont.89055:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.89056

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89057

bnei_else.89056:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.89057:
	flw	%f0, 5(%sp)
	sw	%a0, 15(%sp)
	addi	%a1, %zero, 4
	nop

	sw	%v0, 13(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -17
	add	%v1, %zero, %hp

	lw	%ra, 16(%sp)
	sw	%v0, 10(%v1)
	addi	%hp, %hp, 11
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

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a3, 0(%v1)
	lw	%a3, 0(%sp)
	nop
	nop

	sw	%v1, 12(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.89058

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.89060

	nop
	nop
	nop
	j	bnei_cont.89059

bnei_else.89060:
	lw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89062

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89063

bnei_else.89062:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.89063:
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f2, %f2

	flw	%f3, 2(%a0)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 5(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.89064

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89065

fbeq_else.89064:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.89065:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89066

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89067

bnei_else.89066:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89068

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89069

bnei_else.89068:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.89069:
bnei_cont.89067:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.89061:
	nop
	nop
	nop
	j	bnei_cont.89059

bnei_else.89058:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89070

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89071

fbeq_else.89070:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89071:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89072

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89073

bnei_else.89072:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89074

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89075

fbeq_else.89074:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89075:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89076

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89077

bnei_else.89076:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89078

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89079

fbgt_else.89078:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89079:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89080

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89081

bnei_else.89080:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89081:
bnei_cont.89077:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89073:
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
	nop
	fbne	%f0, %f1, fbeq_else.89082

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89083

fbeq_else.89082:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89083:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89084

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89085

bnei_else.89084:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89086

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89087

fbeq_else.89086:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89087:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89088

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89089

bnei_else.89088:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89090

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89091

fbgt_else.89090:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89091:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89092

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89093

bnei_else.89092:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89093:
bnei_cont.89089:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89085:
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
	nop
	fbne	%f0, %f1, fbeq_else.89094

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89095

fbeq_else.89094:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89095:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89096

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89097

bnei_else.89096:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89098

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89099

fbeq_else.89098:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89099:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89100

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89101

bnei_else.89100:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89102

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89103

fbgt_else.89102:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89103:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89104

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89105

bnei_else.89104:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89105:
bnei_cont.89101:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89097:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.89059:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89106

	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	nop
	nop

	flw	%f3, 488(%zero)
	fsw	%f0, 16(%sp)
	fabs	%f2, %f0
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

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.89108

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89110

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89112

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89114

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89116

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89118

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89120

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89122

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89124

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89126

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89128

	flw	%f4, 477(%zero)
	sw	%ra, 20(%sp)
	fmov	%f0, %f2
	nop

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89128:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89129:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89126:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89127:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89124:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89125:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89122:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89123:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89120:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89121:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89118:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89119:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89116:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89117:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89114:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89115:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89112:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89113:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89110:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89111:
	nop
	nop
	nop
	j	fbgt_cont.89109

fbgt_else.89108:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.89109:
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89130

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89132

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89134

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89136

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89138

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89140

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89140:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.89141:
	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89138:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89139:
	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89136:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89142

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89144

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89143

fbgt_else.89144:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.89145:
	nop
	nop
	nop
	j	fbgt_cont.89143

fbgt_else.89142:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89143:
fbgt_cont.89137:
	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89134:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89135:
	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89132:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89146

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89148

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89150

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89152

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89147

fbgt_else.89152:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.89153:
	nop
	nop
	nop
	j	fbgt_cont.89147

fbgt_else.89150:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89151:
	nop
	nop
	nop
	j	fbgt_cont.89147

fbgt_else.89148:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89154

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89156

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89155

fbgt_else.89156:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.89157:
	nop
	nop
	nop
	j	fbgt_cont.89155

fbgt_else.89154:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89155:
fbgt_cont.89149:
	nop
	nop
	nop
	j	fbgt_cont.89147

fbgt_else.89146:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89147:
fbgt_cont.89133:
	nop
	nop
	nop
	j	fbgt_cont.89131

fbgt_else.89130:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89131:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89158

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89159

fbgt_else.89158:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89159:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89160

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89161

fbgt_else.89160:
fbgt_cont.89161:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89162

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89164

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89163

bnei_else.89164:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89165:
	nop
	nop
	nop
	j	fbgt_cont.89163

fbgt_else.89162:
fbgt_cont.89163:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89166

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89167

fbgt_else.89166:
fbgt_cont.89167:
	flw	%f3, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89168

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89169

fbgt_else.89168:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89169:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89170

	nop
	nop
	nop
	j	bnei_cont.89171

bnei_else.89170:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89171:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89172

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89173

fbgt_else.89172:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89173:
	flw	%f6, 19(%sp)
	fsw	%f0, 20(%sp)
	fabs	%f4, %f4
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

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89174

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89176

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89178

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89180

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89182

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89184

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89186

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89188

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89190

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89192

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89194

	flw	%f7, 477(%zero)
	sw	%ra, 25(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89194:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89195:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89192:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89193:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89190:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89191:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89188:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89189:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89186:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89187:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89184:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89185:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89182:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89183:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89180:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89181:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89178:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89179:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89176:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89177:
	nop
	nop
	nop
	j	fbgt_cont.89175

fbgt_else.89174:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89175:
	flw	%f1, 24(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89196

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89198

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89200

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89202

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89204

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89206

	sw	%ra, 25(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89206:
	sw	%ra, 25(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

fbgt_cont.89207:
	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89204:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89205:
	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89202:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89208

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89210

	sw	%ra, 25(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89209

fbgt_else.89210:
	sw	%ra, 25(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

fbgt_cont.89211:
	nop
	nop
	nop
	j	fbgt_cont.89209

fbgt_else.89208:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89209:
fbgt_cont.89203:
	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89200:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89201:
	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89198:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89212

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89214

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89216

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89218

	sw	%ra, 25(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89213

fbgt_else.89218:
	sw	%ra, 25(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

fbgt_cont.89219:
	nop
	nop
	nop
	j	fbgt_cont.89213

fbgt_else.89216:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89217:
	nop
	nop
	nop
	j	fbgt_cont.89213

fbgt_else.89214:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89220

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89222

	sw	%ra, 25(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89221

fbgt_else.89222:
	sw	%ra, 25(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

fbgt_cont.89223:
	nop
	nop
	nop
	j	fbgt_cont.89221

fbgt_else.89220:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89221:
fbgt_cont.89215:
	nop
	nop
	nop
	j	fbgt_cont.89213

fbgt_else.89212:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89213:
fbgt_cont.89199:
	nop
	nop
	nop
	j	fbgt_cont.89197

fbgt_else.89196:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89197:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89224

	lw	%v0, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89226

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89225

bnei_else.89226:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89227:
	nop
	nop
	nop
	j	fbgt_cont.89225

fbgt_else.89224:
	lw	%v0, 23(%sp)
	nop
	nop
	nop

fbgt_cont.89225:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89228

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89229

fbgt_else.89228:
fbgt_cont.89229:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89230

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89231

fbgt_else.89230:
fbgt_cont.89231:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89232

	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fmul	%f4, %f0, %f0
	nop

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

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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
	nop
	j	fbgt_cont.89233

fbgt_else.89232:
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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

fbgt_cont.89233:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89234

	nop
	nop
	nop
	j	bnei_cont.89235

bnei_else.89234:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89235:
	lw	%v0, 13(%sp)
	flw	%f6, 19(%sp)
	nop
	nop

	flw	%f4, 1(%v0)
	fsw	%f0, 25(%sp)
	nop
	nop

	fsw	%f4, 26(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.89236

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89238

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89240

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89242

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89244

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89246

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89248

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89250

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89252

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89254

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89256

	flw	%f7, 477(%zero)
	sw	%ra, 28(%sp)
	fmov	%f0, %f5
	nop

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
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89256:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89257:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89254:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89255:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89252:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89253:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89250:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89251:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89248:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89249:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89246:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89247:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89244:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89245:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89242:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89243:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89240:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89241:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89238:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89239:
	nop
	nop
	nop
	j	fbgt_cont.89237

fbgt_else.89236:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89237:
	flw	%f1, 27(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89258

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89260

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89262

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89264

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89266

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89268

	sw	%ra, 28(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89268:
	sw	%ra, 28(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

fbgt_cont.89269:
	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89266:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89267:
	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89264:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89270

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89272

	sw	%ra, 28(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89271

fbgt_else.89272:
	sw	%ra, 28(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

fbgt_cont.89273:
	nop
	nop
	nop
	j	fbgt_cont.89271

fbgt_else.89270:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89271:
fbgt_cont.89265:
	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89262:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89263:
	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89260:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89274

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89276

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89278

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89280

	sw	%ra, 28(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89275

fbgt_else.89280:
	sw	%ra, 28(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

fbgt_cont.89281:
	nop
	nop
	nop
	j	fbgt_cont.89275

fbgt_else.89278:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89279:
	nop
	nop
	nop
	j	fbgt_cont.89275

fbgt_else.89276:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89282

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89284

	sw	%ra, 28(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89283

fbgt_else.89284:
	sw	%ra, 28(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

fbgt_cont.89285:
	nop
	nop
	nop
	j	fbgt_cont.89283

fbgt_else.89282:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89283:
fbgt_cont.89277:
	nop
	nop
	nop
	j	fbgt_cont.89275

fbgt_else.89274:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89275:
fbgt_cont.89261:
	nop
	nop
	nop
	j	fbgt_cont.89259

fbgt_else.89258:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89259:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89286

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89287

fbgt_else.89286:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89287:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89288

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89289

fbgt_else.89288:
fbgt_cont.89289:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89290

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89292

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89291

bnei_else.89292:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89293:
	nop
	nop
	nop
	j	fbgt_cont.89291

fbgt_else.89290:
fbgt_cont.89291:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89294

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89295

fbgt_else.89294:
fbgt_cont.89295:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89296

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89297

fbgt_else.89296:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89297:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89298

	nop
	nop
	nop
	j	bnei_cont.89299

bnei_else.89298:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89299:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89300

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89301

fbgt_else.89300:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89301:
	flw	%f6, 19(%sp)
	fsw	%f0, 28(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 29(%sp)
	nop
	nop
	nop

	fsw	%f4, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89302

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89304

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89306

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89308

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89310

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89312

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89314

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89316

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89318

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89320

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89322

	flw	%f7, 477(%zero)
	sw	%ra, 31(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89322:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89323:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89320:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89321:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89318:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89319:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89316:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89317:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89314:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89315:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89312:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89313:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89310:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89311:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89308:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89309:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89306:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89307:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89304:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89305:
	nop
	nop
	nop
	j	fbgt_cont.89303

fbgt_else.89302:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89303:
	flw	%f1, 30(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89324

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89326

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89328

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89330

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89332

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89334

	sw	%ra, 31(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89334:
	sw	%ra, 31(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

fbgt_cont.89335:
	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89332:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89333:
	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89330:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89336

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89338

	sw	%ra, 31(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89337

fbgt_else.89338:
	sw	%ra, 31(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

fbgt_cont.89339:
	nop
	nop
	nop
	j	fbgt_cont.89337

fbgt_else.89336:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89337:
fbgt_cont.89331:
	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89328:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89329:
	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89326:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89340

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89342

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89344

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89346

	sw	%ra, 31(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89341

fbgt_else.89346:
	sw	%ra, 31(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

fbgt_cont.89347:
	nop
	nop
	nop
	j	fbgt_cont.89341

fbgt_else.89344:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89345:
	nop
	nop
	nop
	j	fbgt_cont.89341

fbgt_else.89342:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89348

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89350

	sw	%ra, 31(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89349

fbgt_else.89350:
	sw	%ra, 31(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

fbgt_cont.89351:
	nop
	nop
	nop
	j	fbgt_cont.89349

fbgt_else.89348:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89349:
fbgt_cont.89343:
	nop
	nop
	nop
	j	fbgt_cont.89341

fbgt_else.89340:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89341:
fbgt_cont.89327:
	nop
	nop
	nop
	j	fbgt_cont.89325

fbgt_else.89324:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89325:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89352

	lw	%v0, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89354

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89353

bnei_else.89354:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89355:
	nop
	nop
	nop
	j	fbgt_cont.89353

fbgt_else.89352:
	lw	%v0, 29(%sp)
	nop
	nop
	nop

fbgt_cont.89353:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89356

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89357

fbgt_else.89356:
fbgt_cont.89357:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89358

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89359

fbgt_else.89358:
fbgt_cont.89359:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89360

	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fmul	%f4, %f0, %f0
	nop

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

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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
	nop
	j	fbgt_cont.89361

fbgt_else.89360:
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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

fbgt_cont.89361:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89362

	nop
	nop
	nop
	j	bnei_cont.89363

bnei_else.89362:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89363:
	lw	%v0, 13(%sp)
	flw	%f6, 19(%sp)
	nop
	nop

	flw	%f4, 2(%v0)
	fsw	%f0, 31(%sp)
	nop
	nop

	fsw	%f4, 32(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.89364

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89366

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89368

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89370

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89372

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89374

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89376

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89378

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89380

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89382

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89384

	flw	%f7, 477(%zero)
	sw	%ra, 34(%sp)
	fmov	%f0, %f5
	nop

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89384:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89385:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89382:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89383:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89380:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89381:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89378:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89379:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89376:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89377:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89374:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89375:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89372:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89373:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89370:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89371:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89368:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89369:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89366:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89367:
	nop
	nop
	nop
	j	fbgt_cont.89365

fbgt_else.89364:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89365:
	flw	%f1, 33(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89386

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89388

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89390

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89392

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89394

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89396

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89396:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.89397:
	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89394:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89395:
	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89392:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89398

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89400

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89399

fbgt_else.89400:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.89401:
	nop
	nop
	nop
	j	fbgt_cont.89399

fbgt_else.89398:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89399:
fbgt_cont.89393:
	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89390:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89391:
	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89388:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89402

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89404

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89406

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89408

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89403

fbgt_else.89408:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.89409:
	nop
	nop
	nop
	j	fbgt_cont.89403

fbgt_else.89406:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89407:
	nop
	nop
	nop
	j	fbgt_cont.89403

fbgt_else.89404:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89410

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89412

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89411

fbgt_else.89412:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.89413:
	nop
	nop
	nop
	j	fbgt_cont.89411

fbgt_else.89410:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89411:
fbgt_cont.89405:
	nop
	nop
	nop
	j	fbgt_cont.89403

fbgt_else.89402:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89403:
fbgt_cont.89389:
	nop
	nop
	nop
	j	fbgt_cont.89387

fbgt_else.89386:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89387:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89414

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89415

fbgt_else.89414:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89415:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89416

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89417

fbgt_else.89416:
fbgt_cont.89417:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89418

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89420

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89419

bnei_else.89420:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89421:
	nop
	nop
	nop
	j	fbgt_cont.89419

fbgt_else.89418:
fbgt_cont.89419:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89422

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89423

fbgt_else.89422:
fbgt_cont.89423:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89424

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89425

fbgt_else.89424:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89425:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89426

	nop
	nop
	nop
	j	bnei_cont.89427

bnei_else.89426:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89427:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89428

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89429

fbgt_else.89428:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89429:
	flw	%f5, 19(%sp)
	fsw	%f0, 34(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 35(%sp)
	nop
	nop
	nop

	fsw	%f4, 36(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89430

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89432

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89434

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89436

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89438

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89440

	flw	%f6, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89442

	flw	%f6, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89444

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89446

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89448

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89450

	flw	%f6, 477(%zero)
	sw	%ra, 37(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89450:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89451:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89448:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89449:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89446:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89447:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89444:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89445:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89442:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89443:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89440:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89441:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89438:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89439:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89436:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89437:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89434:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89435:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89432:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89433:
	nop
	nop
	nop
	j	fbgt_cont.89431

fbgt_else.89430:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.89431:
	flw	%f1, 36(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89452

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89454

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89456

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89458

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89460

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89462

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89462:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.89463:
	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89460:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89461:
	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89458:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89464

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89466

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89465

fbgt_else.89466:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.89467:
	nop
	nop
	nop
	j	fbgt_cont.89465

fbgt_else.89464:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89465:
fbgt_cont.89459:
	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89456:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89457:
	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89454:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89468

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89470

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89472

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89474

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89469

fbgt_else.89474:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.89475:
	nop
	nop
	nop
	j	fbgt_cont.89469

fbgt_else.89472:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89473:
	nop
	nop
	nop
	j	fbgt_cont.89469

fbgt_else.89470:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89476

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89478

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89477

fbgt_else.89478:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.89479:
	nop
	nop
	nop
	j	fbgt_cont.89477

fbgt_else.89476:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89477:
fbgt_cont.89471:
	nop
	nop
	nop
	j	fbgt_cont.89469

fbgt_else.89468:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89469:
fbgt_cont.89455:
	nop
	nop
	nop
	j	fbgt_cont.89453

fbgt_else.89452:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89453:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89480

	lw	%v0, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89482

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89481

bnei_else.89482:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89483:
	nop
	nop
	nop
	j	fbgt_cont.89481

fbgt_else.89480:
	lw	%v0, 35(%sp)
	nop
	nop
	nop

fbgt_cont.89481:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89484

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89485

fbgt_else.89484:
fbgt_cont.89485:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89486

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89487

fbgt_else.89486:
fbgt_cont.89487:
	flw	%f1, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89488

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.89489

fbgt_else.89488:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.89489:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89490

	nop
	nop
	nop
	j	bnei_cont.89491

bnei_else.89490:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89491:
	flw	%f1, 34(%sp)
	flw	%f2, 28(%sp)
	nop
	nop

	flw	%f4, 31(%sp)
	flw	%f5, 25(%sp)
	fmul	%f3, %f2, %f1
	nop

	flw	%f8, 20(%sp)
	lw	%v0, 7(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f11, %f5, %f0

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

	flw	%f9, 2(%v0)
	nop
	fmul	%f12, %f8, %f1
	fmul	%f0, %f9, %f0

	nop
	nop
	fadd	%f6, %f6, %f12
	fmul	%f1, %f5, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4

	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)
	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2

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

	fsw	%f12, 0(%v0)
	nop
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

	fsw	%f12, 1(%v0)
	nop
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

	lw	%v0, 13(%sp)
	nop
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4

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

	fsw	%f13, 0(%v0)
	nop
	fadd	%f0, %f0, %f2
	fmul	%f2, %f8, %f6

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f1, %f4

	fsw	%f0, 1(%v0)
	nop
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

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89107

bnei_else.89106:
bnei_cont.89107:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.89051

bnei_else.89050:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.89051:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89492

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
	blti	%v0, 60, bgti_else.89493

	nop
	nop
	nop
	jr	%ra

bgti_else.89493:
	sw	%v0, 37(%sp)
	nop
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89495

	sw	%v0, 38(%sp)
	nop
	nop
	nop

	sw	%ra, 39(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -40
	nop

	lw	%ra, 39(%sp)
	sw	%v0, 39(%sp)
	nop
	nop

	sw	%ra, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	sw	%v0, 40(%sp)
	nop
	nop

	sw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	flw	%f0, 493(%zero)
	nop
	addi	%sp, %sp, -42
	addi	%v1, %zero, 3

	lw	%ra, 41(%sp)
	sw	%v0, 41(%sp)
	addi	%v0, %v1, 0
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

	nop
	nop
	addi	%sp, %sp, 45
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -45
	nop

	lw	%ra, 44(%sp)
	sw	%v0, 44(%sp)
	nop
	nop

	sw	%ra, 45(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 46
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -46
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
	nop
	addi	%sp, %sp, 46
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -46
	addi	%v1, %zero, 2

	lw	%ra, 45(%sp)
	lw	%v0, 44(%sp)
	nop
	nop

	fsw	%f0, 1(%v0)
	sw	%v1, 45(%sp)
	nop
	nop

	sw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -47
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
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	sw	%v0, 46(%sp)
	nop
	nop

	sw	%ra, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -48
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
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -48
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
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -48
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
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	flw	%f1, 42(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89497

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89498

fbgt_else.89497:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89498:
	lw	%v1, 45(%sp)
	sw	%v0, 47(%sp)
	fmov	%f0, %f1
	nop

	sw	%ra, 48(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	sw	%v0, 48(%sp)
	nop
	nop

	sw	%ra, 49(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 50
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -50
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
	nop
	addi	%sp, %sp, 50
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -50
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
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	sw	%v0, 49(%sp)
	nop
	nop

	sw	%ra, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 51
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -51
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
	nop
	addi	%sp, %sp, 51
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -51
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
	nop
	addi	%sp, %sp, 51
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -51
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
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	lw	%v1, 41(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89499

	sw	%v0, 50(%sp)
	nop
	nop
	nop

	sw	%ra, 51(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 52
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 492(%zero)
	nop
	addi	%sp, %sp, -52
	nop

	lw	%ra, 51(%sp)
	lw	%v0, 50(%sp)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%v0)
	fsw	%f1, 51(%sp)
	nop
	nop

	sw	%ra, 52(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	nop
	nop

	lw	%v0, 50(%sp)
	sw	%ra, 52(%sp)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%v0)
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	flw	%f1, 51(%sp)
	nop
	nop

	lw	%v0, 50(%sp)
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
	j	bnei_cont.89500

bnei_else.89499:
bnei_cont.89500:
	lw	%v1, 39(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.89501

	lw	%a0, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89502

bnei_else.89501:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.89502:
	flw	%f0, 42(%sp)
	sw	%a0, 52(%sp)
	addi	%a1, %zero, 4
	nop

	sw	%v0, 50(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%ra, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 54
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -54
	add	%v1, %zero, %hp

	lw	%ra, 53(%sp)
	sw	%v0, 10(%v1)
	addi	%hp, %hp, 11
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

	sw	%a2, 1(%v1)
	nop
	nop
	nop

	sw	%a3, 0(%v1)
	lw	%a3, 37(%sp)
	nop
	nop

	sw	%v1, 12(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.89503

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.89505

	nop
	nop
	nop
	j	bnei_cont.89504

bnei_else.89505:
	lw	%v1, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89507

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89508

bnei_else.89507:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.89508:
	flw	%f0, 0(%a0)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f2, %f2

	flw	%f3, 2(%a0)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 42(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.89509

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89510

fbeq_else.89509:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.89510:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89511

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89512

bnei_else.89511:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89513

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89514

bnei_else.89513:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.89514:
bnei_cont.89512:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a0)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 1(%a0)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.89506:
	nop
	nop
	nop
	j	bnei_cont.89504

bnei_else.89503:
	flw	%f0, 0(%a0)
	flw	%f1, 42(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89515

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89516

fbeq_else.89515:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89516:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89517

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89518

bnei_else.89517:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89519

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89520

fbeq_else.89519:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89520:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89521

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89522

bnei_else.89521:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89523

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89524

fbgt_else.89523:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89524:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89525

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89526

bnei_else.89525:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89526:
bnei_cont.89522:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89518:
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
	nop
	fbne	%f0, %f1, fbeq_else.89527

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89528

fbeq_else.89527:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89528:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89529

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89530

bnei_else.89529:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89531

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89532

fbeq_else.89531:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89532:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89533

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89534

bnei_else.89533:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89535

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89536

fbgt_else.89535:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89536:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89537

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89538

bnei_else.89537:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89538:
bnei_cont.89534:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89530:
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
	nop
	fbne	%f0, %f1, fbeq_else.89539

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89540

fbeq_else.89539:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89540:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89541

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89542

bnei_else.89541:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89543

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89544

fbeq_else.89543:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89544:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89545

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.89546

bnei_else.89545:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89547

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89548

fbgt_else.89547:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89548:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89549

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89550

bnei_else.89549:
	flw	%f2, 490(%zero)
	nop
	nop
	nop

bnei_cont.89550:
bnei_cont.89546:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.89542:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.89504:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89551

	flw	%f0, 0(%v0)
	flw	%f1, 489(%zero)
	nop
	nop

	flw	%f3, 488(%zero)
	fsw	%f0, 53(%sp)
	fabs	%f2, %f0
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

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.89553

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89555

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89557

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89559

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89561

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89563

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89565

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89567

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89569

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.89571

	flw	%f4, 478(%zero)
	sw	%ra, 57(%sp)
	fmov	%f0, %f2
	nop

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89571:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89572:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89569:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89570:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89567:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89568:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89565:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89566:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89563:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89564:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89561:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89562:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89559:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89560:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89557:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89558:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89555:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.89556:
	nop
	nop
	nop
	j	fbgt_cont.89554

fbgt_else.89553:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.89554:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89573

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89575

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89577

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89579

	sw	%ra, 57(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89574

fbgt_else.89579:
	sw	%ra, 57(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

fbgt_cont.89580:
	nop
	nop
	nop
	j	fbgt_cont.89574

fbgt_else.89577:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89578:
	nop
	nop
	nop
	j	fbgt_cont.89574

fbgt_else.89575:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89581

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89583

	sw	%ra, 57(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89582

fbgt_else.89583:
	sw	%ra, 57(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

fbgt_cont.89584:
	nop
	nop
	nop
	j	fbgt_cont.89582

fbgt_else.89581:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89582:
fbgt_cont.89576:
	nop
	nop
	nop
	j	fbgt_cont.89574

fbgt_else.89573:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89574:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89585

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89586

fbgt_else.89585:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89586:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89587

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89588

fbgt_else.89587:
fbgt_cont.89588:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89589

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89591

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89590

bnei_else.89591:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89592:
	nop
	nop
	nop
	j	fbgt_cont.89590

fbgt_else.89589:
fbgt_cont.89590:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89593

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89594

fbgt_else.89593:
fbgt_cont.89594:
	flw	%f3, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89595

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89596

fbgt_else.89595:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89596:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89597

	nop
	nop
	nop
	j	bnei_cont.89598

bnei_else.89597:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89598:
	flw	%f4, 53(%sp)
	flw	%f5, 42(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89599

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89600

fbgt_else.89599:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89600:
	flw	%f6, 56(%sp)
	fsw	%f0, 57(%sp)
	fabs	%f4, %f4
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

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89601

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89603

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89605

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89607

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89609

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89611

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89613

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89615

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89617

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89619

	flw	%f7, 478(%zero)
	sw	%ra, 62(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89619:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89620:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89617:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89618:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89615:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89616:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89613:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89614:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89611:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89612:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89609:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89610:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89607:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89608:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89605:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89606:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89603:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89604:
	nop
	nop
	nop
	j	fbgt_cont.89602

fbgt_else.89601:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89602:
	flw	%f1, 61(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89621

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89623

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89625

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89627

	sw	%ra, 62(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89622

fbgt_else.89627:
	sw	%ra, 62(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 63
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	nop
	nop
	nop

fbgt_cont.89628:
	nop
	nop
	nop
	j	fbgt_cont.89622

fbgt_else.89625:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89626:
	nop
	nop
	nop
	j	fbgt_cont.89622

fbgt_else.89623:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89629

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89631

	sw	%ra, 62(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89630

fbgt_else.89631:
	sw	%ra, 62(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 63
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	nop
	nop
	nop

fbgt_cont.89632:
	nop
	nop
	nop
	j	fbgt_cont.89630

fbgt_else.89629:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89630:
fbgt_cont.89624:
	nop
	nop
	nop
	j	fbgt_cont.89622

fbgt_else.89621:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89622:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89633

	lw	%v0, 60(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89635

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89634

bnei_else.89635:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89636:
	nop
	nop
	nop
	j	fbgt_cont.89634

fbgt_else.89633:
	lw	%v0, 60(%sp)
	nop
	nop
	nop

fbgt_cont.89634:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89637

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89638

fbgt_else.89637:
fbgt_cont.89638:
	flw	%f2, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89639

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89640

fbgt_else.89639:
fbgt_cont.89640:
	flw	%f3, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89641

	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fmul	%f4, %f0, %f0
	nop

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

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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
	nop
	j	fbgt_cont.89642

fbgt_else.89641:
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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

fbgt_cont.89642:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89643

	nop
	nop
	nop
	j	bnei_cont.89644

bnei_else.89643:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89644:
	lw	%v0, 50(%sp)
	flw	%f6, 56(%sp)
	nop
	nop

	flw	%f4, 1(%v0)
	fsw	%f0, 62(%sp)
	nop
	nop

	fsw	%f4, 63(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 64(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.89645

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89647

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89649

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89651

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89653

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89655

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89657

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89659

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89661

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89663

	flw	%f7, 478(%zero)
	sw	%ra, 65(%sp)
	fmov	%f0, %f5
	nop

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
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89663:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89664:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89661:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89662:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89659:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89660:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89657:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89658:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89655:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89656:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89653:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89654:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89651:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89652:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89649:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89650:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89647:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89648:
	nop
	nop
	nop
	j	fbgt_cont.89646

fbgt_else.89645:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89646:
	flw	%f1, 64(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89665

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89667

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89669

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89671

	sw	%ra, 65(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89666

fbgt_else.89671:
	sw	%ra, 65(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

fbgt_cont.89672:
	nop
	nop
	nop
	j	fbgt_cont.89666

fbgt_else.89669:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89670:
	nop
	nop
	nop
	j	fbgt_cont.89666

fbgt_else.89667:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89673

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89675

	sw	%ra, 65(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89674

fbgt_else.89675:
	sw	%ra, 65(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

fbgt_cont.89676:
	nop
	nop
	nop
	j	fbgt_cont.89674

fbgt_else.89673:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89674:
fbgt_cont.89668:
	nop
	nop
	nop
	j	fbgt_cont.89666

fbgt_else.89665:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89666:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89677

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89678

fbgt_else.89677:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89678:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89679

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89680

fbgt_else.89679:
fbgt_cont.89680:
	flw	%f2, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89681

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89683

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89682

bnei_else.89683:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89684:
	nop
	nop
	nop
	j	fbgt_cont.89682

fbgt_else.89681:
fbgt_cont.89682:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89685

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89686

fbgt_else.89685:
fbgt_cont.89686:
	flw	%f3, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89687

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89688

fbgt_else.89687:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89688:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89689

	nop
	nop
	nop
	j	bnei_cont.89690

bnei_else.89689:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89690:
	flw	%f4, 63(%sp)
	flw	%f5, 42(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89691

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89692

fbgt_else.89691:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89692:
	flw	%f6, 56(%sp)
	fsw	%f0, 65(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 66(%sp)
	nop
	nop
	nop

	fsw	%f4, 67(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89693

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89695

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89697

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89699

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89701

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89703

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89705

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89707

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89709

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.89711

	flw	%f7, 478(%zero)
	sw	%ra, 68(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89711:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89712:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89709:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89710:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89707:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89708:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89705:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89706:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89703:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89704:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89701:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89702:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89699:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89700:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89697:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89698:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89695:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89696:
	nop
	nop
	nop
	j	fbgt_cont.89694

fbgt_else.89693:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89694:
	flw	%f1, 67(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89713

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89715

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89717

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89719

	sw	%ra, 68(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89714

fbgt_else.89719:
	sw	%ra, 68(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

fbgt_cont.89720:
	nop
	nop
	nop
	j	fbgt_cont.89714

fbgt_else.89717:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89718:
	nop
	nop
	nop
	j	fbgt_cont.89714

fbgt_else.89715:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89721

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89723

	sw	%ra, 68(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89722

fbgt_else.89723:
	sw	%ra, 68(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

fbgt_cont.89724:
	nop
	nop
	nop
	j	fbgt_cont.89722

fbgt_else.89721:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89722:
fbgt_cont.89716:
	nop
	nop
	nop
	j	fbgt_cont.89714

fbgt_else.89713:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89714:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89725

	lw	%v0, 66(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89727

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89726

bnei_else.89727:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89728:
	nop
	nop
	nop
	j	fbgt_cont.89726

fbgt_else.89725:
	lw	%v0, 66(%sp)
	nop
	nop
	nop

fbgt_cont.89726:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89729

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89730

fbgt_else.89729:
fbgt_cont.89730:
	flw	%f2, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89731

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89732

fbgt_else.89731:
fbgt_cont.89732:
	flw	%f3, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89733

	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fmul	%f4, %f0, %f0
	nop

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

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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
	nop
	j	fbgt_cont.89734

fbgt_else.89733:
	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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

fbgt_cont.89734:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89735

	nop
	nop
	nop
	j	bnei_cont.89736

bnei_else.89735:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89736:
	lw	%v0, 50(%sp)
	flw	%f6, 56(%sp)
	nop
	nop

	flw	%f4, 2(%v0)
	fsw	%f0, 68(%sp)
	nop
	nop

	fsw	%f4, 69(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.89737

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89739

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89741

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89743

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89745

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89747

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89749

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89751

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89753

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.89755

	flw	%f7, 478(%zero)
	sw	%ra, 71(%sp)
	fmov	%f0, %f5
	nop

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
	addi	%sp, %sp, -72
	nop

	lw	%ra, 71(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89755:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89756:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89753:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89754:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89751:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89752:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89749:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89750:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89747:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89748:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89745:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89746:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89743:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89744:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89741:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89742:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89739:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.89740:
	nop
	nop
	nop
	j	fbgt_cont.89738

fbgt_else.89737:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89738:
	flw	%f1, 70(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89757

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89759

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89761

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89763

	sw	%ra, 71(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -72
	nop

	lw	%ra, 71(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89758

fbgt_else.89763:
	sw	%ra, 71(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 72
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -72
	nop

	lw	%ra, 71(%sp)
	nop
	nop
	nop

fbgt_cont.89764:
	nop
	nop
	nop
	j	fbgt_cont.89758

fbgt_else.89761:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89762:
	nop
	nop
	nop
	j	fbgt_cont.89758

fbgt_else.89759:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89765

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89767

	sw	%ra, 71(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -72
	nop

	lw	%ra, 71(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89766

fbgt_else.89767:
	sw	%ra, 71(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 72
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -72
	nop

	lw	%ra, 71(%sp)
	nop
	nop
	nop

fbgt_cont.89768:
	nop
	nop
	nop
	j	fbgt_cont.89766

fbgt_else.89765:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89766:
fbgt_cont.89760:
	nop
	nop
	nop
	j	fbgt_cont.89758

fbgt_else.89757:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89758:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89769

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89770

fbgt_else.89769:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.89770:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89771

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89772

fbgt_else.89771:
fbgt_cont.89772:
	flw	%f2, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89773

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89775

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89774

bnei_else.89775:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89776:
	nop
	nop
	nop
	j	fbgt_cont.89774

fbgt_else.89773:
fbgt_cont.89774:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89777

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89778

fbgt_else.89777:
fbgt_cont.89778:
	flw	%f3, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.89779

	flw	%f5, 491(%zero)
	flw	%f6, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 470(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 469(%zero)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	j	fbgt_cont.89780

fbgt_else.89779:
	flw	%f6, 474(%zero)
	flw	%f7, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 472(%zero)
	nop
	fadd	%f6, %f6, %f7
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

fbgt_cont.89780:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89781

	nop
	nop
	nop
	j	bnei_cont.89782

bnei_else.89781:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89782:
	flw	%f4, 69(%sp)
	flw	%f5, 42(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89783

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89784

fbgt_else.89783:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.89784:
	flw	%f5, 56(%sp)
	fsw	%f0, 71(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 72(%sp)
	nop
	nop
	nop

	fsw	%f4, 73(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.89785

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89787

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89789

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89791

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89793

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89795

	flw	%f6, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89797

	flw	%f6, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89799

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89801

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.89803

	flw	%f6, 478(%zero)
	sw	%ra, 74(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89803:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89804:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89801:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89802:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89799:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89800:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89797:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89798:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89795:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89796:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89793:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89794:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89791:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89792:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89789:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89790:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89787:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.89788:
	nop
	nop
	nop
	j	fbgt_cont.89786

fbgt_else.89785:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.89786:
	flw	%f1, 73(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89805

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89807

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.89809

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89811

	sw	%ra, 74(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89806

fbgt_else.89811:
	sw	%ra, 74(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 75
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

fbgt_cont.89812:
	nop
	nop
	nop
	j	fbgt_cont.89806

fbgt_else.89809:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89810:
	nop
	nop
	nop
	j	fbgt_cont.89806

fbgt_else.89807:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.89813

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89815

	sw	%ra, 74(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.89814

fbgt_else.89815:
	sw	%ra, 74(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 75
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

fbgt_cont.89816:
	nop
	nop
	nop
	j	fbgt_cont.89814

fbgt_else.89813:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89814:
fbgt_cont.89808:
	nop
	nop
	nop
	j	fbgt_cont.89806

fbgt_else.89805:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.89806:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89817

	lw	%v0, 72(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89819

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89818

bnei_else.89819:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.89820:
	nop
	nop
	nop
	j	fbgt_cont.89818

fbgt_else.89817:
	lw	%v0, 72(%sp)
	nop
	nop
	nop

fbgt_cont.89818:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89821

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.89822

fbgt_else.89821:
fbgt_cont.89822:
	flw	%f2, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.89823

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89824

fbgt_else.89823:
fbgt_cont.89824:
	flw	%f1, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89825

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.89826

fbgt_else.89825:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.89826:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89827

	nop
	nop
	nop
	j	bnei_cont.89828

bnei_else.89827:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.89828:
	flw	%f1, 71(%sp)
	flw	%f2, 65(%sp)
	nop
	nop

	flw	%f4, 68(%sp)
	flw	%f5, 62(%sp)
	fmul	%f3, %f2, %f1
	nop

	flw	%f8, 57(%sp)
	lw	%v0, 44(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f11, %f5, %f0

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

	flw	%f9, 2(%v0)
	nop
	fmul	%f12, %f8, %f1
	fmul	%f0, %f9, %f0

	nop
	nop
	fadd	%f6, %f6, %f12
	fmul	%f1, %f5, %f1

	nop
	nop
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4

	flw	%f5, 0(%v0)
	flw	%f8, 1(%v0)
	fmul	%f4, %f5, %f2
	fmul	%f2, %f8, %f2

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

	fsw	%f12, 0(%v0)
	nop
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

	fsw	%f12, 1(%v0)
	nop
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

	lw	%v0, 50(%sp)
	nop
	fadd	%f13, %f13, %f14
	fmul	%f14, %f9, %f4

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

	fsw	%f13, 0(%v0)
	nop
	fadd	%f0, %f0, %f2
	fmul	%f2, %f8, %f6

	nop
	nop
	fmul	%f0, %f12, %f0
	fmul	%f1, %f1, %f4

	fsw	%f0, 1(%v0)
	nop
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

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89552

bnei_else.89551:
bnei_cont.89552:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.89496

bnei_else.89495:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.89496:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.89829

	lw	%v0, 37(%sp)
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
	j	read_object.2772

bnei_else.89829:
	lw	%v0, 37(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.89492:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
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
	addi	%v1, %zero, -1

	lw	%ra, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89832

	lw	%a0, 0(%sp)
	sw	%v0, 1(%sp)
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%a1, %a0, 1
	nop

	sw	%a1, 3(%sp)
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
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89833

	lw	%v1, 3(%sp)
	sw	%v0, 4(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %v1, 1
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
	beqi	%v0, -1, bnei_else.89835

	lw	%v1, 5(%sp)
	sw	%v0, 6(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %v1, 1
	nop

	sw	%a0, 7(%sp)
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
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89837

	lw	%v1, 7(%sp)
	sw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 9(%sp)
	nop
	addi	%a0, %v1, 1
	nop

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
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v1, 7(%sp)
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
	j	bnei_cont.89838

bnei_else.89837:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
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

bnei_cont.89838:
	lw	%v1, 5(%sp)
	lw	%a0, 6(%sp)
	nop
	nop

	nop
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
	j	bnei_cont.89836

bnei_else.89835:
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
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

bnei_cont.89836:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	nop
	nop

	nop
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
	j	bnei_cont.89834

bnei_else.89833:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
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

bnei_cont.89834:
	lw	%v1, 0(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	nop
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

bnei_else.89832:
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

read_or_network.2778:
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
	addi	%v1, %zero, -1

	lw	%ra, 1(%sp)
	sw	%v1, 1(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89839

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
	beqi	%v0, -1, bnei_else.89841

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
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89843

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %zero, 3
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
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89844

bnei_else.89843:
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %zero, 3
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
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.89844:
	lw	%v1, 3(%sp)
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
	j	bnei_cont.89842

bnei_else.89841:
	lw	%v1, 1(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %zero, 2
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
	nop

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.89842:
	lw	%v1, 2(%sp)
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
	j	bnei_cont.89840

bnei_else.89839:
	sw	%ra, 5(%sp)
	nop
	addi	%v0, %zero, 1
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
	addi	%v1, %v0, 0

	lw	%ra, 5(%sp)
	nop
	nop
	nop

bnei_cont.89840:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89845

	lw	%a0, 0(%sp)
	sw	%v1, 5(%sp)
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%a1, %a0, 1
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

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89846

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
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89848

	sw	%v0, 9(%sp)
	nop
	addi	%v1, %zero, 2
	nop

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
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89849

bnei_else.89848:
	lw	%v1, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%v0, %zero, 2
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
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.89849:
	lw	%v1, 8(%sp)
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
	j	bnei_cont.89847

bnei_else.89846:
	lw	%v0, 7(%sp)
	lw	%v1, 1(%sp)
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
	addi	%v1, %v0, 0

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.89847:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89850

	lw	%v0, 6(%sp)
	sw	%v1, 10(%sp)
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	addi	%a0, %v0, 1
	nop

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
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 10(%sp)
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
	j	bnei_cont.89851

bnei_else.89850:
	lw	%v0, 6(%sp)
	sw	%ra, 11(%sp)
	nop
	nop

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
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

bnei_cont.89851:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
	nop
	nop

	nop
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

bnei_else.89845:
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

read_and_network.2780:
	nop
	nop
	addi	%v1, %zero, 0
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
	addi	%v1, %zero, -1

	lw	%ra, 2(%sp)
	sw	%v1, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89852

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
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.89854

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
	beqi	%v0, -1, bnei_else.89856

	sw	%v0, 5(%sp)
	nop
	addi	%v1, %zero, 3
	nop

	sw	%ra, 6(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89857

bnei_else.89856:
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%v0, %zero, 3
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
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.89857:
	lw	%v1, 4(%sp)
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
	j	bnei_cont.89855

bnei_else.89854:
	lw	%v1, 2(%sp)
	sw	%ra, 6(%sp)
	addi	%v0, %zero, 2
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
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.89855:
	lw	%v1, 3(%sp)
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
	j	bnei_cont.89853

bnei_else.89852:
	sw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 1
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
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

bnei_cont.89853:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.89858

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	sw	%v0, 83(%v1)
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	addi	%v1, %v1, 1
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

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89859

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
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89861

	sw	%v0, 9(%sp)
	nop
	addi	%v1, %zero, 2
	nop

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
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v1, 9(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89862

bnei_else.89861:
	lw	%v1, 2(%sp)
	sw	%ra, 10(%sp)
	addi	%v0, %zero, 2
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
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.89862:
	lw	%v1, 8(%sp)
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
	j	bnei_cont.89860

bnei_else.89859:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
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
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.89860:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.89863

	lw	%v1, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 83(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, 1
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
	jal	min_caml_read_int

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
	beqi	%v0, -1, bnei_else.89864

	lw	%v1, 7(%sp)
	sw	%v0, 11(%sp)
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v1, 11(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89865

bnei_else.89864:
	lw	%v0, 7(%sp)
	lw	%v1, 2(%sp)
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
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

bnei_cont.89865:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.89866

	lw	%v1, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 83(%v1)
	nop
	nop
	nop

	lw	%v1, 0(%sp)
	nop
	addi	%v0, %v1, 1
	nop

	sw	%v0, 12(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	read_net_item.2776

	lw	%v1, 0(%v0)
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
	beqi	%v1, -1, bnei_else.89867

	lw	%v1, 12(%sp)
	nop
	nop
	nop

	sw	%v0, 83(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, 1
	nop

	nop
	nop
	nop
	j	read_and_network.2780

bnei_else.89867:
	nop
	nop
	nop
	jr	%ra

bnei_else.89866:
	nop
	nop
	nop
	jr	%ra

bnei_else.89863:
	nop
	nop
	nop
	jr	%ra

bnei_else.89858:
	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.89872

	lw	%a0, 12(%v1)
	lw	%a1, 1(%v0)
	nop
	nop

	lw	%a2, 0(%v0)
	lw	%a3, 1(%a0)
	nop
	nop

	sw	%v0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.89873

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.89875

	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	addi	%a3, %zero, 5
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v0, %a3, 0
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
	nop

	lw	%ra, 6(%sp)
	lw	%v1, 5(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%sp)
	fmul	%f3, %f0, %f0
	nop

	lw	%a0, 4(%v1)
	nop
	nop
	nop

	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1

	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

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
	beqi	%a0, 0, bnei_else.89877

	lw	%a0, 9(%v1)
	nop
	fmul	%f4, %f1, %f2
	nop

	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	flw	%f5, 2(%a0)
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

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
	j	bnei_cont.89878

bnei_else.89877:
bnei_cont.89878:
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)
	nop
	nop

	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)
	fmul	%f4, %f0, %f4
	nop

	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)
	fneg	%f4, %f4
	fmul	%f5, %f1, %f5

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	fneg	%f6, %f6
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89879

	lw	%a0, 9(%v1)
	nop
	nop
	nop

	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)
	nop
	nop

	flw	%f9, 2(%a0)
	lw	%v1, 9(%v1)
	fmul	%f8, %f2, %f7
	nop

	nop
	nop
	fmul	%f10, %f1, %f9
	nop

	flw	%f10, 471(%zero)
	nop
	fadd	%f8, %f8, %f10
	nop

	nop
	nop
	fmul	%f8, %f8, %f10
	nop

	nop
	nop
	fsub	%f4, %f4, %f8
	fmul	%f8, %f0, %f9

	fsw	%f4, 1(%v0)
	flw	%f4, 0(%v1)
	fmul	%f0, %f0, %f7
	nop

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

	fsw	%f2, 2(%v0)
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
	j	bnei_cont.89880

bnei_else.89879:
	fsw	%f4, 1(%v0)
	nop
	nop
	nop

	fsw	%f5, 2(%v0)
	nop
	nop
	nop

	fsw	%f6, 3(%v0)
	nop
	nop
	nop

bnei_cont.89880:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.89881

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89882

fbeq_else.89881:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89882:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89883

	nop
	nop
	nop
	j	bnei_cont.89884

bnei_else.89883:
	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.89884:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
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
	j	bnei_cont.89874

bnei_else.89875:
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	addi	%a3, %zero, 4
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v0, %a3, 0
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

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -8
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

	flw	%f3, 1(%a1)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%a0)
	fadd	%f0, %f0, %f2
	nop

	flw	%f4, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f2, %f2, %f4
	nop

	flw	%f2, 6(%sp)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.89885

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89886

fbgt_else.89885:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89886:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89887

	flw	%f2, 490(%zero)
	nop
	fdiv	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f2, %f2, %f0
	fneg	%f1, %f1

	fsw	%f2, 0(%v0)
	nop
	nop
	nop

	fsw	%f1, 1(%v0)
	nop
	fdiv	%f1, %f3, %f0
	fdiv	%f0, %f4, %f0

	nop
	nop
	fneg	%f1, %f1
	fneg	%f0, %f0

	fsw	%f1, 2(%v0)
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
	j	bnei_cont.89888

bnei_else.89887:
	fsw	%f2, 0(%v0)
	nop
	nop
	nop

bnei_cont.89888:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
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

bnei_cont.89876:
	nop
	nop
	nop
	j	bnei_cont.89874

bnei_else.89873:
	flw	%f0, 493(%zero)
	sw	%v1, 1(%sp)
	addi	%a3, %zero, 6
	nop

	sw	%a1, 2(%sp)
	nop
	addi	%v0, %a3, 0
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
	lw	%v1, 5(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89889

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89890

fbeq_else.89889:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.89890:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89891

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89892

bnei_else.89891:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	lw	%a1, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89893

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89894

fbgt_else.89893:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.89894:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89895

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89897

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89896

bnei_else.89897:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.89898:
	nop
	nop
	nop
	j	bnei_cont.89896

bnei_else.89895:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.89896:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f2, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89899

	nop
	nop
	nop
	j	bnei_cont.89900

bnei_else.89899:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.89900:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.89892:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89901

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89902

fbeq_else.89901:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.89902:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89903

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89904

bnei_else.89903:
	lw	%a0, 4(%sp)
	nop
	nop
	nop

	lw	%a1, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89905

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89906

fbgt_else.89905:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.89906:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89907

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89909

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89908

bnei_else.89909:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.89910:
	nop
	nop
	nop
	j	bnei_cont.89908

bnei_else.89907:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.89908:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f2, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89911

	nop
	nop
	nop
	j	bnei_cont.89912

bnei_else.89911:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.89912:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.89904:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89913

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89914

fbeq_else.89913:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89914:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89915

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89916

bnei_else.89915:
	lw	%v1, 4(%sp)
	nop
	nop
	nop

	lw	%a0, 6(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89917

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89918

fbgt_else.89917:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.89918:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89919

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89921

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89920

bnei_else.89921:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.89922:
	nop
	nop
	nop
	j	bnei_cont.89920

bnei_else.89919:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.89920:
	lw	%v1, 4(%v1)
	nop
	nop
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89923

	nop
	nop
	nop
	j	bnei_cont.89924

bnei_else.89923:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.89924:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.89916:
	lw	%v1, 1(%sp)
	lw	%a0, 2(%sp)
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

bnei_cont.89874:
	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.89925

	lw	%v1, 12(%v0)
	lw	%a0, 0(%sp)
	nop
	nop

	lw	%a1, 1(%a0)
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
	beqi	%a3, 1, bnei_else.89926

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.89928

	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	addi	%a3, %zero, 5
	nop

	sw	%a1, 9(%sp)
	nop
	addi	%v0, %a3, 0
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

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	lw	%v1, 12(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 11(%sp)
	fmul	%f3, %f0, %f0
	nop

	lw	%a0, 4(%v1)
	nop
	nop
	nop

	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1

	flw	%f5, 2(%a0)
	lw	%a0, 3(%v1)
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

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
	beqi	%a0, 0, bnei_else.89930

	lw	%a0, 9(%v1)
	nop
	fmul	%f4, %f1, %f2
	nop

	flw	%f5, 0(%a0)
	lw	%a0, 9(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 9(%v1)
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f0

	flw	%f5, 2(%a0)
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f0, %f1

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
	j	bnei_cont.89931

bnei_else.89930:
bnei_cont.89931:
	lw	%a0, 4(%v1)
	fsw	%f3, 0(%v0)
	nop
	nop

	flw	%f4, 0(%a0)
	lw	%a0, 4(%v1)
	nop
	nop

	flw	%f5, 1(%a0)
	lw	%a0, 4(%v1)
	fmul	%f4, %f0, %f4
	nop

	flw	%f6, 2(%a0)
	lw	%a0, 3(%v1)
	fneg	%f4, %f4
	fmul	%f5, %f1, %f5

	nop
	nop
	fneg	%f5, %f5
	fmul	%f6, %f2, %f6

	nop
	nop
	fneg	%f6, %f6
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89932

	lw	%a0, 9(%v1)
	nop
	nop
	nop

	flw	%f7, 1(%a0)
	lw	%a0, 9(%v1)
	nop
	nop

	flw	%f8, 2(%a0)
	lw	%a0, 9(%v1)
	fmul	%f7, %f2, %f7
	nop

	nop
	nop
	fmul	%f8, %f1, %f8
	nop

	flw	%f8, 471(%zero)
	nop
	fadd	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fsub	%f4, %f4, %f7
	nop

	fsw	%f4, 1(%v0)
	flw	%f4, 0(%a0)
	nop
	nop

	lw	%a0, 9(%v1)
	nop
	fmul	%f2, %f2, %f4
	nop

	flw	%f4, 2(%a0)
	lw	%a0, 9(%v1)
	nop
	nop

	lw	%v1, 9(%v1)
	nop
	fmul	%f4, %f0, %f4
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

	fsw	%f2, 2(%v0)
	flw	%f2, 0(%a0)
	nop
	nop

	flw	%f2, 1(%v1)
	nop
	fmul	%f1, %f1, %f2
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

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89933

bnei_else.89932:
	fsw	%f4, 1(%v0)
	nop
	nop
	nop

	fsw	%f5, 2(%v0)
	nop
	nop
	nop

	fsw	%f6, 3(%v0)
	nop
	nop
	nop

bnei_cont.89933:
	flw	%f0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.89934

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89935

fbeq_else.89934:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89935:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89936

	nop
	nop
	nop
	j	bnei_cont.89937

bnei_else.89936:
	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	fsw	%f0, 4(%v0)
	nop
	nop
	nop

bnei_cont.89937:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
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
	j	bnei_cont.89927

bnei_else.89928:
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	addi	%a3, %zero, 4
	nop

	sw	%a1, 9(%sp)
	nop
	addi	%v0, %a3, 0
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

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v1, 12(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%a0, 11(%sp)
	nop
	nop

	lw	%a1, 4(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%a1)
	lw	%a1, 4(%a0)
	nop
	nop

	flw	%f1, 1(%v1)
	flw	%f2, 1(%a1)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	lw	%v1, 4(%a0)
	fadd	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 13(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.89938

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89939

fbgt_else.89938:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.89939:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89940

	flw	%f1, 490(%zero)
	lw	%v1, 4(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f0
	nop

	fsw	%f1, 0(%v0)
	flw	%f1, 0(%v1)
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
	flw	%f1, 1(%v1)
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
	flw	%f1, 2(%v1)
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
	j	bnei_cont.89941

bnei_else.89940:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.89941:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
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

bnei_cont.89929:
	nop
	nop
	nop
	j	bnei_cont.89927

bnei_else.89926:
	flw	%f0, 493(%zero)
	sw	%v0, 8(%sp)
	addi	%a3, %zero, 6
	nop

	sw	%a1, 9(%sp)
	nop
	addi	%v0, %a3, 0
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
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89942

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89943

fbeq_else.89942:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.89943:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89944

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89945

bnei_else.89944:
	lw	%a0, 11(%sp)
	nop
	nop
	nop

	lw	%a1, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89946

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89947

fbgt_else.89946:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.89947:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89948

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89950

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89949

bnei_else.89950:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.89951:
	nop
	nop
	nop
	j	bnei_cont.89949

bnei_else.89948:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.89949:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f2, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89952

	nop
	nop
	nop
	j	bnei_cont.89953

bnei_else.89952:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.89953:
	fsw	%f2, 0(%v0)
	flw	%f2, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

bnei_cont.89945:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89954

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89955

fbeq_else.89954:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.89955:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89956

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89957

bnei_else.89956:
	lw	%a0, 11(%sp)
	nop
	nop
	nop

	lw	%a1, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89958

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89959

fbgt_else.89958:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.89959:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89960

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.89962

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89961

bnei_else.89962:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.89963:
	nop
	nop
	nop
	j	bnei_cont.89961

bnei_else.89960:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.89961:
	lw	%a2, 4(%a0)
	nop
	nop
	nop

	flw	%f2, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89964

	nop
	nop
	nop
	j	bnei_cont.89965

bnei_else.89964:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.89965:
	fsw	%f2, 2(%v0)
	flw	%f2, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

	fsw	%f0, 3(%v0)
	nop
	nop
	nop

bnei_cont.89957:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.89966

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.89967

fbeq_else.89966:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.89967:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.89968

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.89969

bnei_else.89968:
	lw	%v1, 11(%sp)
	nop
	nop
	nop

	lw	%a0, 6(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.89970

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.89971

fbgt_else.89970:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.89971:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89972

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.89974

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89973

bnei_else.89974:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.89975:
	nop
	nop
	nop
	j	bnei_cont.89973

bnei_else.89972:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.89973:
	lw	%v1, 4(%v1)
	nop
	nop
	nop

	flw	%f1, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.89976

	nop
	nop
	nop
	j	bnei_cont.89977

bnei_else.89976:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.89977:
	fsw	%f1, 4(%v0)
	flw	%f1, 491(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.89969:
	lw	%v1, 8(%sp)
	lw	%a0, 9(%sp)
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

bnei_cont.89927:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.89925:
	nop
	nop
	nop
	jr	%ra

bgti_else.89872:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.89980

	lw	%a0, 12(%v1)
	flw	%f0, 0(%v0)
	nop
	nop

	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)
	nop
	nop

	lw	%a3, 5(%a0)
	nop
	nop
	nop

	flw	%f1, 0(%a3)
	lw	%a3, 5(%a0)
	nop
	nop

	flw	%f1, 1(%a3)
	lw	%a3, 5(%a0)
	fsub	%f0, %f0, %f1
	nop

	fsw	%f0, 0(%a1)
	flw	%f0, 1(%v0)
	nop
	nop

	flw	%f1, 2(%a3)
	nop
	fsub	%f0, %f0, %f1
	nop

	fsw	%f0, 1(%a1)
	flw	%f0, 2(%v0)
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
	beqi	%a2, 2, bnei_else.89981

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.89983

	nop
	nop
	nop
	j	bnei_cont.89982

bgt_else.89983:
	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	nop
	nop

	flw	%f2, 2(%a1)
	lw	%a3, 4(%a0)
	fmul	%f3, %f0, %f0
	nop

	flw	%f4, 0(%a3)
	lw	%a3, 4(%a0)
	nop
	nop

	flw	%f5, 1(%a3)
	lw	%a3, 4(%a0)
	fmul	%f3, %f3, %f4
	fmul	%f4, %f1, %f1

	flw	%f5, 2(%a3)
	lw	%a3, 3(%a0)
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	fmul	%f4, %f2, %f2

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
	beqi	%a3, 0, bnei_else.89985

	lw	%a3, 9(%a0)
	nop
	fmul	%f4, %f1, %f2
	fmul	%f2, %f2, %f0

	flw	%f5, 0(%a3)
	lw	%a3, 9(%a0)
	fmul	%f0, %f0, %f1
	nop

	lw	%a0, 9(%a0)
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f4, 1(%a3)
	flw	%f1, 2(%a0)
	fadd	%f3, %f3, %f4
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
	j	bnei_cont.89986

bnei_else.89985:
	nop
	nop
	fmov	%f0, %f3
	nop

bnei_cont.89986:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.89987

	nop
	nop
	nop
	j	bnei_cont.89988

bnei_else.89987:
	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.89988:
	fsw	%f0, 3(%a1)
	nop
	nop
	nop

bgt_cont.89984:
	nop
	nop
	nop
	j	bnei_cont.89982

bnei_else.89981:
	lw	%a0, 4(%a0)
	flw	%f0, 0(%a1)
	nop
	nop

	flw	%f1, 1(%a1)
	flw	%f2, 2(%a1)
	nop
	nop

	flw	%f3, 0(%a0)
	nop
	nop
	nop

	flw	%f3, 1(%a0)
	nop
	fmul	%f0, %f3, %f0
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	flw	%f1, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
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

bnei_cont.89982:
	nop
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	setup_startp_constants.2882

bgti_else.89980:
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
	beqi	%a0, -1, bnei_else.89990

	lw	%a0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	nop
	nop
	nop

	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)
	nop
	nop

	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)
	fsub	%f3, %f0, %f3
	nop

	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)
	fsub	%f4, %f1, %f4
	nop

	nop
	nop
	fsub	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.89991

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.89993

	lw	%a1, 4(%a0)
	nop
	fmul	%f6, %f3, %f3
	nop

	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)
	nop
	nop

	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4

	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

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
	beqi	%a1, 0, bnei_else.89995

	lw	%a1, 9(%a0)
	nop
	fmul	%f7, %f4, %f5
	fmul	%f5, %f5, %f3

	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	nop

	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)
	fadd	%f6, %f6, %f7
	nop

	flw	%f4, 2(%a1)
	nop
	fmul	%f5, %f5, %f7
	nop

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	fadd	%f3, %f5, %f3
	nop

	nop
	nop
	nop
	j	bnei_cont.89996

bnei_else.89995:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.89996:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.89997

	nop
	nop
	nop
	j	bnei_cont.89998

bnei_else.89997:
	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.89998:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.89999

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90000

fbgt_else.89999:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90000:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90001

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90003

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90002

bnei_else.90003:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90004:
	nop
	nop
	nop
	j	bnei_cont.90002

bnei_else.90001:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90002:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90005

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.89992

bnei_else.90005:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90006:
	nop
	nop
	nop
	j	bnei_cont.89992

bnei_else.89993:
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)
	nop
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	flw	%f6, 1(%a1)
	nop
	fmul	%f3, %f6, %f3
	nop

	nop
	nop
	fmul	%f4, %f6, %f4
	nop

	flw	%f4, 2(%a1)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f4, 493(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90007

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90008

fbgt_else.90007:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90008:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90009

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90011

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90010

bnei_else.90011:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90012:
	nop
	nop
	nop
	j	bnei_cont.90010

bnei_else.90009:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90010:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90013

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90014

bnei_else.90013:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90014:
bnei_cont.89994:
	nop
	nop
	nop
	j	bnei_cont.89992

bnei_else.89991:
	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f3
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.90015

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90016

fbgt_else.90015:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90016:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90017

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f4
	nop

	flw	%f4, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90019

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90020

fbgt_else.90019:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90020:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90021

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f5
	nop

	flw	%f4, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90023

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90018

fbgt_else.90023:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90024:
	nop
	nop
	nop
	j	bnei_cont.90018

bnei_else.90021:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90022:
	nop
	nop
	nop
	j	bnei_cont.90018

bnei_else.90017:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90018:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90025

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90026

bnei_else.90025:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90027

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90028

bnei_else.90027:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90028:
bnei_cont.90026:
bnei_cont.89992:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90029

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90029:
	nop
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
	beqi	%a0, -1, bnei_else.90030

	lw	%a0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	nop
	nop
	nop

	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)
	nop
	nop

	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)
	fsub	%f3, %f0, %f3
	nop

	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)
	fsub	%f4, %f1, %f4
	nop

	nop
	nop
	fsub	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.90031

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.90033

	lw	%a1, 4(%a0)
	nop
	fmul	%f6, %f3, %f3
	nop

	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)
	nop
	nop

	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4

	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

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
	beqi	%a1, 0, bnei_else.90035

	lw	%a1, 9(%a0)
	nop
	fmul	%f7, %f4, %f5
	fmul	%f5, %f5, %f3

	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	nop

	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)
	fadd	%f6, %f6, %f7
	nop

	flw	%f4, 2(%a1)
	nop
	fmul	%f5, %f5, %f7
	nop

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	fadd	%f3, %f5, %f3
	nop

	nop
	nop
	nop
	j	bnei_cont.90036

bnei_else.90035:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.90036:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.90037

	nop
	nop
	nop
	j	bnei_cont.90038

bnei_else.90037:
	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.90038:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90039

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90040

fbgt_else.90039:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90040:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90041

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90043

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90042

bnei_else.90043:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90044:
	nop
	nop
	nop
	j	bnei_cont.90042

bnei_else.90041:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90042:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90045

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90032

bnei_else.90045:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90046:
	nop
	nop
	nop
	j	bnei_cont.90032

bnei_else.90033:
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)
	nop
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	flw	%f6, 1(%a1)
	nop
	fmul	%f3, %f6, %f3
	nop

	nop
	nop
	fmul	%f4, %f6, %f4
	nop

	flw	%f4, 2(%a1)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f4, 493(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90047

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90048

fbgt_else.90047:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90048:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90049

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90051

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90050

bnei_else.90051:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90052:
	nop
	nop
	nop
	j	bnei_cont.90050

bnei_else.90049:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90050:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90053

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90054

bnei_else.90053:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90054:
bnei_cont.90034:
	nop
	nop
	nop
	j	bnei_cont.90032

bnei_else.90031:
	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f3
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.90055

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90056

fbgt_else.90055:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90056:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90057

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f4
	nop

	flw	%f4, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90059

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90060

fbgt_else.90059:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90060:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90061

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f5
	nop

	flw	%f4, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90063

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90058

fbgt_else.90063:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90064:
	nop
	nop
	nop
	j	bnei_cont.90058

bnei_else.90061:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90062:
	nop
	nop
	nop
	j	bnei_cont.90058

bnei_else.90057:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90058:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90065

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90066

bnei_else.90065:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90067

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90068

bnei_else.90067:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90068:
bnei_cont.90066:
bnei_cont.90032:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90069

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90069:
	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	check_all_inside.2907

bnei_else.90030:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.89990:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_and_group.2913:
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
	beqi	%a0, -1, bnei_else.90070

	lw	%a1, 12(%a0)
	flw	%f0, 138(%zero)
	nop
	nop

	lw	%a2, 5(%a1)
	flw	%f2, 139(%zero)
	nop
	nop

	flw	%f1, 0(%a2)
	lw	%a3, 5(%a1)
	addi	%a2, %zero, 1
	nop

	flw	%f3, 1(%a3)
	flw	%f4, 140(%zero)
	fsub	%f1, %f0, %f1
	nop

	lw	%a3, 5(%a1)
	lw	%a0, 187(%a0)
	fsub	%f3, %f2, %f3
	nop

	flw	%f5, 2(%a3)
	lw	%a3, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f5, %f4, %f5
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.90071

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.90073

	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.90075

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90076

fbeq_else.90075:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90076:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90077

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90072

bnei_else.90077:
	flw	%f8, 1(%a0)
	flw	%f9, 2(%a0)
	nop
	nop

	lw	%a3, 4(%a1)
	nop
	fmul	%f8, %f8, %f1
	fmul	%f9, %f9, %f3

	flw	%f9, 3(%a0)
	flw	%f10, 0(%a3)
	fadd	%f8, %f8, %f9
	nop

	lw	%a3, 4(%a1)
	nop
	fmul	%f9, %f9, %f5
	nop

	flw	%f11, 1(%a3)
	lw	%a3, 4(%a1)
	fadd	%f8, %f8, %f9
	fmul	%f9, %f1, %f1

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f3

	flw	%f11, 2(%a3)
	lw	%a3, 3(%a1)
	fmul	%f10, %f10, %f11
	nop

	nop
	nop
	fadd	%f9, %f9, %f10
	fmul	%f10, %f5, %f5

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
	nop
	beqi	%a3, 0, bnei_else.90079

	lw	%a3, 9(%a1)
	nop
	fmul	%f10, %f3, %f5
	fmul	%f5, %f5, %f1

	flw	%f11, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f10, %f10, %f11
	nop

	flw	%f10, 1(%a3)
	lw	%a3, 9(%a1)
	fadd	%f9, %f9, %f10
	nop

	flw	%f3, 2(%a3)
	nop
	fmul	%f5, %f5, %f10
	nop

	nop
	nop
	fadd	%f5, %f9, %f5
	fmul	%f1, %f1, %f3

	nop
	nop
	fadd	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.90080

bnei_else.90079:
	nop
	nop
	fmov	%f1, %f9
	nop

bnei_cont.90080:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.90081

	nop
	nop
	nop
	j	bnei_cont.90082

bnei_else.90081:
	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f3
	nop

bnei_cont.90082:
	nop
	nop
	fmul	%f3, %f8, %f8
	fmul	%f1, %f6, %f1

	nop
	nop
	fsub	%f1, %f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f7, %f1, fbgt_else.90083

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90084

fbgt_else.90083:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90084:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90085

	lw	%a3, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90087

	flw	%f3, 4(%a0)
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	fadd	%f1, %f8, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	nop

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90088

bnei_else.90087:
	flw	%f3, 4(%a0)
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	fsub	%f1, %f8, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	nop

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

bnei_cont.90088:
	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90086

bnei_else.90085:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90086:
bnei_cont.90078:
	nop
	nop
	nop
	j	bnei_cont.90072

bnei_else.90073:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.90089

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90090

fbgt_else.90089:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90090:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90091

	flw	%f6, 1(%a0)
	nop
	nop
	nop

	flw	%f6, 2(%a0)
	nop
	fmul	%f1, %f6, %f1
	nop

	nop
	nop
	fmul	%f3, %f6, %f3
	nop

	flw	%f3, 3(%a0)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f5
	nop

	nop
	nop
	fadd	%f1, %f1, %f3
	nop

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90092

bnei_else.90091:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90092:
bnei_cont.90074:
	nop
	nop
	nop
	j	bnei_cont.90072

bnei_else.90071:
	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)
	nop
	nop

	flw	%f8, 185(%zero)
	lw	%a3, 4(%a1)
	fsub	%f6, %f6, %f1
	nop

	flw	%f10, 1(%a3)
	nop
	fmul	%f6, %f6, %f7
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
	nop
	fblt	%f9, %f10, fbgt_else.90093

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90094

fbgt_else.90093:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90094:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90095

	flw	%f9, 186(%zero)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f10, 2(%a3)
	nop
	fmul	%f9, %f6, %f9
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
	nop
	fblt	%f9, %f10, fbgt_else.90097

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90098

fbgt_else.90097:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90098:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90099

	flw	%f9, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f9, fbeq_else.90101

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90102

fbeq_else.90101:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90102:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90103

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90096

bnei_else.90103:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.90104:
	nop
	nop
	nop
	j	bnei_cont.90096

bnei_else.90099:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90100:
	nop
	nop
	nop
	j	bnei_cont.90096

bnei_else.90095:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90096:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90105

	fsw	%f6, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90106

bnei_else.90105:
	flw	%f6, 2(%a0)
	flw	%f7, 3(%a0)
	nop
	nop

	flw	%f9, 184(%zero)
	lw	%a3, 4(%a1)
	fsub	%f6, %f6, %f3
	nop

	flw	%f11, 0(%a3)
	nop
	fmul	%f6, %f6, %f7
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
	nop
	fblt	%f10, %f11, fbgt_else.90107

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90108

fbgt_else.90107:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90108:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90109

	flw	%f10, 186(%zero)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f11, 2(%a3)
	nop
	fmul	%f10, %f6, %f10
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
	nop
	fblt	%f10, %f11, fbgt_else.90111

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90112

fbgt_else.90111:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90112:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90113

	flw	%f10, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f10, fbeq_else.90115

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90116

fbeq_else.90115:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90116:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90117

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90110

bnei_else.90117:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.90118:
	nop
	nop
	nop
	j	bnei_cont.90110

bnei_else.90113:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90114:
	nop
	nop
	nop
	j	bnei_cont.90110

bnei_else.90109:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90110:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90119

	fsw	%f6, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90120

bnei_else.90119:
	flw	%f6, 4(%a0)
	nop
	nop
	nop

	flw	%f6, 5(%a0)
	lw	%a0, 4(%a1)
	fsub	%f5, %f6, %f5
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f7, %f5, %f9
	nop

	flw	%f7, 0(%a0)
	nop
	fadd	%f1, %f7, %f1
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f7, fbgt_else.90121

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90122

fbgt_else.90121:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.90122:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90123

	lw	%a0, 4(%a1)
	nop
	fmul	%f1, %f5, %f8
	nop

	flw	%f3, 1(%a0)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.90125

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90126

fbgt_else.90125:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.90126:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90127

	flw	%f1, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f1, fbeq_else.90129

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90130

fbeq_else.90129:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.90130:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90131

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90124

bnei_else.90131:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90132:
	nop
	nop
	nop
	j	bnei_cont.90124

bnei_else.90127:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90128:
	nop
	nop
	nop
	j	bnei_cont.90124

bnei_else.90123:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90124:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90133

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90134

bnei_else.90133:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90134:
bnei_cont.90120:
bnei_cont.90106:
bnei_cont.90072:
	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90135

	flw	%f3, 468(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.90137

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90136

fbgt_else.90137:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.90138:
	nop
	nop
	nop
	j	bnei_cont.90136

bnei_else.90135:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.90136:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90139

	flw	%f3, 467(%zero)
	lw	%a0, 0(%v1)
	nop
	nop

	flw	%f3, 78(%zero)
	sw	%v1, 0(%sp)
	fadd	%f1, %f1, %f3
	nop

	sw	%v0, 1(%sp)
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 79(%zero)
	nop
	fadd	%f0, %f3, %f0
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 80(%zero)
	nop
	fadd	%f2, %f3, %f2
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
	nop
	beqi	%a0, -1, bnei_else.90140

	lw	%a0, 12(%a0)
	nop
	nop
	nop

	lw	%a1, 5(%a0)
	nop
	nop
	nop

	flw	%f3, 0(%a1)
	lw	%a1, 5(%a0)
	nop
	nop

	flw	%f4, 1(%a1)
	lw	%a1, 5(%a0)
	fsub	%f3, %f0, %f3
	nop

	flw	%f5, 2(%a1)
	lw	%a1, 1(%a0)
	fsub	%f4, %f2, %f4
	nop

	nop
	nop
	fsub	%f5, %f1, %f5
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.90142

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.90144

	lw	%a1, 4(%a0)
	nop
	fmul	%f6, %f3, %f3
	nop

	flw	%f7, 0(%a1)
	lw	%a1, 4(%a0)
	nop
	nop

	flw	%f8, 1(%a1)
	lw	%a1, 4(%a0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4

	flw	%f8, 2(%a1)
	lw	%a1, 3(%a0)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

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
	beqi	%a1, 0, bnei_else.90146

	lw	%a1, 9(%a0)
	nop
	fmul	%f7, %f4, %f5
	fmul	%f5, %f5, %f3

	flw	%f8, 0(%a1)
	lw	%a1, 9(%a0)
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	nop

	flw	%f7, 1(%a1)
	lw	%a1, 9(%a0)
	fadd	%f6, %f6, %f7
	nop

	flw	%f4, 2(%a1)
	nop
	fmul	%f5, %f5, %f7
	nop

	nop
	nop
	fadd	%f5, %f6, %f5
	fmul	%f3, %f3, %f4

	nop
	nop
	fadd	%f3, %f5, %f3
	nop

	nop
	nop
	nop
	j	bnei_cont.90147

bnei_else.90146:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.90147:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.90148

	nop
	nop
	nop
	j	bnei_cont.90149

bnei_else.90148:
	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.90149:
	lw	%a0, 6(%a0)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90150

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90151

fbgt_else.90150:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90151:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90152

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90154

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90153

bnei_else.90154:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90155:
	nop
	nop
	nop
	j	bnei_cont.90153

bnei_else.90152:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90153:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90156

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90143

bnei_else.90156:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90157:
	nop
	nop
	nop
	j	bnei_cont.90143

bnei_else.90144:
	lw	%a1, 4(%a0)
	lw	%a0, 6(%a0)
	nop
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	flw	%f6, 1(%a1)
	nop
	fmul	%f3, %f6, %f3
	nop

	nop
	nop
	fmul	%f4, %f6, %f4
	nop

	flw	%f4, 2(%a1)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f4, 493(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90158

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90159

fbgt_else.90158:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90159:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90160

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90162

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90161

bnei_else.90162:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90163:
	nop
	nop
	nop
	j	bnei_cont.90161

bnei_else.90160:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.90161:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90164

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90165

bnei_else.90164:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90165:
bnei_cont.90145:
	nop
	nop
	nop
	j	bnei_cont.90143

bnei_else.90142:
	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f3
	nop

	flw	%f6, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f6, fbgt_else.90166

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90167

fbgt_else.90166:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90167:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90168

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f4
	nop

	flw	%f4, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90170

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90171

fbgt_else.90170:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90171:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90172

	lw	%a1, 4(%a0)
	nop
	fabs	%f3, %f5
	nop

	flw	%f4, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90174

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90169

fbgt_else.90174:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90175:
	nop
	nop
	nop
	j	bnei_cont.90169

bnei_else.90172:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90173:
	nop
	nop
	nop
	j	bnei_cont.90169

bnei_else.90168:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90169:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90176

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90177

bnei_else.90176:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90178

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90179

bnei_else.90178:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.90179:
bnei_cont.90177:
bnei_cont.90143:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90180

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90141

bnei_else.90180:
	sw	%ra, 2(%sp)
	nop
	addi	%v0, %a2, 0
	fmov	%f29, %f2

	nop
	nop
	fmov	%f2, %f1
	fmov	%f1, %f29

	nop
	nop
	addi	%sp, %sp, 3
	nop

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	addi	%sp, %sp, -3
	nop

	lw	%ra, 2(%sp)
	nop
	nop
	nop

bnei_cont.90181:
	nop
	nop
	nop
	j	bnei_cont.90141

bnei_else.90140:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.90141:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90182

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90182:
	lw	%v0, 1(%sp)
	lw	%v1, 0(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.90139:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.90183

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.90183:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90070:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_group.2916:
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
	beqi	%a0, -1, bnei_else.90184

	lw	%a0, 83(%a0)
	nop
	addi	%a1, %zero, 0
	nop

	sw	%a1, 0(%sp)
	nop
	nop
	nop

	sw	%v1, 1(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	sw	%v0, 2(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90185

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90185:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	nop
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
	beqi	%a0, -1, bnei_else.90186

	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

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
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90187

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90187:
	lw	%v0, 3(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	nop
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
	beqi	%a0, -1, bnei_else.90188

	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

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
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90189

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90189:
	lw	%v0, 4(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	nop
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
	beqi	%a0, -1, bnei_else.90190

	lw	%a0, 83(%a0)
	lw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 5(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

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
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90191

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90191:
	lw	%v0, 5(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_group.2916

bnei_else.90190:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90188:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90186:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90184:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

shadow_check_one_or_matrix.2919:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a1, %zero, 0

	lw	%a0, 0(%at)
	nop
	nop
	nop

	lw	%a2, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.90192

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

	nop
	nop
	nop
	beqi	%a2, 99, bnei_else.90193

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
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%t0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%t0, 5(%a3)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)
	nop
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.90195

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.90197

	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90199

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90200

fbeq_else.90199:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90200:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90201

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90196

bnei_else.90201:
	flw	%f5, 1(%a2)
	flw	%f6, 2(%a2)
	nop
	nop

	lw	%t0, 4(%a3)
	nop
	fmul	%f5, %f5, %f0
	fmul	%f6, %f6, %f1

	flw	%f6, 3(%a2)
	flw	%f7, 0(%t0)
	fadd	%f5, %f5, %f6
	nop

	lw	%t0, 4(%a3)
	nop
	fmul	%f6, %f6, %f2
	nop

	flw	%f8, 1(%t0)
	lw	%t0, 4(%a3)
	fadd	%f5, %f5, %f6
	fmul	%f6, %f0, %f0

	nop
	nop
	fmul	%f6, %f6, %f7
	fmul	%f7, %f1, %f1

	flw	%f8, 2(%t0)
	lw	%t0, 3(%a3)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f2, %f2

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
	beqi	%t0, 0, bnei_else.90203

	lw	%t0, 9(%a3)
	nop
	fmul	%f7, %f1, %f2
	fmul	%f2, %f2, %f0

	flw	%f8, 0(%t0)
	lw	%t0, 9(%a3)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	nop

	flw	%f7, 1(%t0)
	lw	%t0, 9(%a3)
	fadd	%f6, %f6, %f7
	nop

	flw	%f1, 2(%t0)
	nop
	fmul	%f2, %f2, %f7
	nop

	nop
	nop
	fadd	%f2, %f6, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.90204

bnei_else.90203:
	nop
	nop
	fmov	%f0, %f6
	nop

bnei_cont.90204:
	lw	%t0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.90205

	nop
	nop
	nop
	j	bnei_cont.90206

bnei_else.90205:
	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.90206:
	nop
	nop
	fmul	%f1, %f5, %f5
	fmul	%f0, %f3, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f4, %f0, fbgt_else.90207

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90208

fbgt_else.90207:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90208:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90209

	lw	%a3, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90211

	flw	%f1, 4(%a2)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fadd	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90212

bnei_else.90211:
	flw	%f1, 4(%a2)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	fsub	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.90212:
	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90210

bnei_else.90209:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90210:
bnei_cont.90202:
	nop
	nop
	nop
	j	bnei_cont.90196

bnei_else.90197:
	flw	%f3, 0(%a2)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90213

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90214

fbgt_else.90213:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90214:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90215

	flw	%f3, 1(%a2)
	nop
	nop
	nop

	flw	%f3, 2(%a2)
	nop
	fmul	%f0, %f3, %f0
	nop

	nop
	nop
	fmul	%f1, %f3, %f1
	nop

	flw	%f1, 3(%a2)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90216

bnei_else.90215:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90216:
bnei_cont.90198:
	nop
	nop
	nop
	j	bnei_cont.90196

bnei_else.90195:
	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)
	nop
	nop

	flw	%f5, 185(%zero)
	lw	%t0, 4(%a3)
	fsub	%f3, %f3, %f0
	nop

	flw	%f7, 1(%t0)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	fblt	%f6, %f7, fbgt_else.90217

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90218

fbgt_else.90217:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90218:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90219

	flw	%f6, 186(%zero)
	lw	%t0, 4(%a3)
	nop
	nop

	flw	%f7, 2(%t0)
	nop
	fmul	%f6, %f3, %f6
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
	nop
	fblt	%f6, %f7, fbgt_else.90221

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90222

fbgt_else.90221:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90222:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90223

	flw	%f6, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.90225

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90226

fbeq_else.90225:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90226:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90227

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90220

bnei_else.90227:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90228:
	nop
	nop
	nop
	j	bnei_cont.90220

bnei_else.90223:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90224:
	nop
	nop
	nop
	j	bnei_cont.90220

bnei_else.90219:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90220:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90229

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90230

bnei_else.90229:
	flw	%f3, 2(%a2)
	flw	%f4, 3(%a2)
	nop
	nop

	flw	%f6, 184(%zero)
	lw	%t0, 4(%a3)
	fsub	%f3, %f3, %f1
	nop

	flw	%f8, 0(%t0)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	fblt	%f7, %f8, fbgt_else.90231

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90232

fbgt_else.90231:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90232:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90233

	flw	%f7, 186(%zero)
	lw	%t0, 4(%a3)
	nop
	nop

	flw	%f8, 2(%t0)
	nop
	fmul	%f7, %f3, %f7
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
	nop
	fblt	%f7, %f8, fbgt_else.90235

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90236

fbgt_else.90235:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90236:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90237

	flw	%f7, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.90239

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90240

fbeq_else.90239:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90240:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90241

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90234

bnei_else.90241:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90242:
	nop
	nop
	nop
	j	bnei_cont.90234

bnei_else.90237:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90238:
	nop
	nop
	nop
	j	bnei_cont.90234

bnei_else.90233:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90234:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90243

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90244

bnei_else.90243:
	flw	%f3, 4(%a2)
	nop
	nop
	nop

	flw	%f3, 5(%a2)
	lw	%a2, 4(%a3)
	fsub	%f2, %f3, %f2
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f4, %f2, %f6
	nop

	flw	%f4, 0(%a2)
	nop
	fadd	%f0, %f4, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.90245

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90246

fbgt_else.90245:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90246:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90247

	lw	%a2, 4(%a3)
	nop
	fmul	%f0, %f2, %f5
	nop

	flw	%f1, 1(%a2)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90249

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90250

fbgt_else.90249:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90250:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90251

	flw	%f0, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.90253

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90254

fbeq_else.90253:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.90254:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90255

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90248

bnei_else.90255:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90256:
	nop
	nop
	nop
	j	bnei_cont.90248

bnei_else.90251:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90252:
	nop
	nop
	nop
	j	bnei_cont.90248

bnei_else.90247:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90248:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90257

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a2, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90258

bnei_else.90257:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90258:
bnei_cont.90244:
bnei_cont.90230:
bnei_cont.90196:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90259

	flw	%f0, 135(%zero)
	flw	%f1, 466(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90261

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90262

fbgt_else.90261:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90262:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90263

	lw	%a2, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.90265

	lw	%a2, 83(%a2)
	sw	%ra, 4(%sp)
	addi	%v0, %a1, 0
	nop

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
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90267

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90266

bnei_else.90267:
	lw	%v0, 1(%sp)
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
	beqi	%v1, -1, bnei_else.90269

	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90271

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90270

bnei_else.90271:
	lw	%v0, 1(%sp)
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
	beqi	%v1, -1, bnei_else.90273

	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90275

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90274

bnei_else.90275:
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%v0, %zero, 4
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.90276:
	nop
	nop
	nop
	j	bnei_cont.90274

bnei_else.90273:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90274:
bnei_cont.90272:
	nop
	nop
	nop
	j	bnei_cont.90270

bnei_else.90269:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90270:
bnei_cont.90268:
	nop
	nop
	nop
	j	bnei_cont.90266

bnei_else.90265:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90266:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90277

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90194

bnei_else.90277:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90278:
	nop
	nop
	nop
	j	bnei_cont.90194

bnei_else.90263:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90264:
	nop
	nop
	nop
	j	bnei_cont.90194

bnei_else.90259:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90260:
	nop
	nop
	nop
	j	bnei_cont.90194

bnei_else.90193:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.90194:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90279

	lw	%v0, 1(%sp)
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
	beqi	%v1, -1, bnei_else.90280

	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90282

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90281

bnei_else.90282:
	lw	%v0, 1(%sp)
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
	beqi	%v1, -1, bnei_else.90284

	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90286

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90285

bnei_else.90286:
	lw	%v0, 1(%sp)
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
	beqi	%v1, -1, bnei_else.90288

	lw	%v1, 83(%v1)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_and_group.2913

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
	beqi	%v0, 0, bnei_else.90290

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90289

bnei_else.90290:
	lw	%v1, 1(%sp)
	sw	%ra, 4(%sp)
	addi	%v0, %zero, 4
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_group.2916

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

bnei_cont.90291:
	nop
	nop
	nop
	j	bnei_cont.90289

bnei_else.90288:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90289:
bnei_cont.90287:
	nop
	nop
	nop
	j	bnei_cont.90285

bnei_else.90284:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90285:
bnei_cont.90283:
	nop
	nop
	nop
	j	bnei_cont.90281

bnei_else.90280:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.90281:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90292

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.90292:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2919

bnei_else.90279:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_one_or_matrix.2919

bnei_else.90192:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solve_each_element.2922:
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
	beqi	%a1, -1, bnei_else.90293

	lw	%a2, 12(%a1)
	flw	%f0, 159(%zero)
	nop
	nop

	lw	%a3, 5(%a2)
	flw	%f2, 160(%zero)
	nop
	nop

	flw	%f1, 0(%a3)
	lw	%t0, 5(%a2)
	addi	%a3, %zero, 1
	nop

	flw	%f3, 1(%t0)
	flw	%f4, 161(%zero)
	fsub	%f1, %f0, %f1
	nop

	lw	%t0, 5(%a2)
	nop
	fsub	%f3, %f2, %f3
	nop

	flw	%f5, 2(%t0)
	lw	%t0, 1(%a2)
	nop
	nop

	nop
	nop
	fsub	%f5, %f4, %f5
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.90294

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.90296

	flw	%f6, 0(%a0)
	flw	%f7, 1(%a0)
	nop
	nop

	flw	%f8, 2(%a0)
	lw	%t0, 4(%a2)
	fmul	%f9, %f6, %f6
	fmul	%f11, %f7, %f7

	flw	%f10, 0(%t0)
	lw	%t0, 4(%a2)
	nop
	nop

	flw	%f12, 1(%t0)
	lw	%t0, 4(%a2)
	fmul	%f9, %f9, %f10
	nop

	flw	%f13, 2(%t0)
	lw	%t0, 3(%a2)
	fmul	%f11, %f11, %f12
	nop

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f8

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
	nop
	beqi	%t0, 0, bnei_else.90298

	lw	%t1, 9(%a2)
	nop
	fmul	%f11, %f7, %f8
	nop

	flw	%f14, 0(%t1)
	lw	%t1, 9(%a2)
	nop
	nop

	flw	%f14, 1(%t1)
	lw	%t1, 9(%a2)
	fmul	%f11, %f11, %f14
	nop

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f8, %f6

	flw	%f14, 2(%t1)
	nop
	fmul	%f11, %f11, %f14
	nop

	nop
	nop
	fadd	%f9, %f9, %f11
	fmul	%f11, %f6, %f7

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
	nop
	j	bnei_cont.90299

bnei_else.90298:
bnei_cont.90299:
	flw	%f11, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f9, %f11, fbeq_else.90300

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90301

fbeq_else.90300:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.90301:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90302

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90295

bnei_else.90302:
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
	fmul	%f15, %f15, %f13
	nop

	nop
	nop
	fadd	%f14, %f14, %f15
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90304

	lw	%t1, 9(%a2)
	nop
	fmul	%f15, %f8, %f3
	fmul	%f16, %f7, %f5

	flw	%f16, 0(%t1)
	lw	%t1, 9(%a2)
	fadd	%f15, %f15, %f16
	fmul	%f8, %f8, %f1

	nop
	nop
	fmul	%f15, %f15, %f16
	fmul	%f16, %f6, %f5

	flw	%f16, 1(%t1)
	lw	%t1, 9(%a2)
	fadd	%f8, %f16, %f8
	fmul	%f6, %f6, %f3

	nop
	nop
	fmul	%f8, %f8, %f16
	fmul	%f7, %f7, %f1

	flw	%f7, 2(%t1)
	nop
	fadd	%f8, %f15, %f8
	fadd	%f6, %f6, %f7

	flw	%f7, 471(%zero)
	nop
	fmul	%f6, %f6, %f7
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
	nop
	j	bnei_cont.90305

bnei_else.90304:
	nop
	nop
	fmov	%f6, %f14
	nop

bnei_cont.90305:
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
	fmul	%f8, %f8, %f13
	nop

	nop
	nop
	fadd	%f7, %f7, %f8
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90306

	lw	%t0, 9(%a2)
	nop
	fmul	%f8, %f3, %f5
	fmul	%f5, %f5, %f1

	flw	%f10, 0(%t0)
	lw	%t0, 9(%a2)
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f10
	nop

	flw	%f8, 1(%t0)
	lw	%t0, 9(%a2)
	fadd	%f7, %f7, %f8
	nop

	flw	%f3, 2(%t0)
	nop
	fmul	%f5, %f5, %f8
	nop

	nop
	nop
	fadd	%f5, %f7, %f5
	fmul	%f1, %f1, %f3

	nop
	nop
	fadd	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.90307

bnei_else.90306:
	nop
	nop
	fmov	%f1, %f7
	nop

bnei_cont.90307:
	lw	%t0, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.90308

	nop
	nop
	nop
	j	bnei_cont.90309

bnei_else.90308:
	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f3
	nop

bnei_cont.90309:
	nop
	nop
	fmul	%f3, %f6, %f6
	fmul	%f1, %f9, %f1

	nop
	nop
	fsub	%f1, %f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f11, %f1, fbgt_else.90310

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90311

fbgt_else.90310:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90311:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90312

	lw	%t0, 6(%a2)
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90314

	nop
	nop
	nop
	j	bnei_cont.90315

bnei_else.90314:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.90315:
	nop
	nop
	fsub	%f1, %f1, %f6
	nop

	nop
	nop
	fdiv	%f1, %f1, %f9
	nop

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90313

bnei_else.90312:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90313:
bnei_cont.90303:
	nop
	nop
	nop
	j	bnei_cont.90295

bnei_else.90296:
	lw	%t0, 4(%a2)
	flw	%f6, 0(%a0)
	nop
	nop

	flw	%f7, 0(%t0)
	flw	%f8, 1(%a0)
	nop
	nop

	flw	%f9, 1(%t0)
	flw	%f10, 2(%t0)
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f8, %f8, %f9
	nop

	flw	%f8, 2(%a0)
	nop
	fadd	%f6, %f6, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f10
	nop

	flw	%f8, 493(%zero)
	nop
	fadd	%f6, %f6, %f8
	nop

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.90316

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90317

fbgt_else.90316:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90317:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90318

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

	fsw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90319

bnei_else.90318:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90319:
bnei_cont.90297:
	nop
	nop
	nop
	j	bnei_cont.90295

bnei_else.90294:
	flw	%f6, 0(%a0)
	flw	%f7, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.90320

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90321

fbeq_else.90320:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90321:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90322

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90323

bnei_else.90322:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.90324

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90325

fbgt_else.90324:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90325:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90326

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90328

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90327

bnei_else.90328:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90329:
	nop
	nop
	nop
	j	bnei_cont.90327

bnei_else.90326:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.90327:
	flw	%f8, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90330

	nop
	nop
	nop
	j	bnei_cont.90331

bnei_else.90330:
	nop
	nop
	fneg	%f8, %f8
	nop

bnei_cont.90331:
	flw	%f9, 1(%a0)
	flw	%f10, 1(%t0)
	fsub	%f8, %f8, %f1
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
	nop
	fblt	%f9, %f10, fbgt_else.90332

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90333

fbgt_else.90332:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90333:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90334

	flw	%f9, 2(%a0)
	flw	%f10, 2(%t0)
	nop
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
	nop
	fblt	%f9, %f10, fbgt_else.90336

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90337

fbgt_else.90336:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90337:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90338

	fsw	%f8, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90335

bnei_else.90338:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90339:
	nop
	nop
	nop
	j	bnei_cont.90335

bnei_else.90334:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90335:
bnei_cont.90323:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90340

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90341

bnei_else.90340:
	flw	%f8, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f7, fbeq_else.90342

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90343

fbeq_else.90342:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90343:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90344

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90345

bnei_else.90344:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.90346

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90347

fbgt_else.90346:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90347:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90348

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90350

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90349

bnei_else.90350:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90351:
	nop
	nop
	nop
	j	bnei_cont.90349

bnei_else.90348:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.90349:
	flw	%f9, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90352

	nop
	nop
	nop
	j	bnei_cont.90353

bnei_else.90352:
	nop
	nop
	fneg	%f9, %f9
	nop

bnei_cont.90353:
	flw	%f10, 2(%a0)
	flw	%f11, 2(%t0)
	fsub	%f9, %f9, %f3
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
	nop
	fblt	%f10, %f11, fbgt_else.90354

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90355

fbgt_else.90354:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90355:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90356

	flw	%f11, 0(%t0)
	nop
	fmul	%f10, %f9, %f6
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
	nop
	fblt	%f10, %f11, fbgt_else.90358

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90359

fbgt_else.90358:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90359:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90360

	fsw	%f9, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90357

bnei_else.90360:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90361:
	nop
	nop
	nop
	j	bnei_cont.90357

bnei_else.90356:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90357:
bnei_cont.90345:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90362

	nop
	nop
	addi	%t0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90363

bnei_else.90362:
	flw	%f9, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f9, %f7, fbeq_else.90364

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90365

fbeq_else.90364:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90365:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90366

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90367

bnei_else.90366:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f7, fbgt_else.90368

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90369

fbgt_else.90368:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90369:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90370

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90372

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90371

bnei_else.90372:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90373:
	nop
	nop
	nop
	j	bnei_cont.90371

bnei_else.90370:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.90371:
	flw	%f7, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90374

	nop
	nop
	nop
	j	bnei_cont.90375

bnei_else.90374:
	nop
	nop
	fneg	%f7, %f7
	nop

bnei_cont.90375:
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

	flw	%f6, 0(%t0)
	nop
	fadd	%f1, %f6, %f1
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f6, fbgt_else.90376

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90377

fbgt_else.90376:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90377:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90378

	nop
	nop
	fmul	%f1, %f5, %f8
	nop

	flw	%f3, 1(%t0)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.90380

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90381

fbgt_else.90380:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90381:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90382

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90379

bnei_else.90382:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90383:
	nop
	nop
	nop
	j	bnei_cont.90379

bnei_else.90378:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90379:
bnei_cont.90367:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90384

	nop
	nop
	addi	%t0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90385

bnei_else.90384:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90385:
bnei_cont.90363:
bnei_cont.90341:
bnei_cont.90295:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90386

	flw	%f1, 135(%zero)
	flw	%f3, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.90387

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90388

fbgt_else.90387:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90388:
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
	beqi	%a2, 0, bnei_else.90389

	flw	%f5, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.90391

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90392

fbgt_else.90391:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90392:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90393

	flw	%f5, 467(%zero)
	lw	%a2, 0(%v1)
	nop
	nop

	flw	%f5, 0(%a0)
	sw	%t0, 3(%sp)
	fadd	%f1, %f1, %f5
	nop

	sw	%a1, 4(%sp)
	nop
	fmul	%f5, %f5, %f1
	nop

	flw	%f5, 1(%a0)
	nop
	fadd	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f1
	nop

	flw	%f5, 2(%a0)
	nop
	fadd	%f2, %f5, %f2
	nop

	nop
	nop
	fmul	%f5, %f5, %f1
	nop

	nop
	nop
	fadd	%f4, %f5, %f4
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

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.90395

	lw	%a2, 12(%a2)
	nop
	nop
	nop

	lw	%t1, 5(%a2)
	nop
	nop
	nop

	flw	%f5, 0(%t1)
	lw	%t1, 5(%a2)
	nop
	nop

	flw	%f6, 1(%t1)
	lw	%t1, 5(%a2)
	fsub	%f5, %f0, %f5
	nop

	flw	%f7, 2(%t1)
	lw	%t1, 1(%a2)
	fsub	%f6, %f2, %f6
	nop

	nop
	nop
	fsub	%f7, %f4, %f7
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.90397

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.90399

	lw	%t1, 4(%a2)
	nop
	fmul	%f8, %f5, %f5
	nop

	flw	%f9, 0(%t1)
	lw	%t1, 4(%a2)
	nop
	nop

	flw	%f10, 1(%t1)
	lw	%t1, 4(%a2)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6

	flw	%f10, 2(%t1)
	lw	%t1, 3(%a2)
	fmul	%f9, %f9, %f10
	nop

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

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
	nop
	beqi	%t1, 0, bnei_else.90401

	lw	%t1, 9(%a2)
	nop
	fmul	%f9, %f6, %f7
	fmul	%f7, %f7, %f5

	flw	%f10, 0(%t1)
	lw	%t1, 9(%a2)
	fmul	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f9, %f9, %f10
	nop

	flw	%f9, 1(%t1)
	lw	%t1, 9(%a2)
	fadd	%f8, %f8, %f9
	nop

	flw	%f6, 2(%t1)
	nop
	fmul	%f7, %f7, %f9
	nop

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	fadd	%f5, %f7, %f5
	nop

	nop
	nop
	nop
	j	bnei_cont.90402

bnei_else.90401:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.90402:
	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 3, bnei_else.90403

	nop
	nop
	nop
	j	bnei_cont.90404

bnei_else.90403:
	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.90404:
	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.90405

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90406

fbgt_else.90405:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90406:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90407

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90409

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90408

bnei_else.90409:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90410:
	nop
	nop
	nop
	j	bnei_cont.90408

bnei_else.90407:
	nop
	nop
	add	%a2, %zero, %t1
	nop

bnei_cont.90408:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90411

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90398

bnei_else.90411:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90412:
	nop
	nop
	nop
	j	bnei_cont.90398

bnei_else.90399:
	lw	%t1, 4(%a2)
	lw	%a2, 6(%a2)
	nop
	nop

	flw	%f8, 0(%t1)
	nop
	nop
	nop

	flw	%f8, 1(%t1)
	nop
	fmul	%f5, %f8, %f5
	nop

	nop
	nop
	fmul	%f6, %f8, %f6
	nop

	flw	%f6, 2(%t1)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	fblt	%f5, %f3, fbgt_else.90413

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90414

fbgt_else.90413:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90414:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90415

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90417

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90416

bnei_else.90417:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90418:
	nop
	nop
	nop
	j	bnei_cont.90416

bnei_else.90415:
	nop
	nop
	add	%a2, %zero, %t1
	nop

bnei_cont.90416:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90419

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90420

bnei_else.90419:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90420:
bnei_cont.90400:
	nop
	nop
	nop
	j	bnei_cont.90398

bnei_else.90397:
	lw	%t1, 4(%a2)
	nop
	fabs	%f3, %f5
	nop

	flw	%f5, 0(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.90421

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90422

fbgt_else.90421:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90422:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90423

	lw	%t1, 4(%a2)
	nop
	fabs	%f3, %f6
	nop

	flw	%f5, 1(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.90425

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90426

fbgt_else.90425:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90426:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90427

	lw	%t1, 4(%a2)
	nop
	fabs	%f3, %f7
	nop

	flw	%f5, 2(%t1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.90429

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90424

fbgt_else.90429:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90430:
	nop
	nop
	nop
	j	bnei_cont.90424

bnei_else.90427:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90428:
	nop
	nop
	nop
	j	bnei_cont.90424

bnei_else.90423:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90424:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90431

	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90432

bnei_else.90431:
	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90433

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90434

bnei_else.90433:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90434:
bnei_cont.90432:
bnei_cont.90398:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90435

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90396

bnei_else.90435:
	sw	%ra, 9(%sp)
	nop
	addi	%v0, %a3, 0
	fmov	%f1, %f2

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
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.90436:
	nop
	nop
	nop
	j	bnei_cont.90396

bnei_else.90395:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.90396:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90437

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

	fsw	%f0, 140(%zero)
	nop
	nop
	nop

	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)
	nop
	nop

	sw	%v0, 136(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90390

bnei_else.90437:
bnei_cont.90438:
	nop
	nop
	nop
	j	bnei_cont.90390

bnei_else.90393:
bnei_cont.90394:
	nop
	nop
	nop
	j	bnei_cont.90390

bnei_else.90389:
bnei_cont.90390:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.90386:
	lw	%a1, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90439

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.90439:
	nop
	nop
	nop
	jr	%ra

bnei_else.90293:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network.2926:
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
	beqi	%a1, -1, bnei_else.90442

	lw	%a1, 83(%a1)
	sw	%a0, 0(%sp)
	addi	%a2, %zero, 0
	nop

	sw	%a2, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%v0, %a2, 0
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
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90443

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 5(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90444

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 6(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90445

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 7(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90446

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 8(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90447

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 9(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90448

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

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
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90449

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 11(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_one_or_network.2926

bnei_else.90449:
	nop
	nop
	nop
	jr	%ra

bnei_else.90448:
	nop
	nop
	nop
	jr	%ra

bnei_else.90447:
	nop
	nop
	nop
	jr	%ra

bnei_else.90446:
	nop
	nop
	nop
	jr	%ra

bnei_else.90445:
	nop
	nop
	nop
	jr	%ra

bnei_else.90444:
	nop
	nop
	nop
	jr	%ra

bnei_else.90443:
	nop
	nop
	nop
	jr	%ra

bnei_else.90442:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix.2930:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a3, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90458

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

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.90459

	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)
	nop
	nop

	lw	%t0, 5(%a3)
	nop
	nop
	nop

	flw	%f1, 0(%t0)
	lw	%t0, 5(%a3)
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f2, 1(%t0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 161(%zero)
	lw	%t0, 5(%a3)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%t0)
	lw	%t0, 1(%a3)
	nop
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.90461

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.90463

	flw	%f3, 0(%a0)
	flw	%f4, 1(%a0)
	nop
	nop

	flw	%f5, 2(%a0)
	lw	%t0, 4(%a3)
	fmul	%f6, %f3, %f3
	fmul	%f8, %f4, %f4

	flw	%f7, 0(%t0)
	lw	%t0, 4(%a3)
	nop
	nop

	flw	%f9, 1(%t0)
	lw	%t0, 4(%a3)
	fmul	%f6, %f6, %f7
	nop

	flw	%f10, 2(%t0)
	lw	%t0, 3(%a3)
	fmul	%f8, %f8, %f9
	nop

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f5

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
	nop
	beqi	%t0, 0, bnei_else.90465

	lw	%t1, 9(%a3)
	nop
	fmul	%f8, %f4, %f5
	nop

	flw	%f11, 0(%t1)
	lw	%t1, 9(%a3)
	nop
	nop

	flw	%f11, 1(%t1)
	lw	%t1, 9(%a3)
	fmul	%f8, %f8, %f11
	nop

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f5, %f3

	flw	%f11, 2(%t1)
	nop
	fmul	%f8, %f8, %f11
	nop

	nop
	nop
	fadd	%f6, %f6, %f8
	fmul	%f8, %f3, %f4

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
	nop
	j	bnei_cont.90466

bnei_else.90465:
bnei_cont.90466:
	flw	%f8, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f8, fbeq_else.90467

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90468

fbeq_else.90467:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.90468:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90469

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90462

bnei_else.90469:
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
	fmul	%f12, %f12, %f10
	nop

	nop
	nop
	fadd	%f11, %f11, %f12
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90471

	lw	%t1, 9(%a3)
	nop
	fmul	%f12, %f5, %f1
	fmul	%f13, %f4, %f2

	flw	%f13, 0(%t1)
	lw	%t1, 9(%a3)
	fadd	%f12, %f12, %f13
	fmul	%f5, %f5, %f0

	nop
	nop
	fmul	%f12, %f12, %f13
	fmul	%f13, %f3, %f2

	flw	%f13, 1(%t1)
	lw	%t1, 9(%a3)
	fadd	%f5, %f13, %f5
	fmul	%f3, %f3, %f1

	nop
	nop
	fmul	%f5, %f5, %f13
	fmul	%f4, %f4, %f0

	flw	%f4, 2(%t1)
	nop
	fadd	%f5, %f12, %f5
	fadd	%f3, %f3, %f4

	flw	%f4, 471(%zero)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	j	bnei_cont.90472

bnei_else.90471:
	nop
	nop
	fmov	%f3, %f11
	nop

bnei_cont.90472:
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
	fmul	%f5, %f5, %f10
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90473

	lw	%t0, 9(%a3)
	nop
	fmul	%f5, %f1, %f2
	fmul	%f2, %f2, %f0

	flw	%f7, 0(%t0)
	lw	%t0, 9(%a3)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f5, %f5, %f7
	nop

	flw	%f5, 1(%t0)
	lw	%t0, 9(%a3)
	fadd	%f4, %f4, %f5
	nop

	flw	%f1, 2(%t0)
	nop
	fmul	%f2, %f2, %f5
	nop

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.90474

bnei_else.90473:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.90474:
	lw	%t0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.90475

	nop
	nop
	nop
	j	bnei_cont.90476

bnei_else.90475:
	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.90476:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f8, %f0, fbgt_else.90477

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90478

fbgt_else.90477:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90478:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90479

	lw	%a3, 6(%a3)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90481

	nop
	nop
	nop
	j	bnei_cont.90482

bnei_else.90481:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.90482:
	nop
	nop
	fsub	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f6
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90480

bnei_else.90479:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90480:
bnei_cont.90470:
	nop
	nop
	nop
	j	bnei_cont.90462

bnei_else.90463:
	lw	%a3, 4(%a3)
	flw	%f3, 0(%a0)
	nop
	nop

	flw	%f4, 0(%a3)
	flw	%f5, 1(%a0)
	nop
	nop

	flw	%f6, 1(%a3)
	flw	%f7, 2(%a3)
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	flw	%f5, 2(%a0)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	fmul	%f5, %f5, %f7
	nop

	flw	%f5, 493(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.90483

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90484

fbgt_else.90483:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90484:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90485

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

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90486

bnei_else.90485:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90486:
bnei_cont.90464:
	nop
	nop
	nop
	j	bnei_cont.90462

bnei_else.90461:
	flw	%f3, 0(%a0)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90487

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90488

fbeq_else.90487:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90488:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90489

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90490

bnei_else.90489:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90491

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90492

fbgt_else.90491:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90492:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90493

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90495

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90494

bnei_else.90495:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90496:
	nop
	nop
	nop
	j	bnei_cont.90494

bnei_else.90493:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.90494:
	flw	%f5, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90497

	nop
	nop
	nop
	j	bnei_cont.90498

bnei_else.90497:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.90498:
	flw	%f6, 1(%a0)
	flw	%f7, 1(%t0)
	fsub	%f5, %f5, %f0
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
	nop
	fblt	%f6, %f7, fbgt_else.90499

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90500

fbgt_else.90499:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90500:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90501

	flw	%f6, 2(%a0)
	flw	%f7, 2(%t0)
	nop
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
	nop
	fblt	%f6, %f7, fbgt_else.90503

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90504

fbgt_else.90503:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90504:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90505

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90502

bnei_else.90505:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90506:
	nop
	nop
	nop
	j	bnei_cont.90502

bnei_else.90501:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90502:
bnei_cont.90490:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90507

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90508

bnei_else.90507:
	flw	%f5, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.90509

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90510

fbeq_else.90509:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90510:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90511

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90512

bnei_else.90511:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.90513

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90514

fbgt_else.90513:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90514:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90515

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90517

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90516

bnei_else.90517:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90518:
	nop
	nop
	nop
	j	bnei_cont.90516

bnei_else.90515:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.90516:
	flw	%f6, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90519

	nop
	nop
	nop
	j	bnei_cont.90520

bnei_else.90519:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.90520:
	flw	%f7, 2(%a0)
	flw	%f8, 2(%t0)
	fsub	%f6, %f6, %f1
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
	nop
	fblt	%f7, %f8, fbgt_else.90521

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90522

fbgt_else.90521:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90522:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90523

	flw	%f8, 0(%t0)
	nop
	fmul	%f7, %f6, %f3
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
	nop
	fblt	%f7, %f8, fbgt_else.90525

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90526

fbgt_else.90525:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90526:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90527

	fsw	%f6, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90524

bnei_else.90527:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90528:
	nop
	nop
	nop
	j	bnei_cont.90524

bnei_else.90523:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90524:
bnei_cont.90512:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90529

	nop
	nop
	addi	%a3, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90530

bnei_else.90529:
	flw	%f6, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.90531

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90532

fbeq_else.90531:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90532:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90533

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90534

bnei_else.90533:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.90535

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90536

fbgt_else.90535:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90536:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90537

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90539

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90538

bnei_else.90539:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.90540:
	nop
	nop
	nop
	j	bnei_cont.90538

bnei_else.90537:
	nop
	nop
	add	%a3, %zero, %t1
	nop

bnei_cont.90538:
	flw	%f4, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90541

	nop
	nop
	nop
	j	bnei_cont.90542

bnei_else.90541:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.90542:
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

	flw	%f3, 0(%t0)
	nop
	fadd	%f0, %f3, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.90543

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90544

fbgt_else.90543:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90544:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90545

	nop
	nop
	fmul	%f0, %f2, %f5
	nop

	flw	%f1, 1(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90547

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90548

fbgt_else.90547:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90548:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90549

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90546

bnei_else.90549:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90550:
	nop
	nop
	nop
	j	bnei_cont.90546

bnei_else.90545:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90546:
bnei_cont.90534:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90551

	nop
	nop
	addi	%a3, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90552

bnei_else.90551:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90552:
bnei_cont.90530:
bnei_cont.90508:
bnei_cont.90462:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90553

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90555

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90556

fbgt_else.90555:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90556:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90557

	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90559

	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90561

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90563

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90565

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90567

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90569

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90571

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2926

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
	j	bnei_cont.90460

bnei_else.90571:
bnei_cont.90572:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90569:
bnei_cont.90570:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90567:
bnei_cont.90568:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90565:
bnei_cont.90566:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90563:
bnei_cont.90564:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90561:
bnei_cont.90562:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90559:
bnei_cont.90560:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90557:
bnei_cont.90558:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90553:
bnei_cont.90554:
	nop
	nop
	nop
	j	bnei_cont.90460

bnei_else.90459:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90573

	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90575

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90577

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90579

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90581

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90583

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90585

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_one_or_network.2926

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
	j	bnei_cont.90574

bnei_else.90585:
bnei_cont.90586:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90583:
bnei_cont.90584:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90581:
bnei_cont.90582:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90579:
bnei_cont.90580:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90577:
bnei_cont.90578:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90575:
bnei_cont.90576:
	nop
	nop
	nop
	j	bnei_cont.90574

bnei_else.90573:
bnei_cont.90574:
bnei_cont.90460:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	nop
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
	beqi	%a1, -1, bnei_else.90587

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.90588

	lw	%a1, 12(%a1)
	flw	%f0, 159(%zero)
	nop
	nop

	lw	%a2, 5(%a1)
	nop
	nop
	nop

	flw	%f1, 0(%a2)
	lw	%a2, 5(%a1)
	nop
	nop

	flw	%f1, 160(%zero)
	flw	%f2, 1(%a2)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 161(%zero)
	lw	%a2, 5(%a1)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%a2)
	lw	%a2, 1(%a1)
	nop
	nop

	nop
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.90590

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.90592

	lw	%a2, 0(%sp)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f3, 0(%a2)
	flw	%f4, 1(%a2)
	nop
	nop

	flw	%f5, 2(%a2)
	flw	%f7, 0(%a3)
	fmul	%f6, %f3, %f3
	nop

	lw	%a3, 4(%a1)
	nop
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4

	flw	%f8, 1(%a3)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f8, 2(%a3)
	lw	%a3, 3(%a1)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f5

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
	beqi	%a3, 0, bnei_else.90594

	lw	%a3, 9(%a1)
	nop
	fmul	%f7, %f4, %f5
	nop

	flw	%f8, 0(%a3)
	lw	%a3, 9(%a1)
	nop
	nop

	flw	%f8, 1(%a3)
	lw	%a3, 9(%a1)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3

	flw	%f8, 2(%a3)
	nop
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f3, %f4

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
	j	bnei_cont.90595

bnei_else.90594:
bnei_cont.90595:
	flw	%f7, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.90596

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90597

fbeq_else.90596:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90597:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90598

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90591

bnei_else.90598:
	lw	%a3, 4(%a1)
	nop
	fmul	%f8, %f3, %f0
	nop

	flw	%f9, 0(%a3)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f10, 1(%a3)
	lw	%a3, 4(%a1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1

	flw	%f10, 2(%a3)
	lw	%a3, 3(%a1)
	fmul	%f9, %f9, %f10
	nop

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f5, %f2

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
	nop
	beqi	%a3, 0, bnei_else.90600

	lw	%a3, 9(%a1)
	nop
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2

	flw	%f10, 0(%a3)
	lw	%a3, 9(%a1)
	fadd	%f9, %f9, %f10
	fmul	%f5, %f5, %f0

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2

	flw	%f10, 1(%a3)
	lw	%a3, 9(%a1)
	fadd	%f5, %f10, %f5
	fmul	%f3, %f3, %f1

	nop
	nop
	fmul	%f5, %f5, %f10
	fmul	%f4, %f4, %f0

	flw	%f4, 2(%a3)
	nop
	fadd	%f5, %f9, %f5
	fadd	%f3, %f3, %f4

	flw	%f4, 471(%zero)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	j	bnei_cont.90601

bnei_else.90600:
	nop
	nop
	fmov	%f3, %f8
	nop

bnei_cont.90601:
	lw	%a3, 4(%a1)
	nop
	fmul	%f4, %f0, %f0
	nop

	flw	%f5, 0(%a3)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f8, 1(%a3)
	lw	%a3, 4(%a1)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1

	flw	%f8, 2(%a3)
	lw	%a3, 3(%a1)
	fmul	%f5, %f5, %f8
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	fmul	%f5, %f2, %f2

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
	nop
	beqi	%a3, 0, bnei_else.90602

	lw	%a3, 9(%a1)
	nop
	fmul	%f5, %f1, %f2
	fmul	%f2, %f2, %f0

	flw	%f8, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f5, %f5, %f8
	nop

	flw	%f5, 1(%a3)
	lw	%a3, 9(%a1)
	fadd	%f4, %f4, %f5
	nop

	flw	%f1, 2(%a3)
	nop
	fmul	%f2, %f2, %f5
	nop

	nop
	nop
	fadd	%f2, %f4, %f2
	fmul	%f0, %f0, %f1

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.90603

bnei_else.90602:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.90603:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.90604

	nop
	nop
	nop
	j	bnei_cont.90605

bnei_else.90604:
	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.90605:
	nop
	nop
	fmul	%f1, %f3, %f3
	fmul	%f0, %f6, %f0

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f7, %f0, fbgt_else.90606

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90607

fbgt_else.90606:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90607:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90608

	lw	%a1, 6(%a1)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90610

	nop
	nop
	nop
	j	bnei_cont.90611

bnei_else.90610:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.90611:
	nop
	nop
	fsub	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f6
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90609

bnei_else.90608:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90609:
bnei_cont.90599:
	nop
	nop
	nop
	j	bnei_cont.90591

bnei_else.90592:
	lw	%a1, 4(%a1)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f3, 0(%a2)
	flw	%f4, 0(%a1)
	nop
	nop

	flw	%f5, 1(%a2)
	flw	%f6, 1(%a1)
	fmul	%f3, %f3, %f4
	nop

	flw	%f7, 2(%a1)
	nop
	fmul	%f5, %f5, %f6
	nop

	flw	%f5, 2(%a2)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	fmul	%f5, %f5, %f7
	nop

	flw	%f5, 493(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.90612

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90613

fbgt_else.90612:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90613:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90614

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

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90615

bnei_else.90614:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90615:
bnei_cont.90593:
	nop
	nop
	nop
	j	bnei_cont.90591

bnei_else.90590:
	lw	%a2, 0(%sp)
	flw	%f4, 493(%zero)
	nop
	nop

	flw	%f3, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90616

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90617

fbeq_else.90616:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90617:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90618

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90619

bnei_else.90618:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.90620

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90621

fbgt_else.90620:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90621:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90622

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90624

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90623

bnei_else.90624:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90625:
	nop
	nop
	nop
	j	bnei_cont.90623

bnei_else.90622:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.90623:
	flw	%f5, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90626

	nop
	nop
	nop
	j	bnei_cont.90627

bnei_else.90626:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.90627:
	flw	%f6, 1(%a2)
	flw	%f7, 1(%a3)
	fsub	%f5, %f5, %f0
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
	nop
	fblt	%f6, %f7, fbgt_else.90628

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90629

fbgt_else.90628:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90629:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90630

	flw	%f6, 2(%a2)
	flw	%f7, 2(%a3)
	nop
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
	nop
	fblt	%f6, %f7, fbgt_else.90632

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90633

fbgt_else.90632:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90633:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90634

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90631

bnei_else.90634:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90635:
	nop
	nop
	nop
	j	bnei_cont.90631

bnei_else.90630:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90631:
bnei_cont.90619:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90636

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90637

bnei_else.90636:
	flw	%f5, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.90638

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90639

fbeq_else.90638:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90639:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90640

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90641

bnei_else.90640:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.90642

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90643

fbgt_else.90642:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90643:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90644

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90646

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90645

bnei_else.90646:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90647:
	nop
	nop
	nop
	j	bnei_cont.90645

bnei_else.90644:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.90645:
	flw	%f6, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90648

	nop
	nop
	nop
	j	bnei_cont.90649

bnei_else.90648:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.90649:
	flw	%f7, 2(%a2)
	flw	%f8, 2(%a3)
	fsub	%f6, %f6, %f1
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
	nop
	fblt	%f7, %f8, fbgt_else.90650

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90651

fbgt_else.90650:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90651:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90652

	flw	%f8, 0(%a3)
	nop
	fmul	%f7, %f6, %f3
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
	nop
	fblt	%f7, %f8, fbgt_else.90654

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90655

fbgt_else.90654:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90655:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90656

	fsw	%f6, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90653

bnei_else.90656:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90657:
	nop
	nop
	nop
	j	bnei_cont.90653

bnei_else.90652:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90653:
bnei_cont.90641:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90658

	nop
	nop
	addi	%a1, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90659

bnei_else.90658:
	flw	%f6, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.90660

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90661

fbeq_else.90660:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90661:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90662

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90663

bnei_else.90662:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.90664

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90665

fbgt_else.90664:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90665:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90666

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90668

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90667

bnei_else.90668:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90669:
	nop
	nop
	nop
	j	bnei_cont.90667

bnei_else.90666:
	nop
	nop
	add	%a1, %zero, %t0
	nop

bnei_cont.90667:
	flw	%f4, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90670

	nop
	nop
	nop
	j	bnei_cont.90671

bnei_else.90670:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.90671:
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

	flw	%f3, 0(%a3)
	nop
	fadd	%f0, %f3, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.90672

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90673

fbgt_else.90672:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90673:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90674

	nop
	nop
	fmul	%f0, %f2, %f5
	nop

	flw	%f1, 1(%a3)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90676

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90677

fbgt_else.90676:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90677:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90678

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90675

bnei_else.90678:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90679:
	nop
	nop
	nop
	j	bnei_cont.90675

bnei_else.90674:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90675:
bnei_cont.90663:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90680

	nop
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90681

bnei_else.90680:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90681:
bnei_cont.90659:
bnei_cont.90637:
bnei_cont.90591:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90682

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90684

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90685

fbgt_else.90684:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90685:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90686

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.90688

	lw	%a1, 83(%a1)
	lw	%a3, 1(%sp)
	nop
	nop

	sw	%a0, 6(%sp)
	nop
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0

	sw	%ra, 7(%sp)
	nop
	addi	%v0, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90690

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90692

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90694

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90696

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90698

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
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
	jal	solve_one_or_network.2926

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
	j	bnei_cont.90589

bnei_else.90698:
bnei_cont.90699:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90696:
bnei_cont.90697:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90694:
bnei_cont.90695:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90692:
bnei_cont.90693:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90690:
bnei_cont.90691:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90688:
bnei_cont.90689:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90686:
bnei_cont.90687:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90682:
bnei_cont.90683:
	nop
	nop
	nop
	j	bnei_cont.90589

bnei_else.90588:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.90700

	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	nop
	nop

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	sw	%ra, 7(%sp)
	nop
	addi	%a0, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element.2922

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90702

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90704

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90706

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90708

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90710

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
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
	jal	solve_one_or_network.2926

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
	j	bnei_cont.90701

bnei_else.90710:
bnei_cont.90711:
	nop
	nop
	nop
	j	bnei_cont.90701

bnei_else.90708:
bnei_cont.90709:
	nop
	nop
	nop
	j	bnei_cont.90701

bnei_else.90706:
bnei_cont.90707:
	nop
	nop
	nop
	j	bnei_cont.90701

bnei_else.90704:
bnei_cont.90705:
	nop
	nop
	nop
	j	bnei_cont.90701

bnei_else.90702:
bnei_cont.90703:
	nop
	nop
	nop
	j	bnei_cont.90701

bnei_else.90700:
bnei_cont.90701:
bnei_cont.90589:
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	trace_or_matrix.2930

bnei_else.90587:
	nop
	nop
	nop
	jr	%ra

bnei_else.90458:
	nop
	nop
	nop
	jr	%ra

solve_each_element_fast.2936:
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
	beqi	%a2, -1, bnei_else.90714

	lw	%a3, 12(%a2)
	lw	%t2, 1(%a0)
	addi	%t1, %zero, 1
	nop

	lw	%t0, 10(%a3)
	lw	%t3, 1(%a3)
	add	%at, %t2, %a2
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
	nop
	nop
	beqi	%t3, 1, bnei_else.90715

	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.90717

	flw	%f3, 0(%t2)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90719

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90720

fbeq_else.90719:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.90720:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90721

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90716

bnei_else.90721:
	flw	%f5, 1(%t2)
	nop
	nop
	nop

	flw	%f5, 2(%t2)
	nop
	fmul	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f1, %f5, %f1
	nop

	flw	%f1, 3(%t2)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.90723

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90724

fbgt_else.90723:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90724:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90725

	lw	%t0, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90727

	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%t2)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90728

bnei_else.90727:
	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%t2)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.90728:
	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90726

bnei_else.90725:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90726:
bnei_cont.90722:
	nop
	nop
	nop
	j	bnei_cont.90716

bnei_else.90717:
	flw	%f0, 0(%t2)
	flw	%f1, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90729

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90730

fbgt_else.90729:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90730:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90731

	flw	%f1, 3(%t0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90732

bnei_else.90731:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90732:
bnei_cont.90718:
	nop
	nop
	nop
	j	bnei_cont.90716

bnei_else.90715:
	lw	%t0, 0(%a0)
	flw	%f3, 0(%t2)
	nop
	nop

	flw	%f4, 1(%t2)
	flw	%f5, 1(%t0)
	fsub	%f3, %f3, %f0
	nop

	lw	%t3, 4(%a3)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f7, 1(%t3)
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
	nop
	fblt	%f6, %f7, fbgt_else.90733

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90734

fbgt_else.90733:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.90734:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90735

	flw	%f6, 2(%t0)
	lw	%t3, 4(%a3)
	nop
	nop

	flw	%f7, 2(%t3)
	nop
	fmul	%f6, %f3, %f6
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
	nop
	fblt	%f6, %f7, fbgt_else.90737

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90738

fbgt_else.90737:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.90738:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90739

	flw	%f6, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.90741

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90742

fbeq_else.90741:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.90742:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90743

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90736

bnei_else.90743:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.90744:
	nop
	nop
	nop
	j	bnei_cont.90736

bnei_else.90739:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.90740:
	nop
	nop
	nop
	j	bnei_cont.90736

bnei_else.90735:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.90736:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90745

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90746

bnei_else.90745:
	flw	%f3, 2(%t2)
	flw	%f4, 3(%t2)
	nop
	nop

	flw	%f6, 0(%t0)
	lw	%t3, 4(%a3)
	fsub	%f3, %f3, %f1
	nop

	flw	%f8, 0(%t3)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	fblt	%f7, %f8, fbgt_else.90747

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90748

fbgt_else.90747:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.90748:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.90749

	flw	%f7, 2(%t0)
	lw	%t0, 4(%a3)
	nop
	nop

	flw	%f8, 2(%t0)
	nop
	fmul	%f7, %f3, %f7
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
	nop
	fblt	%f7, %f8, fbgt_else.90751

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90752

fbgt_else.90751:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90752:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90753

	flw	%f7, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.90755

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90756

fbeq_else.90755:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90756:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90757

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90750

bnei_else.90757:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90758:
	nop
	nop
	nop
	j	bnei_cont.90750

bnei_else.90753:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90754:
	nop
	nop
	nop
	j	bnei_cont.90750

bnei_else.90749:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90750:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90759

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90760

bnei_else.90759:
	flw	%f3, 4(%t2)
	lw	%t0, 4(%a3)
	nop
	nop

	flw	%f3, 5(%t2)
	nop
	fsub	%f2, %f3, %f2
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f4, %f2, %f6
	nop

	flw	%f4, 0(%t0)
	nop
	fadd	%f0, %f4, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.90761

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90762

fbgt_else.90761:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90762:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90763

	lw	%t0, 4(%a3)
	nop
	fmul	%f0, %f2, %f5
	nop

	flw	%f1, 1(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90765

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90766

fbgt_else.90765:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.90766:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90767

	flw	%f0, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.90769

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90770

fbeq_else.90769:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.90770:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90771

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90764

bnei_else.90771:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.90772:
	nop
	nop
	nop
	j	bnei_cont.90764

bnei_else.90767:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90768:
	nop
	nop
	nop
	j	bnei_cont.90764

bnei_else.90763:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90764:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90773

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90774

bnei_else.90773:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.90774:
bnei_cont.90760:
bnei_cont.90746:
bnei_cont.90716:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90775

	flw	%f0, 135(%zero)
	flw	%f1, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.90776

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90777

fbgt_else.90776:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90777:
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
	beqi	%a3, 0, bnei_else.90778

	flw	%f2, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.90780

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90781

fbgt_else.90780:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90781:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90782

	flw	%f2, 467(%zero)
	flw	%f3, 162(%zero)
	nop
	nop

	flw	%f2, 0(%a1)
	flw	%f4, 163(%zero)
	fadd	%f0, %f0, %f2
	nop

	flw	%f5, 164(%zero)
	sw	%t0, 3(%sp)
	fmul	%f2, %f2, %f0
	nop

	flw	%f3, 1(%a1)
	sw	%a2, 4(%sp)
	fadd	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f0
	nop

	flw	%f4, 2(%a1)
	lw	%a1, 0(%v1)
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f4, %f0
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
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

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.90784

	lw	%a1, 12(%a1)
	nop
	nop
	nop

	lw	%a3, 5(%a1)
	nop
	nop
	nop

	flw	%f5, 0(%a3)
	lw	%a3, 5(%a1)
	nop
	nop

	flw	%f6, 1(%a3)
	lw	%a3, 5(%a1)
	fsub	%f5, %f2, %f5
	nop

	flw	%f7, 2(%a3)
	lw	%a3, 1(%a1)
	fsub	%f6, %f3, %f6
	nop

	nop
	nop
	fsub	%f7, %f4, %f7
	nop

	nop
	nop
	nop
	beqi	%a3, 1, bnei_else.90786

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.90788

	lw	%a3, 4(%a1)
	nop
	fmul	%f8, %f5, %f5
	nop

	flw	%f9, 0(%a3)
	lw	%a3, 4(%a1)
	nop
	nop

	flw	%f10, 1(%a3)
	lw	%a3, 4(%a1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6

	flw	%f10, 2(%a3)
	lw	%a3, 3(%a1)
	fmul	%f9, %f9, %f10
	nop

	nop
	nop
	fadd	%f8, %f8, %f9
	fmul	%f9, %f7, %f7

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
	nop
	beqi	%a3, 0, bnei_else.90790

	lw	%a3, 9(%a1)
	nop
	fmul	%f9, %f6, %f7
	fmul	%f7, %f7, %f5

	flw	%f10, 0(%a3)
	lw	%a3, 9(%a1)
	fmul	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f9, %f9, %f10
	nop

	flw	%f9, 1(%a3)
	lw	%a3, 9(%a1)
	fadd	%f8, %f8, %f9
	nop

	flw	%f6, 2(%a3)
	nop
	fmul	%f7, %f7, %f9
	nop

	nop
	nop
	fadd	%f7, %f8, %f7
	fmul	%f5, %f5, %f6

	nop
	nop
	fadd	%f5, %f7, %f5
	nop

	nop
	nop
	nop
	j	bnei_cont.90791

bnei_else.90790:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.90791:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.90792

	nop
	nop
	nop
	j	bnei_cont.90793

bnei_else.90792:
	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.90793:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.90794

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90795

fbgt_else.90794:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90795:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90796

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90798

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90797

bnei_else.90798:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90799:
	nop
	nop
	nop
	j	bnei_cont.90797

bnei_else.90796:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.90797:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90800

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90787

bnei_else.90800:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90801:
	nop
	nop
	nop
	j	bnei_cont.90787

bnei_else.90788:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	flw	%f8, 0(%a3)
	nop
	nop
	nop

	flw	%f8, 1(%a3)
	nop
	fmul	%f5, %f8, %f5
	nop

	nop
	nop
	fmul	%f6, %f8, %f6
	nop

	flw	%f6, 2(%a3)
	nop
	fadd	%f5, %f5, %f6
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
	nop
	fblt	%f5, %f1, fbgt_else.90802

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90803

fbgt_else.90802:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90803:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90804

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90806

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90805

bnei_else.90806:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90807:
	nop
	nop
	nop
	j	bnei_cont.90805

bnei_else.90804:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.90805:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90808

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90809

bnei_else.90808:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90809:
bnei_cont.90789:
	nop
	nop
	nop
	j	bnei_cont.90787

bnei_else.90786:
	lw	%a3, 4(%a1)
	nop
	fabs	%f1, %f5
	nop

	flw	%f5, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.90810

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90811

fbgt_else.90810:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90811:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90812

	lw	%a3, 4(%a1)
	nop
	fabs	%f1, %f6
	nop

	flw	%f5, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.90814

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90815

fbgt_else.90814:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90815:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90816

	lw	%a3, 4(%a1)
	nop
	fabs	%f1, %f7
	nop

	flw	%f5, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.90818

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90813

fbgt_else.90818:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90819:
	nop
	nop
	nop
	j	bnei_cont.90813

bnei_else.90816:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90817:
	nop
	nop
	nop
	j	bnei_cont.90813

bnei_else.90812:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90813:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90820

	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90821

bnei_else.90820:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90822

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90823

bnei_else.90822:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.90823:
bnei_cont.90821:
bnei_cont.90787:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90824

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90785

bnei_else.90824:
	sw	%ra, 9(%sp)
	nop
	addi	%v0, %t1, 0
	fmov	%f1, %f3

	nop
	nop
	fmov	%f0, %f2
	fmov	%f2, %f4

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.90825:
	nop
	nop
	nop
	j	bnei_cont.90785

bnei_else.90784:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.90785:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.90826

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

	fsw	%f0, 140(%zero)
	nop
	nop
	nop

	sw	%v0, 141(%zero)
	lw	%v0, 3(%sp)
	nop
	nop

	sw	%v0, 136(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90779

bnei_else.90826:
bnei_cont.90827:
	nop
	nop
	nop
	j	bnei_cont.90779

bnei_else.90782:
bnei_cont.90783:
	nop
	nop
	nop
	j	bnei_cont.90779

bnei_else.90778:
bnei_cont.90779:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.90775:
	lw	%a1, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90828

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.90828:
	nop
	nop
	nop
	jr	%ra

bnei_else.90714:
	nop
	nop
	nop
	jr	%ra

solve_one_or_network_fast.2940:
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
	beqi	%a1, -1, bnei_else.90831

	lw	%a1, 83(%a1)
	sw	%a0, 0(%sp)
	addi	%a2, %zero, 0
	nop

	sw	%a2, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%v0, %a2, 0
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
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	lw	%v0, 3(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90832

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 5(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90833

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 5(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 6(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90834

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 6(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 7(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90835

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 7(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 8(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90836

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 9(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90837

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 9(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

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
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
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
	beqi	%a0, -1, bnei_else.90838

	lw	%a0, 83(%a0)
	lw	%a1, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	sw	%v0, 10(%sp)
	addi	%v1, %a0, 0
	addi	%v0, %a1, 0

	sw	%ra, 11(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	nop
	nop

	lw	%v1, 2(%sp)
	lw	%a0, 0(%sp)
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_one_or_network_fast.2940

bnei_else.90838:
	nop
	nop
	nop
	jr	%ra

bnei_else.90837:
	nop
	nop
	nop
	jr	%ra

bnei_else.90836:
	nop
	nop
	nop
	jr	%ra

bnei_else.90835:
	nop
	nop
	nop
	jr	%ra

bnei_else.90834:
	nop
	nop
	nop
	jr	%ra

bnei_else.90833:
	nop
	nop
	nop
	jr	%ra

bnei_else.90832:
	nop
	nop
	nop
	jr	%ra

bnei_else.90831:
	nop
	nop
	nop
	jr	%ra

trace_or_matrix_fast.2944:
	nop
	nop
	add	%at, %v1, %v0
	addi	%a2, %zero, 0

	lw	%a1, 0(%at)
	nop
	nop
	nop

	lw	%a3, 0(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90847

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

	nop
	nop
	nop
	beqi	%a3, 99, bnei_else.90848

	lw	%t0, 12(%a3)
	lw	%t2, 1(%a0)
	nop
	nop

	lw	%t1, 10(%t0)
	lw	%t2, 1(%t0)
	add	%at, %t2, %a3
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
	nop
	nop
	beqi	%t2, 1, bnei_else.90850

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.90852

	flw	%f3, 0(%a3)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90854

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90855

fbeq_else.90854:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.90855:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90856

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90851

bnei_else.90856:
	flw	%f5, 1(%a3)
	nop
	nop
	nop

	flw	%f5, 2(%a3)
	nop
	fmul	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f1, %f5, %f1
	nop

	flw	%f1, 3(%a3)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.90858

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90859

fbgt_else.90858:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90859:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90860

	lw	%t0, 6(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.90862

	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%a3)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90863

bnei_else.90862:
	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%a3)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.90863:
	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90861

bnei_else.90860:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90861:
bnei_cont.90857:
	nop
	nop
	nop
	j	bnei_cont.90851

bnei_else.90852:
	flw	%f0, 0(%a3)
	flw	%f1, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90864

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90865

fbgt_else.90864:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90865:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90866

	flw	%f1, 3(%t1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90867

bnei_else.90866:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90867:
bnei_cont.90853:
	nop
	nop
	nop
	j	bnei_cont.90851

bnei_else.90850:
	lw	%t1, 0(%a0)
	flw	%f3, 0(%a3)
	nop
	nop

	flw	%f4, 1(%a3)
	flw	%f5, 1(%t1)
	fsub	%f3, %f3, %f0
	nop

	lw	%t2, 4(%t0)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f7, 1(%t2)
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
	nop
	fblt	%f6, %f7, fbgt_else.90868

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90869

fbgt_else.90868:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90869:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90870

	flw	%f6, 2(%t1)
	lw	%t2, 4(%t0)
	nop
	nop

	flw	%f7, 2(%t2)
	nop
	fmul	%f6, %f3, %f6
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
	nop
	fblt	%f6, %f7, fbgt_else.90872

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90873

fbgt_else.90872:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90873:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90874

	flw	%f6, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.90876

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90877

fbeq_else.90876:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.90877:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90878

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90871

bnei_else.90878:
	nop
	nop
	addi	%t2, %zero, 1
	nop

bnei_cont.90879:
	nop
	nop
	nop
	j	bnei_cont.90871

bnei_else.90874:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.90875:
	nop
	nop
	nop
	j	bnei_cont.90871

bnei_else.90870:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.90871:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90880

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90881

bnei_else.90880:
	flw	%f3, 2(%a3)
	flw	%f4, 3(%a3)
	nop
	nop

	flw	%f6, 0(%t1)
	lw	%t2, 4(%t0)
	fsub	%f3, %f3, %f1
	nop

	flw	%f8, 0(%t2)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	fblt	%f7, %f8, fbgt_else.90882

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90883

fbgt_else.90882:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.90883:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.90884

	flw	%f7, 2(%t1)
	lw	%t1, 4(%t0)
	nop
	nop

	flw	%f8, 2(%t1)
	nop
	fmul	%f7, %f3, %f7
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
	nop
	fblt	%f7, %f8, fbgt_else.90886

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90887

fbgt_else.90886:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90887:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90888

	flw	%f7, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.90890

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90891

fbeq_else.90890:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.90891:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90892

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90885

bnei_else.90892:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90893:
	nop
	nop
	nop
	j	bnei_cont.90885

bnei_else.90888:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90889:
	nop
	nop
	nop
	j	bnei_cont.90885

bnei_else.90884:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90885:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90894

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90895

bnei_else.90894:
	flw	%f3, 4(%a3)
	nop
	nop
	nop

	flw	%f3, 5(%a3)
	lw	%a3, 4(%t0)
	fsub	%f2, %f3, %f2
	nop

	nop
	nop
	fmul	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f4, %f2, %f6
	nop

	flw	%f4, 0(%a3)
	nop
	fadd	%f0, %f4, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.90896

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90897

fbgt_else.90896:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90897:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90898

	lw	%a3, 4(%t0)
	nop
	fmul	%f0, %f2, %f5
	nop

	flw	%f1, 1(%a3)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90900

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90901

fbgt_else.90900:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90901:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90902

	flw	%f0, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.90904

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90905

fbeq_else.90904:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.90905:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90906

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90899

bnei_else.90906:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.90907:
	nop
	nop
	nop
	j	bnei_cont.90899

bnei_else.90902:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90903:
	nop
	nop
	nop
	j	bnei_cont.90899

bnei_else.90898:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90899:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90908

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a3, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.90909

bnei_else.90908:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.90909:
bnei_cont.90895:
bnei_cont.90881:
bnei_cont.90851:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90910

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90912

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90913

fbgt_else.90912:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90913:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90914

	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90916

	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90918

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90920

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90922

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90924

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90926

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90928

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.90849

bnei_else.90928:
bnei_cont.90929:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90926:
bnei_cont.90927:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90924:
bnei_cont.90925:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90922:
bnei_cont.90923:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90920:
bnei_cont.90921:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90918:
bnei_cont.90919:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90916:
bnei_cont.90917:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90914:
bnei_cont.90915:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90910:
bnei_cont.90911:
	nop
	nop
	nop
	j	bnei_cont.90849

bnei_else.90848:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.90930

	lw	%a3, 83(%a3)
	sw	%a1, 4(%sp)
	addi	%v0, %a2, 0
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90932

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90934

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90936

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90938

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90940

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 7(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.90942

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 5(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 5(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	sw	%ra, 5(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.90931

bnei_else.90942:
bnei_cont.90943:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90940:
bnei_cont.90941:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90938:
bnei_cont.90939:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90936:
bnei_cont.90937:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90934:
bnei_cont.90935:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90932:
bnei_cont.90933:
	nop
	nop
	nop
	j	bnei_cont.90931

bnei_else.90930:
bnei_cont.90931:
bnei_cont.90849:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	nop
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
	beqi	%a1, -1, bnei_else.90944

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.90945

	lw	%a2, 12(%a1)
	lw	%t0, 0(%sp)
	nop
	nop

	lw	%a3, 10(%a2)
	lw	%t1, 1(%t0)
	nop
	nop

	flw	%f0, 0(%a3)
	flw	%f1, 1(%a3)
	add	%at, %t1, %a1
	nop

	flw	%f2, 2(%a3)
	lw	%a1, 0(%at)
	nop
	nop

	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.90947

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.90949

	flw	%f3, 0(%a1)
	flw	%f4, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.90951

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90952

fbeq_else.90951:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.90952:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90953

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90948

bnei_else.90953:
	flw	%f5, 1(%a1)
	nop
	nop
	nop

	flw	%f5, 2(%a1)
	nop
	fmul	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f1, %f5, %f1
	nop

	flw	%f1, 3(%a1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%a3)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f0
	fmul	%f1, %f3, %f1

	nop
	nop
	fsub	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f4, %f1, fbgt_else.90955

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90956

fbgt_else.90955:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.90956:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.90957

	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90959

	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%a1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.90960

bnei_else.90959:
	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%a1)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

bnei_cont.90960:
	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90958

bnei_else.90957:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90958:
bnei_cont.90954:
	nop
	nop
	nop
	j	bnei_cont.90948

bnei_else.90949:
	flw	%f0, 0(%a1)
	flw	%f1, 493(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.90961

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90962

fbgt_else.90961:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90962:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90963

	flw	%f1, 3(%a3)
	nop
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90964

bnei_else.90963:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90964:
bnei_cont.90950:
	nop
	nop
	nop
	j	bnei_cont.90948

bnei_else.90947:
	lw	%a3, 0(%t0)
	flw	%f3, 0(%a1)
	nop
	nop

	flw	%f4, 1(%a1)
	flw	%f5, 1(%a3)
	fsub	%f3, %f3, %f0
	nop

	lw	%t1, 4(%a2)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f7, 1(%t1)
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
	nop
	fblt	%f6, %f7, fbgt_else.90965

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90966

fbgt_else.90965:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90966:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90967

	flw	%f6, 2(%a3)
	lw	%t1, 4(%a2)
	nop
	nop

	flw	%f8, 2(%t1)
	nop
	fmul	%f6, %f3, %f6
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
	nop
	fblt	%f6, %f8, fbgt_else.90969

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90970

fbgt_else.90969:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90970:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90971

	flw	%f6, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.90973

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90974

fbeq_else.90973:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.90974:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90975

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90968

bnei_else.90975:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.90976:
	nop
	nop
	nop
	j	bnei_cont.90968

bnei_else.90971:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90972:
	nop
	nop
	nop
	j	bnei_cont.90968

bnei_else.90967:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.90968:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90977

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.90978

bnei_else.90977:
	flw	%f3, 2(%a1)
	flw	%f4, 3(%a1)
	nop
	nop

	flw	%f6, 0(%a3)
	lw	%t1, 4(%a2)
	fsub	%f3, %f3, %f1
	nop

	flw	%f9, 0(%t1)
	nop
	fmul	%f3, %f3, %f4
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
	nop
	fblt	%f8, %f9, fbgt_else.90979

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90980

fbgt_else.90979:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.90980:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.90981

	flw	%f8, 2(%a3)
	lw	%a2, 4(%a2)
	nop
	nop

	flw	%f10, 2(%a2)
	nop
	fmul	%f8, %f3, %f8
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
	nop
	fblt	%f8, %f10, fbgt_else.90983

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90984

fbgt_else.90983:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.90984:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90985

	flw	%f8, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f8, fbeq_else.90987

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.90988

fbeq_else.90987:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.90988:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90989

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90982

bnei_else.90989:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.90990:
	nop
	nop
	nop
	j	bnei_cont.90982

bnei_else.90985:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90986:
	nop
	nop
	nop
	j	bnei_cont.90982

bnei_else.90981:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.90982:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.90991

	fsw	%f3, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.90992

bnei_else.90991:
	flw	%f3, 4(%a1)
	nop
	nop
	nop

	flw	%f3, 5(%a1)
	nop
	fsub	%f2, %f3, %f2
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
	nop
	fblt	%f0, %f9, fbgt_else.90993

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90994

fbgt_else.90993:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90994:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90995

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
	nop
	fblt	%f0, %f7, fbgt_else.90997

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.90998

fbgt_else.90997:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.90998:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.90999

	flw	%f0, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.91001

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91002

fbeq_else.91001:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.91002:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91003

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.90996

bnei_else.91003:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.91004:
	nop
	nop
	nop
	j	bnei_cont.90996

bnei_else.90999:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.91000:
	nop
	nop
	nop
	j	bnei_cont.90996

bnei_else.90995:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.90996:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91005

	fsw	%f2, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.91006

bnei_else.91005:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.91006:
bnei_cont.90992:
bnei_cont.90978:
bnei_cont.90948:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91007

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91009

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91010

fbgt_else.91009:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91010:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91011

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.91013

	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	nop
	nop

	sw	%a0, 6(%sp)
	nop
	addi	%a0, %t0, 0
	addi	%v1, %a1, 0

	sw	%ra, 7(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91015

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91017

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91019

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91021

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91023

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
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
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.90946

bnei_else.91023:
bnei_cont.91024:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91021:
bnei_cont.91022:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91019:
bnei_cont.91020:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91017:
bnei_cont.91018:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91015:
bnei_cont.91016:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91013:
bnei_cont.91014:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91011:
bnei_cont.91012:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.91007:
bnei_cont.91008:
	nop
	nop
	nop
	j	bnei_cont.90946

bnei_else.90945:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.91025

	lw	%a1, 83(%a1)
	lw	%a2, 1(%sp)
	nop
	nop

	lw	%a3, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a2, 0

	sw	%ra, 7(%sp)
	nop
	addi	%a0, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91027

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91029

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91031

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91033

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 6(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91035

	lw	%v1, 83(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a1, 0(%sp)
	sw	%ra, 7(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
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
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.91026

bnei_else.91035:
bnei_cont.91036:
	nop
	nop
	nop
	j	bnei_cont.91026

bnei_else.91033:
bnei_cont.91034:
	nop
	nop
	nop
	j	bnei_cont.91026

bnei_else.91031:
bnei_cont.91032:
	nop
	nop
	nop
	j	bnei_cont.91026

bnei_else.91029:
bnei_cont.91030:
	nop
	nop
	nop
	j	bnei_cont.91026

bnei_else.91027:
bnei_cont.91028:
	nop
	nop
	nop
	j	bnei_cont.91026

bnei_else.91025:
bnei_cont.91026:
bnei_cont.90946:
	lw	%v0, 5(%sp)
	lw	%v1, 2(%sp)
	nop
	nop

	lw	%a0, 0(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	trace_or_matrix_fast.2944

bnei_else.90944:
	nop
	nop
	nop
	jr	%ra

bnei_else.90847:
	nop
	nop
	nop
	jr	%ra

trace_reflections.2966:
	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.91039

	lw	%a1, 254(%v0)
	flw	%f2, 465(%zero)
	nop
	nop

	lw	%a2, 1(%a1)
	fsw	%f2, 137(%zero)
	nop
	nop

	lw	%a3, 134(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %a0, 0
	nop

	fsw	%f1, 1(%sp)
	nop
	nop
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%v1, %a3, 0
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
	nop

	sw	%a0, 6(%sp)
	nop
	addi	%a0, %a2, 0
	nop

	sw	%a1, 7(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91040

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91041

fbgt_else.91040:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91041:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91042

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91044

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91043

fbgt_else.91044:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91045:
	nop
	nop
	nop
	j	bnei_cont.91043

bnei_else.91042:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91043:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91046

	lw	%v0, 141(%zero)
	lw	%v1, 136(%zero)
	nop
	nop

	nop
	nop
	sll	%v0, %v0, 2
	nop

	lw	%v1, 7(%sp)
	nop
	add	%v0, %v0, %v1
	nop

	lw	%a0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%v0, %a0, beq_else.91048

	lw	%v0, 6(%sp)
	lw	%a0, 5(%sp)
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.91050

	nop
	nop
	nop
	j	bnei_cont.91047

bnei_else.91050:
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
	nop

	flw	%f1, 143(%zero)
	flw	%f4, 0(%v0)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 7(%sp)
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	flw	%f5, 1(%v0)
	fadd	%f0, %f0, %f1
	nop

	flw	%f2, 3(%sp)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	lw	%v1, 2(%sp)
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f3, %f1, %f2
	nop

	flw	%f3, 0(%v1)
	nop
	fmul	%f0, %f3, %f0
	nop

	flw	%f4, 1(%v1)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f5, 2(%v0)
	nop
	fmul	%f4, %f4, %f5
	nop

	flw	%f4, 2(%v1)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f4, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f4
	nop

	flw	%f3, 493(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.91052

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91053

fbgt_else.91052:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91053:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91054

	flw	%f4, 151(%zero)
	flw	%f5, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f5, %f0, %f5
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	fsw	%f4, 151(%zero)
	nop
	nop
	nop

	flw	%f4, 152(%zero)
	flw	%f5, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f5, %f0, %f5
	nop

	nop
	nop
	fadd	%f4, %f4, %f5
	nop

	fsw	%f4, 152(%zero)
	nop
	nop
	nop

	flw	%f4, 153(%zero)
	flw	%f5, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f5
	nop

	nop
	nop
	fadd	%f0, %f4, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91055

bnei_else.91054:
bnei_cont.91055:
	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.91056

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91057

fbgt_else.91056:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91057:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91058

	flw	%f1, 1(%sp)
	flw	%f3, 151(%zero)
	fmul	%f0, %f1, %f1
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

	fsw	%f3, 151(%zero)
	nop
	nop
	nop

	flw	%f3, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f3, %f3, %f0
	nop

	fsw	%f3, 152(%zero)
	nop
	nop
	nop

	flw	%f3, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f3, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91059

bnei_else.91058:
bnei_cont.91059:
bnei_cont.91051:
	nop
	nop
	nop
	j	bnei_cont.91047

beq_else.91048:
beq_cont.91049:
	nop
	nop
	nop
	j	bnei_cont.91047

bnei_else.91046:
bnei_cont.91047:
	lw	%v0, 0(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	flw	%f1, 1(%sp)
	lw	%v1, 2(%sp)
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	j	trace_reflections.2966

bgti_else.91039:
	nop
	nop
	nop
	jr	%ra

trace_ray.2971:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.91061

	lw	%a1, 2(%a0)
	flw	%f2, 465(%zero)
	addi	%a2, %zero, 0
	nop

	fsw	%f2, 137(%zero)
	fsw	%f1, 0(%sp)
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
	nop

	sw	%a0, 3(%sp)
	nop
	addi	%a0, %v1, 0
	nop

	fsw	%f0, 4(%sp)
	nop
	nop
	nop

	sw	%v1, 5(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	sw	%v0, 6(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a1, 7(%sp)
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
	jal	trace_or_matrix.2930

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91062

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91063

fbgt_else.91062:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91063:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91064

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91066

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91065

fbgt_else.91066:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91067:
	nop
	nop
	nop
	j	bnei_cont.91065

bnei_else.91064:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91065:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91068

	lw	%v0, 141(%zero)
	flw	%f2, 4(%sp)
	addi	%a2, %zero, 1
	nop

	lw	%v1, 12(%v0)
	nop
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
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.91069

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.91071

	flw	%f3, 138(%zero)
	lw	%a1, 5(%v1)
	nop
	nop

	flw	%f4, 0(%a1)
	lw	%a1, 5(%v1)
	nop
	nop

	flw	%f4, 139(%zero)
	flw	%f5, 1(%a1)
	fsub	%f3, %f3, %f4
	nop

	flw	%f5, 140(%zero)
	lw	%a1, 5(%v1)
	fsub	%f4, %f4, %f5
	nop

	flw	%f6, 2(%a1)
	lw	%a1, 4(%v1)
	nop
	nop

	flw	%f6, 0(%a1)
	lw	%a1, 4(%v1)
	fsub	%f5, %f5, %f6
	nop

	flw	%f7, 1(%a1)
	lw	%a1, 4(%v1)
	fmul	%f6, %f3, %f6
	nop

	flw	%f8, 2(%a1)
	lw	%a1, 3(%v1)
	fmul	%f7, %f4, %f7
	nop

	nop
	nop
	fmul	%f8, %f5, %f8
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91073

	lw	%a1, 9(%v1)
	nop
	nop
	nop

	flw	%f9, 2(%a1)
	lw	%a1, 9(%v1)
	nop
	nop

	flw	%f10, 1(%a1)
	lw	%a1, 9(%v1)
	fmul	%f9, %f4, %f9
	nop

	nop
	nop
	fmul	%f10, %f5, %f10
	nop

	flw	%f10, 471(%zero)
	nop
	fadd	%f9, %f9, %f10
	nop

	nop
	nop
	fmul	%f9, %f9, %f10
	nop

	nop
	nop
	fadd	%f6, %f6, %f9
	nop

	fsw	%f6, 142(%zero)
	flw	%f6, 2(%a1)
	nop
	nop

	lw	%a1, 9(%v1)
	nop
	fmul	%f6, %f3, %f6
	nop

	flw	%f9, 0(%a1)
	lw	%a1, 9(%v1)
	nop
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

	fsw	%f5, 143(%zero)
	flw	%f5, 1(%a1)
	nop
	nop

	lw	%a1, 9(%v1)
	nop
	fmul	%f3, %f3, %f5
	nop

	flw	%f5, 0(%a1)
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
	fmul	%f3, %f3, %f10
	nop

	nop
	nop
	fadd	%f3, %f8, %f3
	nop

	fsw	%f3, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91074

bnei_else.91073:
	fsw	%f6, 142(%zero)
	nop
	nop
	nop

	fsw	%f7, 143(%zero)
	nop
	nop
	nop

	fsw	%f8, 144(%zero)
	nop
	nop
	nop

bnei_cont.91074:
	lw	%a1, 6(%v1)
	flw	%f3, 142(%zero)
	nop
	nop

	flw	%f5, 143(%zero)
	nop
	fmul	%f4, %f3, %f3
	nop

	nop
	nop
	fmul	%f6, %f5, %f5
	nop

	flw	%f6, 144(%zero)
	nop
	fadd	%f4, %f4, %f6
	nop

	nop
	nop
	fmul	%f7, %f6, %f6
	nop

	flw	%f7, 493(%zero)
	nop
	fadd	%f4, %f4, %f7
	nop

	nop
	nop
	fsqrt	%f4, %f4
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.91075

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91076

fbeq_else.91075:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.91076:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.91077

	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91078

bnei_else.91077:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91079

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f7, %f4
	nop

	nop
	nop
	nop
	j	bnei_cont.91080

bnei_else.91079:
	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f7, %f4
	nop

bnei_cont.91080:
bnei_cont.91078:
	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	fsw	%f3, 142(%zero)
	nop
	fmul	%f3, %f5, %f4
	nop

	fsw	%f3, 143(%zero)
	nop
	fmul	%f3, %f6, %f4
	nop

	fsw	%f3, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91070

bnei_else.91071:
	lw	%a1, 4(%v1)
	nop
	nop
	nop

	flw	%f3, 0(%a1)
	lw	%a1, 4(%v1)
	nop
	nop

	nop
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 1(%a1)
	nop
	nop

	lw	%a1, 4(%v1)
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 143(%zero)
	flw	%f3, 2(%a1)
	nop
	nop

	nop
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 144(%zero)
	nop
	nop
	nop

bnei_cont.91072:
	nop
	nop
	nop
	j	bnei_cont.91070

bnei_else.91069:
	lw	%a1, 136(%zero)
	flw	%f3, 493(%zero)
	nop
	nop

	fsw	%f3, 142(%zero)
	lw	%a3, 5(%sp)
	addi	%a1, %a1, -1
	nop

	fsw	%f3, 143(%zero)
	nop
	add	%at, %a3, %a1
	nop

	fsw	%f3, 144(%zero)
	flw	%f4, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f3, fbeq_else.91081

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91082

fbeq_else.91081:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.91082:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.91083

	nop
	nop
	nop
	j	bnei_cont.91084

bnei_else.91083:
	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91085

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91086

fbgt_else.91085:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.91086:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.91087

	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91088

bnei_else.91087:
	flw	%f3, 490(%zero)
	nop
	nop
	nop

bnei_cont.91088:
bnei_cont.91084:
	nop
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 142(%a1)
	nop
	nop
	nop

bnei_cont.91070:
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

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.91089

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.91091

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.91093

	nop
	nop
	nop
	beqi	%a1, 4, bnei_else.91095

	nop
	nop
	nop
	j	bnei_cont.91090

bnei_else.91095:
	lw	%a1, 5(%v1)
	flw	%f10, 463(%zero)
	nop
	nop

	flw	%f6, 0(%a1)
	lw	%a1, 4(%v1)
	nop
	nop

	flw	%f7, 0(%a1)
	lw	%a1, 5(%v1)
	fsub	%f6, %f3, %f6
	nop

	nop
	nop
	fsqrt	%f7, %f7
	nop

	flw	%f7, 2(%a1)
	lw	%a1, 4(%v1)
	fmul	%f6, %f6, %f7
	nop

	flw	%f8, 2(%a1)
	nop
	fsub	%f7, %f5, %f7
	nop

	nop
	nop
	fsqrt	%f8, %f8
	nop

	nop
	nop
	fmul	%f7, %f7, %f8
	fmul	%f8, %f6, %f6

	nop
	nop
	fmul	%f9, %f7, %f7
	nop

	nop
	nop
	fadd	%f8, %f8, %f9
	fabs	%f9, %f6

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.91097

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91098

fbgt_else.91097:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91098:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91099

	flw	%f6, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91100

bnei_else.91099:
	flw	%f7, 493(%zero)
	nop
	fdiv	%f6, %f7, %f6
	nop

	nop
	nop
	fabs	%f6, %f6
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.91101

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91102

fbgt_else.91101:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.91102:
	flw	%f9, 461(%zero)
	nop
	fabs	%f7, %f6
	nop

	nop
	nop
	nop
	fblt	%f7, %f9, fbgt_else.91103

	flw	%f6, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f6, fbgt_else.91105

	flw	%f6, 476(%zero)
	flw	%f9, 491(%zero)
	nop
	nop

	flw	%f13, 460(%zero)
	flw	%f14, 459(%zero)
	fdiv	%f7, %f9, %f7
	nop

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
	fmul	%f14, %f14, %f7
	nop

	nop
	nop
	fmul	%f14, %f14, %f11
	nop

	flw	%f14, 458(%zero)
	nop
	fadd	%f13, %f13, %f14
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

	flw	%f14, 457(%zero)
	nop
	fsub	%f13, %f13, %f14
	nop

	nop
	nop
	fmul	%f14, %f14, %f7
	nop

	nop
	nop
	fmul	%f14, %f14, %f12
	nop

	flw	%f14, 456(%zero)
	nop
	fadd	%f13, %f13, %f14
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

	flw	%f13, 455(%zero)
	nop
	fsub	%f9, %f13, %f9
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
	nop
	j	fbgt_cont.91106

fbgt_else.91105:
	flw	%f6, 475(%zero)
	flw	%f9, 491(%zero)
	nop
	nop

	flw	%f13, 460(%zero)
	flw	%f14, 459(%zero)
	fsub	%f11, %f7, %f9
	fadd	%f7, %f7, %f9

	nop
	nop
	fdiv	%f7, %f11, %f7
	nop

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
	fmul	%f14, %f14, %f7
	nop

	nop
	nop
	fmul	%f14, %f14, %f11
	nop

	flw	%f14, 458(%zero)
	nop
	fadd	%f13, %f13, %f14
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

	flw	%f14, 457(%zero)
	nop
	fsub	%f13, %f13, %f14
	nop

	nop
	nop
	fmul	%f14, %f14, %f7
	nop

	nop
	nop
	fmul	%f14, %f14, %f12
	nop

	flw	%f14, 456(%zero)
	nop
	fadd	%f13, %f13, %f14
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

	flw	%f13, 455(%zero)
	nop
	fsub	%f9, %f13, %f9
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
	nop

fbgt_cont.91106:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91107

	nop
	nop
	nop
	j	fbgt_cont.91104

bnei_else.91107:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.91108:
	nop
	nop
	nop
	j	fbgt_cont.91104

fbgt_else.91103:
	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)
	fmul	%f7, %f6, %f6
	nop

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
	fmul	%f13, %f13, %f9
	nop

	flw	%f13, 458(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f13, 457(%zero)
	nop
	fsub	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f6
	nop

	nop
	nop
	fmul	%f13, %f13, %f11
	nop

	flw	%f13, 456(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f12, 455(%zero)
	nop
	fsub	%f7, %f12, %f7
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
	nop

fbgt_cont.91104:
	flw	%f7, 453(%zero)
	nop
	nop
	nop

	flw	%f7, 452(%zero)
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fdiv	%f6, %f6, %f7
	nop

bnei_cont.91100:
	lw	%a1, 5(%v1)
	nop
	floor	%f7, %f6
	nop

	flw	%f7, 1(%a1)
	lw	%a1, 4(%v1)
	fsub	%f6, %f6, %f7
	nop

	flw	%f9, 1(%a1)
	nop
	fsub	%f7, %f4, %f7
	nop

	nop
	nop
	fsqrt	%f9, %f9
	nop

	nop
	nop
	fmul	%f7, %f7, %f9
	fabs	%f9, %f8

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.91109

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91110

fbgt_else.91109:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91110:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91111

	flw	%f7, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91112

bnei_else.91111:
	flw	%f8, 493(%zero)
	nop
	fdiv	%f7, %f7, %f8
	nop

	nop
	nop
	fabs	%f7, %f7
	nop

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.91113

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91114

fbgt_else.91113:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.91114:
	flw	%f9, 461(%zero)
	nop
	fabs	%f8, %f7
	nop

	nop
	nop
	nop
	fblt	%f8, %f9, fbgt_else.91115

	flw	%f7, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.91117

	flw	%f7, 476(%zero)
	flw	%f9, 491(%zero)
	nop
	nop

	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)
	fdiv	%f8, %f9, %f8
	nop

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
	fmul	%f13, %f13, %f8
	nop

	nop
	nop
	fmul	%f13, %f13, %f10
	nop

	flw	%f13, 458(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f13, 457(%zero)
	nop
	fsub	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f8
	nop

	nop
	nop
	fmul	%f13, %f13, %f11
	nop

	flw	%f13, 456(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f12, 455(%zero)
	nop
	fsub	%f9, %f12, %f9
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
	nop
	j	fbgt_cont.91118

fbgt_else.91117:
	flw	%f7, 475(%zero)
	flw	%f9, 491(%zero)
	nop
	nop

	flw	%f12, 460(%zero)
	flw	%f13, 459(%zero)
	fsub	%f10, %f8, %f9
	fadd	%f8, %f8, %f9

	nop
	nop
	fdiv	%f8, %f10, %f8
	nop

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
	fmul	%f13, %f13, %f8
	nop

	nop
	nop
	fmul	%f13, %f13, %f10
	nop

	flw	%f13, 458(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f13, 457(%zero)
	nop
	fsub	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f8
	nop

	nop
	nop
	fmul	%f13, %f13, %f11
	nop

	flw	%f13, 456(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f12, 455(%zero)
	nop
	fsub	%f9, %f12, %f9
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
	nop

fbgt_cont.91118:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91119

	nop
	nop
	nop
	j	fbgt_cont.91116

bnei_else.91119:
	nop
	nop
	fneg	%f7, %f7
	nop

bnei_cont.91120:
	nop
	nop
	nop
	j	fbgt_cont.91116

fbgt_else.91115:
	flw	%f11, 460(%zero)
	flw	%f12, 459(%zero)
	fmul	%f8, %f7, %f7
	nop

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
	fmul	%f12, %f12, %f9
	nop

	flw	%f12, 458(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f12, 457(%zero)
	nop
	fsub	%f11, %f11, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f7
	nop

	nop
	nop
	fmul	%f12, %f12, %f10
	nop

	flw	%f12, 456(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f11, 455(%zero)
	nop
	fsub	%f8, %f11, %f8
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
	nop

fbgt_cont.91116:
	flw	%f8, 453(%zero)
	nop
	nop
	nop

	flw	%f8, 452(%zero)
	nop
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fdiv	%f7, %f7, %f8
	nop

bnei_cont.91112:
	flw	%f9, 471(%zero)
	nop
	floor	%f8, %f7
	nop

	flw	%f8, 451(%zero)
	nop
	fsub	%f7, %f7, %f8
	fsub	%f6, %f9, %f6

	nop
	nop
	fmul	%f6, %f6, %f6
	fsub	%f7, %f9, %f7

	nop
	nop
	fsub	%f6, %f8, %f6
	fmul	%f7, %f7, %f7

	flw	%f7, 493(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.91121

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91122

fbgt_else.91121:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91122:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91123

	nop
	nop
	fmov	%f6, %f7
	nop

	nop
	nop
	nop
	j	bnei_cont.91124

bnei_else.91123:
bnei_cont.91124:
	flw	%f7, 450(%zero)
	nop
	nop
	nop

	flw	%f7, 449(%zero)
	nop
	fmul	%f6, %f7, %f6
	nop

	nop
	nop
	fdiv	%f6, %f6, %f7
	nop

	fsw	%f6, 147(%zero)
	nop
	nop
	nop

bnei_cont.91096:
	nop
	nop
	nop
	j	bnei_cont.91090

bnei_else.91093:
	lw	%a1, 5(%v1)
	flw	%f8, 488(%zero)
	nop
	nop

	flw	%f6, 0(%a1)
	lw	%a1, 5(%v1)
	nop
	nop

	flw	%f7, 2(%a1)
	nop
	fsub	%f6, %f3, %f6
	nop

	nop
	nop
	fsub	%f7, %f5, %f7
	fmul	%f6, %f6, %f6

	nop
	nop
	fmul	%f7, %f7, %f7
	nop

	flw	%f7, 448(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 452(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	flw	%f7, 489(%zero)
	nop
	fmul	%f6, %f6, %f7
	nop

	fsw	%f7, 17(%sp)
	nop
	fabs	%f6, %f6
	nop

	fsw	%f8, 18(%sp)
	nop
	nop
	nop

	fsw	%f6, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.91125

	flw	%f9, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91127

	flw	%f9, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91129

	flw	%f9, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91131

	flw	%f9, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91133

	flw	%f9, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91135

	flw	%f9, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91137

	flw	%f9, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91139

	flw	%f9, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91141

	flw	%f9, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91143

	flw	%f9, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91145

	flw	%f9, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91147

	flw	%f9, 447(%zero)
	sw	%ra, 20(%sp)
	fmov	%f0, %f6
	nop

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

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91147:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91148:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91145:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91146:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91143:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91144:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91141:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91142:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91139:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91140:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91137:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91138:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91135:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91136:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91133:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91134:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91131:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91132:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91129:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91130:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91127:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91128:
	nop
	nop
	nop
	j	fbgt_cont.91126

fbgt_else.91125:
	nop
	nop
	fmov	%f1, %f8
	nop

fbgt_cont.91126:
	flw	%f0, 19(%sp)
	flw	%f2, 18(%sp)
	nop
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91149

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91150

fbgt_else.91149:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91150:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91151

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91152

fbgt_else.91151:
fbgt_cont.91152:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91153

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91155

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91154

bnei_else.91155:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91156:
	nop
	nop
	nop
	j	fbgt_cont.91154

fbgt_else.91153:
fbgt_cont.91154:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91157

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91158

fbgt_else.91157:
fbgt_cont.91158:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91159

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.91160

fbgt_else.91159:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.91160:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91161

	nop
	nop
	nop
	j	bnei_cont.91162

bnei_else.91161:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91162:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91094:
	nop
	nop
	nop
	j	bnei_cont.91090

bnei_else.91091:
	flw	%f6, 446(%zero)
	flw	%f7, 489(%zero)
	nop
	nop

	flw	%f8, 493(%zero)
	nop
	fmul	%f6, %f4, %f6
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.91163

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91164

fbgt_else.91163:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.91164:
	flw	%f8, 488(%zero)
	sw	%a1, 20(%sp)
	fabs	%f6, %f6
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

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.91165

	flw	%f9, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91167

	flw	%f9, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91169

	flw	%f9, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91171

	flw	%f9, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91173

	flw	%f9, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91175

	flw	%f9, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91177

	flw	%f9, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91179

	flw	%f9, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91181

	flw	%f9, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91183

	flw	%f9, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91185

	flw	%f9, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f9, fbgt_else.91187

	flw	%f9, 447(%zero)
	sw	%ra, 24(%sp)
	fmov	%f0, %f6
	nop

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

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91187:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91188:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91185:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91186:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91183:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91184:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91181:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91182:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91179:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91180:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91177:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91178:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91175:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91176:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91173:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91174:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91171:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91172:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91169:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91170:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91167:
	nop
	nop
	fmov	%f1, %f9
	nop

fbgt_cont.91168:
	nop
	nop
	nop
	j	fbgt_cont.91166

fbgt_else.91165:
	nop
	nop
	fmov	%f1, %f8
	nop

fbgt_cont.91166:
	flw	%f0, 23(%sp)
	flw	%f2, 22(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	flw	%f1, 21(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91189

	lw	%v0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91191

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91190

bnei_else.91191:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91192:
	nop
	nop
	nop
	j	fbgt_cont.91190

fbgt_else.91189:
	lw	%v0, 20(%sp)
	nop
	nop
	nop

fbgt_cont.91190:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91193

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91194

fbgt_else.91193:
fbgt_cont.91194:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91195

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91196

fbgt_else.91195:
fbgt_cont.91196:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91197

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.91198

fbgt_else.91197:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.91198:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91199

	nop
	nop
	nop
	j	bnei_cont.91200

bnei_else.91199:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91200:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91092:
	nop
	nop
	nop
	j	bnei_cont.91090

bnei_else.91089:
	lw	%a1, 5(%v1)
	flw	%f7, 445(%zero)
	nop
	nop

	flw	%f6, 0(%a1)
	flw	%f9, 444(%zero)
	nop
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

	flw	%f8, 448(%zero)
	nop
	fsub	%f6, %f6, %f8
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.91201

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91202

fbgt_else.91201:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91202:
	lw	%a3, 5(%v1)
	nop
	nop
	nop

	flw	%f6, 2(%a3)
	nop
	nop
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
	nop
	fblt	%f6, %f8, fbgt_else.91203

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91204

fbgt_else.91203:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.91204:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91205

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.91207

	flw	%f6, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91206

bnei_else.91207:
	flw	%f6, 493(%zero)
	nop
	nop
	nop

bnei_cont.91208:
	nop
	nop
	nop
	j	bnei_cont.91206

bnei_else.91205:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.91209

	flw	%f6, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91210

bnei_else.91209:
	flw	%f6, 450(%zero)
	nop
	nop
	nop

bnei_cont.91210:
bnei_cont.91206:
	fsw	%f6, 146(%zero)
	nop
	nop
	nop

bnei_cont.91090:
	lw	%v0, 16(%sp)
	lw	%v1, 136(%zero)
	nop
	nop

	lw	%a0, 7(%sp)
	flw	%f0, 15(%sp)
	sll	%v0, %v0, 2
	nop

	lw	%v1, 6(%sp)
	flw	%f1, 14(%sp)
	add	%v0, %v0, %v1
	nop

	flw	%f2, 13(%sp)
	lw	%a2, 12(%sp)
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	lw	%v0, 3(%sp)
	nop
	nop

	lw	%a1, 1(%v0)
	lw	%a3, 7(%a2)
	nop
	nop

	flw	%f3, 0(%a3)
	flw	%f4, 471(%zero)
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

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91211

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91212

fbgt_else.91211:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.91212:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.91213

	lw	%a3, 2(%sp)
	nop
	add	%at, %a1, %v1
	nop

	sw	%a3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91214

bnei_else.91213:
	lw	%a3, 11(%sp)
	lw	%a1, 4(%v0)
	add	%at, %a1, %v1
	nop

	sw	%a3, 0(%at)
	flw	%f3, 145(%zero)
	nop
	nop

	flw	%f4, 10(%sp)
	nop
	add	%at, %a1, %v1
	nop

	lw	%a1, 0(%at)
	nop
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

	flw	%f5, 0(%a1)
	nop
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f5, %f5, %f3
	nop

	fsw	%f5, 0(%a1)
	nop
	nop
	nop

	flw	%f5, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f3
	nop

	fsw	%f5, 1(%a1)
	nop
	nop
	nop

	flw	%f5, 2(%a1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f5, %f3
	nop

	fsw	%f3, 2(%a1)
	flw	%f3, 142(%zero)
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

	fsw	%f3, 0(%a1)
	flw	%f3, 143(%zero)
	nop
	nop

	fsw	%f3, 1(%a1)
	flw	%f3, 144(%zero)
	nop
	nop

	fsw	%f3, 2(%a1)
	nop
	nop
	nop

bnei_cont.91214:
	flw	%f3, 442(%zero)
	lw	%a1, 5(%sp)
	nop
	nop

	flw	%f4, 0(%a1)
	flw	%f5, 142(%zero)
	nop
	nop

	flw	%f7, 1(%a1)
	flw	%f8, 143(%zero)
	fmul	%f6, %f4, %f5
	nop

	flw	%f10, 144(%zero)
	lw	%a3, 7(%a2)
	fmul	%f9, %f7, %f8
	nop

	flw	%f9, 2(%a1)
	lw	%t0, 1(%sp)
	fadd	%f6, %f6, %f9
	nop

	nop
	nop
	fmul	%f11, %f9, %f10
	addi	%v1, %t0, 0

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
	nop
	fmul	%f4, %f3, %f8
	fmul	%f3, %f3, %f10

	nop
	nop
	fadd	%f4, %f7, %f4
	fadd	%f3, %f9, %f3

	fsw	%f4, 1(%a1)
	flw	%f4, 4(%sp)
	nop
	nop

	fsw	%f3, 2(%a1)
	flw	%f3, 1(%a3)
	nop
	nop

	lw	%a3, 2(%sp)
	nop
	fmul	%f3, %f4, %f3
	nop

	fsw	%f3, 24(%sp)
	nop
	addi	%v0, %a3, 0
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

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91215

	nop
	nop
	nop
	j	bnei_cont.91216

bnei_else.91215:
	flw	%f0, 78(%zero)
	flw	%f1, 27(%sp)
	nop
	nop

	flw	%f2, 79(%zero)
	flw	%f3, 26(%sp)
	fmul	%f1, %f1, %f0
	nop

	flw	%f4, 25(%sp)
	lw	%v0, 5(%sp)
	fmul	%f3, %f3, %f2
	nop

	flw	%f3, 80(%zero)
	flw	%f5, 0(%v0)
	fadd	%f1, %f1, %f3
	nop

	flw	%f5, 1(%v0)
	nop
	fmul	%f4, %f4, %f3
	fmul	%f0, %f5, %f0

	flw	%f4, 10(%sp)
	nop
	fadd	%f1, %f1, %f4
	fmul	%f2, %f5, %f2

	flw	%f2, 2(%v0)
	nop
	fneg	%f1, %f1
	fadd	%f0, %f0, %f2

	nop
	nop
	fmul	%f1, %f1, %f4
	fmul	%f2, %f2, %f3

	flw	%f2, 493(%zero)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.91217

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91218

fbgt_else.91217:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91218:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91219

	flw	%f3, 151(%zero)
	flw	%f5, 145(%zero)
	nop
	nop

	nop
	nop
	fmul	%f5, %f1, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f5
	nop

	fsw	%f3, 151(%zero)
	nop
	nop
	nop

	flw	%f3, 152(%zero)
	flw	%f5, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f5, %f1, %f5
	nop

	nop
	nop
	fadd	%f3, %f3, %f5
	nop

	fsw	%f3, 152(%zero)
	nop
	nop
	nop

	flw	%f3, 153(%zero)
	flw	%f5, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f5
	nop

	nop
	nop
	fadd	%f1, %f3, %f1
	nop

	fsw	%f1, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91220

bnei_else.91219:
bnei_cont.91220:
	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.91221

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91222

fbgt_else.91221:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91222:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91223

	flw	%f1, 24(%sp)
	flw	%f2, 151(%zero)
	fmul	%f0, %f0, %f0
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

	fsw	%f2, 151(%zero)
	nop
	nop
	nop

	flw	%f2, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f2, %f2, %f0
	nop

	fsw	%f2, 152(%zero)
	nop
	nop
	nop

	flw	%f2, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91224

bnei_else.91223:
bnei_cont.91224:
bnei_cont.91216:
	flw	%f0, 15(%sp)
	nop
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
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	addi	%v1, %v0, -1
	addi	%v0, %zero, 138

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	lw	%v0, 434(%zero)
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	flw	%f0, 10(%sp)
	addi	%v0, %v0, -1
	nop

	flw	%f1, 24(%sp)
	lw	%v1, 5(%sp)
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
	jal	trace_reflections.2966

	flw	%f0, 441(%zero)
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	flw	%f1, 4(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91225

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91226

fbgt_else.91225:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91226:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91227

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.91228

	nop
	nop
	nop
	j	bgti_cont.91229

bgti_else.91228:
	lw	%a1, 7(%sp)
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

bgti_cont.91229:
	lw	%v1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.91230

	nop
	nop
	nop
	jr	%ra

bnei_else.91230:
	flw	%f0, 491(%zero)
	lw	%v1, 12(%sp)
	addi	%v0, %v0, 1
	nop

	lw	%v1, 7(%v1)
	lw	%a0, 3(%sp)
	nop
	nop

	flw	%f2, 0(%v1)
	lw	%v1, 5(%sp)
	nop
	nop

	flw	%f2, 0(%sp)
	nop
	fsub	%f0, %f0, %f2
	nop

	flw	%f1, 8(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fadd	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	trace_ray.2971

bnei_else.91227:
	nop
	nop
	nop
	jr	%ra

bnei_else.91068:
	lw	%v1, 6(%sp)
	lw	%a0, 7(%sp)
	addi	%v0, %zero, -1
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
	beqi	%v1, 0, bnei_else.91233

	lw	%v0, 5(%sp)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f0, 0(%v0)
	flw	%f2, 79(%zero)
	nop
	nop

	flw	%f1, 1(%v0)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91234

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91235

fbgt_else.91234:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91235:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91236

	nop
	nop
	fmul	%f1, %f0, %f0
	nop

	flw	%f1, 4(%sp)
	nop
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 81(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f1, 151(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	fsw	%f1, 151(%zero)
	nop
	nop
	nop

	flw	%f1, 152(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f1, %f1, %f0
	nop

	fsw	%f1, 152(%zero)
	nop
	nop
	nop

	flw	%f1, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.91236:
	nop
	nop
	nop
	jr	%ra

bnei_else.91233:
	nop
	nop
	nop
	jr	%ra

bgt_else.91061:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2977:
	flw	%f1, 465(%zero)
	fsw	%f0, 0(%sp)
	addi	%v1, %zero, 0
	nop

	fsw	%f1, 137(%zero)
	nop
	nop
	nop

	lw	%a0, 134(%zero)
	nop
	nop
	nop

	sw	%a0, 1(%sp)
	nop
	addi	%k0, %a0, 0
	addi	%a0, %v0, 0

	sw	%v1, 2(%sp)
	nop
	nop
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%v0, %v1, 0
	addi	%v1, %k0, 0

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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91241

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91242

fbgt_else.91241:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91242:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91243

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91245

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91244

fbgt_else.91245:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91246:
	nop
	nop
	nop
	j	bnei_cont.91244

bnei_else.91243:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91244:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91247

	lw	%v0, 141(%zero)
	lw	%v1, 3(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.91248

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.91250

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91252

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91253

bnei_else.91252:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.91253:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 493(%zero)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.91254

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91255

fbeq_else.91254:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.91255:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91256

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91257

bnei_else.91256:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91258

	flw	%f4, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91259

bnei_else.91258:
	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

bnei_cont.91259:
bnei_cont.91257:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91249

bnei_else.91250:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.91251:
	nop
	nop
	nop
	j	bnei_cont.91249

bnei_else.91248:
	lw	%a0, 136(%zero)
	flw	%f0, 493(%zero)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.91260

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91261

fbeq_else.91260:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.91261:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91262

	nop
	nop
	nop
	j	bnei_cont.91263

bnei_else.91262:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91264

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91265

fbgt_else.91264:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91265:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91266

	flw	%f0, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91267

bnei_else.91266:
	flw	%f0, 490(%zero)
	nop
	nop
	nop

bnei_cont.91267:
bnei_cont.91263:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a0)
	nop
	nop
	nop

bnei_cont.91249:
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

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.91268

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.91270

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.91272

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.91274

	nop
	nop
	nop
	j	bnei_cont.91269

bnei_else.91274:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91276

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91277

fbgt_else.91276:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91277:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91278

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91279

bnei_else.91278:
	flw	%f1, 493(%zero)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91280

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91281

fbgt_else.91280:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91281:
	flw	%f3, 461(%zero)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.91282

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91284

	flw	%f0, 476(%zero)
	flw	%f3, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f1, %f3, %f1
	nop

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
	fmul	%f8, %f8, %f1
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f1
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop
	j	fbgt_cont.91285

fbgt_else.91284:
	flw	%f0, 475(%zero)
	flw	%f3, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f1, %f3
	fadd	%f1, %f1, %f3

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

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
	fmul	%f8, %f8, %f1
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f1
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.91285:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91286

	nop
	nop
	nop
	j	fbgt_cont.91283

bnei_else.91286:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91287:
	nop
	nop
	nop
	j	fbgt_cont.91283

fbgt_else.91282:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f1, %f0, %f0
	nop

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
	fmul	%f7, %f7, %f3
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f0
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f1, %f6, %f1
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
	nop

fbgt_cont.91283:
	flw	%f1, 453(%zero)
	nop
	nop
	nop

	flw	%f1, 452(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.91279:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91288

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91289

fbgt_else.91288:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91289:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91290

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91291

bnei_else.91290:
	flw	%f2, 493(%zero)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91292

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91293

fbgt_else.91292:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91293:
	flw	%f3, 461(%zero)
	nop
	fabs	%f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.91294

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.91296

	flw	%f1, 476(%zero)
	flw	%f3, 491(%zero)
	nop
	nop

	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fdiv	%f2, %f3, %f2
	nop

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
	fmul	%f7, %f7, %f2
	nop

	nop
	nop
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f2
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop
	j	fbgt_cont.91297

fbgt_else.91296:
	flw	%f1, 475(%zero)
	flw	%f3, 491(%zero)
	nop
	nop

	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fsub	%f4, %f2, %f3
	fadd	%f2, %f2, %f3

	nop
	nop
	fdiv	%f2, %f4, %f2
	nop

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
	fmul	%f7, %f7, %f2
	nop

	nop
	nop
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f2
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.91297:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91298

	nop
	nop
	nop
	j	fbgt_cont.91295

bnei_else.91298:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.91299:
	nop
	nop
	nop
	j	fbgt_cont.91295

fbgt_else.91294:
	flw	%f5, 460(%zero)
	flw	%f6, 459(%zero)
	fmul	%f2, %f1, %f1
	nop

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
	fmul	%f6, %f6, %f3
	nop

	flw	%f6, 458(%zero)
	nop
	fadd	%f5, %f5, %f6
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

	flw	%f6, 457(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f1
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 456(%zero)
	nop
	fadd	%f5, %f5, %f6
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

	flw	%f5, 455(%zero)
	nop
	fsub	%f2, %f5, %f2
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
	nop

fbgt_cont.91295:
	flw	%f2, 453(%zero)
	nop
	nop
	nop

	flw	%f2, 452(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

bnei_cont.91291:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 493(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91300

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91301

fbgt_else.91300:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91301:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91302

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91303

bnei_else.91302:
bnei_cont.91303:
	flw	%f1, 450(%zero)
	nop
	nop
	nop

	flw	%f1, 449(%zero)
	nop
	fmul	%f0, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91275:
	nop
	nop
	nop
	j	bnei_cont.91269

bnei_else.91272:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 5(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f2, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91304

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91306

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91308

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91310

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91312

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91314

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91316

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91318

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91320

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91322

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91324

	flw	%f3, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91326

	flw	%f3, 447(%zero)
	sw	%ra, 8(%sp)
	nop
	nop

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

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91326:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91327:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91324:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91325:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91322:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91323:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91320:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91321:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91318:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91319:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91316:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91317:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91314:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91315:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91312:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91313:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91310:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91311:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91308:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91309:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91306:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91307:
	nop
	nop
	nop
	j	fbgt_cont.91305

fbgt_else.91304:
	nop
	nop
	fmov	%f1, %f2
	nop

fbgt_cont.91305:
	flw	%f0, 7(%sp)
	flw	%f2, 6(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91328

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91329

fbgt_else.91328:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91329:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91330

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91331

fbgt_else.91330:
fbgt_cont.91331:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91332

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91334

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91333

bnei_else.91334:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91335:
	nop
	nop
	nop
	j	fbgt_cont.91333

fbgt_else.91332:
fbgt_cont.91333:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91336

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91337

fbgt_else.91336:
fbgt_cont.91337:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91338

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.91339

fbgt_else.91338:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.91339:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91340

	nop
	nop
	nop
	j	bnei_cont.91341

bnei_else.91340:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91341:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91273:
	nop
	nop
	nop
	j	bnei_cont.91269

bnei_else.91270:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 493(%zero)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91342

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91343

fbgt_else.91342:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91343:
	flw	%f2, 488(%zero)
	sw	%v1, 8(%sp)
	fabs	%f0, %f0
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

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91344

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91346

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91348

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91350

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91352

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91354

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91356

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91358

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91360

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91362

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91364

	flw	%f3, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91366

	flw	%f3, 447(%zero)
	sw	%ra, 12(%sp)
	nop
	nop

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

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91366:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91367:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91364:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91365:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91362:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91363:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91360:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91361:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91358:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91359:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91356:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91357:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91354:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91355:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91352:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91353:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91350:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91351:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91348:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91349:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91346:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.91347:
	nop
	nop
	nop
	j	fbgt_cont.91345

fbgt_else.91344:
	nop
	nop
	fmov	%f1, %f2
	nop

fbgt_cont.91345:
	flw	%f0, 11(%sp)
	flw	%f2, 10(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	flw	%f1, 9(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91368

	lw	%v0, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91370

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91369

bnei_else.91370:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91371:
	nop
	nop
	nop
	j	fbgt_cont.91369

fbgt_else.91368:
	lw	%v0, 8(%sp)
	nop
	nop
	nop

fbgt_cont.91369:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91372

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91373

fbgt_else.91372:
fbgt_cont.91373:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91374

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91375

fbgt_else.91374:
fbgt_cont.91375:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91376

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.91377

fbgt_else.91376:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.91377:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91378

	nop
	nop
	nop
	j	bnei_cont.91379

bnei_else.91378:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91379:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91271:
	nop
	nop
	nop
	j	bnei_cont.91269

bnei_else.91268:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91380

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91381

fbgt_else.91380:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91381:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.91382

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91383

fbgt_else.91382:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.91383:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91384

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91386

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91385

bnei_else.91386:
	flw	%f0, 493(%zero)
	nop
	nop
	nop

bnei_cont.91387:
	nop
	nop
	nop
	j	bnei_cont.91385

bnei_else.91384:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91388

	flw	%f0, 493(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91389

bnei_else.91388:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.91389:
bnei_cont.91385:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91269:
	lw	%v0, 2(%sp)
	lw	%v1, 1(%sp)
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
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.91390

	nop
	nop
	nop
	jr	%ra

bnei_else.91390:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91392

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91393

fbgt_else.91392:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91393:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91394

	nop
	nop
	nop
	j	bnei_cont.91395

bnei_else.91394:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.91395:
	flw	%f1, 0(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.91247:
	nop
	nop
	nop
	jr	%ra

iter_trace_diffuse_rays.2980:
	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	blti	%a1, 0, bgti_else.91398

	flw	%f1, 0(%v1)
	flw	%f3, 1(%v1)
	add	%at, %v0, %a1
	addi	%t1, %zero, 1

	lw	%a3, 0(%at)
	flw	%f4, 2(%v1)
	nop
	nop

	lw	%t0, 0(%a3)
	nop
	nop
	nop

	flw	%f0, 0(%t0)
	flw	%f2, 1(%t0)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	fmul	%f2, %f2, %f3

	flw	%f2, 2(%t0)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f2, %f2, %f4
	nop

	flw	%f2, 493(%zero)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91399

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91400

fbgt_else.91399:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.91400:
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

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.91401

	flw	%f5, 440(%zero)
	nop
	addi	%a3, %a1, 1
	nop

	flw	%f5, 465(%zero)
	nop
	add	%at, %v0, %a3
	fdiv	%f0, %f0, %f5

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
	nop
	nop
	beqi	%t3, -1, bnei_else.91403

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.91405

	lw	%t4, 12(%t3)
	lw	%t6, 1(%a3)
	nop
	nop

	lw	%t5, 10(%t4)
	lw	%t6, 1(%t4)
	add	%at, %t6, %t3
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
	nop
	nop
	beqi	%t6, 1, bnei_else.91407

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.91409

	flw	%f8, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.91411

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91412

fbeq_else.91411:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.91412:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91413

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91408

bnei_else.91413:
	flw	%f9, 1(%t3)
	nop
	nop
	nop

	flw	%f9, 2(%t3)
	nop
	fmul	%f5, %f9, %f5
	nop

	nop
	nop
	fmul	%f6, %f9, %f6
	nop

	flw	%f6, 3(%t3)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	flw	%f6, 3(%t5)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6

	nop
	nop
	fsub	%f6, %f7, %f6
	nop

	nop
	nop
	nop
	fblt	%f2, %f6, fbgt_else.91415

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91416

fbgt_else.91415:
	nop
	nop
	addi	%t5, %zero, 1
	nop

fbgt_cont.91416:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.91417

	lw	%t4, 6(%t4)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91419

	nop
	nop
	fsqrt	%f6, %f6
	nop

	flw	%f6, 4(%t3)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91420

bnei_else.91419:
	nop
	nop
	fsqrt	%f6, %f6
	nop

	flw	%f6, 4(%t3)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

bnei_cont.91420:
	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91418

bnei_else.91417:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91418:
bnei_cont.91414:
	nop
	nop
	nop
	j	bnei_cont.91408

bnei_else.91409:
	flw	%f5, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.91421

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91422

fbgt_else.91421:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91422:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91423

	flw	%f6, 3(%t5)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91424

bnei_else.91423:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91424:
bnei_cont.91410:
	nop
	nop
	nop
	j	bnei_cont.91408

bnei_else.91407:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	nop
	nop

	flw	%f9, 1(%t3)
	flw	%f10, 1(%t5)
	fsub	%f8, %f8, %f5
	nop

	lw	%t6, 4(%t4)
	nop
	fmul	%f8, %f8, %f9
	nop

	flw	%f12, 1(%t6)
	nop
	fmul	%f11, %f8, %f10
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
	nop
	fblt	%f11, %f12, fbgt_else.91425

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91426

fbgt_else.91425:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91426:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91427

	flw	%f11, 2(%t5)
	lw	%t6, 4(%t4)
	nop
	nop

	flw	%f13, 2(%t6)
	nop
	fmul	%f11, %f8, %f11
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
	nop
	fblt	%f11, %f13, fbgt_else.91429

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91430

fbgt_else.91429:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91430:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91431

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.91433

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91434

fbeq_else.91433:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.91434:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91435

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91428

bnei_else.91435:
	nop
	nop
	addi	%t6, %zero, 1
	nop

bnei_cont.91436:
	nop
	nop
	nop
	j	bnei_cont.91428

bnei_else.91431:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.91432:
	nop
	nop
	nop
	j	bnei_cont.91428

bnei_else.91427:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.91428:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91437

	fsw	%f8, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91438

bnei_else.91437:
	flw	%f8, 2(%t3)
	flw	%f9, 3(%t3)
	nop
	nop

	flw	%f11, 0(%t5)
	lw	%t6, 4(%t4)
	fsub	%f8, %f8, %f6
	nop

	flw	%f14, 0(%t6)
	nop
	fmul	%f8, %f8, %f9
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
	nop
	fblt	%f13, %f14, fbgt_else.91439

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91440

fbgt_else.91439:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91440:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91441

	flw	%f13, 2(%t5)
	lw	%t4, 4(%t4)
	nop
	nop

	flw	%f15, 2(%t4)
	nop
	fmul	%f13, %f8, %f13
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
	nop
	fblt	%f13, %f15, fbgt_else.91443

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91444

fbgt_else.91443:
	nop
	nop
	addi	%t4, %zero, 1
	nop

fbgt_cont.91444:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91445

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.91447

	nop
	nop
	addi	%t4, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91448

fbeq_else.91447:
	nop
	nop
	addi	%t4, %zero, 0
	nop

fbeq_cont.91448:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91449

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91442

bnei_else.91449:
	nop
	nop
	addi	%t4, %zero, 1
	nop

bnei_cont.91450:
	nop
	nop
	nop
	j	bnei_cont.91442

bnei_else.91445:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.91446:
	nop
	nop
	nop
	j	bnei_cont.91442

bnei_else.91441:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.91442:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91451

	fsw	%f8, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.91452

bnei_else.91451:
	flw	%f8, 4(%t3)
	nop
	nop
	nop

	flw	%f8, 5(%t3)
	nop
	fsub	%f7, %f8, %f7
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
	nop
	fblt	%f5, %f14, fbgt_else.91453

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91454

fbgt_else.91453:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91454:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91455

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
	nop
	fblt	%f5, %f12, fbgt_else.91457

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91458

fbgt_else.91457:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91458:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91459

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.91461

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91462

fbeq_else.91461:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.91462:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91463

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91456

bnei_else.91463:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.91464:
	nop
	nop
	nop
	j	bnei_cont.91456

bnei_else.91459:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91460:
	nop
	nop
	nop
	j	bnei_cont.91456

bnei_else.91455:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91456:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91465

	fsw	%f7, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.91466

bnei_else.91465:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91466:
bnei_cont.91452:
bnei_cont.91438:
bnei_cont.91408:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91467

	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.91469

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91470

fbgt_else.91469:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91470:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91471

	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.91473

	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	sw	%ra, 14(%sp)
	nop
	addi	%v1, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91475

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91477

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91479

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	nop
	nop

	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91479:
bnei_cont.91480:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91477:
bnei_cont.91478:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91475:
bnei_cont.91476:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91473:
bnei_cont.91474:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91471:
bnei_cont.91472:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91467:
bnei_cont.91468:
	nop
	nop
	nop
	j	bnei_cont.91406

bnei_else.91405:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.91481

	lw	%t3, 83(%t3)
	sw	%t2, 13(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	sw	%ra, 14(%sp)
	nop
	addi	%v1, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91483

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91485

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 14(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91487

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 11(%sp)
	sw	%ra, 14(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	nop
	nop

	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91482

bnei_else.91487:
bnei_cont.91488:
	nop
	nop
	nop
	j	bnei_cont.91482

bnei_else.91485:
bnei_cont.91486:
	nop
	nop
	nop
	j	bnei_cont.91482

bnei_else.91483:
bnei_cont.91484:
	nop
	nop
	nop
	j	bnei_cont.91482

bnei_else.91481:
bnei_cont.91482:
bnei_cont.91406:
	lw	%v0, 12(%sp)
	lw	%v1, 10(%sp)
	nop
	nop

	lw	%a0, 11(%sp)
	sw	%ra, 14(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91404

bnei_else.91403:
bnei_cont.91404:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91489

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91490

fbgt_else.91489:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91490:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91491

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91493

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91492

fbgt_else.91493:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91494:
	nop
	nop
	nop
	j	bnei_cont.91492

bnei_else.91491:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91492:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91495

	lw	%v0, 141(%zero)
	lw	%v1, 11(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.91497

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.91499

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91501

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f7, %f1, %f6
	nop

	nop
	nop
	fmul	%f9, %f2, %f8
	nop

	flw	%f9, 471(%zero)
	nop
	fadd	%f7, %f7, %f9
	nop

	nop
	nop
	fmul	%f7, %f7, %f9
	nop

	nop
	nop
	fadd	%f3, %f3, %f7
	nop

	fsw	%f3, 142(%zero)
	flw	%f6, 0(%v1)
	fmul	%f3, %f0, %f6
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

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91502

bnei_else.91501:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.91502:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 3(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.91503

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91504

fbeq_else.91503:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.91504:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91505

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91506

bnei_else.91505:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91507

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91508

bnei_else.91507:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.91508:
bnei_cont.91506:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91498

bnei_else.91499:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.91500:
	nop
	nop
	nop
	j	bnei_cont.91498

bnei_else.91497:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.91509

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91510

fbeq_else.91509:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.91510:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91511

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.91512

bnei_else.91511:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91513

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91514

fbgt_else.91513:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91514:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91515

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91516

bnei_else.91515:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.91516:
bnei_cont.91512:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.91498:
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

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.91517

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.91519

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.91521

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.91523

	nop
	nop
	nop
	j	bnei_cont.91518

bnei_else.91523:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91525

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91526

fbgt_else.91525:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91526:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91527

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91528

bnei_else.91527:
	flw	%f1, 3(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91529

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91530

fbgt_else.91529:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91530:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.91531

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.91533

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.91534

fbgt_else.91533:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.91534:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91535

	nop
	nop
	nop
	j	fbgt_cont.91532

bnei_else.91535:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91536:
	nop
	nop
	nop
	j	fbgt_cont.91532

fbgt_else.91531:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.91532:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.91528:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91537

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91538

fbgt_else.91537:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91538:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91539

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91540

bnei_else.91539:
	flw	%f2, 3(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91541

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91542

fbgt_else.91541:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91542:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91543

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.91545

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.91546

fbgt_else.91545:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.91546:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91547

	nop
	nop
	nop
	j	fbgt_cont.91544

bnei_else.91547:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.91548:
	nop
	nop
	nop
	j	fbgt_cont.91544

fbgt_else.91543:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.91544:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.91540:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 3(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91549

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91550

fbgt_else.91549:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91550:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91551

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91552

bnei_else.91551:
bnei_cont.91552:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91524:
	nop
	nop
	nop
	j	bnei_cont.91518

bnei_else.91521:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 15(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 16(%sp)
	nop
	nop
	nop

	fsw	%f2, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91553

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91555

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91557

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91559

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91561

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91563

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91565

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91567

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91569

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91571

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91573

	flw	%f3, 477(%zero)
	sw	%ra, 18(%sp)
	nop
	nop

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91573:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91574:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91571:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91572:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91569:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91570:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91567:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91568:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91565:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91566:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91563:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91564:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91561:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91562:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91559:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91560:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91557:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91558:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91555:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91556:
	nop
	nop
	nop
	j	fbgt_cont.91554

fbgt_else.91553:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.91554:
	flw	%f1, 16(%sp)
	flw	%f2, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91575

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91577

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91579

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91581

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91583

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91585

	sw	%ra, 18(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91585:
	sw	%ra, 18(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

fbgt_cont.91586:
	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91583:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91584:
	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91581:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91587

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91589

	sw	%ra, 18(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91588

fbgt_else.91589:
	sw	%ra, 18(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

fbgt_cont.91590:
	nop
	nop
	nop
	j	fbgt_cont.91588

fbgt_else.91587:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91588:
fbgt_cont.91582:
	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91579:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91580:
	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91577:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.91591

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91593

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91595

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91597

	sw	%ra, 18(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91592

fbgt_else.91597:
	sw	%ra, 18(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

fbgt_cont.91598:
	nop
	nop
	nop
	j	fbgt_cont.91592

fbgt_else.91595:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91596:
	nop
	nop
	nop
	j	fbgt_cont.91592

fbgt_else.91593:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91599

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91601

	sw	%ra, 18(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91600

fbgt_else.91601:
	sw	%ra, 18(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

fbgt_cont.91602:
	nop
	nop
	nop
	j	fbgt_cont.91600

fbgt_else.91599:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91600:
fbgt_cont.91594:
	nop
	nop
	nop
	j	fbgt_cont.91592

fbgt_else.91591:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91592:
fbgt_cont.91578:
	nop
	nop
	nop
	j	fbgt_cont.91576

fbgt_else.91575:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91576:
	flw	%f1, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91603

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91604

fbgt_else.91603:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91604:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91605

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91606

fbgt_else.91605:
fbgt_cont.91606:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91607

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91609

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91608

bnei_else.91609:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91610:
	nop
	nop
	nop
	j	fbgt_cont.91608

fbgt_else.91607:
fbgt_cont.91608:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91611

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91612

fbgt_else.91611:
fbgt_cont.91612:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91613

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.91614

fbgt_else.91613:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.91614:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91615

	nop
	nop
	nop
	j	bnei_cont.91616

bnei_else.91615:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91616:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91522:
	nop
	nop
	nop
	j	bnei_cont.91518

bnei_else.91519:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91617

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91618

fbgt_else.91617:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91618:
	flw	%f3, 488(%zero)
	sw	%v1, 18(%sp)
	fabs	%f0, %f0
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

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91619

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91621

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91623

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91625

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91627

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91629

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91631

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91633

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91635

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91637

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91639

	flw	%f4, 477(%zero)
	sw	%ra, 22(%sp)
	nop
	nop

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91639:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91640:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91637:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91638:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91635:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91636:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91633:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91634:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91631:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91632:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91629:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91630:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91627:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91628:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91625:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91626:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91623:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91624:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91621:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91622:
	nop
	nop
	nop
	j	fbgt_cont.91620

fbgt_else.91619:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91620:
	flw	%f1, 20(%sp)
	flw	%f2, 21(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91641

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91643

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91645

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91647

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91649

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91651

	sw	%ra, 22(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91651:
	sw	%ra, 22(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

fbgt_cont.91652:
	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91649:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91650:
	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91647:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91653

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91655

	sw	%ra, 22(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91654

fbgt_else.91655:
	sw	%ra, 22(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

fbgt_cont.91656:
	nop
	nop
	nop
	j	fbgt_cont.91654

fbgt_else.91653:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91654:
fbgt_cont.91648:
	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91645:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91646:
	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91643:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.91657

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91659

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91661

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91663

	sw	%ra, 22(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91658

fbgt_else.91663:
	sw	%ra, 22(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

fbgt_cont.91664:
	nop
	nop
	nop
	j	fbgt_cont.91658

fbgt_else.91661:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91662:
	nop
	nop
	nop
	j	fbgt_cont.91658

fbgt_else.91659:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91665

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91667

	sw	%ra, 22(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91666

fbgt_else.91667:
	sw	%ra, 22(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

fbgt_cont.91668:
	nop
	nop
	nop
	j	fbgt_cont.91666

fbgt_else.91665:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91666:
fbgt_cont.91660:
	nop
	nop
	nop
	j	fbgt_cont.91658

fbgt_else.91657:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91658:
fbgt_cont.91644:
	nop
	nop
	nop
	j	fbgt_cont.91642

fbgt_else.91641:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91642:
	flw	%f1, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91669

	lw	%v0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91671

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91670

bnei_else.91671:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91672:
	nop
	nop
	nop
	j	fbgt_cont.91670

fbgt_else.91669:
	lw	%v0, 18(%sp)
	nop
	nop
	nop

fbgt_cont.91670:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91673

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91674

fbgt_else.91673:
fbgt_cont.91674:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91675

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91676

fbgt_else.91675:
fbgt_cont.91676:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91677

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.91678

fbgt_else.91677:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.91678:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91679

	nop
	nop
	nop
	j	bnei_cont.91680

bnei_else.91679:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91680:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91520:
	nop
	nop
	nop
	j	bnei_cont.91518

bnei_else.91517:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91681

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91682

fbgt_else.91681:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91682:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.91683

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91684

fbgt_else.91683:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.91684:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91685

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91687

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91686

bnei_else.91687:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

bnei_cont.91688:
	nop
	nop
	nop
	j	bnei_cont.91686

bnei_else.91685:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91689

	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91690

bnei_else.91689:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.91690:
bnei_cont.91686:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91518:
	lw	%v0, 2(%sp)
	lw	%v1, 10(%sp)
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
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91691

	nop
	nop
	nop
	j	bnei_cont.91402

bnei_else.91691:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91693

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91694

fbgt_else.91693:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91694:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91695

	nop
	nop
	nop
	j	bnei_cont.91696

bnei_else.91695:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.91696:
	flw	%f2, 9(%sp)
	lw	%v0, 14(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)
	fmul	%f0, %f2, %f0
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	flw	%f2, 148(%zero)
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f3, %f0, %f3
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	fsw	%f2, 148(%zero)
	nop
	nop
	nop

	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f3, %f0, %f3
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	fsw	%f2, 149(%zero)
	nop
	nop
	nop

	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.91692:
	nop
	nop
	nop
	j	bnei_cont.91402

bnei_else.91495:
bnei_cont.91496:
	nop
	nop
	nop
	j	bnei_cont.91402

bnei_else.91401:
	flw	%f5, 439(%zero)
	nop
	nop
	nop

	flw	%f5, 465(%zero)
	nop
	fdiv	%f0, %f0, %f5
	nop

	fsw	%f5, 137(%zero)
	fsw	%f0, 22(%sp)
	nop
	nop

	lw	%t0, 134(%zero)
	nop
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
	nop
	nop
	beqi	%t3, -1, bnei_else.91697

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.91699

	lw	%t4, 12(%t3)
	lw	%t6, 1(%a3)
	nop
	nop

	lw	%t5, 10(%t4)
	lw	%t6, 1(%t4)
	add	%at, %t6, %t3
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
	nop
	nop
	beqi	%t6, 1, bnei_else.91701

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.91703

	flw	%f8, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.91705

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91706

fbeq_else.91705:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.91706:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91707

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91702

bnei_else.91707:
	flw	%f9, 1(%t3)
	nop
	nop
	nop

	flw	%f9, 2(%t3)
	nop
	fmul	%f5, %f9, %f5
	nop

	nop
	nop
	fmul	%f6, %f9, %f6
	nop

	flw	%f6, 3(%t3)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	flw	%f6, 3(%t5)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f7, %f5, %f5
	fmul	%f6, %f8, %f6

	nop
	nop
	fsub	%f6, %f7, %f6
	nop

	nop
	nop
	nop
	fblt	%f2, %f6, fbgt_else.91709

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91710

fbgt_else.91709:
	nop
	nop
	addi	%t5, %zero, 1
	nop

fbgt_cont.91710:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.91711

	lw	%t4, 6(%t4)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91713

	nop
	nop
	fsqrt	%f6, %f6
	nop

	flw	%f6, 4(%t3)
	nop
	fadd	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91714

bnei_else.91713:
	nop
	nop
	fsqrt	%f6, %f6
	nop

	flw	%f6, 4(%t3)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

bnei_cont.91714:
	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91712

bnei_else.91711:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91712:
bnei_cont.91708:
	nop
	nop
	nop
	j	bnei_cont.91702

bnei_else.91703:
	flw	%f5, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.91715

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91716

fbgt_else.91715:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91716:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91717

	flw	%f6, 3(%t5)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91718

bnei_else.91717:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91718:
bnei_cont.91704:
	nop
	nop
	nop
	j	bnei_cont.91702

bnei_else.91701:
	lw	%t5, 0(%a3)
	flw	%f8, 0(%t3)
	nop
	nop

	flw	%f9, 1(%t3)
	flw	%f10, 1(%t5)
	fsub	%f8, %f8, %f5
	nop

	lw	%t6, 4(%t4)
	nop
	fmul	%f8, %f8, %f9
	nop

	flw	%f12, 1(%t6)
	nop
	fmul	%f11, %f8, %f10
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
	nop
	fblt	%f11, %f12, fbgt_else.91719

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91720

fbgt_else.91719:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91720:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91721

	flw	%f11, 2(%t5)
	lw	%t6, 4(%t4)
	nop
	nop

	flw	%f13, 2(%t6)
	nop
	fmul	%f11, %f8, %f11
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
	nop
	fblt	%f11, %f13, fbgt_else.91723

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91724

fbgt_else.91723:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91724:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91725

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.91727

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91728

fbeq_else.91727:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.91728:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91729

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91722

bnei_else.91729:
	nop
	nop
	addi	%t6, %zero, 1
	nop

bnei_cont.91730:
	nop
	nop
	nop
	j	bnei_cont.91722

bnei_else.91725:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.91726:
	nop
	nop
	nop
	j	bnei_cont.91722

bnei_else.91721:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.91722:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91731

	fsw	%f8, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.91732

bnei_else.91731:
	flw	%f8, 2(%t3)
	flw	%f9, 3(%t3)
	nop
	nop

	flw	%f11, 0(%t5)
	lw	%t6, 4(%t4)
	fsub	%f8, %f8, %f6
	nop

	flw	%f14, 0(%t6)
	nop
	fmul	%f8, %f8, %f9
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
	nop
	fblt	%f13, %f14, fbgt_else.91733

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91734

fbgt_else.91733:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.91734:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.91735

	flw	%f13, 2(%t5)
	lw	%t4, 4(%t4)
	nop
	nop

	flw	%f15, 2(%t4)
	nop
	fmul	%f13, %f8, %f13
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
	nop
	fblt	%f13, %f15, fbgt_else.91737

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91738

fbgt_else.91737:
	nop
	nop
	addi	%t4, %zero, 1
	nop

fbgt_cont.91738:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91739

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.91741

	nop
	nop
	addi	%t4, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91742

fbeq_else.91741:
	nop
	nop
	addi	%t4, %zero, 0
	nop

fbeq_cont.91742:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91743

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91736

bnei_else.91743:
	nop
	nop
	addi	%t4, %zero, 1
	nop

bnei_cont.91744:
	nop
	nop
	nop
	j	bnei_cont.91736

bnei_else.91739:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.91740:
	nop
	nop
	nop
	j	bnei_cont.91736

bnei_else.91735:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.91736:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.91745

	fsw	%f8, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.91746

bnei_else.91745:
	flw	%f8, 4(%t3)
	nop
	nop
	nop

	flw	%f8, 5(%t3)
	nop
	fsub	%f7, %f8, %f7
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
	nop
	fblt	%f5, %f14, fbgt_else.91747

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91748

fbgt_else.91747:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91748:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91749

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
	nop
	fblt	%f5, %f12, fbgt_else.91751

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91752

fbgt_else.91751:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91752:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91753

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.91755

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91756

fbeq_else.91755:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.91756:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91757

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91750

bnei_else.91757:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.91758:
	nop
	nop
	nop
	j	bnei_cont.91750

bnei_else.91753:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91754:
	nop
	nop
	nop
	j	bnei_cont.91750

bnei_else.91749:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91750:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91759

	fsw	%f7, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%t3, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.91760

bnei_else.91759:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.91760:
bnei_cont.91746:
bnei_cont.91732:
bnei_cont.91702:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91761

	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.91763

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91764

fbgt_else.91763:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.91764:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.91765

	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.91767

	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	sw	%ra, 26(%sp)
	nop
	addi	%v1, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91769

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91771

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91773

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	nop
	nop

	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.91700

bnei_else.91773:
bnei_cont.91774:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91771:
bnei_cont.91772:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91769:
bnei_cont.91770:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91767:
bnei_cont.91768:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91765:
bnei_cont.91766:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91761:
bnei_cont.91762:
	nop
	nop
	nop
	j	bnei_cont.91700

bnei_else.91699:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.91775

	lw	%t3, 83(%t3)
	sw	%t2, 25(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	sw	%ra, 26(%sp)
	nop
	addi	%v1, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91777

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91779

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 25(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.91781

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 24(%sp)
	sw	%ra, 26(%sp)
	addi	%v0, %a0, 0
	nop

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

	lw	%ra, 26(%sp)
	lw	%v1, 25(%sp)
	nop
	nop

	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.91776

bnei_else.91781:
bnei_cont.91782:
	nop
	nop
	nop
	j	bnei_cont.91776

bnei_else.91779:
bnei_cont.91780:
	nop
	nop
	nop
	j	bnei_cont.91776

bnei_else.91777:
bnei_cont.91778:
	nop
	nop
	nop
	j	bnei_cont.91776

bnei_else.91775:
bnei_cont.91776:
bnei_cont.91700:
	lw	%v0, 12(%sp)
	lw	%v1, 23(%sp)
	nop
	nop

	lw	%a0, 24(%sp)
	sw	%ra, 26(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

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
	j	bnei_cont.91698

bnei_else.91697:
bnei_cont.91698:
	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91783

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91784

fbgt_else.91783:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91784:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91785

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91787

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91786

fbgt_else.91787:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91788:
	nop
	nop
	nop
	j	bnei_cont.91786

bnei_else.91785:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91786:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91789

	lw	%v0, 141(%zero)
	lw	%v1, 24(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.91791

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.91793

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91795

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f7, %f1, %f6
	nop

	nop
	nop
	fmul	%f9, %f2, %f8
	nop

	flw	%f9, 471(%zero)
	nop
	fadd	%f7, %f7, %f9
	nop

	nop
	nop
	fmul	%f7, %f7, %f9
	nop

	nop
	nop
	fadd	%f3, %f3, %f7
	nop

	fsw	%f3, 142(%zero)
	flw	%f6, 0(%v1)
	fmul	%f3, %f0, %f6
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

	fsw	%f2, 143(%zero)
	nop
	nop
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91796

bnei_else.91795:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.91796:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 3(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.91797

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91798

fbeq_else.91797:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.91798:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91799

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91800

bnei_else.91799:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91801

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91802

bnei_else.91801:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.91802:
bnei_cont.91800:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91792

bnei_else.91793:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.91794:
	nop
	nop
	nop
	j	bnei_cont.91792

bnei_else.91791:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.91803

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.91804

fbeq_else.91803:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.91804:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91805

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.91806

bnei_else.91805:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91807

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91808

fbgt_else.91807:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91808:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91809

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91810

bnei_else.91809:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.91810:
bnei_cont.91806:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.91792:
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

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.91811

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.91813

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.91815

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.91817

	nop
	nop
	nop
	j	bnei_cont.91812

bnei_else.91817:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91819

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91820

fbgt_else.91819:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91820:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91821

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91822

bnei_else.91821:
	flw	%f1, 3(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91823

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91824

fbgt_else.91823:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91824:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.91825

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.91827

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.91828

fbgt_else.91827:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.91828:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91829

	nop
	nop
	nop
	j	fbgt_cont.91826

bnei_else.91829:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91830:
	nop
	nop
	nop
	j	fbgt_cont.91826

fbgt_else.91825:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.91826:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.91822:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91831

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91832

fbgt_else.91831:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91832:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91833

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91834

bnei_else.91833:
	flw	%f2, 3(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91835

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91836

fbgt_else.91835:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91836:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.91837

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.91839

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.91840

fbgt_else.91839:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.91840:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91841

	nop
	nop
	nop
	j	fbgt_cont.91838

bnei_else.91841:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.91842:
	nop
	nop
	nop
	j	fbgt_cont.91838

fbgt_else.91837:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.91838:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.91834:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 3(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91843

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91844

fbgt_else.91843:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91844:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91845

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.91846

bnei_else.91845:
bnei_cont.91846:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91818:
	nop
	nop
	nop
	j	bnei_cont.91812

bnei_else.91815:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 27(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 28(%sp)
	nop
	nop
	nop

	fsw	%f2, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91847

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91849

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91851

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91853

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91855

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91857

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91859

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91861

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91863

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91865

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91867

	flw	%f3, 477(%zero)
	sw	%ra, 30(%sp)
	nop
	nop

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91867:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91868:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91865:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91866:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91863:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91864:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91861:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91862:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91859:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91860:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91857:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91858:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91855:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91856:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91853:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91854:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91851:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91852:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91849:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91850:
	nop
	nop
	nop
	j	fbgt_cont.91848

fbgt_else.91847:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.91848:
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91869

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91871

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91873

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91875

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91877

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91879

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91879:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.91880:
	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91877:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91878:
	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91875:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91881

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91883

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91882

fbgt_else.91883:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.91884:
	nop
	nop
	nop
	j	fbgt_cont.91882

fbgt_else.91881:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91882:
fbgt_cont.91876:
	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91873:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91874:
	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91871:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.91885

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91887

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91889

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91891

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91886

fbgt_else.91891:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.91892:
	nop
	nop
	nop
	j	fbgt_cont.91886

fbgt_else.91889:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91890:
	nop
	nop
	nop
	j	fbgt_cont.91886

fbgt_else.91887:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91893

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91895

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91894

fbgt_else.91895:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.91896:
	nop
	nop
	nop
	j	fbgt_cont.91894

fbgt_else.91893:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91894:
fbgt_cont.91888:
	nop
	nop
	nop
	j	fbgt_cont.91886

fbgt_else.91885:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91886:
fbgt_cont.91872:
	nop
	nop
	nop
	j	fbgt_cont.91870

fbgt_else.91869:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91870:
	flw	%f1, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91897

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91898

fbgt_else.91897:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91898:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91899

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91900

fbgt_else.91899:
fbgt_cont.91900:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91901

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91903

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91902

bnei_else.91903:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91904:
	nop
	nop
	nop
	j	fbgt_cont.91902

fbgt_else.91901:
fbgt_cont.91902:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91905

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91906

fbgt_else.91905:
fbgt_cont.91906:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91907

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.91908

fbgt_else.91907:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.91908:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91909

	nop
	nop
	nop
	j	bnei_cont.91910

bnei_else.91909:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91910:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.91816:
	nop
	nop
	nop
	j	bnei_cont.91812

bnei_else.91813:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91911

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91912

fbgt_else.91911:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.91912:
	flw	%f3, 488(%zero)
	sw	%v1, 30(%sp)
	fabs	%f0, %f0
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

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.91913

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91915

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91917

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91919

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91921

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91923

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91925

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91927

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91929

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91931

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.91933

	flw	%f4, 477(%zero)
	sw	%ra, 34(%sp)
	nop
	nop

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91933:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91934:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91931:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91932:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91929:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91930:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91927:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91928:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91925:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91926:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91923:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91924:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91921:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91922:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91919:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91920:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91917:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91918:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91915:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.91916:
	nop
	nop
	nop
	j	fbgt_cont.91914

fbgt_else.91913:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.91914:
	flw	%f1, 32(%sp)
	flw	%f2, 33(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91935

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91937

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91939

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91941

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91943

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91945

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91945:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.91946:
	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91943:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91944:
	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91941:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91947

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91949

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91948

fbgt_else.91949:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.91950:
	nop
	nop
	nop
	j	fbgt_cont.91948

fbgt_else.91947:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91948:
fbgt_cont.91942:
	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91939:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91940:
	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91937:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.91951

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91953

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91955

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91957

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91952

fbgt_else.91957:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.91958:
	nop
	nop
	nop
	j	fbgt_cont.91952

fbgt_else.91955:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91956:
	nop
	nop
	nop
	j	fbgt_cont.91952

fbgt_else.91953:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.91959

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91961

	sw	%ra, 34(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.91960

fbgt_else.91961:
	sw	%ra, 34(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

fbgt_cont.91962:
	nop
	nop
	nop
	j	fbgt_cont.91960

fbgt_else.91959:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91960:
fbgt_cont.91954:
	nop
	nop
	nop
	j	fbgt_cont.91952

fbgt_else.91951:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91952:
fbgt_cont.91938:
	nop
	nop
	nop
	j	fbgt_cont.91936

fbgt_else.91935:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.91936:
	flw	%f1, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91963

	lw	%v0, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91965

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91964

bnei_else.91965:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.91966:
	nop
	nop
	nop
	j	fbgt_cont.91964

fbgt_else.91963:
	lw	%v0, 30(%sp)
	nop
	nop
	nop

fbgt_cont.91964:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91967

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.91968

fbgt_else.91967:
fbgt_cont.91968:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91969

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91970

fbgt_else.91969:
fbgt_cont.91970:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91971

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.91972

fbgt_else.91971:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.91972:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91973

	nop
	nop
	nop
	j	bnei_cont.91974

bnei_else.91973:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.91974:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91814:
	nop
	nop
	nop
	j	bnei_cont.91812

bnei_else.91811:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.91975

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91976

fbgt_else.91975:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.91976:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.91977

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91978

fbgt_else.91977:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.91978:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.91979

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91981

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91980

bnei_else.91981:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

bnei_cont.91982:
	nop
	nop
	nop
	j	bnei_cont.91980

bnei_else.91979:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.91983

	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.91984

bnei_else.91983:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.91984:
bnei_cont.91980:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.91812:
	lw	%v0, 2(%sp)
	lw	%v1, 23(%sp)
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
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91985

	nop
	nop
	nop
	j	bnei_cont.91790

bnei_else.91985:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91987

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91988

fbgt_else.91987:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91988:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91989

	nop
	nop
	nop
	j	bnei_cont.91990

bnei_else.91989:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.91990:
	flw	%f2, 22(%sp)
	lw	%v0, 26(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f3, 145(%zero)
	fmul	%f0, %f2, %f0
	nop

	flw	%f2, 0(%v0)
	nop
	nop
	nop

	flw	%f2, 148(%zero)
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fmul	%f3, %f0, %f3
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	fsw	%f2, 148(%zero)
	nop
	nop
	nop

	flw	%f2, 149(%zero)
	flw	%f3, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f3, %f0, %f3
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	nop

	fsw	%f2, 149(%zero)
	nop
	nop
	nop

	flw	%f2, 150(%zero)
	flw	%f3, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fadd	%f0, %f2, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.91986:
	nop
	nop
	nop
	j	bnei_cont.91790

bnei_else.91789:
bnei_cont.91790:
bnei_cont.91402:
	lw	%v0, 8(%sp)
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
	blti	%v0, 0, bgti_else.91991

	lw	%v1, 7(%sp)
	flw	%f1, 6(%sp)
	nop
	nop

	flw	%f2, 5(%sp)
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

	flw	%f0, 0(%a1)
	nop
	nop
	nop

	flw	%f1, 1(%a1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 4(%sp)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%a1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.91992

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91993

fbgt_else.91992:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.91993:
	sw	%v0, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.91994

	flw	%f2, 440(%zero)
	lw	%a2, 2(%sp)
	addi	%a0, %v0, 1
	nop

	flw	%f2, 465(%zero)
	nop
	add	%at, %v1, %a0
	fdiv	%f0, %f0, %f2

	lw	%a0, 0(%at)
	fsw	%f2, 137(%zero)
	addi	%v0, %a2, 0
	nop

	lw	%a1, 134(%zero)
	fsw	%f0, 35(%sp)
	nop
	nop

	sw	%a1, 36(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%a0, 37(%sp)
	nop
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.91996

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.91997

fbgt_else.91996:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.91997:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.91998

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92000

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.91999

fbgt_else.92000:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92001:
	nop
	nop
	nop
	j	bnei_cont.91999

bnei_else.91998:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.91999:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92002

	lw	%v0, 141(%zero)
	lw	%v1, 37(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92004

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92006

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92008

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92009

bnei_else.92008:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92009:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 3(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92010

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92011

fbeq_else.92010:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92011:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92012

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92013

bnei_else.92012:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92014

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92015

bnei_else.92014:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92015:
bnei_cont.92013:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92005

bnei_else.92006:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92007:
	nop
	nop
	nop
	j	bnei_cont.92005

bnei_else.92004:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92016

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92017

fbeq_else.92016:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92017:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92018

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92019

bnei_else.92018:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92020

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92021

fbgt_else.92020:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92021:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92022

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92023

bnei_else.92022:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92023:
bnei_cont.92019:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92005:
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

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92024

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92026

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92028

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92030

	nop
	nop
	nop
	j	bnei_cont.92025

bnei_else.92030:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92032

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92033

fbgt_else.92032:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92033:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92034

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92035

bnei_else.92034:
	flw	%f1, 3(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92036

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92037

fbgt_else.92036:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92037:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92038

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92040

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92041

fbgt_else.92040:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92041:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92042

	nop
	nop
	nop
	j	fbgt_cont.92039

bnei_else.92042:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92043:
	nop
	nop
	nop
	j	fbgt_cont.92039

fbgt_else.92038:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92039:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92035:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92044

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92045

fbgt_else.92044:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92045:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92046

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92047

bnei_else.92046:
	flw	%f2, 3(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92048

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92049

fbgt_else.92048:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92049:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92050

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92052

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92053

fbgt_else.92052:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92053:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92054

	nop
	nop
	nop
	j	fbgt_cont.92051

bnei_else.92054:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92055:
	nop
	nop
	nop
	j	fbgt_cont.92051

fbgt_else.92050:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92051:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92047:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 3(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92056

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92057

fbgt_else.92056:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92057:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92058

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92059

bnei_else.92058:
bnei_cont.92059:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92031:
	nop
	nop
	nop
	j	bnei_cont.92025

bnei_else.92028:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 39(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 40(%sp)
	nop
	nop
	nop

	fsw	%f2, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92060

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92062

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92064

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92066

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92068

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92070

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92072

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92074

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92076

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92078

	flw	%f3, 478(%zero)
	sw	%ra, 42(%sp)
	nop
	nop

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
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92078:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92079:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92076:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92077:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92074:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92075:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92072:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92073:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92070:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92071:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92068:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92069:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92066:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92067:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92064:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92065:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92062:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92063:
	nop
	nop
	nop
	j	fbgt_cont.92061

fbgt_else.92060:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92061:
	flw	%f1, 40(%sp)
	flw	%f2, 41(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92080

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92082

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92084

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92086

	sw	%ra, 42(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92081

fbgt_else.92086:
	sw	%ra, 42(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

fbgt_cont.92087:
	nop
	nop
	nop
	j	fbgt_cont.92081

fbgt_else.92084:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92085:
	nop
	nop
	nop
	j	fbgt_cont.92081

fbgt_else.92082:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92088

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92090

	sw	%ra, 42(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92089

fbgt_else.92090:
	sw	%ra, 42(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

fbgt_cont.92091:
	nop
	nop
	nop
	j	fbgt_cont.92089

fbgt_else.92088:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92089:
fbgt_cont.92083:
	nop
	nop
	nop
	j	fbgt_cont.92081

fbgt_else.92080:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92081:
	flw	%f1, 39(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92092

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92093

fbgt_else.92092:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92093:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92094

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92095

fbgt_else.92094:
fbgt_cont.92095:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92096

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92098

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92097

bnei_else.92098:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92099:
	nop
	nop
	nop
	j	fbgt_cont.92097

fbgt_else.92096:
fbgt_cont.92097:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92100

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92101

fbgt_else.92100:
fbgt_cont.92101:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92102

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92103

fbgt_else.92102:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92103:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92104

	nop
	nop
	nop
	j	bnei_cont.92105

bnei_else.92104:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92105:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92029:
	nop
	nop
	nop
	j	bnei_cont.92025

bnei_else.92026:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92106

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92107

fbgt_else.92106:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92107:
	flw	%f3, 488(%zero)
	sw	%v1, 42(%sp)
	fabs	%f0, %f0
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

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92108

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92110

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92112

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92114

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92116

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92118

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92120

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92122

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92124

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92126

	flw	%f4, 478(%zero)
	sw	%ra, 46(%sp)
	nop
	nop

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
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92126:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92127:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92124:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92125:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92122:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92123:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92120:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92121:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92118:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92119:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92116:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92117:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92114:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92115:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92112:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92113:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92110:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92111:
	nop
	nop
	nop
	j	fbgt_cont.92109

fbgt_else.92108:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92109:
	flw	%f1, 44(%sp)
	flw	%f2, 45(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92128

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92130

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92132

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92134

	sw	%ra, 46(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92129

fbgt_else.92134:
	sw	%ra, 46(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

fbgt_cont.92135:
	nop
	nop
	nop
	j	fbgt_cont.92129

fbgt_else.92132:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92133:
	nop
	nop
	nop
	j	fbgt_cont.92129

fbgt_else.92130:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92136

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92138

	sw	%ra, 46(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92137

fbgt_else.92138:
	sw	%ra, 46(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

fbgt_cont.92139:
	nop
	nop
	nop
	j	fbgt_cont.92137

fbgt_else.92136:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92137:
fbgt_cont.92131:
	nop
	nop
	nop
	j	fbgt_cont.92129

fbgt_else.92128:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92129:
	flw	%f1, 43(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92140

	lw	%v0, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92142

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92141

bnei_else.92142:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92143:
	nop
	nop
	nop
	j	fbgt_cont.92141

fbgt_else.92140:
	lw	%v0, 42(%sp)
	nop
	nop
	nop

fbgt_cont.92141:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92144

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92145

fbgt_else.92144:
fbgt_cont.92145:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92146

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92147

fbgt_else.92146:
fbgt_cont.92147:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92148

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92149

fbgt_else.92148:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92149:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92150

	nop
	nop
	nop
	j	bnei_cont.92151

bnei_else.92150:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92151:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92027:
	nop
	nop
	nop
	j	bnei_cont.92025

bnei_else.92024:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92152

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92153

fbgt_else.92152:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92153:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92154

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92155

fbgt_else.92154:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92155:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92156

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92158

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92157

bnei_else.92158:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

bnei_cont.92159:
	nop
	nop
	nop
	j	bnei_cont.92157

bnei_else.92156:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92160

	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92161

bnei_else.92160:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92161:
bnei_cont.92157:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92025:
	lw	%v0, 2(%sp)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92162

	nop
	nop
	nop
	j	bnei_cont.91995

bnei_else.92162:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92164

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92165

fbgt_else.92164:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92165:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92166

	nop
	nop
	nop
	j	bnei_cont.92167

bnei_else.92166:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92167:
	flw	%f1, 35(%sp)
	lw	%v0, 38(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92163:
	nop
	nop
	nop
	j	bnei_cont.91995

bnei_else.92002:
bnei_cont.92003:
	nop
	nop
	nop
	j	bnei_cont.91995

bnei_else.91994:
	flw	%f2, 439(%zero)
	lw	%a2, 2(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 46(%sp)
	nop
	nop

	lw	%a1, 134(%zero)
	nop
	nop
	nop

	sw	%a1, 47(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%a0, 48(%sp)
	nop
	nop
	nop

	sw	%ra, 49(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 50
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92168

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92169

fbgt_else.92168:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92169:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92170

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92172

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.92171

fbgt_else.92172:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92173:
	nop
	nop
	nop
	j	bnei_cont.92171

bnei_else.92170:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.92171:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92174

	lw	%v0, 141(%zero)
	lw	%v1, 48(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92176

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92178

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92180

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92181

bnei_else.92180:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92181:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 3(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92182

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92183

fbeq_else.92182:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92183:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92184

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92185

bnei_else.92184:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92186

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92187

bnei_else.92186:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92187:
bnei_cont.92185:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92177

bnei_else.92178:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92179:
	nop
	nop
	nop
	j	bnei_cont.92177

bnei_else.92176:
	lw	%a0, 136(%zero)
	flw	%f0, 3(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92188

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92189

fbeq_else.92188:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92189:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92190

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92191

bnei_else.92190:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92192

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92193

fbgt_else.92192:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92193:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92194

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92195

bnei_else.92194:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92195:
bnei_cont.92191:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92177:
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

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92196

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92198

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92200

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92202

	nop
	nop
	nop
	j	bnei_cont.92197

bnei_else.92202:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92204

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92205

fbgt_else.92204:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92205:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92206

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92207

bnei_else.92206:
	flw	%f1, 3(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92208

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92209

fbgt_else.92208:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92209:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92210

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92212

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92213

fbgt_else.92212:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92213:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92214

	nop
	nop
	nop
	j	fbgt_cont.92211

bnei_else.92214:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92215:
	nop
	nop
	nop
	j	fbgt_cont.92211

fbgt_else.92210:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92211:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92207:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92216

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92217

fbgt_else.92216:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92217:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92218

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92219

bnei_else.92218:
	flw	%f2, 3(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92220

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92221

fbgt_else.92220:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92221:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92222

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92224

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92225

fbgt_else.92224:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92225:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92226

	nop
	nop
	nop
	j	fbgt_cont.92223

bnei_else.92226:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92227:
	nop
	nop
	nop
	j	fbgt_cont.92223

fbgt_else.92222:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92223:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92219:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 3(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92228

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92229

fbgt_else.92228:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92229:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92230

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92231

bnei_else.92230:
bnei_cont.92231:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92203:
	nop
	nop
	nop
	j	bnei_cont.92197

bnei_else.92200:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 50(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 51(%sp)
	nop
	nop
	nop

	fsw	%f2, 52(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92232

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92234

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92236

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92238

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92240

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92242

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92244

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92246

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92248

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92250

	flw	%f3, 478(%zero)
	sw	%ra, 53(%sp)
	nop
	nop

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
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92250:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92251:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92248:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92249:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92246:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92247:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92244:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92245:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92242:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92243:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92240:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92241:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92238:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92239:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92236:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92237:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92234:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92235:
	nop
	nop
	nop
	j	fbgt_cont.92233

fbgt_else.92232:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92233:
	flw	%f1, 51(%sp)
	flw	%f2, 52(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92252

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92254

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92256

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92258

	sw	%ra, 53(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92253

fbgt_else.92258:
	sw	%ra, 53(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 54
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	nop
	nop
	nop

fbgt_cont.92259:
	nop
	nop
	nop
	j	fbgt_cont.92253

fbgt_else.92256:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92257:
	nop
	nop
	nop
	j	fbgt_cont.92253

fbgt_else.92254:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92260

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92262

	sw	%ra, 53(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92261

fbgt_else.92262:
	sw	%ra, 53(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 54
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	nop
	nop
	nop

fbgt_cont.92263:
	nop
	nop
	nop
	j	fbgt_cont.92261

fbgt_else.92260:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92261:
fbgt_cont.92255:
	nop
	nop
	nop
	j	fbgt_cont.92253

fbgt_else.92252:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92253:
	flw	%f1, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92264

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92265

fbgt_else.92264:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92265:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92266

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92267

fbgt_else.92266:
fbgt_cont.92267:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92268

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92270

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92269

bnei_else.92270:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92271:
	nop
	nop
	nop
	j	fbgt_cont.92269

fbgt_else.92268:
fbgt_cont.92269:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92272

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92273

fbgt_else.92272:
fbgt_cont.92273:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92274

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92275

fbgt_else.92274:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92275:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92276

	nop
	nop
	nop
	j	bnei_cont.92277

bnei_else.92276:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92277:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92201:
	nop
	nop
	nop
	j	bnei_cont.92197

bnei_else.92198:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 3(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92278

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92279

fbgt_else.92278:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92279:
	flw	%f3, 488(%zero)
	sw	%v1, 53(%sp)
	fabs	%f0, %f0
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

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92280

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92282

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92284

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92286

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92288

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92290

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92292

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92294

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92296

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92298

	flw	%f4, 478(%zero)
	sw	%ra, 57(%sp)
	nop
	nop

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92298:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92299:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92296:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92297:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92294:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92295:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92292:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92293:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92290:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92291:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92288:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92289:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92286:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92287:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92284:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92285:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92282:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92283:
	nop
	nop
	nop
	j	fbgt_cont.92281

fbgt_else.92280:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92281:
	flw	%f1, 55(%sp)
	flw	%f2, 56(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92300

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92302

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92304

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92306

	sw	%ra, 57(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92301

fbgt_else.92306:
	sw	%ra, 57(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

fbgt_cont.92307:
	nop
	nop
	nop
	j	fbgt_cont.92301

fbgt_else.92304:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92305:
	nop
	nop
	nop
	j	fbgt_cont.92301

fbgt_else.92302:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92308

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92310

	sw	%ra, 57(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92309

fbgt_else.92310:
	sw	%ra, 57(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

fbgt_cont.92311:
	nop
	nop
	nop
	j	fbgt_cont.92309

fbgt_else.92308:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92309:
fbgt_cont.92303:
	nop
	nop
	nop
	j	fbgt_cont.92301

fbgt_else.92300:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92301:
	flw	%f1, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92312

	lw	%v0, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92314

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92313

bnei_else.92314:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92315:
	nop
	nop
	nop
	j	fbgt_cont.92313

fbgt_else.92312:
	lw	%v0, 53(%sp)
	nop
	nop
	nop

fbgt_cont.92313:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92316

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92317

fbgt_else.92316:
fbgt_cont.92317:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92318

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92319

fbgt_else.92318:
fbgt_cont.92319:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92320

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92321

fbgt_else.92320:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92321:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92322

	nop
	nop
	nop
	j	bnei_cont.92323

bnei_else.92322:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92323:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92199:
	nop
	nop
	nop
	j	bnei_cont.92197

bnei_else.92196:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92324

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92325

fbgt_else.92324:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92325:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92326

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92327

fbgt_else.92326:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92327:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92328

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92330

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92329

bnei_else.92330:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

bnei_cont.92331:
	nop
	nop
	nop
	j	bnei_cont.92329

bnei_else.92328:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92332

	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92333

bnei_else.92332:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92333:
bnei_cont.92329:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92197:
	lw	%v0, 2(%sp)
	lw	%v1, 47(%sp)
	nop
	nop

	sw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92334

	nop
	nop
	nop
	j	bnei_cont.92175

bnei_else.92334:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92336

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92337

fbgt_else.92336:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92337:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92338

	nop
	nop
	nop
	j	bnei_cont.92339

bnei_else.92338:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92339:
	flw	%f1, 46(%sp)
	lw	%v0, 49(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92335:
	nop
	nop
	nop
	j	bnei_cont.92175

bnei_else.92174:
bnei_cont.92175:
bnei_cont.91995:
	lw	%v0, 34(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	lw	%v0, 7(%sp)
	lw	%a0, 0(%sp)
	addi	%a1, %v0, -2
	nop

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2980

bgti_else.91991:
	nop
	nop
	nop
	jr	%ra

bgti_else.91398:
	nop
	nop
	nop
	jr	%ra

do_without_neighbors.3002:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.92342

	lw	%a0, 2(%v0)
	nop
	addi	%a1, %zero, 0
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
	blti	%a0, 0, bgti_else.92343

	lw	%a0, 3(%v0)
	sw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%v1, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92344

	lw	%a0, 5(%v0)
	lw	%a2, 7(%v0)
	nop
	nop

	lw	%a3, 1(%v0)
	lw	%t0, 4(%v0)
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%t0, 3(%sp)
	add	%at, %a2, %v1
	nop

	flw	%f0, 0(%a0)
	lw	%a2, 0(%at)
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
	lw	%a0, 6(%v0)
	nop
	nop

	lw	%a0, 0(%a0)
	lw	%a3, 0(%at)
	nop
	nop

	sw	%a2, 4(%sp)
	nop
	nop
	nop

	sw	%a3, 5(%sp)
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
	beqi	%a0, 0, bnei_else.92346

	lw	%t1, 179(%zero)
	flw	%f0, 0(%a3)
	addi	%v0, %a3, 0
	nop

	fsw	%f0, 162(%zero)
	flw	%f0, 1(%a3)
	nop
	nop

	fsw	%f0, 163(%zero)
	flw	%f0, 2(%a3)
	nop
	nop

	fsw	%f0, 164(%zero)
	sw	%t1, 7(%sp)
	nop
	nop

	lw	%t2, 0(%zero)
	sw	%ra, 8(%sp)
	nop
	nop

	nop
	nop
	addi	%t2, %t2, -1
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v1, %t2, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -9
	addi	%a1, %zero, 118

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.92347

bnei_else.92346:
bnei_cont.92347:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.92348

	lw	%v1, 180(%zero)
	lw	%a0, 5(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 8(%sp)
	addi	%v0, %a0, 0
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
	nop
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
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a1, %zero, 118

	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.92349

bnei_else.92348:
bnei_cont.92349:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.92350

	lw	%v1, 181(%zero)
	lw	%a0, 5(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 9(%sp)
	addi	%v0, %a0, 0
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
	nop
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
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a1, %zero, 118

	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.92351

bnei_else.92350:
bnei_cont.92351:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.92352

	lw	%v1, 182(%zero)
	lw	%a0, 5(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 10(%sp)
	addi	%v0, %a0, 0
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
	sw	%ra, 11(%sp)
	nop
	nop

	lw	%a1, 0(%zero)
	nop
	addi	%sp, %sp, 12
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -12
	addi	%a1, %zero, 118

	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.92353

bnei_else.92352:
bnei_cont.92353:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.92354

	lw	%v0, 183(%zero)
	lw	%v1, 5(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	sw	%v0, 11(%sp)
	addi	%v0, %v1, 0
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
	sw	%ra, 12(%sp)
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%sp, %sp, 13
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -13
	addi	%a1, %zero, 118

	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	lw	%a0, 5(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.92355

bnei_else.92354:
bnei_cont.92355:
	lw	%v0, 2(%sp)
	lw	%v1, 3(%sp)
	nop
	nop

	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 1(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)
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

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92345

bnei_else.92344:
bnei_cont.92345:
	lw	%v0, 2(%sp)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.92356

	lw	%v1, 1(%sp)
	nop
	nop
	nop

	lw	%a0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.92357

	lw	%a0, 3(%v1)
	nop
	nop
	nop

	nop
	nop
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92358

	lw	%a0, 5(%v1)
	lw	%a1, 7(%v1)
	nop
	nop

	lw	%a2, 1(%v1)
	lw	%a3, 4(%v1)
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v0, 12(%sp)
	add	%at, %a1, %v0
	nop

	flw	%f0, 0(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v0
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

	sw	%a3, 13(%sp)
	nop
	nop
	nop

	sw	%a1, 14(%sp)
	nop
	nop
	nop

	sw	%a2, 15(%sp)
	nop
	nop
	nop

	sw	%a0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92360

	lw	%t0, 179(%zero)
	flw	%f0, 0(%a2)
	addi	%v0, %a2, 0
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
	sw	%t0, 17(%sp)
	nop
	nop

	lw	%t1, 0(%zero)
	sw	%ra, 18(%sp)
	nop
	nop

	nop
	nop
	addi	%t1, %t1, -1
	addi	%sp, %sp, 19

	nop
	nop
	addi	%v1, %t1, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v0, 17(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 14(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92362

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92363

fbgt_else.92362:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92363:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92364

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 0(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 18(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 19(%sp)
	nop
	nop
	nop

	fsw	%f1, 20(%sp)
	nop
	nop
	nop

	sw	%a0, 21(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92366

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92367

fbgt_else.92366:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92367:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92368

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92370

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.92369

fbgt_else.92370:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92371:
	nop
	nop
	nop
	j	bnei_cont.92369

bnei_else.92368:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.92369:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92372

	lw	%v0, 141(%zero)
	lw	%v1, 21(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92374

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92376

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92378

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92379

bnei_else.92378:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92379:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 20(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92380

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92381

fbeq_else.92380:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92381:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92382

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92383

bnei_else.92382:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92384

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92385

bnei_else.92384:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92385:
bnei_cont.92383:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92375

bnei_else.92376:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92377:
	nop
	nop
	nop
	j	bnei_cont.92375

bnei_else.92374:
	lw	%a0, 136(%zero)
	flw	%f0, 20(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92386

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92387

fbeq_else.92386:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92387:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92388

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92389

bnei_else.92388:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92390

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92391

fbgt_else.92390:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92391:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92392

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92393

bnei_else.92392:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92393:
bnei_cont.92389:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92375:
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
	sw	%v0, 22(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92394

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92396

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92398

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92400

	nop
	nop
	nop
	j	bnei_cont.92395

bnei_else.92400:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92402

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92403

fbgt_else.92402:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92403:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92404

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92405

bnei_else.92404:
	flw	%f1, 20(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92406

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92407

fbgt_else.92406:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92407:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92408

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92410

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92411

fbgt_else.92410:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92411:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92412

	nop
	nop
	nop
	j	fbgt_cont.92409

bnei_else.92412:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92413:
	nop
	nop
	nop
	j	fbgt_cont.92409

fbgt_else.92408:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92409:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92405:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92414

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92415

fbgt_else.92414:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92415:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92416

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92417

bnei_else.92416:
	flw	%f2, 20(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92418

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92419

fbgt_else.92418:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92419:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92420

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92422

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92423

fbgt_else.92422:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92423:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92424

	nop
	nop
	nop
	j	fbgt_cont.92421

bnei_else.92424:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92425:
	nop
	nop
	nop
	j	fbgt_cont.92421

fbgt_else.92420:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92421:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92417:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 20(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92426

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92427

fbgt_else.92426:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92427:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92428

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92429

bnei_else.92428:
bnei_cont.92429:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92401:
	nop
	nop
	nop
	j	bnei_cont.92395

bnei_else.92398:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 23(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 24(%sp)
	nop
	nop
	nop

	fsw	%f2, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92430

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92432

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92434

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92436

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92438

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92440

	flw	%f3, 482(%zero)
	sw	%ra, 26(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.92431

fbgt_else.92440:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92441:
	nop
	nop
	nop
	j	fbgt_cont.92431

fbgt_else.92438:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92439:
	nop
	nop
	nop
	j	fbgt_cont.92431

fbgt_else.92436:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92437:
	nop
	nop
	nop
	j	fbgt_cont.92431

fbgt_else.92434:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92435:
	nop
	nop
	nop
	j	fbgt_cont.92431

fbgt_else.92432:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92433:
	nop
	nop
	nop
	j	fbgt_cont.92431

fbgt_else.92430:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92431:
	flw	%f1, 24(%sp)
	flw	%f2, 25(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92442

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92444

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92446

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92448

	sw	%ra, 26(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.92443

fbgt_else.92448:
	sw	%ra, 26(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

fbgt_cont.92449:
	nop
	nop
	nop
	j	fbgt_cont.92443

fbgt_else.92446:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92447:
	nop
	nop
	nop
	j	fbgt_cont.92443

fbgt_else.92444:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92450

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92452

	sw	%ra, 26(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.92451

fbgt_else.92452:
	sw	%ra, 26(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

fbgt_cont.92453:
	nop
	nop
	nop
	j	fbgt_cont.92451

fbgt_else.92450:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92451:
fbgt_cont.92445:
	nop
	nop
	nop
	j	fbgt_cont.92443

fbgt_else.92442:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92443:
	flw	%f1, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92454

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92455

fbgt_else.92454:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92455:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92456

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92457

fbgt_else.92456:
fbgt_cont.92457:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92458

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92460

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92459

bnei_else.92460:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92461:
	nop
	nop
	nop
	j	fbgt_cont.92459

fbgt_else.92458:
fbgt_cont.92459:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92462

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92463

fbgt_else.92462:
fbgt_cont.92463:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92464

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92465

fbgt_else.92464:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92465:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92466

	nop
	nop
	nop
	j	bnei_cont.92467

bnei_else.92466:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92467:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92399:
	nop
	nop
	nop
	j	bnei_cont.92395

bnei_else.92396:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 20(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92468

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92469

fbgt_else.92468:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92469:
	flw	%f3, 488(%zero)
	sw	%v1, 26(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 27(%sp)
	nop
	nop
	nop

	fsw	%f0, 28(%sp)
	nop
	nop
	nop

	fsw	%f3, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92470

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92472

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92474

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92476

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92478

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92480

	flw	%f4, 482(%zero)
	sw	%ra, 30(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 31

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92480:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92481:
	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92478:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92479:
	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92476:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92477:
	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92474:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92475:
	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92472:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92473:
	nop
	nop
	nop
	j	fbgt_cont.92471

fbgt_else.92470:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92471:
	flw	%f1, 28(%sp)
	flw	%f2, 29(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92482

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92484

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92486

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92488

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92483

fbgt_else.92488:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.92489:
	nop
	nop
	nop
	j	fbgt_cont.92483

fbgt_else.92486:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92487:
	nop
	nop
	nop
	j	fbgt_cont.92483

fbgt_else.92484:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92490

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92492

	sw	%ra, 30(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92491

fbgt_else.92492:
	sw	%ra, 30(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

fbgt_cont.92493:
	nop
	nop
	nop
	j	fbgt_cont.92491

fbgt_else.92490:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92491:
fbgt_cont.92485:
	nop
	nop
	nop
	j	fbgt_cont.92483

fbgt_else.92482:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92483:
	flw	%f1, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92494

	lw	%v0, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92496

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92495

bnei_else.92496:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92497:
	nop
	nop
	nop
	j	fbgt_cont.92495

fbgt_else.92494:
	lw	%v0, 26(%sp)
	nop
	nop
	nop

fbgt_cont.92495:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92498

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92499

fbgt_else.92498:
fbgt_cont.92499:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92500

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92501

fbgt_else.92500:
fbgt_cont.92501:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92502

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92503

fbgt_else.92502:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92503:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92504

	nop
	nop
	nop
	j	bnei_cont.92505

bnei_else.92504:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92505:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92397:
	nop
	nop
	nop
	j	bnei_cont.92395

bnei_else.92394:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92506

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92507

fbgt_else.92506:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92507:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92508

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92509

fbgt_else.92508:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92509:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92510

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92512

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92511

bnei_else.92512:
	flw	%f0, 20(%sp)
	nop
	nop
	nop

bnei_cont.92513:
	nop
	nop
	nop
	j	bnei_cont.92511

bnei_else.92510:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92514

	flw	%f0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92515

bnei_else.92514:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92515:
bnei_cont.92511:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92395:
	lw	%v0, 0(%sp)
	lw	%v1, 19(%sp)
	nop
	nop

	sw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92516

	nop
	nop
	nop
	j	bnei_cont.92365

bnei_else.92516:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 20(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92518

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92519

fbgt_else.92518:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92519:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92520

	nop
	nop
	nop
	j	bnei_cont.92521

bnei_else.92520:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92521:
	flw	%f1, 18(%sp)
	lw	%v0, 22(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92517:
	nop
	nop
	nop
	j	bnei_cont.92365

bnei_else.92372:
bnei_cont.92373:
	nop
	nop
	nop
	j	bnei_cont.92365

bnei_else.92364:
	flw	%f2, 439(%zero)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 30(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 31(%sp)
	nop
	nop
	nop

	fsw	%f1, 20(%sp)
	nop
	nop
	nop

	sw	%a0, 32(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92522

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92523

fbgt_else.92522:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92523:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92524

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92526

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.92525

fbgt_else.92526:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92527:
	nop
	nop
	nop
	j	bnei_cont.92525

bnei_else.92524:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.92525:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92528

	lw	%v0, 141(%zero)
	lw	%v1, 32(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92530

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92532

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92534

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92535

bnei_else.92534:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92535:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 20(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92536

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92537

fbeq_else.92536:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92537:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92538

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92539

bnei_else.92538:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92540

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92541

bnei_else.92540:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92541:
bnei_cont.92539:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92531

bnei_else.92532:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92533:
	nop
	nop
	nop
	j	bnei_cont.92531

bnei_else.92530:
	lw	%a0, 136(%zero)
	flw	%f0, 20(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92542

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92543

fbeq_else.92542:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92543:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92544

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92545

bnei_else.92544:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92546

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92547

fbgt_else.92546:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92547:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92548

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92549

bnei_else.92548:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92549:
bnei_cont.92545:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92531:
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
	sw	%v0, 33(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92550

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92552

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92554

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92556

	nop
	nop
	nop
	j	bnei_cont.92551

bnei_else.92556:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92558

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92559

fbgt_else.92558:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92559:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92560

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92561

bnei_else.92560:
	flw	%f1, 20(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92562

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92563

fbgt_else.92562:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92563:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92564

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92566

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92567

fbgt_else.92566:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92567:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92568

	nop
	nop
	nop
	j	fbgt_cont.92565

bnei_else.92568:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92569:
	nop
	nop
	nop
	j	fbgt_cont.92565

fbgt_else.92564:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92565:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92561:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92570

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92571

fbgt_else.92570:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92571:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92572

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92573

bnei_else.92572:
	flw	%f2, 20(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92574

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92575

fbgt_else.92574:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92575:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92576

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92578

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92579

fbgt_else.92578:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92579:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92580

	nop
	nop
	nop
	j	fbgt_cont.92577

bnei_else.92580:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92581:
	nop
	nop
	nop
	j	fbgt_cont.92577

fbgt_else.92576:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92577:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92573:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 20(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92582

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92583

fbgt_else.92582:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92583:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92584

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92585

bnei_else.92584:
bnei_cont.92585:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92557:
	nop
	nop
	nop
	j	bnei_cont.92551

bnei_else.92554:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 34(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 35(%sp)
	nop
	nop
	nop

	fsw	%f2, 36(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92586

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92588

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92590

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92592

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92594

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92596

	flw	%f3, 482(%zero)
	sw	%ra, 37(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 38

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92596:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92597:
	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92594:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92595:
	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92592:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92593:
	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92590:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92591:
	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92588:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92589:
	nop
	nop
	nop
	j	fbgt_cont.92587

fbgt_else.92586:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92587:
	flw	%f1, 35(%sp)
	flw	%f2, 36(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92598

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92600

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92602

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92604

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92599

fbgt_else.92604:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.92605:
	nop
	nop
	nop
	j	fbgt_cont.92599

fbgt_else.92602:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92603:
	nop
	nop
	nop
	j	fbgt_cont.92599

fbgt_else.92600:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92606

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92608

	sw	%ra, 37(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92607

fbgt_else.92608:
	sw	%ra, 37(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

fbgt_cont.92609:
	nop
	nop
	nop
	j	fbgt_cont.92607

fbgt_else.92606:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92607:
fbgt_cont.92601:
	nop
	nop
	nop
	j	fbgt_cont.92599

fbgt_else.92598:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92599:
	flw	%f1, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92610

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92611

fbgt_else.92610:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92611:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92612

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92613

fbgt_else.92612:
fbgt_cont.92613:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92614

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92616

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92615

bnei_else.92616:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92617:
	nop
	nop
	nop
	j	fbgt_cont.92615

fbgt_else.92614:
fbgt_cont.92615:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92618

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92619

fbgt_else.92618:
fbgt_cont.92619:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92620

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92621

fbgt_else.92620:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92621:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92622

	nop
	nop
	nop
	j	bnei_cont.92623

bnei_else.92622:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92623:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92555:
	nop
	nop
	nop
	j	bnei_cont.92551

bnei_else.92552:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 20(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92624

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92625

fbgt_else.92624:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92625:
	flw	%f3, 488(%zero)
	sw	%v1, 37(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 38(%sp)
	nop
	nop
	nop

	fsw	%f0, 39(%sp)
	nop
	nop
	nop

	fsw	%f3, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92626

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92628

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92630

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92632

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92634

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92636

	flw	%f4, 482(%zero)
	sw	%ra, 41(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92636:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92637:
	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92634:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92635:
	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92632:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92633:
	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92630:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92631:
	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92628:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92629:
	nop
	nop
	nop
	j	fbgt_cont.92627

fbgt_else.92626:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92627:
	flw	%f1, 39(%sp)
	flw	%f2, 40(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92638

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92640

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92642

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92644

	sw	%ra, 41(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92639

fbgt_else.92644:
	sw	%ra, 41(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

fbgt_cont.92645:
	nop
	nop
	nop
	j	fbgt_cont.92639

fbgt_else.92642:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92643:
	nop
	nop
	nop
	j	fbgt_cont.92639

fbgt_else.92640:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92646

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92648

	sw	%ra, 41(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 42

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92647

fbgt_else.92648:
	sw	%ra, 41(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

fbgt_cont.92649:
	nop
	nop
	nop
	j	fbgt_cont.92647

fbgt_else.92646:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92647:
fbgt_cont.92641:
	nop
	nop
	nop
	j	fbgt_cont.92639

fbgt_else.92638:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92639:
	flw	%f1, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92650

	lw	%v0, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92652

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92651

bnei_else.92652:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92653:
	nop
	nop
	nop
	j	fbgt_cont.92651

fbgt_else.92650:
	lw	%v0, 37(%sp)
	nop
	nop
	nop

fbgt_cont.92651:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92654

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92655

fbgt_else.92654:
fbgt_cont.92655:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92656

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92657

fbgt_else.92656:
fbgt_cont.92657:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92658

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92659

fbgt_else.92658:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92659:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92660

	nop
	nop
	nop
	j	bnei_cont.92661

bnei_else.92660:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92661:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92553:
	nop
	nop
	nop
	j	bnei_cont.92551

bnei_else.92550:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92662

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92663

fbgt_else.92662:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92663:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92664

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92665

fbgt_else.92664:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92665:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92666

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92668

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92667

bnei_else.92668:
	flw	%f0, 20(%sp)
	nop
	nop
	nop

bnei_cont.92669:
	nop
	nop
	nop
	j	bnei_cont.92667

bnei_else.92666:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92670

	flw	%f0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92671

bnei_else.92670:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92671:
bnei_cont.92667:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92551:
	lw	%v0, 0(%sp)
	lw	%v1, 31(%sp)
	nop
	nop

	sw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92672

	nop
	nop
	nop
	j	bnei_cont.92529

bnei_else.92672:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 20(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92674

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92675

fbgt_else.92674:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92675:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92676

	nop
	nop
	nop
	j	bnei_cont.92677

bnei_else.92676:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92677:
	flw	%f1, 30(%sp)
	lw	%v0, 33(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92673:
	nop
	nop
	nop
	j	bnei_cont.92529

bnei_else.92528:
bnei_cont.92529:
bnei_cont.92365:
	lw	%v0, 17(%sp)
	lw	%v1, 14(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 15(%sp)
	sw	%ra, 41(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92361

bnei_else.92360:
bnei_cont.92361:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.92678

	lw	%v1, 180(%zero)
	lw	%a0, 15(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 41(%sp)
	addi	%v0, %a0, 0
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
	sw	%ra, 42(%sp)
	nop
	nop

	lw	%a1, 0(%zero)
	nop
	addi	%sp, %sp, 43
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	lw	%v0, 41(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 14(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92680

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92681

fbgt_else.92680:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92681:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92682

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 0(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 42(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 43(%sp)
	nop
	nop
	nop

	fsw	%f1, 44(%sp)
	nop
	nop
	nop

	sw	%a0, 45(%sp)
	nop
	nop
	nop

	sw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92684

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92685

fbgt_else.92684:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92685:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92686

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92688

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.92687

fbgt_else.92688:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92689:
	nop
	nop
	nop
	j	bnei_cont.92687

bnei_else.92686:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.92687:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92690

	lw	%v0, 141(%zero)
	lw	%v1, 45(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92692

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92694

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92696

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92697

bnei_else.92696:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92697:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 44(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92698

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92699

fbeq_else.92698:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92699:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92700

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92701

bnei_else.92700:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92702

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92703

bnei_else.92702:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92703:
bnei_cont.92701:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92693

bnei_else.92694:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92695:
	nop
	nop
	nop
	j	bnei_cont.92693

bnei_else.92692:
	lw	%a0, 136(%zero)
	flw	%f0, 44(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92704

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92705

fbeq_else.92704:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92705:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92706

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92707

bnei_else.92706:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92708

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92709

fbgt_else.92708:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92709:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92710

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92711

bnei_else.92710:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92711:
bnei_cont.92707:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92693:
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
	sw	%v0, 46(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92712

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92714

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92716

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92718

	nop
	nop
	nop
	j	bnei_cont.92713

bnei_else.92718:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92720

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92721

fbgt_else.92720:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92721:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92722

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92723

bnei_else.92722:
	flw	%f1, 44(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92724

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92725

fbgt_else.92724:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92725:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92726

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92728

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92729

fbgt_else.92728:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92729:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92730

	nop
	nop
	nop
	j	fbgt_cont.92727

bnei_else.92730:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92731:
	nop
	nop
	nop
	j	fbgt_cont.92727

fbgt_else.92726:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92727:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92723:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92732

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92733

fbgt_else.92732:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92733:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92734

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92735

bnei_else.92734:
	flw	%f2, 44(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92736

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92737

fbgt_else.92736:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92737:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92738

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92740

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92741

fbgt_else.92740:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92741:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92742

	nop
	nop
	nop
	j	fbgt_cont.92739

bnei_else.92742:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92743:
	nop
	nop
	nop
	j	fbgt_cont.92739

fbgt_else.92738:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92739:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92735:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 44(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92744

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92745

fbgt_else.92744:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92745:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92746

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92747

bnei_else.92746:
bnei_cont.92747:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92719:
	nop
	nop
	nop
	j	bnei_cont.92713

bnei_else.92716:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 47(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 48(%sp)
	nop
	nop
	nop

	fsw	%f2, 49(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92748

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92750

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92752

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92754

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92756

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92758

	flw	%f3, 482(%zero)
	sw	%ra, 50(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92758:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92759:
	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92756:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92757:
	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92754:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92755:
	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92752:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92753:
	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92750:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92751:
	nop
	nop
	nop
	j	fbgt_cont.92749

fbgt_else.92748:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92749:
	flw	%f1, 48(%sp)
	flw	%f2, 49(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92760

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92762

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92764

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92766

	sw	%ra, 50(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92761

fbgt_else.92766:
	sw	%ra, 50(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 51
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	nop
	nop
	nop

fbgt_cont.92767:
	nop
	nop
	nop
	j	fbgt_cont.92761

fbgt_else.92764:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92765:
	nop
	nop
	nop
	j	fbgt_cont.92761

fbgt_else.92762:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92768

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92770

	sw	%ra, 50(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 51

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92769

fbgt_else.92770:
	sw	%ra, 50(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 51
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	nop
	nop
	nop

fbgt_cont.92771:
	nop
	nop
	nop
	j	fbgt_cont.92769

fbgt_else.92768:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92769:
fbgt_cont.92763:
	nop
	nop
	nop
	j	fbgt_cont.92761

fbgt_else.92760:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92761:
	flw	%f1, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92772

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92773

fbgt_else.92772:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92773:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92774

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92775

fbgt_else.92774:
fbgt_cont.92775:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92776

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92778

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92777

bnei_else.92778:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92779:
	nop
	nop
	nop
	j	fbgt_cont.92777

fbgt_else.92776:
fbgt_cont.92777:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92780

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92781

fbgt_else.92780:
fbgt_cont.92781:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92782

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92783

fbgt_else.92782:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92783:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92784

	nop
	nop
	nop
	j	bnei_cont.92785

bnei_else.92784:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92785:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92717:
	nop
	nop
	nop
	j	bnei_cont.92713

bnei_else.92714:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 44(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92786

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92787

fbgt_else.92786:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92787:
	flw	%f3, 488(%zero)
	sw	%v1, 50(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 51(%sp)
	nop
	nop
	nop

	fsw	%f0, 52(%sp)
	nop
	nop
	nop

	fsw	%f3, 53(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92788

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92790

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92792

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92794

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92796

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92798

	flw	%f4, 482(%zero)
	sw	%ra, 54(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 55

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92798:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92799:
	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92796:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92797:
	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92794:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92795:
	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92792:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92793:
	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92790:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92791:
	nop
	nop
	nop
	j	fbgt_cont.92789

fbgt_else.92788:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92789:
	flw	%f1, 52(%sp)
	flw	%f2, 53(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92800

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92802

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92804

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92806

	sw	%ra, 54(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 55

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92801

fbgt_else.92806:
	sw	%ra, 54(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 55
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

fbgt_cont.92807:
	nop
	nop
	nop
	j	fbgt_cont.92801

fbgt_else.92804:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92805:
	nop
	nop
	nop
	j	fbgt_cont.92801

fbgt_else.92802:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92808

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92810

	sw	%ra, 54(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 55

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92809

fbgt_else.92810:
	sw	%ra, 54(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 55
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

fbgt_cont.92811:
	nop
	nop
	nop
	j	fbgt_cont.92809

fbgt_else.92808:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92809:
fbgt_cont.92803:
	nop
	nop
	nop
	j	fbgt_cont.92801

fbgt_else.92800:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92801:
	flw	%f1, 51(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92812

	lw	%v0, 50(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92814

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92813

bnei_else.92814:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92815:
	nop
	nop
	nop
	j	fbgt_cont.92813

fbgt_else.92812:
	lw	%v0, 50(%sp)
	nop
	nop
	nop

fbgt_cont.92813:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92816

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92817

fbgt_else.92816:
fbgt_cont.92817:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92818

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92819

fbgt_else.92818:
fbgt_cont.92819:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92820

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92821

fbgt_else.92820:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92821:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92822

	nop
	nop
	nop
	j	bnei_cont.92823

bnei_else.92822:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92823:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92715:
	nop
	nop
	nop
	j	bnei_cont.92713

bnei_else.92712:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92824

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92825

fbgt_else.92824:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92825:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92826

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92827

fbgt_else.92826:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92827:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92828

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92830

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92829

bnei_else.92830:
	flw	%f0, 44(%sp)
	nop
	nop
	nop

bnei_cont.92831:
	nop
	nop
	nop
	j	bnei_cont.92829

bnei_else.92828:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92832

	flw	%f0, 44(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92833

bnei_else.92832:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92833:
bnei_cont.92829:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92713:
	lw	%v0, 0(%sp)
	lw	%v1, 43(%sp)
	nop
	nop

	sw	%ra, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 55
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92834

	nop
	nop
	nop
	j	bnei_cont.92683

bnei_else.92834:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 44(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92836

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92837

fbgt_else.92836:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92837:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92838

	nop
	nop
	nop
	j	bnei_cont.92839

bnei_else.92838:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92839:
	flw	%f1, 42(%sp)
	lw	%v0, 46(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92835:
	nop
	nop
	nop
	j	bnei_cont.92683

bnei_else.92690:
bnei_cont.92691:
	nop
	nop
	nop
	j	bnei_cont.92683

bnei_else.92682:
	flw	%f2, 439(%zero)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 54(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 55(%sp)
	nop
	nop
	nop

	fsw	%f1, 44(%sp)
	nop
	nop
	nop

	sw	%a0, 56(%sp)
	nop
	nop
	nop

	sw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92840

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92841

fbgt_else.92840:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92841:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92842

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92844

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.92843

fbgt_else.92844:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92845:
	nop
	nop
	nop
	j	bnei_cont.92843

bnei_else.92842:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.92843:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92846

	lw	%v0, 141(%zero)
	lw	%v1, 56(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.92848

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.92850

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92852

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92853

bnei_else.92852:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.92853:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 44(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.92854

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92855

fbeq_else.92854:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.92855:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92856

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92857

bnei_else.92856:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92858

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92859

bnei_else.92858:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.92859:
bnei_cont.92857:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92849

bnei_else.92850:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.92851:
	nop
	nop
	nop
	j	bnei_cont.92849

bnei_else.92848:
	lw	%a0, 136(%zero)
	flw	%f0, 44(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.92860

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.92861

fbeq_else.92860:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.92861:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92862

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.92863

bnei_else.92862:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92864

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92865

fbgt_else.92864:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92865:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92866

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92867

bnei_else.92866:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.92867:
bnei_cont.92863:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.92849:
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
	sw	%v0, 57(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.92868

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.92870

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.92872

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.92874

	nop
	nop
	nop
	j	bnei_cont.92869

bnei_else.92874:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92876

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92877

fbgt_else.92876:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92877:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92878

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92879

bnei_else.92878:
	flw	%f1, 44(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92880

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92881

fbgt_else.92880:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92881:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.92882

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.92884

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.92885

fbgt_else.92884:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.92885:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92886

	nop
	nop
	nop
	j	fbgt_cont.92883

bnei_else.92886:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92887:
	nop
	nop
	nop
	j	fbgt_cont.92883

fbgt_else.92882:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.92883:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.92879:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92888

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92889

fbgt_else.92888:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92889:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92890

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92891

bnei_else.92890:
	flw	%f2, 44(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92892

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92893

fbgt_else.92892:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92893:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.92894

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.92896

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.92897

fbgt_else.92896:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.92897:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92898

	nop
	nop
	nop
	j	fbgt_cont.92895

bnei_else.92898:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.92899:
	nop
	nop
	nop
	j	fbgt_cont.92895

fbgt_else.92894:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.92895:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.92891:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 44(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92900

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92901

fbgt_else.92900:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92901:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92902

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.92903

bnei_else.92902:
bnei_cont.92903:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92875:
	nop
	nop
	nop
	j	bnei_cont.92869

bnei_else.92872:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 58(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 59(%sp)
	nop
	nop
	nop

	fsw	%f2, 60(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92904

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92906

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92908

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92910

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92912

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92914

	flw	%f3, 482(%zero)
	sw	%ra, 61(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 62

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92914:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92915:
	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92912:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92913:
	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92910:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92911:
	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92908:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92909:
	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92906:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92907:
	nop
	nop
	nop
	j	fbgt_cont.92905

fbgt_else.92904:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.92905:
	flw	%f1, 59(%sp)
	flw	%f2, 60(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92916

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92918

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92920

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92922

	sw	%ra, 61(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 62

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92917

fbgt_else.92922:
	sw	%ra, 61(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	nop
	nop
	nop

fbgt_cont.92923:
	nop
	nop
	nop
	j	fbgt_cont.92917

fbgt_else.92920:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92921:
	nop
	nop
	nop
	j	fbgt_cont.92917

fbgt_else.92918:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92924

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92926

	sw	%ra, 61(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 62

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92925

fbgt_else.92926:
	sw	%ra, 61(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	nop
	nop
	nop

fbgt_cont.92927:
	nop
	nop
	nop
	j	fbgt_cont.92925

fbgt_else.92924:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92925:
fbgt_cont.92919:
	nop
	nop
	nop
	j	fbgt_cont.92917

fbgt_else.92916:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92917:
	flw	%f1, 58(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92928

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92929

fbgt_else.92928:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92929:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92930

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92931

fbgt_else.92930:
fbgt_cont.92931:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92932

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92934

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92933

bnei_else.92934:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92935:
	nop
	nop
	nop
	j	fbgt_cont.92933

fbgt_else.92932:
fbgt_cont.92933:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92936

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92937

fbgt_else.92936:
fbgt_cont.92937:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92938

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.92939

fbgt_else.92938:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.92939:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92940

	nop
	nop
	nop
	j	bnei_cont.92941

bnei_else.92940:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92941:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.92873:
	nop
	nop
	nop
	j	bnei_cont.92869

bnei_else.92870:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 44(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92942

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92943

fbgt_else.92942:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.92943:
	flw	%f3, 488(%zero)
	sw	%v1, 61(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 62(%sp)
	nop
	nop
	nop

	fsw	%f0, 63(%sp)
	nop
	nop
	nop

	fsw	%f3, 64(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.92944

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92946

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92948

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92950

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92952

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.92954

	flw	%f4, 482(%zero)
	sw	%ra, 65(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92954:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92955:
	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92952:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92953:
	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92950:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92951:
	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92948:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92949:
	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92946:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.92947:
	nop
	nop
	nop
	j	fbgt_cont.92945

fbgt_else.92944:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.92945:
	flw	%f1, 63(%sp)
	flw	%f2, 64(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92956

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92958

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.92960

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92962

	sw	%ra, 65(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92957

fbgt_else.92962:
	sw	%ra, 65(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

fbgt_cont.92963:
	nop
	nop
	nop
	j	fbgt_cont.92957

fbgt_else.92960:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92961:
	nop
	nop
	nop
	j	fbgt_cont.92957

fbgt_else.92958:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.92964

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92966

	sw	%ra, 65(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.92965

fbgt_else.92966:
	sw	%ra, 65(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

fbgt_cont.92967:
	nop
	nop
	nop
	j	fbgt_cont.92965

fbgt_else.92964:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92965:
fbgt_cont.92959:
	nop
	nop
	nop
	j	fbgt_cont.92957

fbgt_else.92956:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.92957:
	flw	%f1, 62(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92968

	lw	%v0, 61(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92970

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92969

bnei_else.92970:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.92971:
	nop
	nop
	nop
	j	fbgt_cont.92969

fbgt_else.92968:
	lw	%v0, 61(%sp)
	nop
	nop
	nop

fbgt_cont.92969:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92972

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.92973

fbgt_else.92972:
fbgt_cont.92973:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92974

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92975

fbgt_else.92974:
fbgt_cont.92975:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92976

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.92977

fbgt_else.92976:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.92977:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92978

	nop
	nop
	nop
	j	bnei_cont.92979

bnei_else.92978:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.92979:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92871:
	nop
	nop
	nop
	j	bnei_cont.92869

bnei_else.92868:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.92980

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92981

fbgt_else.92980:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92981:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.92982

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92983

fbgt_else.92982:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.92983:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.92984

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92986

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92985

bnei_else.92986:
	flw	%f0, 44(%sp)
	nop
	nop
	nop

bnei_cont.92987:
	nop
	nop
	nop
	j	bnei_cont.92985

bnei_else.92984:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.92988

	flw	%f0, 44(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92989

bnei_else.92988:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.92989:
bnei_cont.92985:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.92869:
	lw	%v0, 0(%sp)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92990

	nop
	nop
	nop
	j	bnei_cont.92847

bnei_else.92990:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 44(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.92992

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92993

fbgt_else.92992:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.92993:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.92994

	nop
	nop
	nop
	j	bnei_cont.92995

bnei_else.92994:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.92995:
	flw	%f1, 54(%sp)
	lw	%v0, 57(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.92991:
	nop
	nop
	nop
	j	bnei_cont.92847

bnei_else.92846:
bnei_cont.92847:
bnei_cont.92683:
	lw	%v0, 41(%sp)
	lw	%v1, 14(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 15(%sp)
	sw	%ra, 65(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92679

bnei_else.92678:
bnei_cont.92679:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.92996

	lw	%v1, 181(%zero)
	lw	%a0, 15(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 65(%sp)
	addi	%v0, %a0, 0
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
	sw	%ra, 66(%sp)
	nop
	nop

	lw	%a1, 0(%zero)
	nop
	addi	%sp, %sp, 67
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -67
	nop

	lw	%ra, 66(%sp)
	lw	%v0, 65(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 14(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.92998

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.92999

fbgt_else.92998:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.92999:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93000

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 0(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 66(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 67(%sp)
	nop
	nop
	nop

	fsw	%f1, 68(%sp)
	nop
	nop
	nop

	sw	%a0, 69(%sp)
	nop
	nop
	nop

	sw	%ra, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 71
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -71
	nop

	lw	%ra, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93002

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93003

fbgt_else.93002:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93003:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93004

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93006

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93005

fbgt_else.93006:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93007:
	nop
	nop
	nop
	j	bnei_cont.93005

bnei_else.93004:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93005:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93008

	lw	%v0, 141(%zero)
	lw	%v1, 69(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93010

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93012

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93014

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93015

bnei_else.93014:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93015:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 68(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93016

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93017

fbeq_else.93016:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93017:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93018

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93019

bnei_else.93018:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93020

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93021

bnei_else.93020:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93021:
bnei_cont.93019:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93011

bnei_else.93012:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93013:
	nop
	nop
	nop
	j	bnei_cont.93011

bnei_else.93010:
	lw	%a0, 136(%zero)
	flw	%f0, 68(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93022

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93023

fbeq_else.93022:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93023:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93024

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93025

bnei_else.93024:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93026

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93027

fbgt_else.93026:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93027:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93028

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93029

bnei_else.93028:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93029:
bnei_cont.93025:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93011:
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
	sw	%v0, 70(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93030

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93032

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93034

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93036

	nop
	nop
	nop
	j	bnei_cont.93031

bnei_else.93036:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93038

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93039

fbgt_else.93038:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93039:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93040

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93041

bnei_else.93040:
	flw	%f1, 68(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93042

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93043

fbgt_else.93042:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93043:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93044

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93046

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93047

fbgt_else.93046:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93047:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93048

	nop
	nop
	nop
	j	fbgt_cont.93045

bnei_else.93048:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93049:
	nop
	nop
	nop
	j	fbgt_cont.93045

fbgt_else.93044:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93045:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93041:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93050

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93051

fbgt_else.93050:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93051:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93052

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93053

bnei_else.93052:
	flw	%f2, 68(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93054

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93055

fbgt_else.93054:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93055:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93056

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93058

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93059

fbgt_else.93058:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93059:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93060

	nop
	nop
	nop
	j	fbgt_cont.93057

bnei_else.93060:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93061:
	nop
	nop
	nop
	j	fbgt_cont.93057

fbgt_else.93056:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93057:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93053:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 68(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93062

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93063

fbgt_else.93062:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93063:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93064

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93065

bnei_else.93064:
bnei_cont.93065:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93037:
	nop
	nop
	nop
	j	bnei_cont.93031

bnei_else.93034:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 71(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 72(%sp)
	nop
	nop
	nop

	fsw	%f2, 73(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93066

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93068

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93070

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93072

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93074

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93076

	flw	%f3, 482(%zero)
	sw	%ra, 74(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 75

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93076:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93077:
	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93074:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93075:
	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93072:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93073:
	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93070:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93071:
	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93068:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93069:
	nop
	nop
	nop
	j	fbgt_cont.93067

fbgt_else.93066:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93067:
	flw	%f1, 72(%sp)
	flw	%f2, 73(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93078

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93080

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93082

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93084

	sw	%ra, 74(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93079

fbgt_else.93084:
	sw	%ra, 74(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 75
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

fbgt_cont.93085:
	nop
	nop
	nop
	j	fbgt_cont.93079

fbgt_else.93082:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93083:
	nop
	nop
	nop
	j	fbgt_cont.93079

fbgt_else.93080:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93086

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93088

	sw	%ra, 74(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93087

fbgt_else.93088:
	sw	%ra, 74(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 75
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -75
	nop

	lw	%ra, 74(%sp)
	nop
	nop
	nop

fbgt_cont.93089:
	nop
	nop
	nop
	j	fbgt_cont.93087

fbgt_else.93086:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93087:
fbgt_cont.93081:
	nop
	nop
	nop
	j	fbgt_cont.93079

fbgt_else.93078:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93079:
	flw	%f1, 71(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93090

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93091

fbgt_else.93090:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93091:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93092

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93093

fbgt_else.93092:
fbgt_cont.93093:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93094

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93096

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93095

bnei_else.93096:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93097:
	nop
	nop
	nop
	j	fbgt_cont.93095

fbgt_else.93094:
fbgt_cont.93095:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93098

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93099

fbgt_else.93098:
fbgt_cont.93099:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93100

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93101

fbgt_else.93100:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93101:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93102

	nop
	nop
	nop
	j	bnei_cont.93103

bnei_else.93102:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93103:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93035:
	nop
	nop
	nop
	j	bnei_cont.93031

bnei_else.93032:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 68(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93104

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93105

fbgt_else.93104:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93105:
	flw	%f3, 488(%zero)
	sw	%v1, 74(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 75(%sp)
	nop
	nop
	nop

	fsw	%f0, 76(%sp)
	nop
	nop
	nop

	fsw	%f3, 77(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93106

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93108

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93110

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93112

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93114

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93116

	flw	%f4, 482(%zero)
	sw	%ra, 78(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 79

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93116:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93117:
	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93114:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93115:
	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93112:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93113:
	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93110:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93111:
	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93108:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93109:
	nop
	nop
	nop
	j	fbgt_cont.93107

fbgt_else.93106:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93107:
	flw	%f1, 76(%sp)
	flw	%f2, 77(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93118

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93120

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93122

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93124

	sw	%ra, 78(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 79

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93119

fbgt_else.93124:
	sw	%ra, 78(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 79
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

fbgt_cont.93125:
	nop
	nop
	nop
	j	fbgt_cont.93119

fbgt_else.93122:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93123:
	nop
	nop
	nop
	j	fbgt_cont.93119

fbgt_else.93120:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93126

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93128

	sw	%ra, 78(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 79

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93127

fbgt_else.93128:
	sw	%ra, 78(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 79
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

fbgt_cont.93129:
	nop
	nop
	nop
	j	fbgt_cont.93127

fbgt_else.93126:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93127:
fbgt_cont.93121:
	nop
	nop
	nop
	j	fbgt_cont.93119

fbgt_else.93118:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93119:
	flw	%f1, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93130

	lw	%v0, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93132

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93131

bnei_else.93132:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93133:
	nop
	nop
	nop
	j	fbgt_cont.93131

fbgt_else.93130:
	lw	%v0, 74(%sp)
	nop
	nop
	nop

fbgt_cont.93131:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93134

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93135

fbgt_else.93134:
fbgt_cont.93135:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93136

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93137

fbgt_else.93136:
fbgt_cont.93137:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93138

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93139

fbgt_else.93138:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93139:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93140

	nop
	nop
	nop
	j	bnei_cont.93141

bnei_else.93140:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93141:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93033:
	nop
	nop
	nop
	j	bnei_cont.93031

bnei_else.93030:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93142

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93143

fbgt_else.93142:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93143:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93144

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93145

fbgt_else.93144:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93145:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93146

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93148

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93147

bnei_else.93148:
	flw	%f0, 68(%sp)
	nop
	nop
	nop

bnei_cont.93149:
	nop
	nop
	nop
	j	bnei_cont.93147

bnei_else.93146:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93150

	flw	%f0, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93151

bnei_else.93150:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93151:
bnei_cont.93147:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93031:
	lw	%v0, 0(%sp)
	lw	%v1, 67(%sp)
	nop
	nop

	sw	%ra, 78(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 79
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -79
	nop

	lw	%ra, 78(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93152

	nop
	nop
	nop
	j	bnei_cont.93001

bnei_else.93152:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 68(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93154

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93155

fbgt_else.93154:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93155:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93156

	nop
	nop
	nop
	j	bnei_cont.93157

bnei_else.93156:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93157:
	flw	%f1, 66(%sp)
	lw	%v0, 70(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93153:
	nop
	nop
	nop
	j	bnei_cont.93001

bnei_else.93008:
bnei_cont.93009:
	nop
	nop
	nop
	j	bnei_cont.93001

bnei_else.93000:
	flw	%f2, 439(%zero)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 78(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 79(%sp)
	nop
	nop
	nop

	fsw	%f1, 68(%sp)
	nop
	nop
	nop

	sw	%a0, 80(%sp)
	nop
	nop
	nop

	sw	%ra, 81(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 82
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93158

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93159

fbgt_else.93158:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93159:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93160

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93162

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93161

fbgt_else.93162:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93163:
	nop
	nop
	nop
	j	bnei_cont.93161

bnei_else.93160:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93161:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93164

	lw	%v0, 141(%zero)
	lw	%v1, 80(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93166

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93168

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93170

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93171

bnei_else.93170:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93171:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 68(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93172

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93173

fbeq_else.93172:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93173:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93174

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93175

bnei_else.93174:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93176

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93177

bnei_else.93176:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93177:
bnei_cont.93175:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93167

bnei_else.93168:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93169:
	nop
	nop
	nop
	j	bnei_cont.93167

bnei_else.93166:
	lw	%a0, 136(%zero)
	flw	%f0, 68(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93178

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93179

fbeq_else.93178:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93179:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93180

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93181

bnei_else.93180:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93182

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93183

fbgt_else.93182:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93183:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93184

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93185

bnei_else.93184:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93185:
bnei_cont.93181:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93167:
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
	sw	%v0, 81(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93186

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93188

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93190

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93192

	nop
	nop
	nop
	j	bnei_cont.93187

bnei_else.93192:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93194

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93195

fbgt_else.93194:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93195:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93196

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93197

bnei_else.93196:
	flw	%f1, 68(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93198

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93199

fbgt_else.93198:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93199:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93200

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93202

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93203

fbgt_else.93202:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93203:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93204

	nop
	nop
	nop
	j	fbgt_cont.93201

bnei_else.93204:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93205:
	nop
	nop
	nop
	j	fbgt_cont.93201

fbgt_else.93200:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93201:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93197:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93206

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93207

fbgt_else.93206:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93207:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93208

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93209

bnei_else.93208:
	flw	%f2, 68(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93210

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93211

fbgt_else.93210:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93211:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93212

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93214

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93215

fbgt_else.93214:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93215:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93216

	nop
	nop
	nop
	j	fbgt_cont.93213

bnei_else.93216:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93217:
	nop
	nop
	nop
	j	fbgt_cont.93213

fbgt_else.93212:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93213:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93209:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 68(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93218

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93219

fbgt_else.93218:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93219:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93220

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93221

bnei_else.93220:
bnei_cont.93221:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93193:
	nop
	nop
	nop
	j	bnei_cont.93187

bnei_else.93190:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 82(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 83(%sp)
	nop
	nop
	nop

	fsw	%f2, 84(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93222

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93224

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93226

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93228

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93230

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93232

	flw	%f3, 482(%zero)
	sw	%ra, 85(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 86

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -86
	nop

	lw	%ra, 85(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93232:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93233:
	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93230:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93231:
	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93228:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93229:
	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93226:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93227:
	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93224:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93225:
	nop
	nop
	nop
	j	fbgt_cont.93223

fbgt_else.93222:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93223:
	flw	%f1, 83(%sp)
	flw	%f2, 84(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93234

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93236

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93238

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93240

	sw	%ra, 85(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 86

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -86
	nop

	lw	%ra, 85(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93235

fbgt_else.93240:
	sw	%ra, 85(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 86
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -86
	nop

	lw	%ra, 85(%sp)
	nop
	nop
	nop

fbgt_cont.93241:
	nop
	nop
	nop
	j	fbgt_cont.93235

fbgt_else.93238:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93239:
	nop
	nop
	nop
	j	fbgt_cont.93235

fbgt_else.93236:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93242

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93244

	sw	%ra, 85(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 86

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -86
	nop

	lw	%ra, 85(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93243

fbgt_else.93244:
	sw	%ra, 85(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 86
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -86
	nop

	lw	%ra, 85(%sp)
	nop
	nop
	nop

fbgt_cont.93245:
	nop
	nop
	nop
	j	fbgt_cont.93243

fbgt_else.93242:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93243:
fbgt_cont.93237:
	nop
	nop
	nop
	j	fbgt_cont.93235

fbgt_else.93234:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93235:
	flw	%f1, 82(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93246

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93247

fbgt_else.93246:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93247:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93248

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93249

fbgt_else.93248:
fbgt_cont.93249:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93250

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93252

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93251

bnei_else.93252:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93253:
	nop
	nop
	nop
	j	fbgt_cont.93251

fbgt_else.93250:
fbgt_cont.93251:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93254

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93255

fbgt_else.93254:
fbgt_cont.93255:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93256

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93257

fbgt_else.93256:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93257:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93258

	nop
	nop
	nop
	j	bnei_cont.93259

bnei_else.93258:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93259:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93191:
	nop
	nop
	nop
	j	bnei_cont.93187

bnei_else.93188:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 68(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93260

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93261

fbgt_else.93260:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93261:
	flw	%f3, 488(%zero)
	sw	%v1, 85(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 86(%sp)
	nop
	nop
	nop

	fsw	%f0, 87(%sp)
	nop
	nop
	nop

	fsw	%f3, 88(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93262

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93264

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93266

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93268

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93270

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93272

	flw	%f4, 482(%zero)
	sw	%ra, 89(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 90

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93272:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93273:
	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93270:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93271:
	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93268:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93269:
	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93266:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93267:
	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93264:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93265:
	nop
	nop
	nop
	j	fbgt_cont.93263

fbgt_else.93262:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93263:
	flw	%f1, 87(%sp)
	flw	%f2, 88(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93274

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93276

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93278

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93280

	sw	%ra, 89(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 90

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93275

fbgt_else.93280:
	sw	%ra, 89(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 90
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

fbgt_cont.93281:
	nop
	nop
	nop
	j	fbgt_cont.93275

fbgt_else.93278:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93279:
	nop
	nop
	nop
	j	fbgt_cont.93275

fbgt_else.93276:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93282

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93284

	sw	%ra, 89(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 90

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93283

fbgt_else.93284:
	sw	%ra, 89(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 90
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

fbgt_cont.93285:
	nop
	nop
	nop
	j	fbgt_cont.93283

fbgt_else.93282:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93283:
fbgt_cont.93277:
	nop
	nop
	nop
	j	fbgt_cont.93275

fbgt_else.93274:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93275:
	flw	%f1, 86(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93286

	lw	%v0, 85(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93288

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93287

bnei_else.93288:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93289:
	nop
	nop
	nop
	j	fbgt_cont.93287

fbgt_else.93286:
	lw	%v0, 85(%sp)
	nop
	nop
	nop

fbgt_cont.93287:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93290

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93291

fbgt_else.93290:
fbgt_cont.93291:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93292

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93293

fbgt_else.93292:
fbgt_cont.93293:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93294

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93295

fbgt_else.93294:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93295:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93296

	nop
	nop
	nop
	j	bnei_cont.93297

bnei_else.93296:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93297:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93189:
	nop
	nop
	nop
	j	bnei_cont.93187

bnei_else.93186:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93298

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93299

fbgt_else.93298:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93299:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93300

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93301

fbgt_else.93300:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93301:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93302

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93304

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93303

bnei_else.93304:
	flw	%f0, 68(%sp)
	nop
	nop
	nop

bnei_cont.93305:
	nop
	nop
	nop
	j	bnei_cont.93303

bnei_else.93302:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93306

	flw	%f0, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93307

bnei_else.93306:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93307:
bnei_cont.93303:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93187:
	lw	%v0, 0(%sp)
	lw	%v1, 79(%sp)
	nop
	nop

	sw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 90
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93308

	nop
	nop
	nop
	j	bnei_cont.93165

bnei_else.93308:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 68(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93310

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93311

fbgt_else.93310:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93311:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93312

	nop
	nop
	nop
	j	bnei_cont.93313

bnei_else.93312:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93313:
	flw	%f1, 78(%sp)
	lw	%v0, 81(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93309:
	nop
	nop
	nop
	j	bnei_cont.93165

bnei_else.93164:
bnei_cont.93165:
bnei_cont.93001:
	lw	%v0, 65(%sp)
	lw	%v1, 14(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 15(%sp)
	sw	%ra, 89(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 90
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -90
	nop

	lw	%ra, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92997

bnei_else.92996:
bnei_cont.92997:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.93314

	lw	%v1, 182(%zero)
	lw	%a0, 15(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 89(%sp)
	addi	%v0, %a0, 0
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
	sw	%ra, 90(%sp)
	nop
	nop

	lw	%a1, 0(%zero)
	nop
	addi	%sp, %sp, 91
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	lw	%v0, 89(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 14(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93316

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93317

fbgt_else.93316:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93317:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93318

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 0(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 90(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 91(%sp)
	nop
	nop
	nop

	fsw	%f1, 92(%sp)
	nop
	nop
	nop

	sw	%a0, 93(%sp)
	nop
	nop
	nop

	sw	%ra, 94(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 95
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -95
	nop

	lw	%ra, 94(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93320

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93321

fbgt_else.93320:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93321:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93322

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93324

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93323

fbgt_else.93324:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93325:
	nop
	nop
	nop
	j	bnei_cont.93323

bnei_else.93322:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93323:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93326

	lw	%v0, 141(%zero)
	lw	%v1, 93(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93328

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93330

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93332

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93333

bnei_else.93332:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93333:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 92(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93334

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93335

fbeq_else.93334:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93335:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93336

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93337

bnei_else.93336:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93338

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93339

bnei_else.93338:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93339:
bnei_cont.93337:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93329

bnei_else.93330:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93331:
	nop
	nop
	nop
	j	bnei_cont.93329

bnei_else.93328:
	lw	%a0, 136(%zero)
	flw	%f0, 92(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93340

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93341

fbeq_else.93340:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93341:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93342

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93343

bnei_else.93342:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93344

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93345

fbgt_else.93344:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93345:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93346

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93347

bnei_else.93346:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93347:
bnei_cont.93343:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93329:
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
	sw	%v0, 94(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93348

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93350

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93352

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93354

	nop
	nop
	nop
	j	bnei_cont.93349

bnei_else.93354:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93356

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93357

fbgt_else.93356:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93357:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93358

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93359

bnei_else.93358:
	flw	%f1, 92(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93360

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93361

fbgt_else.93360:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93361:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93362

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93364

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93365

fbgt_else.93364:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93365:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93366

	nop
	nop
	nop
	j	fbgt_cont.93363

bnei_else.93366:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93367:
	nop
	nop
	nop
	j	fbgt_cont.93363

fbgt_else.93362:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93363:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93359:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93368

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93369

fbgt_else.93368:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93369:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93370

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93371

bnei_else.93370:
	flw	%f2, 92(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93372

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93373

fbgt_else.93372:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93373:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93374

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93376

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93377

fbgt_else.93376:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93377:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93378

	nop
	nop
	nop
	j	fbgt_cont.93375

bnei_else.93378:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93379:
	nop
	nop
	nop
	j	fbgt_cont.93375

fbgt_else.93374:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93375:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93371:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 92(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93380

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93381

fbgt_else.93380:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93381:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93382

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93383

bnei_else.93382:
bnei_cont.93383:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93355:
	nop
	nop
	nop
	j	bnei_cont.93349

bnei_else.93352:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 95(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 96(%sp)
	nop
	nop
	nop

	fsw	%f2, 97(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93384

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93386

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93388

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93390

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93392

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93394

	flw	%f3, 482(%zero)
	sw	%ra, 98(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 99

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93394:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93395:
	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93392:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93393:
	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93390:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93391:
	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93388:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93389:
	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93386:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93387:
	nop
	nop
	nop
	j	fbgt_cont.93385

fbgt_else.93384:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93385:
	flw	%f1, 96(%sp)
	flw	%f2, 97(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93396

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93398

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93400

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93402

	sw	%ra, 98(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 99

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93397

fbgt_else.93402:
	sw	%ra, 98(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 99
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	nop
	nop
	nop

fbgt_cont.93403:
	nop
	nop
	nop
	j	fbgt_cont.93397

fbgt_else.93400:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93401:
	nop
	nop
	nop
	j	fbgt_cont.93397

fbgt_else.93398:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93404

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93406

	sw	%ra, 98(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 99

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93405

fbgt_else.93406:
	sw	%ra, 98(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 99
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	nop
	nop
	nop

fbgt_cont.93407:
	nop
	nop
	nop
	j	fbgt_cont.93405

fbgt_else.93404:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93405:
fbgt_cont.93399:
	nop
	nop
	nop
	j	fbgt_cont.93397

fbgt_else.93396:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93397:
	flw	%f1, 95(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93408

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93409

fbgt_else.93408:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93409:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93410

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93411

fbgt_else.93410:
fbgt_cont.93411:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93412

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93414

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93413

bnei_else.93414:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93415:
	nop
	nop
	nop
	j	fbgt_cont.93413

fbgt_else.93412:
fbgt_cont.93413:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93416

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93417

fbgt_else.93416:
fbgt_cont.93417:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93418

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93419

fbgt_else.93418:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93419:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93420

	nop
	nop
	nop
	j	bnei_cont.93421

bnei_else.93420:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93421:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93353:
	nop
	nop
	nop
	j	bnei_cont.93349

bnei_else.93350:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 92(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93422

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93423

fbgt_else.93422:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93423:
	flw	%f3, 488(%zero)
	sw	%v1, 98(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 99(%sp)
	nop
	nop
	nop

	fsw	%f0, 100(%sp)
	nop
	nop
	nop

	fsw	%f3, 101(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93424

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93426

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93428

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93430

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93432

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93434

	flw	%f4, 482(%zero)
	sw	%ra, 102(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 103

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93434:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93435:
	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93432:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93433:
	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93430:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93431:
	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93428:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93429:
	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93426:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93427:
	nop
	nop
	nop
	j	fbgt_cont.93425

fbgt_else.93424:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93425:
	flw	%f1, 100(%sp)
	flw	%f2, 101(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93436

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93438

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93440

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93442

	sw	%ra, 102(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 103

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93437

fbgt_else.93442:
	sw	%ra, 102(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

fbgt_cont.93443:
	nop
	nop
	nop
	j	fbgt_cont.93437

fbgt_else.93440:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93441:
	nop
	nop
	nop
	j	fbgt_cont.93437

fbgt_else.93438:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93444

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93446

	sw	%ra, 102(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 103

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93445

fbgt_else.93446:
	sw	%ra, 102(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

fbgt_cont.93447:
	nop
	nop
	nop
	j	fbgt_cont.93445

fbgt_else.93444:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93445:
fbgt_cont.93439:
	nop
	nop
	nop
	j	fbgt_cont.93437

fbgt_else.93436:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93437:
	flw	%f1, 99(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93448

	lw	%v0, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93450

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93449

bnei_else.93450:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93451:
	nop
	nop
	nop
	j	fbgt_cont.93449

fbgt_else.93448:
	lw	%v0, 98(%sp)
	nop
	nop
	nop

fbgt_cont.93449:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93452

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93453

fbgt_else.93452:
fbgt_cont.93453:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93454

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93455

fbgt_else.93454:
fbgt_cont.93455:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93456

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93457

fbgt_else.93456:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93457:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93458

	nop
	nop
	nop
	j	bnei_cont.93459

bnei_else.93458:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93459:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93351:
	nop
	nop
	nop
	j	bnei_cont.93349

bnei_else.93348:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93460

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93461

fbgt_else.93460:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93461:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93462

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93463

fbgt_else.93462:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93463:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93464

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93466

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93465

bnei_else.93466:
	flw	%f0, 92(%sp)
	nop
	nop
	nop

bnei_cont.93467:
	nop
	nop
	nop
	j	bnei_cont.93465

bnei_else.93464:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93468

	flw	%f0, 92(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93469

bnei_else.93468:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93469:
bnei_cont.93465:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93349:
	lw	%v0, 0(%sp)
	lw	%v1, 91(%sp)
	nop
	nop

	sw	%ra, 102(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93470

	nop
	nop
	nop
	j	bnei_cont.93319

bnei_else.93470:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 92(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93472

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93473

fbgt_else.93472:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93473:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93474

	nop
	nop
	nop
	j	bnei_cont.93475

bnei_else.93474:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93475:
	flw	%f1, 90(%sp)
	lw	%v0, 94(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93471:
	nop
	nop
	nop
	j	bnei_cont.93319

bnei_else.93326:
bnei_cont.93327:
	nop
	nop
	nop
	j	bnei_cont.93319

bnei_else.93318:
	flw	%f2, 439(%zero)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 102(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 103(%sp)
	nop
	nop
	nop

	fsw	%f1, 92(%sp)
	nop
	nop
	nop

	sw	%a0, 104(%sp)
	nop
	nop
	nop

	sw	%ra, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 106
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -106
	nop

	lw	%ra, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93476

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93477

fbgt_else.93476:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93477:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93478

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93480

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93479

fbgt_else.93480:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93481:
	nop
	nop
	nop
	j	bnei_cont.93479

bnei_else.93478:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93479:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93482

	lw	%v0, 141(%zero)
	lw	%v1, 104(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93484

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93486

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93488

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93489

bnei_else.93488:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93489:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 92(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93490

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93491

fbeq_else.93490:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93491:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93492

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93493

bnei_else.93492:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93494

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93495

bnei_else.93494:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93495:
bnei_cont.93493:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93485

bnei_else.93486:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93487:
	nop
	nop
	nop
	j	bnei_cont.93485

bnei_else.93484:
	lw	%a0, 136(%zero)
	flw	%f0, 92(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93496

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93497

fbeq_else.93496:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93497:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93498

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93499

bnei_else.93498:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93500

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93501

fbgt_else.93500:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93501:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93502

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93503

bnei_else.93502:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93503:
bnei_cont.93499:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93485:
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
	sw	%v0, 105(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93504

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93506

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93508

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93510

	nop
	nop
	nop
	j	bnei_cont.93505

bnei_else.93510:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93512

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93513

fbgt_else.93512:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93513:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93514

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93515

bnei_else.93514:
	flw	%f1, 92(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93516

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93517

fbgt_else.93516:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93517:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93518

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93520

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93521

fbgt_else.93520:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93521:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93522

	nop
	nop
	nop
	j	fbgt_cont.93519

bnei_else.93522:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93523:
	nop
	nop
	nop
	j	fbgt_cont.93519

fbgt_else.93518:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93519:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93515:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93524

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93525

fbgt_else.93524:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93525:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93526

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93527

bnei_else.93526:
	flw	%f2, 92(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93528

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93529

fbgt_else.93528:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93529:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93530

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93532

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93533

fbgt_else.93532:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93533:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93534

	nop
	nop
	nop
	j	fbgt_cont.93531

bnei_else.93534:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93535:
	nop
	nop
	nop
	j	fbgt_cont.93531

fbgt_else.93530:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93531:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93527:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 92(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93536

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93537

fbgt_else.93536:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93537:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93538

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93539

bnei_else.93538:
bnei_cont.93539:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93511:
	nop
	nop
	nop
	j	bnei_cont.93505

bnei_else.93508:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 106(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 107(%sp)
	nop
	nop
	nop

	fsw	%f2, 108(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93540

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93542

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93544

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93546

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93548

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93550

	flw	%f3, 482(%zero)
	sw	%ra, 109(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 110

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93550:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93551:
	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93548:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93549:
	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93546:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93547:
	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93544:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93545:
	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93542:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93543:
	nop
	nop
	nop
	j	fbgt_cont.93541

fbgt_else.93540:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93541:
	flw	%f1, 107(%sp)
	flw	%f2, 108(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93552

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93554

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93556

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93558

	sw	%ra, 109(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 110

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93553

fbgt_else.93558:
	sw	%ra, 109(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 110
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	nop
	nop
	nop

fbgt_cont.93559:
	nop
	nop
	nop
	j	fbgt_cont.93553

fbgt_else.93556:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93557:
	nop
	nop
	nop
	j	fbgt_cont.93553

fbgt_else.93554:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93560

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93562

	sw	%ra, 109(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 110

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93561

fbgt_else.93562:
	sw	%ra, 109(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 110
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	nop
	nop
	nop

fbgt_cont.93563:
	nop
	nop
	nop
	j	fbgt_cont.93561

fbgt_else.93560:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93561:
fbgt_cont.93555:
	nop
	nop
	nop
	j	fbgt_cont.93553

fbgt_else.93552:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93553:
	flw	%f1, 106(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93564

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93565

fbgt_else.93564:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93565:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93566

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93567

fbgt_else.93566:
fbgt_cont.93567:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93568

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93570

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93569

bnei_else.93570:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93571:
	nop
	nop
	nop
	j	fbgt_cont.93569

fbgt_else.93568:
fbgt_cont.93569:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93572

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93573

fbgt_else.93572:
fbgt_cont.93573:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93574

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93575

fbgt_else.93574:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93575:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93576

	nop
	nop
	nop
	j	bnei_cont.93577

bnei_else.93576:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93577:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93509:
	nop
	nop
	nop
	j	bnei_cont.93505

bnei_else.93506:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 92(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93578

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93579

fbgt_else.93578:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93579:
	flw	%f3, 488(%zero)
	sw	%v1, 109(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 110(%sp)
	nop
	nop
	nop

	fsw	%f0, 111(%sp)
	nop
	nop
	nop

	fsw	%f3, 112(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93580

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93582

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93584

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93586

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93588

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93590

	flw	%f4, 482(%zero)
	sw	%ra, 113(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 114

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93590:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93591:
	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93588:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93589:
	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93586:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93587:
	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93584:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93585:
	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93582:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93583:
	nop
	nop
	nop
	j	fbgt_cont.93581

fbgt_else.93580:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93581:
	flw	%f1, 111(%sp)
	flw	%f2, 112(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93592

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93594

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93596

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93598

	sw	%ra, 113(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 114

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93593

fbgt_else.93598:
	sw	%ra, 113(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 114
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

fbgt_cont.93599:
	nop
	nop
	nop
	j	fbgt_cont.93593

fbgt_else.93596:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93597:
	nop
	nop
	nop
	j	fbgt_cont.93593

fbgt_else.93594:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93600

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93602

	sw	%ra, 113(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 114

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93601

fbgt_else.93602:
	sw	%ra, 113(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 114
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

fbgt_cont.93603:
	nop
	nop
	nop
	j	fbgt_cont.93601

fbgt_else.93600:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93601:
fbgt_cont.93595:
	nop
	nop
	nop
	j	fbgt_cont.93593

fbgt_else.93592:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93593:
	flw	%f1, 110(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93604

	lw	%v0, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93606

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93605

bnei_else.93606:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93607:
	nop
	nop
	nop
	j	fbgt_cont.93605

fbgt_else.93604:
	lw	%v0, 109(%sp)
	nop
	nop
	nop

fbgt_cont.93605:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93608

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93609

fbgt_else.93608:
fbgt_cont.93609:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93610

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93611

fbgt_else.93610:
fbgt_cont.93611:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93612

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93613

fbgt_else.93612:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93613:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93614

	nop
	nop
	nop
	j	bnei_cont.93615

bnei_else.93614:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93615:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93507:
	nop
	nop
	nop
	j	bnei_cont.93505

bnei_else.93504:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93616

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93617

fbgt_else.93616:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93617:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93618

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93619

fbgt_else.93618:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93619:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93620

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93622

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93621

bnei_else.93622:
	flw	%f0, 92(%sp)
	nop
	nop
	nop

bnei_cont.93623:
	nop
	nop
	nop
	j	bnei_cont.93621

bnei_else.93620:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93624

	flw	%f0, 92(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93625

bnei_else.93624:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93625:
bnei_cont.93621:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93505:
	lw	%v0, 0(%sp)
	lw	%v1, 103(%sp)
	nop
	nop

	sw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 114
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93626

	nop
	nop
	nop
	j	bnei_cont.93483

bnei_else.93626:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 92(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93628

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93629

fbgt_else.93628:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93629:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93630

	nop
	nop
	nop
	j	bnei_cont.93631

bnei_else.93630:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93631:
	flw	%f1, 102(%sp)
	lw	%v0, 105(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93627:
	nop
	nop
	nop
	j	bnei_cont.93483

bnei_else.93482:
bnei_cont.93483:
bnei_cont.93319:
	lw	%v0, 89(%sp)
	lw	%v1, 14(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 15(%sp)
	sw	%ra, 113(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 114
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -114
	nop

	lw	%ra, 113(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93315

bnei_else.93314:
bnei_cont.93315:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.93632

	lw	%v0, 183(%zero)
	lw	%v1, 15(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	sw	%v0, 113(%sp)
	addi	%v0, %v1, 0
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
	sw	%ra, 114(%sp)
	nop
	nop

	lw	%a0, 0(%zero)
	nop
	addi	%sp, %sp, 115
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
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -115
	nop

	lw	%ra, 114(%sp)
	lw	%v0, 113(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 14(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93634

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93635

fbgt_else.93634:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93635:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93636

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 0(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 114(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 115(%sp)
	nop
	nop
	nop

	fsw	%f1, 116(%sp)
	nop
	nop
	nop

	sw	%a0, 117(%sp)
	nop
	nop
	nop

	sw	%ra, 118(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 119
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -119
	nop

	lw	%ra, 118(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93638

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93639

fbgt_else.93638:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93639:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93640

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93642

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93641

fbgt_else.93642:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93643:
	nop
	nop
	nop
	j	bnei_cont.93641

bnei_else.93640:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93641:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93644

	lw	%v0, 141(%zero)
	lw	%v1, 117(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93646

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93648

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93650

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93651

bnei_else.93650:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93651:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 116(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93652

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93653

fbeq_else.93652:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93653:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93654

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93655

bnei_else.93654:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93656

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93657

bnei_else.93656:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93657:
bnei_cont.93655:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93647

bnei_else.93648:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93649:
	nop
	nop
	nop
	j	bnei_cont.93647

bnei_else.93646:
	lw	%a0, 136(%zero)
	flw	%f0, 116(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93658

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93659

fbeq_else.93658:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93659:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93660

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93661

bnei_else.93660:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93662

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93663

fbgt_else.93662:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93663:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93664

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93665

bnei_else.93664:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93665:
bnei_cont.93661:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93647:
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
	sw	%v0, 118(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93666

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93668

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93670

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93672

	nop
	nop
	nop
	j	bnei_cont.93667

bnei_else.93672:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93674

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93675

fbgt_else.93674:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93675:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93676

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93677

bnei_else.93676:
	flw	%f1, 116(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93678

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93679

fbgt_else.93678:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93679:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93680

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93682

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93683

fbgt_else.93682:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93683:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93684

	nop
	nop
	nop
	j	fbgt_cont.93681

bnei_else.93684:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93685:
	nop
	nop
	nop
	j	fbgt_cont.93681

fbgt_else.93680:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93681:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93677:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93686

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93687

fbgt_else.93686:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93687:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93688

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93689

bnei_else.93688:
	flw	%f2, 116(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93690

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93691

fbgt_else.93690:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93691:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93692

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93694

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93695

fbgt_else.93694:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93695:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93696

	nop
	nop
	nop
	j	fbgt_cont.93693

bnei_else.93696:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93697:
	nop
	nop
	nop
	j	fbgt_cont.93693

fbgt_else.93692:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93693:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93689:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 116(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93698

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93699

fbgt_else.93698:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93699:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93700

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93701

bnei_else.93700:
bnei_cont.93701:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93673:
	nop
	nop
	nop
	j	bnei_cont.93667

bnei_else.93670:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 119(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 120(%sp)
	nop
	nop
	nop

	fsw	%f2, 121(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93702

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93704

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93706

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93708

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93710

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93712

	flw	%f3, 482(%zero)
	sw	%ra, 122(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 123

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -123
	nop

	lw	%ra, 122(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93712:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93713:
	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93710:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93711:
	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93708:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93709:
	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93706:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93707:
	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93704:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93705:
	nop
	nop
	nop
	j	fbgt_cont.93703

fbgt_else.93702:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93703:
	flw	%f1, 120(%sp)
	flw	%f2, 121(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93714

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93716

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93718

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93720

	sw	%ra, 122(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 123

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -123
	nop

	lw	%ra, 122(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93715

fbgt_else.93720:
	sw	%ra, 122(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 123
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -123
	nop

	lw	%ra, 122(%sp)
	nop
	nop
	nop

fbgt_cont.93721:
	nop
	nop
	nop
	j	fbgt_cont.93715

fbgt_else.93718:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93719:
	nop
	nop
	nop
	j	fbgt_cont.93715

fbgt_else.93716:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93722

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93724

	sw	%ra, 122(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 123

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -123
	nop

	lw	%ra, 122(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93723

fbgt_else.93724:
	sw	%ra, 122(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 123
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -123
	nop

	lw	%ra, 122(%sp)
	nop
	nop
	nop

fbgt_cont.93725:
	nop
	nop
	nop
	j	fbgt_cont.93723

fbgt_else.93722:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93723:
fbgt_cont.93717:
	nop
	nop
	nop
	j	fbgt_cont.93715

fbgt_else.93714:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93715:
	flw	%f1, 119(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93726

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93727

fbgt_else.93726:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93727:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93728

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93729

fbgt_else.93728:
fbgt_cont.93729:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93730

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93732

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93731

bnei_else.93732:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93733:
	nop
	nop
	nop
	j	fbgt_cont.93731

fbgt_else.93730:
fbgt_cont.93731:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93734

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93735

fbgt_else.93734:
fbgt_cont.93735:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93736

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93737

fbgt_else.93736:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93737:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93738

	nop
	nop
	nop
	j	bnei_cont.93739

bnei_else.93738:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93739:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93671:
	nop
	nop
	nop
	j	bnei_cont.93667

bnei_else.93668:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 116(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93740

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93741

fbgt_else.93740:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93741:
	flw	%f3, 488(%zero)
	sw	%v1, 122(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 123(%sp)
	nop
	nop
	nop

	fsw	%f0, 124(%sp)
	nop
	nop
	nop

	fsw	%f3, 125(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93742

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93744

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93746

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93748

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93750

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93752

	flw	%f4, 482(%zero)
	sw	%ra, 126(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 127

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93752:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93753:
	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93750:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93751:
	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93748:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93749:
	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93746:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93747:
	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93744:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93745:
	nop
	nop
	nop
	j	fbgt_cont.93743

fbgt_else.93742:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93743:
	flw	%f1, 124(%sp)
	flw	%f2, 125(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93754

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93756

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93758

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93760

	sw	%ra, 126(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 127

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93755

fbgt_else.93760:
	sw	%ra, 126(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 127
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

fbgt_cont.93761:
	nop
	nop
	nop
	j	fbgt_cont.93755

fbgt_else.93758:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93759:
	nop
	nop
	nop
	j	fbgt_cont.93755

fbgt_else.93756:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93762

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93764

	sw	%ra, 126(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 127

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93763

fbgt_else.93764:
	sw	%ra, 126(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 127
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

fbgt_cont.93765:
	nop
	nop
	nop
	j	fbgt_cont.93763

fbgt_else.93762:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93763:
fbgt_cont.93757:
	nop
	nop
	nop
	j	fbgt_cont.93755

fbgt_else.93754:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93755:
	flw	%f1, 123(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93766

	lw	%v0, 122(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93768

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93767

bnei_else.93768:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93769:
	nop
	nop
	nop
	j	fbgt_cont.93767

fbgt_else.93766:
	lw	%v0, 122(%sp)
	nop
	nop
	nop

fbgt_cont.93767:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93770

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93771

fbgt_else.93770:
fbgt_cont.93771:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93772

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93773

fbgt_else.93772:
fbgt_cont.93773:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93774

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93775

fbgt_else.93774:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93775:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93776

	nop
	nop
	nop
	j	bnei_cont.93777

bnei_else.93776:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93777:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93669:
	nop
	nop
	nop
	j	bnei_cont.93667

bnei_else.93666:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93778

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93779

fbgt_else.93778:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93779:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93780

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93781

fbgt_else.93780:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93781:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93782

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93784

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93783

bnei_else.93784:
	flw	%f0, 116(%sp)
	nop
	nop
	nop

bnei_cont.93785:
	nop
	nop
	nop
	j	bnei_cont.93783

bnei_else.93782:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93786

	flw	%f0, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93787

bnei_else.93786:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93787:
bnei_cont.93783:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93667:
	lw	%v0, 0(%sp)
	lw	%v1, 115(%sp)
	nop
	nop

	sw	%ra, 126(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 127
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -127
	nop

	lw	%ra, 126(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93788

	nop
	nop
	nop
	j	bnei_cont.93637

bnei_else.93788:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 116(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93790

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93791

fbgt_else.93790:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93791:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93792

	nop
	nop
	nop
	j	bnei_cont.93793

bnei_else.93792:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93793:
	flw	%f1, 114(%sp)
	lw	%v0, 118(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93789:
	nop
	nop
	nop
	j	bnei_cont.93637

bnei_else.93644:
bnei_cont.93645:
	nop
	nop
	nop
	j	bnei_cont.93637

bnei_else.93636:
	flw	%f2, 439(%zero)
	lw	%a2, 0(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 126(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 127(%sp)
	nop
	nop
	nop

	fsw	%f1, 116(%sp)
	nop
	nop
	nop

	sw	%a0, 128(%sp)
	nop
	nop
	nop

	sw	%ra, 129(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 130
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -130
	nop

	lw	%ra, 129(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93794

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93795

fbgt_else.93794:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93795:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93796

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93798

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93797

fbgt_else.93798:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93799:
	nop
	nop
	nop
	j	bnei_cont.93797

bnei_else.93796:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93797:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93800

	lw	%v0, 141(%zero)
	lw	%v1, 128(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.93802

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.93804

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93806

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93807

bnei_else.93806:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.93807:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 116(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.93808

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93809

fbeq_else.93808:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.93809:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93810

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93811

bnei_else.93810:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93812

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93813

bnei_else.93812:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.93813:
bnei_cont.93811:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93803

bnei_else.93804:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.93805:
	nop
	nop
	nop
	j	bnei_cont.93803

bnei_else.93802:
	lw	%a0, 136(%zero)
	flw	%f0, 116(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.93814

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.93815

fbeq_else.93814:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.93815:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93816

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.93817

bnei_else.93816:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93818

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93819

fbgt_else.93818:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93819:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93820

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93821

bnei_else.93820:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.93821:
bnei_cont.93817:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.93803:
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
	sw	%v0, 129(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.93822

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.93824

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.93826

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.93828

	nop
	nop
	nop
	j	bnei_cont.93823

bnei_else.93828:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93830

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93831

fbgt_else.93830:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93831:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93832

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93833

bnei_else.93832:
	flw	%f1, 116(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93834

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93835

fbgt_else.93834:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93835:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.93836

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.93838

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.93839

fbgt_else.93838:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.93839:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93840

	nop
	nop
	nop
	j	fbgt_cont.93837

bnei_else.93840:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93841:
	nop
	nop
	nop
	j	fbgt_cont.93837

fbgt_else.93836:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.93837:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.93833:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93842

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93843

fbgt_else.93842:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93843:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93844

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93845

bnei_else.93844:
	flw	%f2, 116(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93846

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93847

fbgt_else.93846:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93847:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.93848

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.93850

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.93851

fbgt_else.93850:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.93851:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93852

	nop
	nop
	nop
	j	fbgt_cont.93849

bnei_else.93852:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.93853:
	nop
	nop
	nop
	j	fbgt_cont.93849

fbgt_else.93848:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.93849:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.93845:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 116(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93854

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93855

fbgt_else.93854:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93855:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93856

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.93857

bnei_else.93856:
bnei_cont.93857:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93829:
	nop
	nop
	nop
	j	bnei_cont.93823

bnei_else.93826:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 130(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 131(%sp)
	nop
	nop
	nop

	fsw	%f2, 132(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93858

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93860

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93862

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93864

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93866

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93868

	flw	%f3, 482(%zero)
	sw	%ra, 133(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 134

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -134
	nop

	lw	%ra, 133(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93868:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93869:
	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93866:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93867:
	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93864:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93865:
	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93862:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93863:
	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93860:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93861:
	nop
	nop
	nop
	j	fbgt_cont.93859

fbgt_else.93858:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.93859:
	flw	%f1, 131(%sp)
	flw	%f2, 132(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93870

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93872

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93874

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93876

	sw	%ra, 133(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 134

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -134
	nop

	lw	%ra, 133(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93871

fbgt_else.93876:
	sw	%ra, 133(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 134
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -134
	nop

	lw	%ra, 133(%sp)
	nop
	nop
	nop

fbgt_cont.93877:
	nop
	nop
	nop
	j	fbgt_cont.93871

fbgt_else.93874:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93875:
	nop
	nop
	nop
	j	fbgt_cont.93871

fbgt_else.93872:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93878

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93880

	sw	%ra, 133(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 134

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -134
	nop

	lw	%ra, 133(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93879

fbgt_else.93880:
	sw	%ra, 133(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 134
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -134
	nop

	lw	%ra, 133(%sp)
	nop
	nop
	nop

fbgt_cont.93881:
	nop
	nop
	nop
	j	fbgt_cont.93879

fbgt_else.93878:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93879:
fbgt_cont.93873:
	nop
	nop
	nop
	j	fbgt_cont.93871

fbgt_else.93870:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93871:
	flw	%f1, 130(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93882

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93883

fbgt_else.93882:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93883:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93884

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93885

fbgt_else.93884:
fbgt_cont.93885:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93886

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93888

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93887

bnei_else.93888:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93889:
	nop
	nop
	nop
	j	fbgt_cont.93887

fbgt_else.93886:
fbgt_cont.93887:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93890

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93891

fbgt_else.93890:
fbgt_cont.93891:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93892

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.93893

fbgt_else.93892:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.93893:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93894

	nop
	nop
	nop
	j	bnei_cont.93895

bnei_else.93894:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93895:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.93827:
	nop
	nop
	nop
	j	bnei_cont.93823

bnei_else.93824:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 116(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93896

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93897

fbgt_else.93896:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.93897:
	flw	%f3, 488(%zero)
	sw	%v1, 133(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 134(%sp)
	nop
	nop
	nop

	fsw	%f0, 135(%sp)
	nop
	nop
	nop

	fsw	%f3, 136(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.93898

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93900

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93902

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93904

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93906

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.93908

	flw	%f4, 482(%zero)
	sw	%ra, 137(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 138

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93908:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93909:
	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93906:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93907:
	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93904:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93905:
	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93902:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93903:
	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93900:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.93901:
	nop
	nop
	nop
	j	fbgt_cont.93899

fbgt_else.93898:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.93899:
	flw	%f1, 135(%sp)
	flw	%f2, 136(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93910

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93912

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.93914

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93916

	sw	%ra, 137(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 138

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93911

fbgt_else.93916:
	sw	%ra, 137(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 138
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

fbgt_cont.93917:
	nop
	nop
	nop
	j	fbgt_cont.93911

fbgt_else.93914:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93915:
	nop
	nop
	nop
	j	fbgt_cont.93911

fbgt_else.93912:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.93918

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93920

	sw	%ra, 137(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	fmov	%f29, %f1
	fmov	%f1, %f0

	nop
	nop
	fmov	%f0, %f29
	addi	%sp, %sp, 138

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.93919

fbgt_else.93920:
	sw	%ra, 137(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 138
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

fbgt_cont.93921:
	nop
	nop
	nop
	j	fbgt_cont.93919

fbgt_else.93918:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93919:
fbgt_cont.93913:
	nop
	nop
	nop
	j	fbgt_cont.93911

fbgt_else.93910:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.93911:
	flw	%f1, 134(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93922

	lw	%v0, 133(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93924

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93923

bnei_else.93924:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.93925:
	nop
	nop
	nop
	j	fbgt_cont.93923

fbgt_else.93922:
	lw	%v0, 133(%sp)
	nop
	nop
	nop

fbgt_cont.93923:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93926

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.93927

fbgt_else.93926:
fbgt_cont.93927:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93928

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93929

fbgt_else.93928:
fbgt_cont.93929:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93930

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.93931

fbgt_else.93930:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.93931:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93932

	nop
	nop
	nop
	j	bnei_cont.93933

bnei_else.93932:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.93933:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93825:
	nop
	nop
	nop
	j	bnei_cont.93823

bnei_else.93822:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.93934

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93935

fbgt_else.93934:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93935:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.93936

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93937

fbgt_else.93936:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.93937:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93938

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93940

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93939

bnei_else.93940:
	flw	%f0, 116(%sp)
	nop
	nop
	nop

bnei_cont.93941:
	nop
	nop
	nop
	j	bnei_cont.93939

bnei_else.93938:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.93942

	flw	%f0, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93943

bnei_else.93942:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.93943:
bnei_cont.93939:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.93823:
	lw	%v0, 0(%sp)
	lw	%v1, 127(%sp)
	nop
	nop

	sw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 138
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93944

	nop
	nop
	nop
	j	bnei_cont.93801

bnei_else.93944:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 116(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93946

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93947

fbgt_else.93946:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93947:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93948

	nop
	nop
	nop
	j	bnei_cont.93949

bnei_else.93948:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.93949:
	flw	%f1, 126(%sp)
	lw	%v0, 129(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.93945:
	nop
	nop
	nop
	j	bnei_cont.93801

bnei_else.93800:
bnei_cont.93801:
bnei_cont.93637:
	lw	%v0, 113(%sp)
	lw	%v1, 14(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 15(%sp)
	sw	%ra, 137(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 138
	nop

	nop
	nop
	nop
	jal	iter_trace_diffuse_rays.2980

	nop
	nop
	addi	%sp, %sp, -138
	nop

	lw	%ra, 137(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93633

bnei_else.93632:
bnei_cont.93633:
	lw	%v0, 12(%sp)
	lw	%v1, 13(%sp)
	nop
	nop

	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)
	add	%at, %v1, %v0
	nop

	lw	%v1, 0(%at)
	nop
	nop
	nop

	flw	%f1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 1(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)
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

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.92359

bnei_else.92358:
bnei_cont.92359:
	lw	%v0, 1(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.92357:
	nop
	nop
	nop
	jr	%ra

bgt_else.92356:
	nop
	nop
	nop
	jr	%ra

bgti_else.92343:
	nop
	nop
	nop
	jr	%ra

bgt_else.92342:
	nop
	nop
	nop
	jr	%ra

try_exploit_neighbors.3018:
	nop
	nop
	add	%at, %a1, %v0
	nop

	lw	%t0, 0(%at)
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.93954

	lw	%t2, 2(%t0)
	nop
	addi	%t1, %zero, 0
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
	blti	%t2, 0, bgti_else.93955

	lw	%t2, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t2, %a3
	nop

	lw	%t2, 0(%at)
	nop
	add	%at, %a0, %v0
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t4, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t4, %a3
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t4, %t2, beq_else.93956

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	lw	%t4, 2(%t4)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t4, %a3
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t4, %t2, beq_else.93958

	nop
	nop
	addi	%t4, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t4
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	lw	%t4, 2(%t4)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t4, %a3
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t4, %t2, beq_else.93960

	nop
	nop
	addi	%t4, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t4
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	lw	%t4, 2(%t4)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t4, %a3
	nop

	lw	%t4, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t4, %t2, beq_else.93962

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.93957

beq_else.93962:
	nop
	nop
	addi	%t2, %zero, 0
	nop

beq_cont.93963:
	nop
	nop
	nop
	j	beq_cont.93957

beq_else.93960:
	nop
	nop
	addi	%t2, %zero, 0
	nop

beq_cont.93961:
	nop
	nop
	nop
	j	beq_cont.93957

beq_else.93958:
	nop
	nop
	addi	%t2, %zero, 0
	nop

beq_cont.93959:
	nop
	nop
	nop
	j	beq_cont.93957

beq_else.93956:
	nop
	nop
	addi	%t2, %zero, 0
	nop

beq_cont.93957:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.93964

	lw	%t1, 3(%t0)
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
	beqi	%t1, 0, bnei_else.93965

	lw	%t1, 5(%t3)
	lw	%t4, 5(%t0)
	addi	%t2, %v0, -1
	addi	%t5, %v0, 1

	nop
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
	add	%at, %a1, %t5
	nop

	lw	%t2, 5(%t2)
	lw	%t5, 0(%at)
	add	%at, %a2, %v0
	nop

	lw	%t5, 5(%t5)
	lw	%t6, 0(%at)
	add	%at, %t1, %a3
	nop

	lw	%t6, 5(%t6)
	lw	%t1, 0(%at)
	add	%at, %t2, %a3
	nop

	flw	%f0, 0(%t1)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	add	%at, %t4, %a3
	nop

	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	add	%at, %t5, %a3

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	add	%at, %t6, %a3

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 4(%t0)
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 149(%zero)
	nop
	add	%at, %t1, %a3
	nop

	flw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)
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

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93966

bnei_else.93965:
bnei_cont.93966:
	nop
	nop
	addi	%a3, %a3, 1
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.93967

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
	blti	%t1, 0, bgti_else.93968

	lw	%t1, 2(%t0)
	lw	%t2, 2(%t3)
	nop
	nop

	nop
	nop
	add	%at, %t1, %a3
	nop

	lw	%t1, 0(%at)
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
	bne	%t2, %t1, beq_else.93969

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
	bne	%t2, %t1, beq_else.93971

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
	bne	%t2, %t1, beq_else.93973

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
	bne	%t2, %t1, beq_else.93975

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.93970

beq_else.93975:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.93976:
	nop
	nop
	nop
	j	beq_cont.93970

beq_else.93973:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.93974:
	nop
	nop
	nop
	j	beq_cont.93970

beq_else.93971:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.93972:
	nop
	nop
	nop
	j	beq_cont.93970

beq_else.93969:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.93970:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.93977

	lw	%t1, 3(%t0)
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
	beqi	%t1, 0, bnei_else.93978

	lw	%t1, 5(%t3)
	lw	%t3, 5(%t0)
	addi	%t2, %v0, -1
	addi	%t4, %v0, 1

	lw	%t0, 4(%t0)
	nop
	add	%at, %a1, %t2
	nop

	lw	%t2, 0(%at)
	nop
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

	flw	%f0, 0(%t1)
	nop
	nop
	nop

	fsw	%f0, 148(%zero)
	flw	%f0, 1(%t1)
	nop
	nop

	fsw	%f0, 149(%zero)
	flw	%f0, 2(%t1)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%t1, 0(%at)
	add	%at, %t3, %a3
	nop

	flw	%f0, 148(%zero)
	flw	%f1, 0(%t1)
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	add	%at, %t4, %a3

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	add	%at, %t5, %a3

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	lw	%t1, 0(%at)
	fadd	%f0, %f0, %f1
	add	%at, %t0, %a3

	fsw	%f0, 149(%zero)
	lw	%t0, 0(%at)
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 1(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 148(%zero)
	nop
	nop
	nop

	flw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 2(%t1)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 149(%zero)
	nop
	nop
	nop

	flw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f1, 0(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

	flw	%f0, 151(%zero)
	flw	%f2, 148(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 1(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 151(%zero)
	nop
	nop
	nop

	flw	%f0, 152(%zero)
	flw	%f2, 149(%zero)
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%t0)
	nop
	fadd	%f0, %f0, %f1
	nop

	fsw	%f0, 152(%zero)
	nop
	nop
	nop

	flw	%f0, 153(%zero)
	flw	%f2, 150(%zero)
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

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.93979

bnei_else.93978:
bnei_cont.93979:
	nop
	nop
	addi	%a3, %a3, 1
	nop

	nop
	nop
	nop
	j	try_exploit_neighbors.3018

bnei_else.93977:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.93968:
	nop
	nop
	nop
	jr	%ra

bgt_else.93967:
	nop
	nop
	nop
	jr	%ra

bnei_else.93964:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.93982

	lw	%v0, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	add	%at, %v0, %a3
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.93983

	lw	%v0, 3(%t0)
	sw	%t0, 0(%sp)
	nop
	nop

	sw	%a3, 1(%sp)
	nop
	add	%at, %v0, %a3
	nop

	lw	%v0, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93984

	lw	%v0, 5(%t0)
	lw	%v1, 7(%t0)
	nop
	nop

	lw	%a0, 1(%t0)
	lw	%a1, 4(%t0)
	add	%at, %v0, %a3
	nop

	lw	%v0, 0(%at)
	sw	%a1, 2(%sp)
	add	%at, %v1, %a3
	nop

	flw	%f0, 0(%v0)
	lw	%v1, 0(%at)
	add	%at, %a0, %a3
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

	sw	%t1, 3(%sp)
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

	sw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93986

	lw	%a2, 179(%zero)
	flw	%f0, 0(%a0)
	addi	%v0, %a0, 0
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
	sw	%a2, 7(%sp)
	nop
	nop

	lw	%t2, 0(%zero)
	sw	%ra, 8(%sp)
	nop
	nop

	nop
	nop
	addi	%t2, %t2, -1
	addi	%sp, %sp, 9

	nop
	nop
	addi	%v1, %t2, 0
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	lw	%a0, 118(%v0)
	lw	%a1, 4(%sp)
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

	flw	%f1, 1(%v1)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%v1)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 493(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93988

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93989

fbgt_else.93988:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.93989:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.93990

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 465(%zero)
	lw	%a2, 3(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 8(%sp)
	addi	%v0, %a2, 0
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 9(%sp)
	nop
	nop
	nop

	fsw	%f1, 10(%sp)
	nop
	nop
	nop

	sw	%a0, 11(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.93992

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.93993

fbgt_else.93992:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93993:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93994

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.93996

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.93995

fbgt_else.93996:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.93997:
	nop
	nop
	nop
	j	bnei_cont.93995

bnei_else.93994:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.93995:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.93998

	lw	%v0, 141(%zero)
	lw	%v1, 11(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.94000

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.94002

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94004

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94005

bnei_else.94004:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.94005:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 10(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.94006

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.94007

fbeq_else.94006:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.94007:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.94008

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94009

bnei_else.94008:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94010

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.94011

bnei_else.94010:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.94011:
bnei_cont.94009:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94001

bnei_else.94002:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.94003:
	nop
	nop
	nop
	j	bnei_cont.94001

bnei_else.94000:
	lw	%a0, 136(%zero)
	flw	%f0, 10(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.94012

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.94013

fbeq_else.94012:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.94013:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94014

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.94015

bnei_else.94014:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94016

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94017

fbgt_else.94016:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94017:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94018

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94019

bnei_else.94018:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.94019:
bnei_cont.94015:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.94001:
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
	sw	%v0, 12(%sp)
	nop
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 1, bnei_else.94020

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.94022

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.94024

	nop
	nop
	nop
	beqi	%v1, 4, bnei_else.94026

	nop
	nop
	nop
	j	bnei_cont.94021

bnei_else.94026:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 140(%zero)
	flw	%f4, 463(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%v1)
	nop
	fsub	%f1, %f1, %f2
	nop

	nop
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	fmul	%f2, %f0, %f0

	nop
	nop
	fmul	%f3, %f1, %f1
	nop

	nop
	nop
	fadd	%f2, %f2, %f3
	fabs	%f3, %f0

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.94028

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94029

fbgt_else.94028:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94029:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94030

	flw	%f0, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94031

bnei_else.94030:
	flw	%f1, 10(%sp)
	nop
	fdiv	%f0, %f1, %f0
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94032

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.94033

fbgt_else.94032:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.94033:
	flw	%f5, 461(%zero)
	nop
	fabs	%f3, %f0
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.94034

	flw	%f0, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.94036

	flw	%f0, 476(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop
	j	fbgt_cont.94037

fbgt_else.94036:
	flw	%f0, 475(%zero)
	flw	%f5, 491(%zero)
	nop
	nop

	flw	%f8, 460(%zero)
	flw	%f9, 459(%zero)
	fsub	%f6, %f3, %f5
	fadd	%f3, %f3, %f5

	nop
	nop
	fdiv	%f3, %f6, %f3
	nop

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
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f6
	nop

	flw	%f9, 458(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f9, 457(%zero)
	nop
	fsub	%f8, %f8, %f9
	nop

	nop
	nop
	fmul	%f9, %f9, %f3
	nop

	nop
	nop
	fmul	%f9, %f9, %f7
	nop

	flw	%f9, 456(%zero)
	nop
	fadd	%f8, %f8, %f9
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

	flw	%f8, 455(%zero)
	nop
	fsub	%f5, %f8, %f5
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
	nop

fbgt_cont.94037:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94038

	nop
	nop
	nop
	j	fbgt_cont.94035

bnei_else.94038:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.94039:
	nop
	nop
	nop
	j	fbgt_cont.94035

fbgt_else.94034:
	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fmul	%f3, %f0, %f0
	nop

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
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f0
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f3, %f7, %f3
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
	nop

fbgt_cont.94035:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

bnei_cont.94031:
	lw	%v1, 5(%v0)
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 139(%zero)
	flw	%f3, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	lw	%v1, 4(%v0)
	nop
	fsub	%f1, %f1, %f3
	nop

	flw	%f3, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	fsqrt	%f3, %f3
	nop

	nop
	nop
	fmul	%f1, %f1, %f3
	fabs	%f3, %f2

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.94040

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94041

fbgt_else.94040:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94041:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94042

	flw	%f1, 462(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94043

bnei_else.94042:
	flw	%f2, 10(%sp)
	nop
	fdiv	%f1, %f1, %f2
	nop

	nop
	nop
	fabs	%f1, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.94044

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.94045

fbgt_else.94044:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.94045:
	flw	%f4, 461(%zero)
	nop
	fabs	%f3, %f1
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.94046

	flw	%f1, 454(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.94048

	flw	%f1, 476(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fdiv	%f3, %f4, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop
	j	fbgt_cont.94049

fbgt_else.94048:
	flw	%f1, 475(%zero)
	flw	%f4, 491(%zero)
	nop
	nop

	flw	%f7, 460(%zero)
	flw	%f8, 459(%zero)
	fsub	%f5, %f3, %f4
	fadd	%f3, %f3, %f4

	nop
	nop
	fdiv	%f3, %f5, %f3
	nop

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
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f5
	nop

	flw	%f8, 458(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f8, 457(%zero)
	nop
	fsub	%f7, %f7, %f8
	nop

	nop
	nop
	fmul	%f8, %f8, %f3
	nop

	nop
	nop
	fmul	%f8, %f8, %f6
	nop

	flw	%f8, 456(%zero)
	nop
	fadd	%f7, %f7, %f8
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

	flw	%f7, 455(%zero)
	nop
	fsub	%f4, %f7, %f4
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
	nop

fbgt_cont.94049:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94050

	nop
	nop
	nop
	j	fbgt_cont.94047

bnei_else.94050:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.94051:
	nop
	nop
	nop
	j	fbgt_cont.94047

fbgt_else.94046:
	flw	%f6, 460(%zero)
	flw	%f7, 459(%zero)
	fmul	%f3, %f1, %f1
	nop

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
	fmul	%f7, %f7, %f4
	nop

	flw	%f7, 458(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f7, 457(%zero)
	nop
	fsub	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f7, %f7, %f1
	nop

	nop
	nop
	fmul	%f7, %f7, %f5
	nop

	flw	%f7, 456(%zero)
	nop
	fadd	%f6, %f6, %f7
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

	flw	%f6, 455(%zero)
	nop
	fsub	%f3, %f6, %f3
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
	nop

fbgt_cont.94047:
	flw	%f3, 453(%zero)
	nop
	nop
	nop

	flw	%f3, 452(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

bnei_cont.94043:
	flw	%f3, 471(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 451(%zero)
	nop
	fsub	%f1, %f1, %f2
	fsub	%f0, %f3, %f0

	nop
	nop
	fmul	%f0, %f0, %f0
	fsub	%f1, %f3, %f1

	nop
	nop
	fsub	%f0, %f2, %f0
	fmul	%f1, %f1, %f1

	flw	%f1, 10(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94052

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94053

fbgt_else.94052:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94053:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94054

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.94055

bnei_else.94054:
bnei_cont.94055:
	flw	%f2, 450(%zero)
	nop
	nop
	nop

	flw	%f2, 449(%zero)
	nop
	fmul	%f0, %f2, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.94027:
	nop
	nop
	nop
	j	bnei_cont.94021

bnei_else.94024:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 140(%zero)
	flw	%f2, 2(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 488(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 448(%zero)
	nop
	fadd	%f0, %f0, %f1
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

	flw	%f1, 452(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 489(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 13(%sp)
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 14(%sp)
	nop
	nop
	nop

	fsw	%f2, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94056

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94058

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94060

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94062

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94064

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94066

	flw	%f3, 482(%zero)
	sw	%ra, 16(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 17

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94066:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94067:
	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94064:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94065:
	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94062:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94063:
	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94060:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94061:
	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94058:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94059:
	nop
	nop
	nop
	j	fbgt_cont.94057

fbgt_else.94056:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.94057:
	flw	%f1, 14(%sp)
	flw	%f2, 15(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.94068

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94070

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.94072

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94074

	sw	%ra, 16(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94069

fbgt_else.94074:
	sw	%ra, 16(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

fbgt_cont.94075:
	nop
	nop
	nop
	j	fbgt_cont.94069

fbgt_else.94072:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94073:
	nop
	nop
	nop
	j	fbgt_cont.94069

fbgt_else.94070:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.94076

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94078

	sw	%ra, 16(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94077

fbgt_else.94078:
	sw	%ra, 16(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

fbgt_cont.94079:
	nop
	nop
	nop
	j	fbgt_cont.94077

fbgt_else.94076:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94077:
fbgt_cont.94071:
	nop
	nop
	nop
	j	fbgt_cont.94069

fbgt_else.94068:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94069:
	flw	%f1, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94080

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94081

fbgt_else.94080:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.94081:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94082

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.94083

fbgt_else.94082:
fbgt_cont.94083:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94084

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94086

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94085

bnei_else.94086:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.94087:
	nop
	nop
	nop
	j	fbgt_cont.94085

fbgt_else.94084:
fbgt_cont.94085:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94088

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94089

fbgt_else.94088:
fbgt_cont.94089:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94090

	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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
	j	fbgt_cont.94091

fbgt_else.94090:
	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
	fsub	%f0, %f2, %f0
	nop

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
	fmul	%f4, %f4, %f2
	nop

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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

fbgt_cont.94091:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94092

	nop
	nop
	nop
	j	bnei_cont.94093

bnei_else.94092:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.94093:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f0, %f1
	nop

	fsw	%f2, 146(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 147(%zero)
	nop
	nop
	nop

bnei_cont.94025:
	nop
	nop
	nop
	j	bnei_cont.94021

bnei_else.94022:
	flw	%f0, 139(%zero)
	flw	%f1, 446(%zero)
	nop
	nop

	flw	%f1, 489(%zero)
	flw	%f2, 10(%sp)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94094

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.94095

fbgt_else.94094:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.94095:
	flw	%f3, 488(%zero)
	sw	%v1, 16(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 17(%sp)
	nop
	nop
	nop

	fsw	%f0, 18(%sp)
	nop
	nop
	nop

	fsw	%f3, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.94096

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.94098

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.94100

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.94102

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.94104

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f4, fbgt_else.94106

	flw	%f4, 482(%zero)
	sw	%ra, 20(%sp)
	nop
	nop

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94106:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.94107:
	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94104:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.94105:
	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94102:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.94103:
	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94100:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.94101:
	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94098:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.94099:
	nop
	nop
	nop
	j	fbgt_cont.94097

fbgt_else.94096:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.94097:
	flw	%f1, 18(%sp)
	flw	%f2, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.94108

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94110

	flw	%f3, 494(%zero)
	nop
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.94112

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94114

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94109

fbgt_else.94114:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.94115:
	nop
	nop
	nop
	j	fbgt_cont.94109

fbgt_else.94112:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94113:
	nop
	nop
	nop
	j	fbgt_cont.94109

fbgt_else.94110:
	flw	%f3, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.94116

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94118

	sw	%ra, 20(%sp)
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.94117

fbgt_else.94118:
	sw	%ra, 20(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

fbgt_cont.94119:
	nop
	nop
	nop
	j	fbgt_cont.94117

fbgt_else.94116:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94117:
fbgt_cont.94111:
	nop
	nop
	nop
	j	fbgt_cont.94109

fbgt_else.94108:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.94109:
	flw	%f1, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94120

	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94122

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94121

bnei_else.94122:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.94123:
	nop
	nop
	nop
	j	fbgt_cont.94121

fbgt_else.94120:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

fbgt_cont.94121:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94124

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.94125

fbgt_else.94124:
fbgt_cont.94125:
	flw	%f2, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94126

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94127

fbgt_else.94126:
fbgt_cont.94127:
	flw	%f1, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94128

	flw	%f3, 474(%zero)
	flw	%f4, 473(%zero)
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

	flw	%f4, 472(%zero)
	nop
	fadd	%f3, %f3, %f4
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
	j	fbgt_cont.94129

fbgt_else.94128:
	flw	%f2, 491(%zero)
	flw	%f3, 471(%zero)
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 470(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 469(%zero)
	nop
	fadd	%f2, %f2, %f3
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

fbgt_cont.94129:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94130

	nop
	nop
	nop
	j	bnei_cont.94131

bnei_else.94130:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.94131:
	flw	%f1, 450(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f2, %f1, %f0
	nop

	fsw	%f2, 145(%zero)
	nop
	nop
	nop

	flw	%f2, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f2, %f0
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	nop

	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.94023:
	nop
	nop
	nop
	j	bnei_cont.94021

bnei_else.94020:
	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	flw	%f3, 444(%zero)
	nop
	nop

	flw	%f1, 445(%zero)
	nop
	fsub	%f0, %f0, %f1
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

	flw	%f2, 448(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.94132

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94133

fbgt_else.94132:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94133:
	flw	%f0, 140(%zero)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%a0)
	nop
	nop
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
	nop
	fblt	%f0, %f2, fbgt_else.94134

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94135

fbgt_else.94134:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.94135:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94136

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.94138

	flw	%f0, 450(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94137

bnei_else.94138:
	flw	%f0, 10(%sp)
	nop
	nop
	nop

bnei_cont.94139:
	nop
	nop
	nop
	j	bnei_cont.94137

bnei_else.94136:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.94140

	flw	%f0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94141

bnei_else.94140:
	flw	%f0, 450(%zero)
	nop
	nop
	nop

bnei_cont.94141:
bnei_cont.94137:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

bnei_cont.94021:
	lw	%v0, 3(%sp)
	lw	%v1, 9(%sp)
	nop
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
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94142

	nop
	nop
	nop
	j	bnei_cont.93991

bnei_else.94142:
	flw	%f0, 142(%zero)
	flw	%f1, 78(%zero)
	nop
	nop

	flw	%f1, 143(%zero)
	flw	%f2, 79(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 80(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 144(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 10(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94144

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94145

fbgt_else.94144:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.94145:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94146

	nop
	nop
	nop
	j	bnei_cont.94147

bnei_else.94146:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.94147:
	flw	%f1, 8(%sp)
	lw	%v0, 12(%sp)
	nop
	nop

	lw	%v0, 7(%v0)
	flw	%f2, 145(%zero)
	fmul	%f0, %f1, %f0
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	flw	%f1, 148(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 148(%zero)
	nop
	nop
	nop

	flw	%f1, 149(%zero)
	flw	%f2, 146(%zero)
	nop
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	nop
	nop
	fadd	%f1, %f1, %f2
	nop

	fsw	%f1, 149(%zero)
	nop
	nop
	nop

	flw	%f1, 150(%zero)
	flw	%f2, 147(%zero)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f2
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	fsw	%f0, 150(%zero)
	nop
	nop
	nop

bnei_cont.94143:
	nop
	nop
	nop
	j	bnei_cont.93991

bnei_else.93998:
bnei_cont.93999:
	nop
	nop
	nop
	j	bnei_cont.93991

bnei_else.93990:
	flw	%f2, 439(%zero)
	lw	%a2, 3(%sp)
	nop
	nop

	flw	%f2, 465(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 20(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 21(%sp)
	nop
	nop
	nop

	fsw	%f1, 10(%sp)
	nop
	nop
	nop

	sw	%a0, 22(%sp)
	nop
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 466(%zero)
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.94148

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94149

fbgt_else.94148:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.94149:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94150

	flw	%f1, 464(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94152

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.94151

fbgt_else.94152:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.94153:
	nop
	nop
	nop
	j	bnei_cont.94151

bnei_else.94150:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.94151:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.94154

	lw	%v0, 141(%zero)
	lw	%v1, 22(%sp)
	nop
	nop

	lw	%v0, 12(%v0)
	lw	%v1, 0(%v1)
	nop
	nop

	lw	%a0, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.94156

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.94158

	flw	%f0, 138(%zero)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 0(%v1)
	lw	%v1, 5(%v0)
	nop
	nop

	flw	%f1, 139(%zero)
	flw	%f2, 1(%v1)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 140(%zero)
	lw	%v1, 5(%v0)
	fsub	%f1, %f1, %f2
	nop

	flw	%f3, 2(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f3, 0(%v1)
	lw	%v1, 4(%v0)
	fsub	%f2, %f2, %f3
	nop

	flw	%f4, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f3, %f0, %f3
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 3(%v0)
	fmul	%f4, %f1, %f4
	nop

	nop
	nop
	fmul	%f5, %f2, %f5
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94160

	lw	%v1, 9(%v0)
	nop
	nop
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f7, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f6, %f1, %f6
	nop

	nop
	nop
	fmul	%f7, %f2, %f7
	nop

	flw	%f7, 471(%zero)
	nop
	fadd	%f6, %f6, %f7
	nop

	nop
	nop
	fmul	%f6, %f6, %f7
	nop

	nop
	nop
	fadd	%f3, %f3, %f6
	nop

	fsw	%f3, 142(%zero)
	flw	%f3, 2(%v1)
	nop
	nop

	lw	%v1, 9(%v0)
	nop
	fmul	%f3, %f0, %f3
	nop

	flw	%f6, 0(%v1)
	lw	%v1, 9(%v0)
	nop
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

	fsw	%f2, 143(%zero)
	flw	%f2, 1(%v1)
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

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94161

bnei_else.94160:
	fsw	%f3, 142(%zero)
	nop
	nop
	nop

	fsw	%f4, 143(%zero)
	nop
	nop
	nop

	fsw	%f5, 144(%zero)
	nop
	nop
	nop

bnei_cont.94161:
	lw	%v1, 6(%v0)
	flw	%f0, 142(%zero)
	nop
	nop

	flw	%f2, 143(%zero)
	nop
	fmul	%f1, %f0, %f0
	nop

	nop
	nop
	fmul	%f3, %f2, %f2
	nop

	flw	%f3, 144(%zero)
	nop
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	nop

	flw	%f4, 10(%sp)
	nop
	fadd	%f1, %f1, %f4
	nop

	nop
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	fbne	%f1, %f4, fbeq_else.94162

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.94163

fbeq_else.94162:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.94163:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.94164

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94165

bnei_else.94164:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94166

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.94167

bnei_else.94166:
	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.94167:
bnei_cont.94165:
	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 142(%zero)
	nop
	fmul	%f0, %f2, %f1
	nop

	fsw	%f0, 143(%zero)
	nop
	fmul	%f0, %f3, %f1
	nop

	fsw	%f0, 144(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94157

bnei_else.94158:
	lw	%v1, 4(%v0)
	nop
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%zero)
	flw	%f0, 1(%v1)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 143(%zero)
	flw	%f0, 2(%v1)
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

bnei_cont.94159:
	nop
	nop
	nop
	j	bnei_cont.94157

bnei_else.94156:
	lw	%a0, 136(%zero)
	flw	%f0, 10(%sp)
	nop
	nop

	fsw	%f0, 142(%zero)
	nop
	addi	%a0, %a0, -1
	nop

	fsw	%f0, 143(%zero)
	nop
	add	%at, %v1, %a0
	nop

	fsw	%f0, 144(%zero)
	flw	%f1, 0(%at)
	nop
	nop

	nop
	nop
	nop
	fbne	%f1, %f0, fbeq_else.94168

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.94169

fbeq_else.94168:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.94169:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94170

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.94171

bnei_else.94170:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.94172

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.94173

fbgt_else.94172:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.94173:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.94174

	flw	%f1, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.94175

bnei_else.94174:
	flw	%f1, 490(%zero)
	nop
	nop
	nop

bnei_cont.94175:
bnei_cont.94171:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.94157:
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

	nop
	nop
