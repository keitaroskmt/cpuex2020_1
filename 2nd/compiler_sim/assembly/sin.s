.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 15
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
kernel_sin.213:
	fmul	%f18, %f0, %f0
	fmul	%f17, %f18, %f18
	flw	%f1, 14(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f18
	fsub	%f16, %f0, %f1
	flw	%f1, 13(%zero)
	fmul	%f1, %f1, %f0
	fmul	%f1, %f1, %f17
	fadd	%f16, %f16, %f1
	flw	%f1, 12(%zero)
	fmul	%f0, %f1, %f0
	fmul	%f0, %f0, %f18
	fmul	%f0, %f0, %f17
	fsub	%f0, %f16, %f0
	jr	%ra
kernel_cos.215:
	fmul	%f17, %f0, %f0
	fmul	%f16, %f17, %f17
	flw	%f1, 11(%zero)
	flw	%f0, 10(%zero)
	fmul	%f0, %f0, %f17
	fsub	%f1, %f1, %f0
	flw	%f0, 9(%zero)
	fmul	%f0, %f0, %f16
	fadd	%f1, %f1, %f0
	flw	%f0, 8(%zero)
	fmul	%f0, %f0, %f17
	fmul	%f0, %f0, %f16
	fsub	%f0, %f1, %f0
	jr	%ra
f.295:
	fmov	%f16, %f0
	fmov	%f0, %f1
	fblt	%f16, %f0, fbgt_else.522
	flw	%f1, 7(%zero)
	fmul	%f1, %f1, %f0
	fmov	%f0, %f16
	j	f.295
fbgt_else.522:
	jr	%ra
g.299:
	flw	%f16, 1(%k1)
	fblt	%f0, %f16, fbgt_else.547
	fblt	%f0, %f1, fbgt_else.548
	fsub	%f0, %f0, %f1
	flw	%f16, 7(%zero)
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.548:
	flw	%f16, 7(%zero)
	fdiv	%f1, %f1, %f16
	lw	%at, 0(%k1)
	jr	%at
fbgt_else.547:
	jr	%ra
reduction_2pi.219:
	fmov	%f17, %f0
	add	%a0, %zero, %ra
	flw	%f18, 6(%zero)
	fmov	%f1, %f18
	fmov	%f0, %f17
	jal	f.295
	fmov	%f1, %f0
	add	%k1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a1, %zero, g.299
	sw	%a1, 0(%k1)
	fsw	%f18, 1(%k1)
	add	%ra, %zero, %a0
	fmov	%f0, %f17
	lw	%at, 0(%k1)
	jr	%at
sin.223:
	add	%a2, %zero, %ra
	flw	%f19, 5(%zero)
	flw	%f1, 4(%zero)
	fblt	%f0, %f1, fbgt_else.606
	addi	%a3, %zero, 1
	j	fbgt_cont.607
fbgt_else.606:
	addi	%a3, %zero, 0
fbgt_cont.607:
	fabs	%f0, %f0
	jal	reduction_2pi.219
	fblt	%f0, %f19, fbgt_else.608
	beqi	%a3, 0, bnei_else.610
	addi	%a3, %zero, 0
	j	fbgt_cont.609
bnei_else.610:
	addi	%a3, %zero, 1
bnei_cont.611:
	j	fbgt_cont.609
fbgt_else.608:
fbgt_cont.609:
	fblt	%f0, %f19, fbgt_else.612
	fsub	%f0, %f0, %f19
	j	fbgt_cont.613
fbgt_else.612:
fbgt_cont.613:
	flw	%f16, 3(%zero)
	fblt	%f0, %f16, fbgt_else.614
	fsub	%f0, %f19, %f0
	j	fbgt_cont.615
fbgt_else.614:
fbgt_cont.615:
	flw	%f1, 2(%zero)
	fblt	%f1, %f0, fbgt_else.616
	jal	kernel_sin.213
	j	fbgt_cont.617
fbgt_else.616:
	fsub	%f0, %f16, %f0
	jal	kernel_cos.215
fbgt_cont.617:
	beqi	%a3, 0, bnei_else.618
	add	%ra, %zero, %a2
	jr	%ra
bnei_else.618:
	add	%ra, %zero, %a2
	fneg	%f0, %f0
	jr	%ra
rad.227:
	flw	%f1, 1(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 0(%zero)
	jal	rad.227
	jal	sin.223
	fmov	%g0, %f0
	ret
