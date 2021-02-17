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
	fblt	%f0, %f1, fbgt_else.31091

	flw	%f2, 495(%zero)
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
	fblt	%f0, %f1, fbgt_else.31092

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31093

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31094

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31095

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31096

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31097

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31098

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31099

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31100

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31101

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31102

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31103

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31104

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31105

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31106

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub1.2614

fbgt_else.31106:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31105:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31104:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31103:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31102:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31101:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31100:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31099:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31098:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31097:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31096:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31095:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31094:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31093:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31092:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31091:
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
	fblt	%f0, %f2, fbgt_else.31107

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31108

	flw	%f3, 495(%zero)
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
	fblt	%f0, %f2, fbgt_else.31109

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31110

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31111

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31112

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31113

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31114

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31114:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31113:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31112:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31115

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31116

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31116:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31115:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31111:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31110:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31117

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31118

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31119

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31120

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31120:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31119:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31118:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31121

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31122

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31122:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31121:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31117:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31109:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31108:
	flw	%f3, 495(%zero)
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
	fblt	%f0, %f2, fbgt_else.31123

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31124

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31125

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31126

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31127

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31128

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31128:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31127:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31126:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31129

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31130

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31130:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31129:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31125:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31124:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31131

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31132

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31133

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31134

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31134:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31133:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31132:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.31135

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31136

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31136:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.31135:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31131:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31123:
	nop
	nop
	nop
	jr	%ra

fbgt_else.31107:
	nop
	nop
	nop
	jr	%ra

atan.2627:
	flw	%f1, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.31137

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.31138

fbgt_else.31137:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.31138:
	flw	%f2, 493(%zero)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.31139

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.31140

	flw	%f0, 483(%zero)
	flw	%f2, 484(%zero)
	nop
	nop

	flw	%f5, 492(%zero)
	flw	%f6, 491(%zero)
	fdiv	%f1, %f2, %f1
	nop

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fsub	%f5, %f1, %f5

	nop
	nop
	fmul	%f6, %f6, %f1
	nop

	nop
	nop
	fmul	%f6, %f6, %f3
	nop

	flw	%f6, 490(%zero)
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

	flw	%f6, 489(%zero)
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

	flw	%f6, 488(%zero)
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

	flw	%f5, 487(%zero)
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

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.31141

fbgt_else.31140:
	flw	%f0, 485(%zero)
	flw	%f2, 484(%zero)
	nop
	nop

	flw	%f5, 492(%zero)
	flw	%f6, 491(%zero)
	fsub	%f3, %f1, %f2
	fadd	%f1, %f1, %f2

	nop
	nop
	fdiv	%f1, %f3, %f1
	nop

	nop
	nop
	fmul	%f2, %f1, %f1
	fmul	%f5, %f5, %f1

	nop
	nop
	fmul	%f3, %f2, %f2
	fmul	%f5, %f5, %f2

	nop
	nop
	fmul	%f4, %f3, %f3
	fsub	%f5, %f1, %f5

	nop
	nop
	fmul	%f6, %f6, %f1
	nop

	nop
	nop
	fmul	%f6, %f6, %f3
	nop

	flw	%f6, 490(%zero)
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

	flw	%f6, 489(%zero)
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

	flw	%f6, 488(%zero)
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

	flw	%f5, 487(%zero)
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

	nop
	nop
	fadd	%f0, %f0, %f1
	nop

fbgt_cont.31141:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.31142

	nop
	nop
	nop
	jr	%ra

bnei_else.31142:
	nop
	nop
	fneg	%f0, %f0
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.31139:
	flw	%f4, 492(%zero)
	flw	%f5, 491(%zero)
	fmul	%f1, %f0, %f0
	nop

	nop
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
	fmul	%f5, %f5, %f0

	nop
	nop
	fmul	%f5, %f5, %f2
	nop

	flw	%f5, 490(%zero)
	nop
	fadd	%f4, %f4, %f5
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

	flw	%f5, 489(%zero)
	nop
	fsub	%f4, %f4, %f5
	nop

	nop
	nop
	fmul	%f5, %f5, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f3
	nop

	flw	%f5, 488(%zero)
	nop
	fadd	%f4, %f4, %f5
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

	flw	%f4, 487(%zero)
	nop
	fsub	%f1, %f4, %f1
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

print_int_sub1.2629:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31143

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31144

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31145

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31146

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31147

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31148

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31149

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31150

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	print_int_sub1.2629

bgti_else.31150:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31149:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31148:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31147:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31146:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31145:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31144:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.31143:
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
	blti	%v0, 10, bgti_else.31151

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31152

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31153

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31154

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31155

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31156

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31157

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31158

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31159

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31160

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31161

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31162

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31163

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31164

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31165

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.31166

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	j	print_int_sub2.2632

bgti_else.31166:
	nop
	nop
	nop
	jr	%ra

bgti_else.31165:
	nop
	nop
	nop
	jr	%ra

bgti_else.31164:
	nop
	nop
	nop
	jr	%ra

bgti_else.31163:
	nop
	nop
	nop
	jr	%ra

bgti_else.31162:
	nop
	nop
	nop
	jr	%ra

bgti_else.31161:
	nop
	nop
	nop
	jr	%ra

bgti_else.31160:
	nop
	nop
	nop
	jr	%ra

bgti_else.31159:
	nop
	nop
	nop
	jr	%ra

bgti_else.31158:
	nop
	nop
	nop
	jr	%ra

bgti_else.31157:
	nop
	nop
	nop
	jr	%ra

bgti_else.31156:
	nop
	nop
	nop
	jr	%ra

bgti_else.31155:
	nop
	nop
	nop
	jr	%ra

bgti_else.31154:
	nop
	nop
	nop
	jr	%ra

bgti_else.31153:
	nop
	nop
	nop
	jr	%ra

bgti_else.31152:
	nop
	nop
	nop
	jr	%ra

bgti_else.31151:
	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2767:
	flw	%f0, 0(%v1)
	flw	%f1, 482(%zero)
	nop
	nop

	flw	%f3, 481(%zero)
	sw	%v0, 0(%sp)
	fabs	%f2, %f0
	nop

	sw	%v1, 1(%sp)
	nop
	nop
	nop

	fsw	%f0, 2(%sp)
	nop
	nop
	nop

	fsw	%f1, 3(%sp)
	nop
	nop
	nop

	fsw	%f2, 4(%sp)
	nop
	nop
	nop

	fsw	%f3, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.32290

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32292

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32294

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32296

	flw	%f4, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32298

	flw	%f4, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32300

	flw	%f4, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32302

	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32304

	flw	%f4, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32306

	flw	%f4, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32308

	flw	%f4, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32310

	flw	%f4, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32312

	flw	%f4, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.32314

	flw	%f4, 468(%zero)
	sw	%ra, 6(%sp)
	fmov	%f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 7

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.32291

fbgt_else.32314:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32315:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32312:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32313:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32310:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32311:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32308:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32309:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32306:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32307:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32304:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32305:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32302:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32303:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32300:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32301:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32298:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32299:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32296:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32297:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32294:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32295:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32292:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.32293:
	nop
	nop
	nop
	j	fbgt_cont.32291

fbgt_else.32290:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.32291:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32316

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32318

	flw	%f3, 495(%zero)
	sw	%ra, 6(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 7
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.32317

fbgt_else.32318:
	flw	%f3, 495(%zero)
	sw	%ra, 6(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 7

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

fbgt_cont.32319:
	nop
	nop
	nop
	j	fbgt_cont.32317

fbgt_else.32316:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32317:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32320

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32321

fbgt_else.32320:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32321:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32322

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32323

fbgt_else.32322:
fbgt_cont.32323:
	flw	%f2, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32324

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32326

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32325

bnei_else.32326:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32327:
	nop
	nop
	nop
	j	fbgt_cont.32325

fbgt_else.32324:
fbgt_cont.32325:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32328

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32329

fbgt_else.32328:
fbgt_cont.32329:
	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.32330

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.32331

fbgt_else.32330:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.32331:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32332

	nop
	nop
	nop
	j	bnei_cont.32333

bnei_else.32332:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32333:
	flw	%f4, 494(%zero)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.32334

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32335

fbgt_else.32334:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.32335:
	flw	%f6, 5(%sp)
	fsw	%f0, 6(%sp)
	fabs	%f5, %f5
	nop

	fsw	%f4, 7(%sp)
	nop
	nop
	nop

	fsw	%f3, 8(%sp)
	nop
	nop
	nop

	fsw	%f2, 9(%sp)
	nop
	nop
	nop

	sw	%v0, 10(%sp)
	nop
	nop
	nop

	fsw	%f5, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.32336

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32338

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32340

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32342

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32344

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32346

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32348

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32350

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32352

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32354

	flw	%f7, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32356

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32358

	flw	%f7, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32360

	flw	%f7, 468(%zero)
	sw	%ra, 12(%sp)
	fmov	%f0, %f5
	nop

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 13

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.32337

fbgt_else.32360:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32361:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32358:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32359:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32356:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32357:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32354:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32355:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32352:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32353:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32350:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32351:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32348:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32349:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32346:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32347:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32344:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32345:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32342:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32343:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32340:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32341:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32338:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32339:
	nop
	nop
	nop
	j	fbgt_cont.32337

fbgt_else.32336:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32337:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32362

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32364

	flw	%f3, 495(%zero)
	sw	%ra, 12(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32363

fbgt_else.32364:
	flw	%f3, 495(%zero)
	sw	%ra, 12(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 13

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

fbgt_cont.32365:
	nop
	nop
	nop
	j	fbgt_cont.32363

fbgt_else.32362:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32363:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32366

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32368

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32367

bnei_else.32368:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32369:
	nop
	nop
	nop
	j	fbgt_cont.32367

fbgt_else.32366:
	lw	%v0, 10(%sp)
	nop
	nop
	nop

fbgt_cont.32367:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32370

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32371

fbgt_else.32370:
fbgt_cont.32371:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32372

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32373

fbgt_else.32372:
fbgt_cont.32373:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.32374

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.32375

fbgt_else.32374:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.32375:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32376

	nop
	nop
	nop
	j	bnei_cont.32377

bnei_else.32376:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32377:
	lw	%v0, 1(%sp)
	flw	%f6, 5(%sp)
	nop
	nop

	flw	%f4, 1(%v0)
	fsw	%f0, 12(%sp)
	nop
	nop

	fsw	%f4, 13(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.32378

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32380

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32382

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32384

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32386

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32388

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32390

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32392

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32394

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32396

	flw	%f7, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32398

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32400

	flw	%f7, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32402

	flw	%f7, 468(%zero)
	sw	%ra, 15(%sp)
	fmov	%f0, %f5
	nop

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32402:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32403:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32400:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32401:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32398:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32399:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32396:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32397:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32394:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32395:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32392:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32393:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32390:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32391:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32388:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32389:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32386:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32387:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32384:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32385:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32382:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32383:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32380:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32381:
	nop
	nop
	nop
	j	fbgt_cont.32379

fbgt_else.32378:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32379:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32404

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32406

	flw	%f3, 495(%zero)
	sw	%ra, 15(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32405

fbgt_else.32406:
	flw	%f3, 495(%zero)
	sw	%ra, 15(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 16

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

fbgt_cont.32407:
	nop
	nop
	nop
	j	fbgt_cont.32405

fbgt_else.32404:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32405:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32408

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32409

fbgt_else.32408:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32409:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32410

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32411

fbgt_else.32410:
fbgt_cont.32411:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32412

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32414

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32413

bnei_else.32414:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32415:
	nop
	nop
	nop
	j	fbgt_cont.32413

fbgt_else.32412:
fbgt_cont.32413:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32416

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32417

fbgt_else.32416:
fbgt_cont.32417:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.32418

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.32419

fbgt_else.32418:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.32419:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32420

	nop
	nop
	nop
	j	bnei_cont.32421

bnei_else.32420:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32421:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.32422

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32423

fbgt_else.32422:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.32423:
	flw	%f6, 5(%sp)
	fsw	%f0, 15(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 16(%sp)
	nop
	nop
	nop

	fsw	%f4, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32424

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32426

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32428

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32430

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32432

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32434

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32436

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32438

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32440

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32442

	flw	%f7, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32444

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32446

	flw	%f7, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.32448

	flw	%f7, 468(%zero)
	sw	%ra, 18(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f7
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
	j	fbgt_cont.32425

fbgt_else.32448:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32449:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32446:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32447:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32444:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32445:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32442:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32443:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32440:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32441:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32438:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32439:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32436:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32437:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32434:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32435:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32432:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32433:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32430:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32431:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32428:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32429:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32426:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32427:
	nop
	nop
	nop
	j	fbgt_cont.32425

fbgt_else.32424:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32425:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32450

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32452

	flw	%f3, 495(%zero)
	sw	%ra, 18(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
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

	nop
	nop
	nop
	j	fbgt_cont.32451

fbgt_else.32452:
	flw	%f3, 495(%zero)
	sw	%ra, 18(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 19

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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

fbgt_cont.32453:
	nop
	nop
	nop
	j	fbgt_cont.32451

fbgt_else.32450:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32451:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32454

	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32456

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32455

bnei_else.32456:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32457:
	nop
	nop
	nop
	j	fbgt_cont.32455

fbgt_else.32454:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

fbgt_cont.32455:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32458

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32459

fbgt_else.32458:
fbgt_cont.32459:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32460

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32461

fbgt_else.32460:
fbgt_cont.32461:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.32462

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.32463

fbgt_else.32462:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.32463:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32464

	nop
	nop
	nop
	j	bnei_cont.32465

bnei_else.32464:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32465:
	lw	%v0, 1(%sp)
	flw	%f6, 5(%sp)
	nop
	nop

	flw	%f4, 2(%v0)
	fsw	%f0, 18(%sp)
	nop
	nop

	fsw	%f4, 19(%sp)
	nop
	fabs	%f5, %f4
	nop

	fsw	%f5, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.32466

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32468

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32470

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32472

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32474

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32476

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32478

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32480

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32482

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32484

	flw	%f7, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32486

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32488

	flw	%f7, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.32490

	flw	%f7, 468(%zero)
	sw	%ra, 21(%sp)
	fmov	%f0, %f5
	nop

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 22

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32490:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32491:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32488:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32489:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32486:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32487:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32484:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32485:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32482:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32483:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32480:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32481:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32478:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32479:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32476:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32477:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32474:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32475:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32472:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32473:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32470:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32471:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32468:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.32469:
	nop
	nop
	nop
	j	fbgt_cont.32467

fbgt_else.32466:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32467:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32492

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32494

	flw	%f3, 495(%zero)
	sw	%ra, 21(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32493

fbgt_else.32494:
	flw	%f3, 495(%zero)
	sw	%ra, 21(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 22

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

fbgt_cont.32495:
	nop
	nop
	nop
	j	fbgt_cont.32493

fbgt_else.32492:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32493:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32496

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32497

fbgt_else.32496:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32497:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32498

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32499

fbgt_else.32498:
fbgt_cont.32499:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32500

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32502

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32501

bnei_else.32502:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32503:
	nop
	nop
	nop
	j	fbgt_cont.32501

fbgt_else.32500:
fbgt_cont.32501:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32504

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32505

fbgt_else.32504:
fbgt_cont.32505:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.32506

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.32507

fbgt_else.32506:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.32507:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32508

	nop
	nop
	nop
	j	bnei_cont.32509

bnei_else.32508:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32509:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.32510

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32511

fbgt_else.32510:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.32511:
	flw	%f5, 5(%sp)
	fsw	%f0, 21(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 22(%sp)
	nop
	nop
	nop

	fsw	%f4, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.32512

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32514

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32516

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32518

	flw	%f6, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32520

	flw	%f6, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32522

	flw	%f6, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32524

	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32526

	flw	%f6, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32528

	flw	%f6, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32530

	flw	%f6, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32532

	flw	%f6, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32534

	flw	%f6, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.32536

	flw	%f6, 468(%zero)
	sw	%ra, 24(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32536:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32537:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32534:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32535:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32532:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32533:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32530:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32531:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32528:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32529:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32526:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32527:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32524:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32525:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32522:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32523:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32520:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32521:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32518:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32519:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32516:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32517:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32514:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.32515:
	nop
	nop
	nop
	j	fbgt_cont.32513

fbgt_else.32512:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.32513:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.32538

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32540

	flw	%f3, 495(%zero)
	sw	%ra, 24(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.32539

fbgt_else.32540:
	flw	%f3, 495(%zero)
	sw	%ra, 24(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 25

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

fbgt_cont.32541:
	nop
	nop
	nop
	j	fbgt_cont.32539

fbgt_else.32538:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.32539:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32542

	lw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32544

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32543

bnei_else.32544:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32545:
	nop
	nop
	nop
	j	fbgt_cont.32543

fbgt_else.32542:
	lw	%v0, 22(%sp)
	nop
	nop
	nop

fbgt_cont.32543:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32546

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.32547

fbgt_else.32546:
fbgt_cont.32547:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.32548

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32549

fbgt_else.32548:
fbgt_cont.32549:
	flw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32550

	flw	%f3, 467(%zero)
	flw	%f4, 466(%zero)
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

	flw	%f4, 465(%zero)
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
	j	fbgt_cont.32551

fbgt_else.32550:
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
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

	flw	%f3, 463(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 462(%zero)
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

fbgt_cont.32551:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32552

	nop
	nop
	nop
	j	bnei_cont.32553

bnei_else.32552:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32553:
	flw	%f1, 21(%sp)
	flw	%f2, 15(%sp)
	nop
	nop

	flw	%f4, 18(%sp)
	flw	%f5, 12(%sp)
	fmul	%f3, %f2, %f1
	nop

	flw	%f8, 6(%sp)
	lw	%v0, 0(%sp)
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
	flw	%f12, 495(%zero)
	fmul	%f13, %f13, %f10
	fmul	%f5, %f3, %f10

	lw	%v0, 1(%sp)
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
	jr	%ra

read_nth_object.2770:
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
	beqi	%v0, -1, bnei_else.32601

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

	flw	%f0, 494(%zero)
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
	fblt	%f0, %f1, fbgt_else.32602

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32603

fbgt_else.32602:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32603:
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
	beqi	%v1, 0, bnei_else.32604

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

	flw	%f1, 461(%zero)
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
	j	bnei_cont.32605

bnei_else.32604:
bnei_cont.32605:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.32606

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32607

bnei_else.32606:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.32607:
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
	beqi	%a2, 3, bnei_else.32608

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32610

	nop
	nop
	nop
	j	bnei_cont.32609

bnei_else.32610:
	lw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32612

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32613

bnei_else.32612:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.32613:
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
	fbne	%f1, %f4, fbeq_else.32614

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32615

fbeq_else.32614:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.32615:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32616

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32617

bnei_else.32616:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32618

	flw	%f4, 460(%zero)
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
	j	bnei_cont.32619

bnei_else.32618:
	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

bnei_cont.32619:
bnei_cont.32617:
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

bnei_cont.32611:
	nop
	nop
	nop
	j	bnei_cont.32609

bnei_else.32608:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32620

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32621

fbeq_else.32620:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32621:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32622

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.32623

bnei_else.32622:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32624

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32625

fbeq_else.32624:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32625:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32626

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.32627

bnei_else.32626:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32628

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32629

fbgt_else.32628:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32629:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32630

	flw	%f2, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32631

bnei_else.32630:
	flw	%f2, 460(%zero)
	nop
	nop
	nop

bnei_cont.32631:
bnei_cont.32627:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.32623:
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
	fbne	%f0, %f1, fbeq_else.32632

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32633

fbeq_else.32632:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32633:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32634

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.32635

bnei_else.32634:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32636

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32637

fbeq_else.32636:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32637:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32638

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.32639

bnei_else.32638:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32640

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32641

fbgt_else.32640:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32641:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32642

	flw	%f2, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32643

bnei_else.32642:
	flw	%f2, 460(%zero)
	nop
	nop
	nop

bnei_cont.32643:
bnei_cont.32639:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.32635:
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
	fbne	%f0, %f1, fbeq_else.32644

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32645

fbeq_else.32644:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32645:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32646

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.32647

bnei_else.32646:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32648

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32649

fbeq_else.32648:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32649:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32650

	nop
	nop
	nop
	j	bnei_cont.32651

bnei_else.32650:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.32652

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32653

fbgt_else.32652:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32653:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32654

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32655

bnei_else.32654:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.32655:
bnei_cont.32651:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.32647:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.32609:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32656

	sw	%ra, 16(%sp)
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	rotate_quadratic_matrix.2767

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
	j	bnei_cont.32657

bnei_else.32656:
bnei_cont.32657:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32601:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

read_object.2772:
	nop
	nop
	nop
	blti	%v0, 60, bgti_else.32667

	nop
	nop
	nop
	jr	%ra

bgti_else.32667:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32669

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
	blti	%v0, 60, bgti_else.32670

	nop
	nop
	nop
	jr	%ra

bgti_else.32670:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32672

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
	blti	%v0, 60, bgti_else.32673

	nop
	nop
	nop
	jr	%ra

bgti_else.32673:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32675

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
	blti	%v0, 60, bgti_else.32676

	nop
	nop
	nop
	jr	%ra

bgti_else.32676:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32678

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
	blti	%v0, 60, bgti_else.32679

	nop
	nop
	nop
	jr	%ra

bgti_else.32679:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32681

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
	blti	%v0, 60, bgti_else.32682

	nop
	nop
	nop
	jr	%ra

bgti_else.32682:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32684

	lw	%v0, 5(%sp)
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
	blti	%v0, 60, bgti_else.32685

	nop
	nop
	nop
	jr	%ra

bgti_else.32685:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32687

	lw	%v0, 6(%sp)
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
	blti	%v0, 60, bgti_else.32688

	nop
	nop
	nop
	jr	%ra

bgti_else.32688:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.32690

	lw	%v0, 7(%sp)
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

bnei_else.32690:
	lw	%v0, 7(%sp)
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

bnei_else.32687:
	lw	%v0, 6(%sp)
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

bnei_else.32684:
	lw	%v0, 5(%sp)
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

bnei_else.32681:
	lw	%v0, 4(%sp)
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

bnei_else.32678:
	lw	%v0, 3(%sp)
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

bnei_else.32675:
	lw	%v0, 2(%sp)
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

bnei_else.32672:
	lw	%v0, 1(%sp)
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

bnei_else.32669:
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
	beqi	%v0, -1, bnei_else.32712

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
	beqi	%v0, -1, bnei_else.32713

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
	beqi	%v0, -1, bnei_else.32715

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
	beqi	%v0, -1, bnei_else.32717

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
	j	bnei_cont.32718

bnei_else.32717:
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

bnei_cont.32718:
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
	j	bnei_cont.32716

bnei_else.32715:
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

bnei_cont.32716:
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
	j	bnei_cont.32714

bnei_else.32713:
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

bnei_cont.32714:
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

bnei_else.32712:
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
	beqi	%v0, -1, bnei_else.32736

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
	beqi	%v0, -1, bnei_else.32738

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
	beqi	%v0, -1, bnei_else.32740

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
	j	bnei_cont.32741

bnei_else.32740:
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

bnei_cont.32741:
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
	j	bnei_cont.32739

bnei_else.32738:
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

bnei_cont.32739:
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
	j	bnei_cont.32737

bnei_else.32736:
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

bnei_cont.32737:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.32742

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
	beqi	%v0, -1, bnei_else.32743

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
	beqi	%v0, -1, bnei_else.32745

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
	j	bnei_cont.32746

bnei_else.32745:
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

bnei_cont.32746:
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
	j	bnei_cont.32744

bnei_else.32743:
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

bnei_cont.32744:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.32747

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
	j	bnei_cont.32748

bnei_else.32747:
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

bnei_cont.32748:
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

bnei_else.32742:
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
	beqi	%v0, -1, bnei_else.32770

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
	beqi	%v0, -1, bnei_else.32772

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
	beqi	%v0, -1, bnei_else.32774

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
	j	bnei_cont.32775

bnei_else.32774:
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

bnei_cont.32775:
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
	j	bnei_cont.32773

bnei_else.32772:
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

bnei_cont.32773:
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
	j	bnei_cont.32771

bnei_else.32770:
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

bnei_cont.32771:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.32776

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
	beqi	%v0, -1, bnei_else.32777

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
	beqi	%v0, -1, bnei_else.32779

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
	j	bnei_cont.32780

bnei_else.32779:
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

bnei_cont.32780:
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
	j	bnei_cont.32778

bnei_else.32777:
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

bnei_cont.32778:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.32781

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
	beqi	%v0, -1, bnei_else.32782

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
	j	bnei_cont.32783

bnei_else.32782:
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

bnei_cont.32783:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.32784

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
	beqi	%v1, -1, bnei_else.32785

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

bnei_else.32785:
	nop
	nop
	nop
	jr	%ra

bnei_else.32784:
	nop
	nop
	nop
	jr	%ra

bnei_else.32781:
	nop
	nop
	nop
	jr	%ra

bnei_else.32776:
	nop
	nop
	nop
	jr	%ra

solver_second.2818:
	flw	%f3, 0(%v1)
	flw	%f4, 1(%v1)
	nop
	nop

	flw	%f5, 2(%v1)
	lw	%v1, 4(%v0)
	fmul	%f6, %f3, %f3
	nop

	flw	%f7, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f6, %f6, %f7
	fmul	%f7, %f4, %f4

	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)
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
	beqi	%v1, 0, bnei_else.32790

	lw	%v1, 9(%v0)
	nop
	fmul	%f7, %f4, %f5
	nop

	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)
	nop
	nop

	flw	%f8, 1(%v1)
	lw	%v1, 9(%v0)
	fmul	%f7, %f7, %f8
	nop

	nop
	nop
	fadd	%f6, %f6, %f7
	fmul	%f7, %f5, %f3

	flw	%f8, 2(%v1)
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
	j	bnei_cont.32791

bnei_else.32790:
bnei_cont.32791:
	flw	%f7, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.32792

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32793

fbeq_else.32792:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32793:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32794

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32794:
	lw	%v1, 4(%v0)
	nop
	fmul	%f8, %f3, %f0
	nop

	flw	%f9, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f10, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f4, %f1

	flw	%f10, 2(%v1)
	lw	%v1, 3(%v0)
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
	beqi	%v1, 0, bnei_else.32795

	lw	%v1, 9(%v0)
	nop
	fmul	%f9, %f5, %f1
	fmul	%f10, %f4, %f2

	flw	%f10, 0(%v1)
	lw	%v1, 9(%v0)
	fadd	%f9, %f9, %f10
	fmul	%f5, %f5, %f0

	nop
	nop
	fmul	%f9, %f9, %f10
	fmul	%f10, %f3, %f2

	flw	%f10, 1(%v1)
	lw	%v1, 9(%v0)
	fadd	%f5, %f10, %f5
	fmul	%f3, %f3, %f1

	nop
	nop
	fmul	%f5, %f5, %f10
	fmul	%f4, %f4, %f0

	flw	%f4, 2(%v1)
	nop
	fadd	%f5, %f9, %f5
	fadd	%f3, %f3, %f4

	flw	%f4, 464(%zero)
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
	j	bnei_cont.32796

bnei_else.32795:
	nop
	nop
	fmov	%f3, %f8
	nop

bnei_cont.32796:
	lw	%v1, 4(%v0)
	nop
	fmul	%f4, %f0, %f0
	nop

	flw	%f5, 0(%v1)
	lw	%v1, 4(%v0)
	nop
	nop

	flw	%f8, 1(%v1)
	lw	%v1, 4(%v0)
	fmul	%f4, %f4, %f5
	fmul	%f5, %f1, %f1

	flw	%f8, 2(%v1)
	lw	%v1, 3(%v0)
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
	beqi	%v1, 0, bnei_else.32797

	lw	%v1, 9(%v0)
	nop
	fmul	%f5, %f1, %f2
	fmul	%f2, %f2, %f0

	flw	%f8, 0(%v1)
	lw	%v1, 9(%v0)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f5, %f5, %f8
	nop

	flw	%f5, 1(%v1)
	lw	%v1, 9(%v0)
	fadd	%f4, %f4, %f5
	nop

	flw	%f1, 2(%v1)
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
	j	bnei_cont.32798

bnei_else.32797:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.32798:
	lw	%v1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 3, bnei_else.32799

	nop
	nop
	nop
	j	bnei_cont.32800

bnei_else.32799:
	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.32800:
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
	fblt	%f7, %f0, fbgt_else.32801

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32802

fbgt_else.32801:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32802:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32803

	lw	%v0, 6(%v0)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32804

	nop
	nop
	nop
	j	bnei_cont.32805

bnei_else.32804:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.32805:
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
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32803:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

solver_fast2.2865:
	lw	%a0, 12(%v0)
	lw	%a2, 1(%v1)
	nop
	nop

	lw	%a1, 10(%a0)
	lw	%a2, 1(%a0)
	add	%at, %a2, %v0
	nop

	flw	%f0, 0(%a1)
	flw	%f1, 1(%a1)
	nop
	nop

	flw	%f2, 2(%a1)
	lw	%v0, 0(%at)
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.32806

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.32807

	flw	%f3, 0(%v0)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.32808

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32809

fbeq_else.32808:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32809:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32810

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32810:
	flw	%f5, 1(%v0)
	nop
	nop
	nop

	flw	%f5, 2(%v0)
	nop
	fmul	%f0, %f5, %f0
	nop

	nop
	nop
	fmul	%f1, %f5, %f1
	nop

	flw	%f1, 3(%v0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 3(%a1)
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
	fblt	%f4, %f1, fbgt_else.32811

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32812

fbgt_else.32811:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32812:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32813

	lw	%v1, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32814

	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%v0)
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
	j	bnei_cont.32815

bnei_else.32814:
	nop
	nop
	fsqrt	%f1, %f1
	nop

	flw	%f1, 4(%v0)
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

bnei_cont.32815:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32813:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32807:
	flw	%f0, 0(%v0)
	flw	%f1, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.32816

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32817

fbgt_else.32816:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32817:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32818

	flw	%f1, 3(%a1)
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
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32818:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.32806:
	lw	%v1, 0(%v1)
	flw	%f3, 0(%v0)
	nop
	nop

	flw	%f4, 1(%v0)
	flw	%f5, 1(%v1)
	fsub	%f3, %f3, %f0
	nop

	lw	%a1, 4(%a0)
	nop
	fmul	%f3, %f3, %f4
	nop

	flw	%f7, 1(%a1)
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
	fblt	%f6, %f7, fbgt_else.32819

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32820

fbgt_else.32819:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.32820:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32821

	flw	%f6, 2(%v1)
	lw	%a1, 4(%a0)
	nop
	nop

	flw	%f8, 2(%a1)
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
	fblt	%f6, %f8, fbgt_else.32823

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32824

fbgt_else.32823:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.32824:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32825

	flw	%f6, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.32827

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32828

fbeq_else.32827:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.32828:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32829

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32822

bnei_else.32829:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.32830:
	nop
	nop
	nop
	j	bnei_cont.32822

bnei_else.32825:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.32826:
	nop
	nop
	nop
	j	bnei_cont.32822

bnei_else.32821:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.32822:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32831

	fsw	%f3, 135(%zero)
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

bnei_else.32831:
	flw	%f3, 2(%v0)
	flw	%f4, 3(%v0)
	nop
	nop

	flw	%f6, 0(%v1)
	lw	%a1, 4(%a0)
	fsub	%f3, %f3, %f1
	nop

	flw	%f9, 0(%a1)
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
	fblt	%f8, %f9, fbgt_else.32832

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32833

fbgt_else.32832:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.32833:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32834

	flw	%f8, 2(%v1)
	lw	%v1, 4(%a0)
	nop
	nop

	flw	%f10, 2(%v1)
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
	fblt	%f8, %f10, fbgt_else.32836

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32837

fbgt_else.32836:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32837:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32838

	flw	%f8, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f8, fbeq_else.32840

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32841

fbeq_else.32840:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32841:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32842

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32835

bnei_else.32842:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.32843:
	nop
	nop
	nop
	j	bnei_cont.32835

bnei_else.32838:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.32839:
	nop
	nop
	nop
	j	bnei_cont.32835

bnei_else.32834:
	nop
	nop
	addi	%v1, %zero, 0
	nop

bnei_cont.32835:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32844

	fsw	%f3, 135(%zero)
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

bnei_else.32844:
	flw	%f3, 4(%v0)
	nop
	nop
	nop

	flw	%f3, 5(%v0)
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
	fblt	%f0, %f9, fbgt_else.32845

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32846

fbgt_else.32845:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32846:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32847

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
	fblt	%f0, %f7, fbgt_else.32849

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32850

fbgt_else.32849:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.32850:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32851

	flw	%f0, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.32853

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32854

fbeq_else.32853:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbeq_cont.32854:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32855

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32848

bnei_else.32855:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.32856:
	nop
	nop
	nop
	j	bnei_cont.32848

bnei_else.32851:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.32852:
	nop
	nop
	nop
	j	bnei_cont.32848

bnei_else.32847:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.32848:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.32857

	fsw	%f2, 135(%zero)
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

bnei_else.32857:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.32899

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
	beqi	%a3, 1, bnei_else.32900

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32902

	flw	%f0, 494(%zero)
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
	beqi	%a0, 0, bnei_else.32904

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
	j	bnei_cont.32905

bnei_else.32904:
bnei_cont.32905:
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
	beqi	%a0, 0, bnei_else.32906

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

	flw	%f10, 464(%zero)
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
	j	bnei_cont.32907

bnei_else.32906:
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

bnei_cont.32907:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.32908

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32909

fbeq_else.32908:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32909:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32910

	nop
	nop
	nop
	j	bnei_cont.32911

bnei_else.32910:
	flw	%f0, 484(%zero)
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

bnei_cont.32911:
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
	j	bnei_cont.32901

bnei_else.32902:
	flw	%f0, 494(%zero)
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
	fblt	%f2, %f0, fbgt_else.32912

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32913

fbgt_else.32912:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32913:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32914

	flw	%f2, 460(%zero)
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
	j	bnei_cont.32915

bnei_else.32914:
	fsw	%f2, 0(%v0)
	nop
	nop
	nop

bnei_cont.32915:
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

bnei_cont.32903:
	nop
	nop
	nop
	j	bnei_cont.32901

bnei_else.32900:
	flw	%f0, 494(%zero)
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
	fbne	%f0, %f1, fbeq_else.32916

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32917

fbeq_else.32916:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.32917:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32918

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32919

bnei_else.32918:
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
	fblt	%f0, %f1, fbgt_else.32920

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32921

fbgt_else.32920:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.32921:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32922

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32924

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32923

bnei_else.32924:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.32925:
	nop
	nop
	nop
	j	bnei_cont.32923

bnei_else.32922:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.32923:
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
	beqi	%a1, 0, bnei_else.32926

	nop
	nop
	nop
	j	bnei_cont.32927

bnei_else.32926:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.32927:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.32919:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32928

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32929

fbeq_else.32928:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.32929:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32930

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32931

bnei_else.32930:
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
	fblt	%f0, %f1, fbgt_else.32932

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32933

fbgt_else.32932:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.32933:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32934

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32936

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32935

bnei_else.32936:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.32937:
	nop
	nop
	nop
	j	bnei_cont.32935

bnei_else.32934:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.32935:
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
	beqi	%a1, 0, bnei_else.32938

	nop
	nop
	nop
	j	bnei_cont.32939

bnei_else.32938:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.32939:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.32931:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32940

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32941

fbeq_else.32940:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32941:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32942

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32943

bnei_else.32942:
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
	fblt	%f0, %f1, fbgt_else.32944

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32945

fbgt_else.32944:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.32945:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32946

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32948

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32947

bnei_else.32948:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.32949:
	nop
	nop
	nop
	j	bnei_cont.32947

bnei_else.32946:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.32947:
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
	beqi	%a0, 0, bnei_else.32950

	nop
	nop
	nop
	j	bnei_cont.32951

bnei_else.32950:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.32951:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
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

bnei_cont.32943:
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

bnei_cont.32901:
	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.32952

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
	beqi	%a3, 1, bnei_else.32953

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.32955

	flw	%f0, 494(%zero)
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
	beqi	%a0, 0, bnei_else.32957

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
	j	bnei_cont.32958

bnei_else.32957:
bnei_cont.32958:
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
	beqi	%a0, 0, bnei_else.32959

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

	flw	%f8, 464(%zero)
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
	j	bnei_cont.32960

bnei_else.32959:
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

bnei_cont.32960:
	flw	%f0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.32961

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32962

fbeq_else.32961:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32962:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32963

	nop
	nop
	nop
	j	bnei_cont.32964

bnei_else.32963:
	flw	%f0, 484(%zero)
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

bnei_cont.32964:
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
	j	bnei_cont.32954

bnei_else.32955:
	flw	%f0, 494(%zero)
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
	fblt	%f1, %f0, fbgt_else.32965

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32966

fbgt_else.32965:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.32966:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32967

	flw	%f1, 460(%zero)
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
	j	bnei_cont.32968

bnei_else.32967:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.32968:
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

bnei_cont.32956:
	nop
	nop
	nop
	j	bnei_cont.32954

bnei_else.32953:
	flw	%f0, 494(%zero)
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
	fbne	%f0, %f1, fbeq_else.32969

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32970

fbeq_else.32969:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.32970:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32971

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32972

bnei_else.32971:
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
	fblt	%f0, %f1, fbgt_else.32973

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32974

fbgt_else.32973:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.32974:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32975

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32977

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32976

bnei_else.32977:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.32978:
	nop
	nop
	nop
	j	bnei_cont.32976

bnei_else.32975:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.32976:
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
	beqi	%a1, 0, bnei_else.32979

	nop
	nop
	nop
	j	bnei_cont.32980

bnei_else.32979:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.32980:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.32972:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32981

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32982

fbeq_else.32981:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.32982:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32983

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32984

bnei_else.32983:
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
	fblt	%f0, %f1, fbgt_else.32985

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32986

fbgt_else.32985:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.32986:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.32987

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.32989

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.32988

bnei_else.32989:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.32990:
	nop
	nop
	nop
	j	bnei_cont.32988

bnei_else.32987:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.32988:
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
	beqi	%a1, 0, bnei_else.32991

	nop
	nop
	nop
	j	bnei_cont.32992

bnei_else.32991:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.32992:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.32984:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.32993

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.32994

fbeq_else.32993:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.32994:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.32995

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.32996

bnei_else.32995:
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
	fblt	%f0, %f1, fbgt_else.32997

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.32998

fbgt_else.32997:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.32998:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.32999

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33001

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33000

bnei_else.33001:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33002:
	nop
	nop
	nop
	j	bnei_cont.33000

bnei_else.32999:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33000:
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
	beqi	%a0, 0, bnei_else.33003

	nop
	nop
	nop
	j	bnei_cont.33004

bnei_else.33003:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.33004:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
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

bnei_cont.32996:
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

bnei_cont.32954:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.32952:
	nop
	nop
	nop
	jr	%ra

bgti_else.32899:
	nop
	nop
	nop
	jr	%ra

setup_dirvec_constants.2880:
	lw	%v1, 0(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.33028

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
	beqi	%a3, 1, bnei_else.33029

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.33031

	flw	%f0, 494(%zero)
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
	beqi	%a0, 0, bnei_else.33033

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
	j	bnei_cont.33034

bnei_else.33033:
bnei_cont.33034:
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
	beqi	%a0, 0, bnei_else.33035

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

	flw	%f8, 464(%zero)
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
	j	bnei_cont.33036

bnei_else.33035:
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

bnei_cont.33036:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.33037

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33038

fbeq_else.33037:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.33038:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.33039

	nop
	nop
	nop
	j	bnei_cont.33040

bnei_else.33039:
	flw	%f0, 484(%zero)
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

bnei_cont.33040:
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
	j	bnei_cont.33030

bnei_else.33031:
	flw	%f0, 494(%zero)
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

	flw	%f1, 6(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33041

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33042

fbgt_else.33041:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.33042:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.33043

	flw	%f1, 460(%zero)
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
	j	bnei_cont.33044

bnei_else.33043:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.33044:
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

bnei_cont.33032:
	nop
	nop
	nop
	j	bnei_cont.33030

bnei_else.33029:
	flw	%f0, 494(%zero)
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
	fbne	%f0, %f1, fbeq_else.33045

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33046

fbeq_else.33045:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.33046:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33047

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33048

bnei_else.33047:
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
	fblt	%f0, %f1, fbgt_else.33049

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33050

fbgt_else.33049:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33050:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33051

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33053

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33052

bnei_else.33053:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33054:
	nop
	nop
	nop
	j	bnei_cont.33052

bnei_else.33051:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.33052:
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
	beqi	%a1, 0, bnei_else.33055

	nop
	nop
	nop
	j	bnei_cont.33056

bnei_else.33055:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.33056:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.33048:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.33057

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33058

fbeq_else.33057:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.33058:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33059

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33060

bnei_else.33059:
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
	fblt	%f0, %f1, fbgt_else.33061

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33062

fbgt_else.33061:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33062:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33063

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33065

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33064

bnei_else.33065:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33066:
	nop
	nop
	nop
	j	bnei_cont.33064

bnei_else.33063:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.33064:
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
	beqi	%a1, 0, bnei_else.33067

	nop
	nop
	nop
	j	bnei_cont.33068

bnei_else.33067:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.33068:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.33060:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.33069

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33070

fbeq_else.33069:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.33070:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.33071

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33072

bnei_else.33071:
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
	fblt	%f0, %f1, fbgt_else.33073

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33074

fbgt_else.33073:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33074:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33075

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33077

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33076

bnei_else.33077:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33078:
	nop
	nop
	nop
	j	bnei_cont.33076

bnei_else.33075:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33076:
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
	beqi	%a0, 0, bnei_else.33079

	nop
	nop
	nop
	j	bnei_cont.33080

bnei_else.33079:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.33080:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
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

bnei_cont.33072:
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

bnei_cont.33030:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.33028:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.33083

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
	beqi	%a2, 2, bnei_else.33084

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.33086

	nop
	nop
	nop
	j	bnei_cont.33085

bgt_else.33086:
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
	beqi	%a3, 0, bnei_else.33088

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
	j	bnei_cont.33089

bnei_else.33088:
	nop
	nop
	fmov	%f0, %f3
	nop

bnei_cont.33089:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33090

	nop
	nop
	nop
	j	bnei_cont.33091

bnei_else.33090:
	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.33091:
	fsw	%f0, 3(%a1)
	nop
	nop
	nop

bgt_cont.33087:
	nop
	nop
	nop
	j	bnei_cont.33085

bnei_else.33084:
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

bnei_cont.33085:
	nop
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	setup_startp_constants.2882

bgti_else.33083:
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
	beqi	%a0, -1, bnei_else.33093

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
	beqi	%a1, 1, bnei_else.33094

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33096

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
	beqi	%a1, 0, bnei_else.33098

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
	j	bnei_cont.33099

bnei_else.33098:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.33099:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33100

	nop
	nop
	nop
	j	bnei_cont.33101

bnei_else.33100:
	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.33101:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33102

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33103

fbgt_else.33102:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33103:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33104

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33106

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33105

bnei_else.33106:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33107:
	nop
	nop
	nop
	j	bnei_cont.33105

bnei_else.33104:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33105:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33108

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33095

bnei_else.33108:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33109:
	nop
	nop
	nop
	j	bnei_cont.33095

bnei_else.33096:
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

	flw	%f4, 494(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33110

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33111

fbgt_else.33110:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33111:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33112

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33114

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33113

bnei_else.33114:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33115:
	nop
	nop
	nop
	j	bnei_cont.33113

bnei_else.33112:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33113:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33116

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33117

bnei_else.33116:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33117:
bnei_cont.33097:
	nop
	nop
	nop
	j	bnei_cont.33095

bnei_else.33094:
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
	fblt	%f3, %f6, fbgt_else.33118

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33119

fbgt_else.33118:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33119:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33120

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
	fblt	%f3, %f4, fbgt_else.33122

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33123

fbgt_else.33122:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33123:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33124

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
	fblt	%f3, %f4, fbgt_else.33126

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33121

fbgt_else.33126:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33127:
	nop
	nop
	nop
	j	bnei_cont.33121

bnei_else.33124:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33125:
	nop
	nop
	nop
	j	bnei_cont.33121

bnei_else.33120:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33121:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33128

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33129

bnei_else.33128:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33130

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33131

bnei_else.33130:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33131:
bnei_cont.33129:
bnei_cont.33095:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33132

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33132:
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
	beqi	%a0, -1, bnei_else.33133

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
	beqi	%a1, 1, bnei_else.33134

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33136

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
	beqi	%a1, 0, bnei_else.33138

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
	j	bnei_cont.33139

bnei_else.33138:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.33139:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33140

	nop
	nop
	nop
	j	bnei_cont.33141

bnei_else.33140:
	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.33141:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33142

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33143

fbgt_else.33142:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33143:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33144

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33146

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33145

bnei_else.33146:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33147:
	nop
	nop
	nop
	j	bnei_cont.33145

bnei_else.33144:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33145:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33148

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33135

bnei_else.33148:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33149:
	nop
	nop
	nop
	j	bnei_cont.33135

bnei_else.33136:
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

	flw	%f4, 494(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33150

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33151

fbgt_else.33150:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33151:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33152

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33154

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33153

bnei_else.33154:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33155:
	nop
	nop
	nop
	j	bnei_cont.33153

bnei_else.33152:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33153:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33156

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33157

bnei_else.33156:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33157:
bnei_cont.33137:
	nop
	nop
	nop
	j	bnei_cont.33135

bnei_else.33134:
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
	fblt	%f3, %f6, fbgt_else.33158

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33159

fbgt_else.33158:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33159:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33160

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
	fblt	%f3, %f4, fbgt_else.33162

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33163

fbgt_else.33162:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33163:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33164

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
	fblt	%f3, %f4, fbgt_else.33166

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33161

fbgt_else.33166:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33167:
	nop
	nop
	nop
	j	bnei_cont.33161

bnei_else.33164:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33165:
	nop
	nop
	nop
	j	bnei_cont.33161

bnei_else.33160:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33161:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33168

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33169

bnei_else.33168:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33170

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33171

bnei_else.33170:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33171:
bnei_cont.33169:
bnei_cont.33135:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33172

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33172:
	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	check_all_inside.2907

bnei_else.33133:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33093:
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
	beqi	%a0, -1, bnei_else.33179

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
	beqi	%a3, 1, bnei_else.33180

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.33182

	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.33184

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33185

fbeq_else.33184:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33185:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33186

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33181

bnei_else.33186:
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
	beqi	%a3, 0, bnei_else.33188

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
	j	bnei_cont.33189

bnei_else.33188:
	nop
	nop
	fmov	%f1, %f9
	nop

bnei_cont.33189:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.33190

	nop
	nop
	nop
	j	bnei_cont.33191

bnei_else.33190:
	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f3
	nop

bnei_cont.33191:
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
	fblt	%f7, %f1, fbgt_else.33192

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33193

fbgt_else.33192:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33193:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33194

	lw	%a3, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33196

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
	j	bnei_cont.33197

bnei_else.33196:
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

bnei_cont.33197:
	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33195

bnei_else.33194:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33195:
bnei_cont.33187:
	nop
	nop
	nop
	j	bnei_cont.33181

bnei_else.33182:
	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.33198

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33199

fbgt_else.33198:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33199:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33200

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
	j	bnei_cont.33201

bnei_else.33200:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33201:
bnei_cont.33183:
	nop
	nop
	nop
	j	bnei_cont.33181

bnei_else.33180:
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
	fblt	%f9, %f10, fbgt_else.33202

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33203

fbgt_else.33202:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33203:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33204

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
	fblt	%f9, %f10, fbgt_else.33206

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33207

fbgt_else.33206:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33207:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33208

	flw	%f9, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f9, fbeq_else.33210

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33211

fbeq_else.33210:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33211:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33212

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33205

bnei_else.33212:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.33213:
	nop
	nop
	nop
	j	bnei_cont.33205

bnei_else.33208:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33209:
	nop
	nop
	nop
	j	bnei_cont.33205

bnei_else.33204:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33205:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33214

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
	j	bnei_cont.33215

bnei_else.33214:
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
	fblt	%f10, %f11, fbgt_else.33216

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33217

fbgt_else.33216:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33217:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33218

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
	fblt	%f10, %f11, fbgt_else.33220

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33221

fbgt_else.33220:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33221:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33222

	flw	%f10, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f10, fbeq_else.33224

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33225

fbeq_else.33224:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33225:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33226

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33219

bnei_else.33226:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.33227:
	nop
	nop
	nop
	j	bnei_cont.33219

bnei_else.33222:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33223:
	nop
	nop
	nop
	j	bnei_cont.33219

bnei_else.33218:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33219:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33228

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
	j	bnei_cont.33229

bnei_else.33228:
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
	fblt	%f1, %f7, fbgt_else.33230

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33231

fbgt_else.33230:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.33231:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33232

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
	fblt	%f1, %f3, fbgt_else.33234

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33235

fbgt_else.33234:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.33235:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33236

	flw	%f1, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f1, fbeq_else.33238

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33239

fbeq_else.33238:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.33239:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33240

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33233

bnei_else.33240:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33241:
	nop
	nop
	nop
	j	bnei_cont.33233

bnei_else.33236:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33237:
	nop
	nop
	nop
	j	bnei_cont.33233

bnei_else.33232:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33233:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33242

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
	j	bnei_cont.33243

bnei_else.33242:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33243:
bnei_cont.33229:
bnei_cont.33215:
bnei_cont.33181:
	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33244

	flw	%f3, 459(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.33246

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33245

fbgt_else.33246:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.33247:
	nop
	nop
	nop
	j	bnei_cont.33245

bnei_else.33244:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.33245:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33248

	flw	%f3, 458(%zero)
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
	beqi	%a0, -1, bnei_else.33249

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
	beqi	%a1, 1, bnei_else.33251

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.33253

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
	beqi	%a1, 0, bnei_else.33255

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
	j	bnei_cont.33256

bnei_else.33255:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.33256:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.33257

	nop
	nop
	nop
	j	bnei_cont.33258

bnei_else.33257:
	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.33258:
	lw	%a0, 6(%a0)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33259

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33260

fbgt_else.33259:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33260:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33261

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33263

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33262

bnei_else.33263:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33264:
	nop
	nop
	nop
	j	bnei_cont.33262

bnei_else.33261:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33262:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33265

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33252

bnei_else.33265:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33266:
	nop
	nop
	nop
	j	bnei_cont.33252

bnei_else.33253:
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

	flw	%f4, 494(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33267

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33268

fbgt_else.33267:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33268:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33269

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33271

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33270

bnei_else.33271:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33272:
	nop
	nop
	nop
	j	bnei_cont.33270

bnei_else.33269:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.33270:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33273

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33274

bnei_else.33273:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33274:
bnei_cont.33254:
	nop
	nop
	nop
	j	bnei_cont.33252

bnei_else.33251:
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
	fblt	%f3, %f6, fbgt_else.33275

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33276

fbgt_else.33275:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33276:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33277

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
	fblt	%f3, %f4, fbgt_else.33279

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33280

fbgt_else.33279:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33280:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33281

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
	fblt	%f3, %f4, fbgt_else.33283

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33278

fbgt_else.33283:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33284:
	nop
	nop
	nop
	j	bnei_cont.33278

bnei_else.33281:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33282:
	nop
	nop
	nop
	j	bnei_cont.33278

bnei_else.33277:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33278:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33285

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33286

bnei_else.33285:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33287

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33288

bnei_else.33287:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.33288:
bnei_cont.33286:
bnei_cont.33252:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33289

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33250

bnei_else.33289:
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

bnei_cont.33290:
	nop
	nop
	nop
	j	bnei_cont.33250

bnei_else.33249:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.33250:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33291

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33291:
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

bnei_else.33248:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.33292

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.33292:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33179:
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
	beqi	%a0, -1, bnei_else.33304

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
	beqi	%v0, 0, bnei_else.33305

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33305:
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
	beqi	%a0, -1, bnei_else.33306

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
	beqi	%v0, 0, bnei_else.33307

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33307:
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
	beqi	%a0, -1, bnei_else.33308

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
	beqi	%v0, 0, bnei_else.33309

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33309:
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
	beqi	%a0, -1, bnei_else.33310

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
	beqi	%v0, 0, bnei_else.33311

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33311:
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

bnei_else.33310:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33308:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33306:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33304:
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
	beqi	%a2, -1, bnei_else.33344

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
	beqi	%a2, 99, bnei_else.33345

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
	beqi	%t0, 1, bnei_else.33347

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.33349

	flw	%f3, 0(%a2)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.33351

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33352

fbeq_else.33351:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33352:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33353

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33348

bnei_else.33353:
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
	beqi	%t0, 0, bnei_else.33355

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
	j	bnei_cont.33356

bnei_else.33355:
	nop
	nop
	fmov	%f0, %f6
	nop

bnei_cont.33356:
	lw	%t0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.33357

	nop
	nop
	nop
	j	bnei_cont.33358

bnei_else.33357:
	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.33358:
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
	fblt	%f4, %f0, fbgt_else.33359

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33360

fbgt_else.33359:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33360:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33361

	lw	%a3, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33363

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
	j	bnei_cont.33364

bnei_else.33363:
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

bnei_cont.33364:
	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33362

bnei_else.33361:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33362:
bnei_cont.33354:
	nop
	nop
	nop
	j	bnei_cont.33348

bnei_else.33349:
	flw	%f3, 0(%a2)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33365

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33366

fbgt_else.33365:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33366:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33367

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
	j	bnei_cont.33368

bnei_else.33367:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33368:
bnei_cont.33350:
	nop
	nop
	nop
	j	bnei_cont.33348

bnei_else.33347:
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
	fblt	%f6, %f7, fbgt_else.33369

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33370

fbgt_else.33369:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33370:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33371

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
	fblt	%f6, %f7, fbgt_else.33373

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33374

fbgt_else.33373:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33374:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33375

	flw	%f6, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.33377

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33378

fbeq_else.33377:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33378:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33379

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33372

bnei_else.33379:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.33380:
	nop
	nop
	nop
	j	bnei_cont.33372

bnei_else.33375:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33376:
	nop
	nop
	nop
	j	bnei_cont.33372

bnei_else.33371:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33372:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33381

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
	j	bnei_cont.33382

bnei_else.33381:
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
	fblt	%f7, %f8, fbgt_else.33383

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33384

fbgt_else.33383:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33384:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33385

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
	fblt	%f7, %f8, fbgt_else.33387

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33388

fbgt_else.33387:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33388:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33389

	flw	%f7, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.33391

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33392

fbeq_else.33391:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33392:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33393

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33386

bnei_else.33393:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.33394:
	nop
	nop
	nop
	j	bnei_cont.33386

bnei_else.33389:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33390:
	nop
	nop
	nop
	j	bnei_cont.33386

bnei_else.33385:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33386:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33395

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
	j	bnei_cont.33396

bnei_else.33395:
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
	fblt	%f0, %f4, fbgt_else.33397

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33398

fbgt_else.33397:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33398:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33399

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
	fblt	%f0, %f1, fbgt_else.33401

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33402

fbgt_else.33401:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33402:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33403

	flw	%f0, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.33405

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33406

fbeq_else.33405:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.33406:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33407

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33400

bnei_else.33407:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.33408:
	nop
	nop
	nop
	j	bnei_cont.33400

bnei_else.33403:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33404:
	nop
	nop
	nop
	j	bnei_cont.33400

bnei_else.33399:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33400:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33409

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
	j	bnei_cont.33410

bnei_else.33409:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33410:
bnei_cont.33396:
bnei_cont.33382:
bnei_cont.33348:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33411

	flw	%f0, 135(%zero)
	flw	%f1, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33413

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33414

fbgt_else.33413:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33414:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33415

	lw	%a2, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.33417

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
	beqi	%v0, 0, bnei_else.33419

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33418

bnei_else.33419:
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
	beqi	%v1, -1, bnei_else.33421

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
	beqi	%v0, 0, bnei_else.33423

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33422

bnei_else.33423:
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
	beqi	%v1, -1, bnei_else.33425

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
	beqi	%v0, 0, bnei_else.33427

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33426

bnei_else.33427:
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

bnei_cont.33428:
	nop
	nop
	nop
	j	bnei_cont.33426

bnei_else.33425:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33426:
bnei_cont.33424:
	nop
	nop
	nop
	j	bnei_cont.33422

bnei_else.33421:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33422:
bnei_cont.33420:
	nop
	nop
	nop
	j	bnei_cont.33418

bnei_else.33417:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33418:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33429

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33346

bnei_else.33429:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33430:
	nop
	nop
	nop
	j	bnei_cont.33346

bnei_else.33415:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33416:
	nop
	nop
	nop
	j	bnei_cont.33346

bnei_else.33411:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33412:
	nop
	nop
	nop
	j	bnei_cont.33346

bnei_else.33345:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.33346:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33431

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
	beqi	%v1, -1, bnei_else.33432

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
	beqi	%v0, 0, bnei_else.33434

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33433

bnei_else.33434:
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
	beqi	%v1, -1, bnei_else.33436

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
	beqi	%v0, 0, bnei_else.33438

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33437

bnei_else.33438:
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
	beqi	%v1, -1, bnei_else.33440

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
	beqi	%v0, 0, bnei_else.33442

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33441

bnei_else.33442:
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

bnei_cont.33443:
	nop
	nop
	nop
	j	bnei_cont.33441

bnei_else.33440:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33441:
bnei_cont.33439:
	nop
	nop
	nop
	j	bnei_cont.33437

bnei_else.33436:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33437:
bnei_cont.33435:
	nop
	nop
	nop
	j	bnei_cont.33433

bnei_else.33432:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33433:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33444

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.33444:
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

bnei_else.33431:
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

bnei_else.33344:
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
	beqi	%a1, -1, bnei_else.33494

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
	sw	%a1, 0(%sp)
	fsub	%f3, %f2, %f3
	nop

	flw	%f5, 2(%t0)
	lw	%t0, 1(%a2)
	nop
	nop

	sw	%a3, 1(%sp)
	nop
	fsub	%f5, %f4, %f5
	nop

	fsw	%f4, 2(%sp)
	nop
	nop
	nop

	fsw	%f2, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	nop
	nop

	sw	%a0, 5(%sp)
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

	sw	%a2, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 1, bnei_else.33495

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.33497

	sw	%ra, 9(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a2, 0

	nop
	nop
	fmov	%f2, %f5
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 10

	nop
	nop
	nop
	jal	solver_second.2818

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
	j	bnei_cont.33496

bnei_else.33497:
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

	flw	%f8, 494(%zero)
	nop
	fadd	%f6, %f6, %f8
	nop

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.33499

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33500

fbgt_else.33499:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33500:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33501

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
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33502

bnei_else.33501:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33502:
bnei_cont.33498:
	nop
	nop
	nop
	j	bnei_cont.33496

bnei_else.33495:
	flw	%f6, 0(%a0)
	flw	%f7, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.33503

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33504

fbeq_else.33503:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33504:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33505

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33506

bnei_else.33505:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.33507

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33508

fbgt_else.33507:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.33508:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33509

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.33511

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33510

bnei_else.33511:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.33512:
	nop
	nop
	nop
	j	bnei_cont.33510

bnei_else.33509:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.33510:
	flw	%f8, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33513

	nop
	nop
	nop
	j	bnei_cont.33514

bnei_else.33513:
	nop
	nop
	fneg	%f8, %f8
	nop

bnei_cont.33514:
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
	fblt	%f9, %f10, fbgt_else.33515

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33516

fbgt_else.33515:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33516:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33517

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
	fblt	%f9, %f10, fbgt_else.33519

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33520

fbgt_else.33519:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33520:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33521

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
	j	bnei_cont.33518

bnei_else.33521:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33522:
	nop
	nop
	nop
	j	bnei_cont.33518

bnei_else.33517:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33518:
bnei_cont.33506:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33523

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33524

bnei_else.33523:
	flw	%f8, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f7, fbeq_else.33525

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33526

fbeq_else.33525:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33526:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33527

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33528

bnei_else.33527:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.33529

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33530

fbgt_else.33529:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.33530:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33531

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.33533

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33532

bnei_else.33533:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.33534:
	nop
	nop
	nop
	j	bnei_cont.33532

bnei_else.33531:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.33532:
	flw	%f9, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33535

	nop
	nop
	nop
	j	bnei_cont.33536

bnei_else.33535:
	nop
	nop
	fneg	%f9, %f9
	nop

bnei_cont.33536:
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
	fblt	%f10, %f11, fbgt_else.33537

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33538

fbgt_else.33537:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33538:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33539

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
	fblt	%f10, %f11, fbgt_else.33541

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33542

fbgt_else.33541:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33542:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33543

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
	j	bnei_cont.33540

bnei_else.33543:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33544:
	nop
	nop
	nop
	j	bnei_cont.33540

bnei_else.33539:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33540:
bnei_cont.33528:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33545

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.33546

bnei_else.33545:
	flw	%f9, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f9, %f7, fbeq_else.33547

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33548

fbeq_else.33547:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33548:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33549

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33550

bnei_else.33549:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f7, fbgt_else.33551

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33552

fbgt_else.33551:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.33552:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33553

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.33555

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33554

bnei_else.33555:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.33556:
	nop
	nop
	nop
	j	bnei_cont.33554

bnei_else.33553:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.33554:
	flw	%f7, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33557

	nop
	nop
	nop
	j	bnei_cont.33558

bnei_else.33557:
	nop
	nop
	fneg	%f7, %f7
	nop

bnei_cont.33558:
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
	fblt	%f1, %f6, fbgt_else.33559

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33560

fbgt_else.33559:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33560:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33561

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
	fblt	%f1, %f3, fbgt_else.33563

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33564

fbgt_else.33563:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33564:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33565

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
	j	bnei_cont.33562

bnei_else.33565:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33566:
	nop
	nop
	nop
	j	bnei_cont.33562

bnei_else.33561:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33562:
bnei_cont.33550:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33567

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.33568

bnei_else.33567:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33568:
bnei_cont.33546:
bnei_cont.33524:
bnei_cont.33496:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33569

	flw	%f0, 135(%zero)
	flw	%f1, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.33570

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33571

fbgt_else.33570:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.33571:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.33572

	flw	%f2, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33574

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33575

fbgt_else.33574:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.33575:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.33576

	flw	%f2, 458(%zero)
	lw	%a0, 5(%sp)
	nop
	nop

	flw	%f2, 0(%a0)
	flw	%f3, 4(%sp)
	fadd	%f0, %f0, %f2
	nop

	flw	%f4, 3(%sp)
	flw	%f5, 2(%sp)
	fmul	%f2, %f2, %f0
	nop

	flw	%f3, 1(%a0)
	lw	%v1, 6(%sp)
	fadd	%f2, %f2, %f3
	nop

	lw	%a1, 0(%v1)
	sw	%v0, 9(%sp)
	fmul	%f3, %f3, %f0
	nop

	flw	%f4, 2(%a0)
	nop
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

	fsw	%f4, 10(%sp)
	nop
	nop
	nop

	fsw	%f3, 11(%sp)
	nop
	nop
	nop

	fsw	%f2, 12(%sp)
	nop
	nop
	nop

	fsw	%f0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.33578

	lw	%a1, 12(%a1)
	nop
	nop
	nop

	lw	%a2, 5(%a1)
	nop
	nop
	nop

	flw	%f5, 0(%a2)
	lw	%a2, 5(%a1)
	nop
	nop

	flw	%f6, 1(%a2)
	lw	%a2, 5(%a1)
	fsub	%f5, %f2, %f5
	nop

	flw	%f7, 2(%a2)
	lw	%a2, 1(%a1)
	fsub	%f6, %f3, %f6
	nop

	nop
	nop
	fsub	%f7, %f4, %f7
	nop

	nop
	nop
	nop
	beqi	%a2, 1, bnei_else.33580

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33582

	lw	%a2, 4(%a1)
	nop
	fmul	%f8, %f5, %f5
	nop

	flw	%f9, 0(%a2)
	lw	%a2, 4(%a1)
	nop
	nop

	flw	%f10, 1(%a2)
	lw	%a2, 4(%a1)
	fmul	%f8, %f8, %f9
	fmul	%f9, %f6, %f6

	flw	%f10, 2(%a2)
	lw	%a2, 3(%a1)
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
	beqi	%a2, 0, bnei_else.33584

	lw	%a2, 9(%a1)
	nop
	fmul	%f9, %f6, %f7
	fmul	%f7, %f7, %f5

	flw	%f10, 0(%a2)
	lw	%a2, 9(%a1)
	fmul	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f9, %f9, %f10
	nop

	flw	%f9, 1(%a2)
	lw	%a2, 9(%a1)
	fadd	%f8, %f8, %f9
	nop

	flw	%f6, 2(%a2)
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
	j	bnei_cont.33585

bnei_else.33584:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.33585:
	lw	%a2, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.33586

	nop
	nop
	nop
	j	bnei_cont.33587

bnei_else.33586:
	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.33587:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.33588

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33589

fbgt_else.33588:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33589:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33590

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33592

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33591

bnei_else.33592:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33593:
	nop
	nop
	nop
	j	bnei_cont.33591

bnei_else.33590:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.33591:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33594

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33581

bnei_else.33594:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33595:
	nop
	nop
	nop
	j	bnei_cont.33581

bnei_else.33582:
	lw	%a2, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	flw	%f8, 0(%a2)
	nop
	nop
	nop

	flw	%f8, 1(%a2)
	nop
	fmul	%f5, %f8, %f5
	nop

	nop
	nop
	fmul	%f6, %f8, %f6
	nop

	flw	%f6, 2(%a2)
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
	fblt	%f5, %f1, fbgt_else.33596

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33597

fbgt_else.33596:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33597:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33598

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33600

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33599

bnei_else.33600:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33601:
	nop
	nop
	nop
	j	bnei_cont.33599

bnei_else.33598:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.33599:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33602

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33603

bnei_else.33602:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33603:
bnei_cont.33583:
	nop
	nop
	nop
	j	bnei_cont.33581

bnei_else.33580:
	lw	%a2, 4(%a1)
	nop
	fabs	%f1, %f5
	nop

	flw	%f5, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.33604

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33605

fbgt_else.33604:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33605:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33606

	lw	%a2, 4(%a1)
	nop
	fabs	%f1, %f6
	nop

	flw	%f5, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.33608

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33609

fbgt_else.33608:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33609:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33610

	lw	%a2, 4(%a1)
	nop
	fabs	%f1, %f7
	nop

	flw	%f5, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.33612

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33607

fbgt_else.33612:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.33613:
	nop
	nop
	nop
	j	bnei_cont.33607

bnei_else.33610:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33611:
	nop
	nop
	nop
	j	bnei_cont.33607

bnei_else.33606:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.33607:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.33614

	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33615

bnei_else.33614:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33616

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33617

bnei_else.33616:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33617:
bnei_cont.33615:
bnei_cont.33581:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33618

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33579

bnei_else.33618:
	lw	%a1, 1(%sp)
	sw	%ra, 14(%sp)
	fmov	%f1, %f3
	fmov	%f0, %f2

	nop
	nop
	addi	%v0, %a1, 0
	fmov	%f2, %f4

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	check_all_inside.2907

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

bnei_cont.33619:
	nop
	nop
	nop
	j	bnei_cont.33579

bnei_else.33578:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.33579:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33620

	flw	%f0, 13(%sp)
	lw	%v0, 0(%sp)
	nop
	nop

	fsw	%f0, 137(%zero)
	flw	%f0, 12(%sp)
	nop
	nop

	fsw	%f0, 138(%zero)
	flw	%f0, 11(%sp)
	nop
	nop

	fsw	%f0, 139(%zero)
	flw	%f0, 10(%sp)
	nop
	nop

	fsw	%f0, 140(%zero)
	nop
	nop
	nop

	sw	%v0, 141(%zero)
	lw	%v0, 9(%sp)
	nop
	nop

	sw	%v0, 136(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.33573

bnei_else.33620:
bnei_cont.33621:
	nop
	nop
	nop
	j	bnei_cont.33573

bnei_else.33576:
bnei_cont.33577:
	nop
	nop
	nop
	j	bnei_cont.33573

bnei_else.33572:
bnei_cont.33573:
	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.33569:
	lw	%v0, 8(%sp)
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
	beqi	%v0, 0, bnei_else.33622

	lw	%v0, 7(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 5(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.33622:
	nop
	nop
	nop
	jr	%ra

bnei_else.33494:
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
	beqi	%a1, -1, bnei_else.33657

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
	beqi	%a0, -1, bnei_else.33658

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
	beqi	%a0, -1, bnei_else.33659

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
	beqi	%a0, -1, bnei_else.33660

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
	beqi	%a0, -1, bnei_else.33661

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
	beqi	%a0, -1, bnei_else.33662

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
	beqi	%a0, -1, bnei_else.33663

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
	beqi	%a0, -1, bnei_else.33664

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

bnei_else.33664:
	nop
	nop
	nop
	jr	%ra

bnei_else.33663:
	nop
	nop
	nop
	jr	%ra

bnei_else.33662:
	nop
	nop
	nop
	jr	%ra

bnei_else.33661:
	nop
	nop
	nop
	jr	%ra

bnei_else.33660:
	nop
	nop
	nop
	jr	%ra

bnei_else.33659:
	nop
	nop
	nop
	jr	%ra

bnei_else.33658:
	nop
	nop
	nop
	jr	%ra

bnei_else.33657:
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
	beqi	%a3, -1, bnei_else.33796

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
	beqi	%a3, 99, bnei_else.33797

	lw	%a3, 12(%a3)
	flw	%f0, 159(%zero)
	nop
	nop

	lw	%t0, 5(%a3)
	sw	%a1, 4(%sp)
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
	beqi	%t0, 1, bnei_else.33799

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.33801

	sw	%ra, 5(%sp)
	nop
	addi	%v1, %a0, 0
	addi	%v0, %a3, 0

	nop
	nop
	addi	%sp, %sp, 6
	nop

	nop
	nop
	nop
	jal	solver_second.2818

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
	j	bnei_cont.33800

bnei_else.33801:
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

	flw	%f5, 494(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.33803

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33804

fbgt_else.33803:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33804:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33805

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
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33806

bnei_else.33805:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33806:
bnei_cont.33802:
	nop
	nop
	nop
	j	bnei_cont.33800

bnei_else.33799:
	flw	%f3, 0(%a0)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.33807

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33808

fbeq_else.33807:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33808:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33809

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33810

bnei_else.33809:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33811

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33812

fbgt_else.33811:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.33812:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33813

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.33815

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33814

bnei_else.33815:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.33816:
	nop
	nop
	nop
	j	bnei_cont.33814

bnei_else.33813:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.33814:
	flw	%f5, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33817

	nop
	nop
	nop
	j	bnei_cont.33818

bnei_else.33817:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.33818:
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
	fblt	%f6, %f7, fbgt_else.33819

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33820

fbgt_else.33819:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33820:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33821

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
	fblt	%f6, %f7, fbgt_else.33823

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33824

fbgt_else.33823:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33824:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33825

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
	j	bnei_cont.33822

bnei_else.33825:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33826:
	nop
	nop
	nop
	j	bnei_cont.33822

bnei_else.33821:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33822:
bnei_cont.33810:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33827

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33828

bnei_else.33827:
	flw	%f5, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.33829

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33830

fbeq_else.33829:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33830:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33831

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33832

bnei_else.33831:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.33833

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33834

fbgt_else.33833:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.33834:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33835

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.33837

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33836

bnei_else.33837:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.33838:
	nop
	nop
	nop
	j	bnei_cont.33836

bnei_else.33835:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.33836:
	flw	%f6, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33839

	nop
	nop
	nop
	j	bnei_cont.33840

bnei_else.33839:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.33840:
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
	fblt	%f7, %f8, fbgt_else.33841

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33842

fbgt_else.33841:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33842:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33843

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
	fblt	%f7, %f8, fbgt_else.33845

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33846

fbgt_else.33845:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33846:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33847

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
	j	bnei_cont.33844

bnei_else.33847:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33848:
	nop
	nop
	nop
	j	bnei_cont.33844

bnei_else.33843:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.33844:
bnei_cont.33832:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33849

	nop
	nop
	addi	%v0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.33850

bnei_else.33849:
	flw	%f6, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.33851

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33852

fbeq_else.33851:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.33852:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33853

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33854

bnei_else.33853:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.33855

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33856

fbgt_else.33855:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33856:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33857

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33859

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33858

bnei_else.33859:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.33860:
	nop
	nop
	nop
	j	bnei_cont.33858

bnei_else.33857:
	nop
	nop
	add	%a3, %zero, %t1
	nop

bnei_cont.33858:
	flw	%f4, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33861

	nop
	nop
	nop
	j	bnei_cont.33862

bnei_else.33861:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.33862:
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
	fblt	%f0, %f3, fbgt_else.33863

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33864

fbgt_else.33863:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33864:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33865

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
	fblt	%f0, %f1, fbgt_else.33867

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33868

fbgt_else.33867:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33868:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33869

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
	j	bnei_cont.33866

bnei_else.33869:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33870:
	nop
	nop
	nop
	j	bnei_cont.33866

bnei_else.33865:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33866:
bnei_cont.33854:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33871

	nop
	nop
	addi	%v0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.33872

bnei_else.33871:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.33872:
bnei_cont.33850:
bnei_cont.33828:
bnei_cont.33800:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33873

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33875

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33876

fbgt_else.33875:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.33876:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.33877

	lw	%v0, 4(%sp)
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
	beqi	%v1, -1, bnei_else.33879

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

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.33881

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
	beqi	%v1, -1, bnei_else.33883

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
	beqi	%v1, -1, bnei_else.33885

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
	beqi	%v1, -1, bnei_else.33887

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
	beqi	%v1, -1, bnei_else.33889

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
	beqi	%v1, -1, bnei_else.33891

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
	j	bnei_cont.33798

bnei_else.33891:
bnei_cont.33892:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33889:
bnei_cont.33890:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33887:
bnei_cont.33888:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33885:
bnei_cont.33886:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33883:
bnei_cont.33884:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33881:
bnei_cont.33882:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33879:
bnei_cont.33880:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33877:
bnei_cont.33878:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33873:
bnei_cont.33874:
	nop
	nop
	nop
	j	bnei_cont.33798

bnei_else.33797:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.33893

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
	beqi	%v1, -1, bnei_else.33895

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
	beqi	%v1, -1, bnei_else.33897

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
	beqi	%v1, -1, bnei_else.33899

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
	beqi	%v1, -1, bnei_else.33901

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
	beqi	%v1, -1, bnei_else.33903

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
	beqi	%v1, -1, bnei_else.33905

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
	j	bnei_cont.33894

bnei_else.33905:
bnei_cont.33906:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33903:
bnei_cont.33904:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33901:
bnei_cont.33902:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33899:
bnei_cont.33900:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33897:
bnei_cont.33898:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33895:
bnei_cont.33896:
	nop
	nop
	nop
	j	bnei_cont.33894

bnei_else.33893:
bnei_cont.33894:
bnei_cont.33798:
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
	beqi	%a1, -1, bnei_else.33907

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.33908

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
	beqi	%a2, 1, bnei_else.33910

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.33912

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
	beqi	%a3, 0, bnei_else.33914

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
	j	bnei_cont.33915

bnei_else.33914:
bnei_cont.33915:
	flw	%f7, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.33916

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33917

fbeq_else.33916:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33917:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33918

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33911

bnei_else.33918:
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
	beqi	%a3, 0, bnei_else.33920

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

	flw	%f4, 464(%zero)
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
	j	bnei_cont.33921

bnei_else.33920:
	nop
	nop
	fmov	%f3, %f8
	nop

bnei_cont.33921:
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
	beqi	%a3, 0, bnei_else.33922

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
	j	bnei_cont.33923

bnei_else.33922:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.33923:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.33924

	nop
	nop
	nop
	j	bnei_cont.33925

bnei_else.33924:
	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.33925:
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
	fblt	%f7, %f0, fbgt_else.33926

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33927

fbgt_else.33926:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33927:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33928

	lw	%a1, 6(%a1)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33930

	nop
	nop
	nop
	j	bnei_cont.33931

bnei_else.33930:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.33931:
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
	j	bnei_cont.33929

bnei_else.33928:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33929:
bnei_cont.33919:
	nop
	nop
	nop
	j	bnei_cont.33911

bnei_else.33912:
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

	flw	%f5, 494(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.33932

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33933

fbgt_else.33932:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33933:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33934

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
	j	bnei_cont.33935

bnei_else.33934:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33935:
bnei_cont.33913:
	nop
	nop
	nop
	j	bnei_cont.33911

bnei_else.33910:
	lw	%a2, 0(%sp)
	flw	%f4, 494(%zero)
	nop
	nop

	flw	%f3, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.33936

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33937

fbeq_else.33936:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33937:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33938

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33939

bnei_else.33938:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.33940

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33941

fbgt_else.33940:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33941:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33942

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33944

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33943

bnei_else.33944:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.33945:
	nop
	nop
	nop
	j	bnei_cont.33943

bnei_else.33942:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.33943:
	flw	%f5, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33946

	nop
	nop
	nop
	j	bnei_cont.33947

bnei_else.33946:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.33947:
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
	fblt	%f6, %f7, fbgt_else.33948

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33949

fbgt_else.33948:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33949:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33950

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
	fblt	%f6, %f7, fbgt_else.33952

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33953

fbgt_else.33952:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33953:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33954

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
	j	bnei_cont.33951

bnei_else.33954:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33955:
	nop
	nop
	nop
	j	bnei_cont.33951

bnei_else.33950:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33951:
bnei_cont.33939:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33956

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.33957

bnei_else.33956:
	flw	%f5, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.33958

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33959

fbeq_else.33958:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33959:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33960

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33961

bnei_else.33960:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.33962

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33963

fbgt_else.33962:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.33963:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33964

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.33966

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33965

bnei_else.33966:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.33967:
	nop
	nop
	nop
	j	bnei_cont.33965

bnei_else.33964:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.33965:
	flw	%f6, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33968

	nop
	nop
	nop
	j	bnei_cont.33969

bnei_else.33968:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.33969:
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
	fblt	%f7, %f8, fbgt_else.33970

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33971

fbgt_else.33970:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33971:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33972

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
	fblt	%f7, %f8, fbgt_else.33974

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33975

fbgt_else.33974:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.33975:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33976

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
	j	bnei_cont.33973

bnei_else.33976:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33977:
	nop
	nop
	nop
	j	bnei_cont.33973

bnei_else.33972:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.33973:
bnei_cont.33961:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33978

	nop
	nop
	addi	%a1, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.33979

bnei_else.33978:
	flw	%f6, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.33980

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.33981

fbeq_else.33980:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.33981:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.33982

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33983

bnei_else.33982:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.33984

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33985

fbgt_else.33984:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.33985:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33986

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.33988

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.33987

bnei_else.33988:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.33989:
	nop
	nop
	nop
	j	bnei_cont.33987

bnei_else.33986:
	nop
	nop
	add	%a1, %zero, %t0
	nop

bnei_cont.33987:
	flw	%f4, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33990

	nop
	nop
	nop
	j	bnei_cont.33991

bnei_else.33990:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.33991:
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
	fblt	%f0, %f3, fbgt_else.33992

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33993

fbgt_else.33992:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33993:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33994

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
	fblt	%f0, %f1, fbgt_else.33996

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.33997

fbgt_else.33996:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.33997:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.33998

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
	j	bnei_cont.33995

bnei_else.33998:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33999:
	nop
	nop
	nop
	j	bnei_cont.33995

bnei_else.33994:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.33995:
bnei_cont.33983:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34000

	nop
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.34001

bnei_else.34000:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.34001:
bnei_cont.33979:
bnei_cont.33957:
bnei_cont.33911:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34002

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34004

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34005

fbgt_else.34004:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.34005:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34006

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.34008

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
	beqi	%v1, -1, bnei_else.34010

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
	beqi	%v1, -1, bnei_else.34012

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
	beqi	%v1, -1, bnei_else.34014

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
	beqi	%v1, -1, bnei_else.34016

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
	beqi	%v1, -1, bnei_else.34018

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
	j	bnei_cont.33909

bnei_else.34018:
bnei_cont.34019:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34016:
bnei_cont.34017:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34014:
bnei_cont.34015:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34012:
bnei_cont.34013:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34010:
bnei_cont.34011:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34008:
bnei_cont.34009:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34006:
bnei_cont.34007:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.34002:
bnei_cont.34003:
	nop
	nop
	nop
	j	bnei_cont.33909

bnei_else.33908:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.34020

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
	beqi	%v1, -1, bnei_else.34022

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
	beqi	%v1, -1, bnei_else.34024

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
	beqi	%v1, -1, bnei_else.34026

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
	beqi	%v1, -1, bnei_else.34028

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
	beqi	%v1, -1, bnei_else.34030

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
	j	bnei_cont.34021

bnei_else.34030:
bnei_cont.34031:
	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34028:
bnei_cont.34029:
	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34026:
bnei_cont.34027:
	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34024:
bnei_cont.34025:
	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34022:
bnei_cont.34023:
	nop
	nop
	nop
	j	bnei_cont.34021

bnei_else.34020:
bnei_cont.34021:
bnei_cont.33909:
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

bnei_else.33907:
	nop
	nop
	nop
	jr	%ra

bnei_else.33796:
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
	beqi	%a2, -1, bnei_else.34068

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
	beqi	%t3, 1, bnei_else.34069

	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.34071

	flw	%f3, 0(%t2)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.34073

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34074

fbeq_else.34073:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.34074:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34075

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34070

bnei_else.34075:
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
	fblt	%f4, %f1, fbgt_else.34077

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34078

fbgt_else.34077:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.34078:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34079

	lw	%t0, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34081

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
	j	bnei_cont.34082

bnei_else.34081:
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

bnei_cont.34082:
	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.34080

bnei_else.34079:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34080:
bnei_cont.34076:
	nop
	nop
	nop
	j	bnei_cont.34070

bnei_else.34071:
	flw	%f0, 0(%t2)
	flw	%f1, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34083

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34084

fbgt_else.34083:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.34084:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34085

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
	j	bnei_cont.34086

bnei_else.34085:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34086:
bnei_cont.34072:
	nop
	nop
	nop
	j	bnei_cont.34070

bnei_else.34069:
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
	fblt	%f6, %f7, fbgt_else.34087

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34088

fbgt_else.34087:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.34088:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34089

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
	fblt	%f6, %f7, fbgt_else.34091

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34092

fbgt_else.34091:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.34092:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34093

	flw	%f6, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.34095

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34096

fbeq_else.34095:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.34096:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34097

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34090

bnei_else.34097:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.34098:
	nop
	nop
	nop
	j	bnei_cont.34090

bnei_else.34093:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.34094:
	nop
	nop
	nop
	j	bnei_cont.34090

bnei_else.34089:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.34090:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34099

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
	j	bnei_cont.34100

bnei_else.34099:
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
	fblt	%f7, %f8, fbgt_else.34101

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34102

fbgt_else.34101:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.34102:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.34103

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
	fblt	%f7, %f8, fbgt_else.34105

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34106

fbgt_else.34105:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.34106:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34107

	flw	%f7, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.34109

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34110

fbeq_else.34109:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.34110:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34111

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34104

bnei_else.34111:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.34112:
	nop
	nop
	nop
	j	bnei_cont.34104

bnei_else.34107:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34108:
	nop
	nop
	nop
	j	bnei_cont.34104

bnei_else.34103:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34104:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34113

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
	j	bnei_cont.34114

bnei_else.34113:
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
	fblt	%f0, %f4, fbgt_else.34115

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34116

fbgt_else.34115:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.34116:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34117

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
	fblt	%f0, %f1, fbgt_else.34119

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34120

fbgt_else.34119:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.34120:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34121

	flw	%f0, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.34123

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34124

fbeq_else.34123:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.34124:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34125

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34118

bnei_else.34125:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.34126:
	nop
	nop
	nop
	j	bnei_cont.34118

bnei_else.34121:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34122:
	nop
	nop
	nop
	j	bnei_cont.34118

bnei_else.34117:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34118:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34127

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
	j	bnei_cont.34128

bnei_else.34127:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.34128:
bnei_cont.34114:
bnei_cont.34100:
bnei_cont.34070:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34129

	flw	%f0, 135(%zero)
	flw	%f1, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34130

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34131

fbgt_else.34130:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34131:
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
	beqi	%a3, 0, bnei_else.34132

	flw	%f2, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34134

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34135

fbgt_else.34134:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34135:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34136

	flw	%f2, 458(%zero)
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
	beqi	%a1, -1, bnei_else.34138

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
	beqi	%a3, 1, bnei_else.34140

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.34142

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
	beqi	%a3, 0, bnei_else.34144

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
	j	bnei_cont.34145

bnei_else.34144:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.34145:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.34146

	nop
	nop
	nop
	j	bnei_cont.34147

bnei_else.34146:
	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.34147:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.34148

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34149

fbgt_else.34148:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34149:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34150

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34152

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34151

bnei_else.34152:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.34153:
	nop
	nop
	nop
	j	bnei_cont.34151

bnei_else.34150:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.34151:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34154

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34141

bnei_else.34154:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.34155:
	nop
	nop
	nop
	j	bnei_cont.34141

bnei_else.34142:
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
	fblt	%f5, %f1, fbgt_else.34156

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34157

fbgt_else.34156:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34157:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34158

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34160

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34159

bnei_else.34160:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.34161:
	nop
	nop
	nop
	j	bnei_cont.34159

bnei_else.34158:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.34159:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34162

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34163

bnei_else.34162:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.34163:
bnei_cont.34143:
	nop
	nop
	nop
	j	bnei_cont.34141

bnei_else.34140:
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
	fblt	%f1, %f5, fbgt_else.34164

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34165

fbgt_else.34164:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34165:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34166

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
	fblt	%f1, %f5, fbgt_else.34168

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34169

fbgt_else.34168:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34169:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34170

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
	fblt	%f1, %f5, fbgt_else.34172

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34167

fbgt_else.34172:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34173:
	nop
	nop
	nop
	j	bnei_cont.34167

bnei_else.34170:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34171:
	nop
	nop
	nop
	j	bnei_cont.34167

bnei_else.34166:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34167:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34174

	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34175

bnei_else.34174:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34176

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34177

bnei_else.34176:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.34177:
bnei_cont.34175:
bnei_cont.34141:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34178

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34139

bnei_else.34178:
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

bnei_cont.34179:
	nop
	nop
	nop
	j	bnei_cont.34139

bnei_else.34138:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34139:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34180

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
	j	bnei_cont.34133

bnei_else.34180:
bnei_cont.34181:
	nop
	nop
	nop
	j	bnei_cont.34133

bnei_else.34136:
bnei_cont.34137:
	nop
	nop
	nop
	j	bnei_cont.34133

bnei_else.34132:
bnei_cont.34133:
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

bnei_else.34129:
	lw	%a1, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34182

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.34182:
	nop
	nop
	nop
	jr	%ra

bnei_else.34068:
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
	beqi	%a1, -1, bnei_else.34217

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
	beqi	%a0, -1, bnei_else.34218

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
	beqi	%a0, -1, bnei_else.34219

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
	beqi	%a0, -1, bnei_else.34220

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
	beqi	%a0, -1, bnei_else.34221

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
	beqi	%a0, -1, bnei_else.34222

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
	beqi	%a0, -1, bnei_else.34223

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
	beqi	%a0, -1, bnei_else.34224

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

bnei_else.34224:
	nop
	nop
	nop
	jr	%ra

bnei_else.34223:
	nop
	nop
	nop
	jr	%ra

bnei_else.34222:
	nop
	nop
	nop
	jr	%ra

bnei_else.34221:
	nop
	nop
	nop
	jr	%ra

bnei_else.34220:
	nop
	nop
	nop
	jr	%ra

bnei_else.34219:
	nop
	nop
	nop
	jr	%ra

bnei_else.34218:
	nop
	nop
	nop
	jr	%ra

bnei_else.34217:
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
	beqi	%a3, -1, bnei_else.34348

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
	beqi	%a3, 99, bnei_else.34349

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
	beqi	%t2, 1, bnei_else.34351

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.34353

	flw	%f3, 0(%a3)
	flw	%f4, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.34355

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34356

fbeq_else.34355:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.34356:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34357

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34352

bnei_else.34357:
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
	fblt	%f4, %f1, fbgt_else.34359

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34360

fbgt_else.34359:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.34360:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.34361

	lw	%t0, 6(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34363

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
	j	bnei_cont.34364

bnei_else.34363:
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

bnei_cont.34364:
	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.34362

bnei_else.34361:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34362:
bnei_cont.34358:
	nop
	nop
	nop
	j	bnei_cont.34352

bnei_else.34353:
	flw	%f0, 0(%a3)
	flw	%f1, 494(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34365

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34366

fbgt_else.34365:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34366:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34367

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
	j	bnei_cont.34368

bnei_else.34367:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34368:
bnei_cont.34354:
	nop
	nop
	nop
	j	bnei_cont.34352

bnei_else.34351:
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
	fblt	%f6, %f7, fbgt_else.34369

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34370

fbgt_else.34369:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.34370:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34371

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
	fblt	%f6, %f7, fbgt_else.34373

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34374

fbgt_else.34373:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.34374:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34375

	flw	%f6, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.34377

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34378

fbeq_else.34377:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.34378:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34379

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34372

bnei_else.34379:
	nop
	nop
	addi	%t2, %zero, 1
	nop

bnei_cont.34380:
	nop
	nop
	nop
	j	bnei_cont.34372

bnei_else.34375:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.34376:
	nop
	nop
	nop
	j	bnei_cont.34372

bnei_else.34371:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.34372:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34381

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
	j	bnei_cont.34382

bnei_else.34381:
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
	fblt	%f7, %f8, fbgt_else.34383

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34384

fbgt_else.34383:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.34384:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.34385

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
	fblt	%f7, %f8, fbgt_else.34387

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34388

fbgt_else.34387:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.34388:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.34389

	flw	%f7, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.34391

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34392

fbeq_else.34391:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.34392:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.34393

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34386

bnei_else.34393:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.34394:
	nop
	nop
	nop
	j	bnei_cont.34386

bnei_else.34389:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.34390:
	nop
	nop
	nop
	j	bnei_cont.34386

bnei_else.34385:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.34386:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.34395

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
	j	bnei_cont.34396

bnei_else.34395:
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
	fblt	%f0, %f4, fbgt_else.34397

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34398

fbgt_else.34397:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34398:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34399

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
	fblt	%f0, %f1, fbgt_else.34401

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34402

fbgt_else.34401:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34402:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34403

	flw	%f0, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.34405

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34406

fbeq_else.34405:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.34406:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34407

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34400

bnei_else.34407:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.34408:
	nop
	nop
	nop
	j	bnei_cont.34400

bnei_else.34403:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34404:
	nop
	nop
	nop
	j	bnei_cont.34400

bnei_else.34399:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34400:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34409

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
	j	bnei_cont.34410

bnei_else.34409:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.34410:
bnei_cont.34396:
bnei_cont.34382:
bnei_cont.34352:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34411

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34413

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34414

fbgt_else.34413:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34414:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34415

	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.34417

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
	beqi	%v1, -1, bnei_else.34419

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
	beqi	%v1, -1, bnei_else.34421

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
	beqi	%v1, -1, bnei_else.34423

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
	beqi	%v1, -1, bnei_else.34425

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
	beqi	%v1, -1, bnei_else.34427

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
	beqi	%v1, -1, bnei_else.34429

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
	j	bnei_cont.34350

bnei_else.34429:
bnei_cont.34430:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34427:
bnei_cont.34428:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34425:
bnei_cont.34426:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34423:
bnei_cont.34424:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34421:
bnei_cont.34422:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34419:
bnei_cont.34420:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34417:
bnei_cont.34418:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34415:
bnei_cont.34416:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34411:
bnei_cont.34412:
	nop
	nop
	nop
	j	bnei_cont.34350

bnei_else.34349:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.34431

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
	beqi	%v1, -1, bnei_else.34433

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
	beqi	%v1, -1, bnei_else.34435

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
	beqi	%v1, -1, bnei_else.34437

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
	beqi	%v1, -1, bnei_else.34439

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
	beqi	%v1, -1, bnei_else.34441

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
	beqi	%v1, -1, bnei_else.34443

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
	j	bnei_cont.34432

bnei_else.34443:
bnei_cont.34444:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34441:
bnei_cont.34442:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34439:
bnei_cont.34440:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34437:
bnei_cont.34438:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34435:
bnei_cont.34436:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34433:
bnei_cont.34434:
	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34431:
bnei_cont.34432:
bnei_cont.34350:
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
	beqi	%a1, -1, bnei_else.34445

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.34446

	lw	%a2, 0(%sp)
	sw	%a0, 6(%sp)
	addi	%v0, %a1, 0
	nop

	sw	%ra, 7(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	solver_fast2.2865

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
	beqi	%v0, 0, bnei_else.34448

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34450

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34451

fbgt_else.34450:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34451:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34452

	lw	%v0, 6(%sp)
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
	beqi	%v1, -1, bnei_else.34454

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

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.34456

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
	beqi	%v1, -1, bnei_else.34458

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
	beqi	%v1, -1, bnei_else.34460

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
	beqi	%v1, -1, bnei_else.34462

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
	beqi	%v1, -1, bnei_else.34464

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
	j	bnei_cont.34447

bnei_else.34464:
bnei_cont.34465:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34462:
bnei_cont.34463:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34460:
bnei_cont.34461:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34458:
bnei_cont.34459:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34456:
bnei_cont.34457:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34454:
bnei_cont.34455:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34452:
bnei_cont.34453:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34448:
bnei_cont.34449:
	nop
	nop
	nop
	j	bnei_cont.34447

bnei_else.34446:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.34466

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
	beqi	%v1, -1, bnei_else.34468

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
	beqi	%v1, -1, bnei_else.34470

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
	beqi	%v1, -1, bnei_else.34472

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
	beqi	%v1, -1, bnei_else.34474

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
	beqi	%v1, -1, bnei_else.34476

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
	j	bnei_cont.34467

bnei_else.34476:
bnei_cont.34477:
	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34474:
bnei_cont.34475:
	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34472:
bnei_cont.34473:
	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34470:
bnei_cont.34471:
	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34468:
bnei_cont.34469:
	nop
	nop
	nop
	j	bnei_cont.34467

bnei_else.34466:
bnei_cont.34467:
bnei_cont.34447:
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

bnei_else.34445:
	nop
	nop
	nop
	jr	%ra

bnei_else.34348:
	nop
	nop
	nop
	jr	%ra

utexture.2959:
	lw	%a0, 0(%v0)
	lw	%a1, 8(%v0)
	nop
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
	beqi	%a0, 1, bnei_else.34579

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34580

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.34581

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.34582

	nop
	nop
	nop
	jr	%ra

bnei_else.34582:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 4(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a0)
	lw	%a0, 4(%v0)
	fsqrt	%f1, %f1
	nop

	flw	%f1, 2(%v1)
	flw	%f4, 456(%zero)
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a0)
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
	fblt	%f3, %f4, fbgt_else.34584

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34585

fbgt_else.34584:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.34585:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34586

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34587

bnei_else.34586:
	flw	%f1, 494(%zero)
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
	fblt	%f0, %f1, fbgt_else.34588

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34589

fbgt_else.34588:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbgt_cont.34589:
	flw	%f3, 493(%zero)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.34590

	flw	%f0, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34592

	flw	%f0, 483(%zero)
	flw	%f3, 484(%zero)
	nop
	nop

	flw	%f7, 492(%zero)
	flw	%f8, 491(%zero)
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

	flw	%f8, 490(%zero)
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

	flw	%f8, 489(%zero)
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

	flw	%f8, 488(%zero)
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

	flw	%f7, 487(%zero)
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
	j	fbgt_cont.34593

fbgt_else.34592:
	flw	%f0, 485(%zero)
	flw	%f3, 484(%zero)
	nop
	nop

	flw	%f7, 492(%zero)
	flw	%f8, 491(%zero)
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

	flw	%f8, 490(%zero)
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

	flw	%f8, 489(%zero)
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

	flw	%f8, 488(%zero)
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

	flw	%f7, 487(%zero)
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

fbgt_cont.34593:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34594

	nop
	nop
	nop
	j	fbgt_cont.34591

bnei_else.34594:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34595:
	nop
	nop
	nop
	j	fbgt_cont.34591

fbgt_else.34590:
	flw	%f6, 492(%zero)
	flw	%f7, 491(%zero)
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

	flw	%f7, 490(%zero)
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

	flw	%f7, 489(%zero)
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

	flw	%f7, 488(%zero)
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

	flw	%f6, 487(%zero)
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

fbgt_cont.34591:
	flw	%f1, 454(%zero)
	nop
	nop
	nop

	flw	%f1, 453(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

bnei_cont.34587:
	nop
	nop
	floor	%f1, %f0
	nop

	flw	%f1, 1(%v1)
	lw	%v1, 5(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f3, 1(%v1)
	lw	%v0, 4(%v0)
	nop
	nop

	flw	%f3, 1(%v0)
	nop
	fsub	%f1, %f1, %f3
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
	fblt	%f3, %f4, fbgt_else.34596

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34597

fbgt_else.34596:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34597:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34598

	flw	%f1, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34599

bnei_else.34598:
	flw	%f2, 494(%zero)
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
	fblt	%f1, %f2, fbgt_else.34600

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34601

fbgt_else.34600:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.34601:
	flw	%f3, 493(%zero)
	nop
	fabs	%f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.34602

	flw	%f1, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.34604

	flw	%f1, 483(%zero)
	flw	%f3, 484(%zero)
	nop
	nop

	flw	%f6, 492(%zero)
	flw	%f7, 491(%zero)
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

	flw	%f7, 490(%zero)
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

	flw	%f7, 489(%zero)
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

	flw	%f7, 488(%zero)
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

	flw	%f6, 487(%zero)
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
	j	fbgt_cont.34605

fbgt_else.34604:
	flw	%f1, 485(%zero)
	flw	%f3, 484(%zero)
	nop
	nop

	flw	%f6, 492(%zero)
	flw	%f7, 491(%zero)
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

	flw	%f7, 490(%zero)
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

	flw	%f7, 489(%zero)
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

	flw	%f7, 488(%zero)
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

	flw	%f6, 487(%zero)
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

fbgt_cont.34605:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34606

	nop
	nop
	nop
	j	fbgt_cont.34603

bnei_else.34606:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.34607:
	nop
	nop
	nop
	j	fbgt_cont.34603

fbgt_else.34602:
	flw	%f5, 492(%zero)
	flw	%f6, 491(%zero)
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

	flw	%f6, 490(%zero)
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

	flw	%f6, 489(%zero)
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

	flw	%f6, 488(%zero)
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

	flw	%f5, 487(%zero)
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

fbgt_cont.34603:
	flw	%f2, 454(%zero)
	nop
	nop
	nop

	flw	%f2, 453(%zero)
	nop
	fmul	%f1, %f1, %f2
	nop

	nop
	nop
	fdiv	%f1, %f1, %f2
	nop

bnei_cont.34599:
	flw	%f3, 464(%zero)
	nop
	floor	%f2, %f1
	nop

	flw	%f2, 452(%zero)
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

	flw	%f1, 494(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34608

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34609

fbgt_else.34608:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34609:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34610

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.34611

bnei_else.34610:
bnei_cont.34611:
	flw	%f1, 451(%zero)
	nop
	nop
	nop

	flw	%f1, 450(%zero)
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

	nop
	nop
	nop
	jr	%ra

bnei_else.34581:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	lw	%v0, 5(%v0)
	nop
	nop

	flw	%f1, 2(%v1)
	flw	%f2, 2(%v0)
	fsub	%f0, %f0, %f1
	nop

	flw	%f2, 481(%zero)
	nop
	fsub	%f1, %f1, %f2
	fmul	%f0, %f0, %f0

	nop
	nop
	fmul	%f1, %f1, %f1
	nop

	flw	%f1, 449(%zero)
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

	flw	%f1, 453(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	flw	%f1, 482(%zero)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 0(%sp)
	nop
	fabs	%f0, %f0
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
	fblt	%f0, %f2, fbgt_else.34613

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34615

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34617

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34619

	flw	%f3, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34621

	flw	%f3, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34623

	flw	%f3, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34625

	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34627

	flw	%f3, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34629

	flw	%f3, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34631

	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34633

	flw	%f3, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34635

	flw	%f3, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34637

	flw	%f3, 468(%zero)
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
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.34614

fbgt_else.34637:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34638:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34635:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34636:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34633:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34634:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34631:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34632:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34629:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34630:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34627:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34628:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34625:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34626:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34623:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34624:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34621:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34622:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34619:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34620:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34617:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34618:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34615:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34616:
	nop
	nop
	nop
	j	fbgt_cont.34614

fbgt_else.34613:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.34614:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34639

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34641

	flw	%f3, 495(%zero)
	sw	%ra, 3(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.34640

fbgt_else.34641:
	flw	%f3, 495(%zero)
	sw	%ra, 3(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 4

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	nop
	nop
	nop

fbgt_cont.34642:
	nop
	nop
	nop
	j	fbgt_cont.34640

fbgt_else.34639:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34640:
	flw	%f1, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34643

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34644

fbgt_else.34643:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34644:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34645

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34646

fbgt_else.34645:
fbgt_cont.34646:
	flw	%f2, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34647

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34649

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34648

bnei_else.34649:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34650:
	nop
	nop
	nop
	j	fbgt_cont.34648

fbgt_else.34647:
fbgt_cont.34648:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34651

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34652

fbgt_else.34651:
fbgt_cont.34652:
	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34653

	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 463(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 462(%zero)
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
	j	fbgt_cont.34654

fbgt_else.34653:
	flw	%f3, 467(%zero)
	flw	%f4, 466(%zero)
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

	flw	%f4, 465(%zero)
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

fbgt_cont.34654:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34655

	nop
	nop
	nop
	j	bnei_cont.34656

bnei_else.34655:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34656:
	flw	%f1, 451(%zero)
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

	flw	%f2, 484(%zero)
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

	nop
	nop
	nop
	jr	%ra

bnei_else.34580:
	flw	%f0, 1(%v1)
	flw	%f1, 448(%zero)
	nop
	nop

	flw	%f1, 482(%zero)
	flw	%f2, 494(%zero)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34658

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34659

fbgt_else.34658:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.34659:
	flw	%f2, 481(%zero)
	sw	%v0, 3(%sp)
	fabs	%f0, %f0
	nop

	fsw	%f1, 4(%sp)
	nop
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	nop
	nop

	fsw	%f2, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34660

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34662

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34664

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34666

	flw	%f3, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34668

	flw	%f3, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34670

	flw	%f3, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34672

	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34674

	flw	%f3, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34676

	flw	%f3, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34678

	flw	%f3, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34680

	flw	%f3, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34682

	flw	%f3, 469(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.34684

	flw	%f3, 468(%zero)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.34661

fbgt_else.34684:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34685:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34682:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34683:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34680:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34681:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34678:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34679:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34676:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34677:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34674:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34675:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34672:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34673:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34670:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34671:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34668:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34669:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34666:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34667:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34664:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34665:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34662:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34663:
	nop
	nop
	nop
	j	fbgt_cont.34661

fbgt_else.34660:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.34661:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34686

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34688

	flw	%f3, 495(%zero)
	sw	%ra, 7(%sp)
	fsub	%f1, %f1, %f0
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.34687

fbgt_else.34688:
	flw	%f3, 495(%zero)
	sw	%ra, 7(%sp)
	fmov	%f29, %f1
	nop

	nop
	nop
	fdiv	%f0, %f0, %f3
	addi	%sp, %sp, 8

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

fbgt_cont.34689:
	nop
	nop
	nop
	j	fbgt_cont.34687

fbgt_else.34686:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34687:
	flw	%f1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34690

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34692

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34691

bnei_else.34692:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34693:
	nop
	nop
	nop
	j	fbgt_cont.34691

fbgt_else.34690:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

fbgt_cont.34691:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34694

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34695

fbgt_else.34694:
fbgt_cont.34695:
	flw	%f2, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34696

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34697

fbgt_else.34696:
fbgt_cont.34697:
	flw	%f1, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34698

	flw	%f3, 467(%zero)
	flw	%f4, 466(%zero)
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

	flw	%f4, 465(%zero)
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
	j	fbgt_cont.34699

fbgt_else.34698:
	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
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

	flw	%f3, 463(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 462(%zero)
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

fbgt_cont.34699:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34700

	nop
	nop
	nop
	j	bnei_cont.34701

bnei_else.34700:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34701:
	flw	%f1, 451(%zero)
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

	flw	%f2, 484(%zero)
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

	nop
	nop
	nop
	jr	%ra

bnei_else.34579:
	flw	%f0, 0(%v1)
	lw	%a0, 5(%v0)
	nop
	nop

	flw	%f1, 0(%a0)
	flw	%f3, 446(%zero)
	nop
	nop

	flw	%f1, 447(%zero)
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

	flw	%f2, 449(%zero)
	nop
	fsub	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34703

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34704

fbgt_else.34703:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.34704:
	flw	%f0, 2(%v1)
	lw	%v0, 5(%v0)
	nop
	nop

	flw	%f4, 2(%v0)
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
	fblt	%f0, %f2, fbgt_else.34705

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34706

fbgt_else.34705:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34706:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34707

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34709

	flw	%f0, 451(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34708

bnei_else.34709:
	flw	%f0, 494(%zero)
	nop
	nop
	nop

bnei_cont.34710:
	nop
	nop
	nop
	j	bnei_cont.34708

bnei_else.34707:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34711

	flw	%f0, 494(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34712

bnei_else.34711:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.34712:
bnei_cont.34708:
	fsw	%f0, 146(%zero)
	nop
	nop
	nop

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
	blti	%v0, 0, bgti_else.34724

	lw	%a1, 254(%v0)
	flw	%f2, 445(%zero)
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
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34725

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34726

fbgt_else.34725:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34726:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34727

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34729

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34728

fbgt_else.34729:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34730:
	nop
	nop
	nop
	j	bnei_cont.34728

bnei_else.34727:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.34728:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34731

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
	bne	%v0, %a0, beq_else.34733

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
	beqi	%v0, 0, bnei_else.34735

	nop
	nop
	nop
	j	bnei_cont.34732

bnei_else.34735:
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

	flw	%f3, 494(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34737

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34738

fbgt_else.34737:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34738:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34739

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
	j	bnei_cont.34740

bnei_else.34739:
bnei_cont.34740:
	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.34741

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34742

fbgt_else.34741:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34742:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34743

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
	j	bnei_cont.34744

bnei_else.34743:
bnei_cont.34744:
bnei_cont.34736:
	nop
	nop
	nop
	j	bnei_cont.34732

beq_else.34733:
beq_cont.34734:
	nop
	nop
	nop
	j	bnei_cont.34732

bnei_else.34731:
bnei_cont.34732:
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

bgti_else.34724:
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
	blt	%at, %v0, bgt_else.34779

	lw	%a1, 2(%a0)
	flw	%f2, 445(%zero)
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
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34780

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34781

fbgt_else.34780:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34781:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34782

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34784

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34783

fbgt_else.34784:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34785:
	nop
	nop
	nop
	j	bnei_cont.34783

bnei_else.34782:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.34783:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34786

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
	beqi	%a1, 1, bnei_else.34787

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.34789

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
	beqi	%a1, 0, bnei_else.34791

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

	flw	%f10, 464(%zero)
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
	j	bnei_cont.34792

bnei_else.34791:
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

bnei_cont.34792:
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

	flw	%f7, 494(%zero)
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
	fbne	%f4, %f7, fbeq_else.34793

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34794

fbeq_else.34793:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.34794:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34795

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34796

bnei_else.34795:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.34797

	flw	%f7, 460(%zero)
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
	j	bnei_cont.34798

bnei_else.34797:
	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f7, %f4
	nop

bnei_cont.34798:
bnei_cont.34796:
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
	j	bnei_cont.34788

bnei_else.34789:
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

bnei_cont.34790:
	nop
	nop
	nop
	j	bnei_cont.34788

bnei_else.34787:
	lw	%a1, 136(%zero)
	flw	%f3, 494(%zero)
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
	fbne	%f4, %f3, fbeq_else.34799

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34800

fbeq_else.34799:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.34800:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34801

	nop
	nop
	nop
	j	bnei_cont.34802

bnei_else.34801:
	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.34803

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34804

fbgt_else.34803:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.34804:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.34805

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34806

bnei_else.34805:
	flw	%f3, 460(%zero)
	nop
	nop
	nop

bnei_cont.34806:
bnei_cont.34802:
	nop
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 142(%a1)
	nop
	nop
	nop

bnei_cont.34788:
	flw	%f3, 138(%zero)
	fsw	%f0, 8(%sp)
	nop
	nop

	fsw	%f3, 159(%zero)
	sw	%a0, 9(%sp)
	nop
	nop

	flw	%f4, 139(%zero)
	fsw	%f1, 10(%sp)
	nop
	nop

	fsw	%f4, 160(%zero)
	sw	%a2, 11(%sp)
	nop
	nop

	flw	%f5, 140(%zero)
	sw	%v1, 12(%sp)
	nop
	nop

	fsw	%f5, 161(%zero)
	fsw	%f5, 13(%sp)
	nop
	nop

	fsw	%f4, 14(%sp)
	nop
	addi	%a1, %zero, 138
	nop

	fsw	%f3, 15(%sp)
	nop
	nop
	nop

	sw	%v0, 16(%sp)
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a1, 0

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
	jal	utexture.2959

	lw	%v1, 136(%zero)
	flw	%f4, 464(%zero)
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
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
	fblt	%f3, %f4, fbgt_else.34807

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34808

fbgt_else.34807:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.34808:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.34809

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
	j	bnei_cont.34810

bnei_else.34809:
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

bnei_cont.34810:
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

	fsw	%f3, 17(%sp)
	nop
	addi	%v0, %a3, 0
	nop

	fsw	%f10, 18(%sp)
	nop
	nop
	nop

	fsw	%f8, 19(%sp)
	nop
	nop
	nop

	fsw	%f5, 20(%sp)
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
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34811

	nop
	nop
	nop
	j	bnei_cont.34812

bnei_else.34811:
	flw	%f0, 78(%zero)
	flw	%f1, 20(%sp)
	nop
	nop

	flw	%f2, 79(%zero)
	flw	%f3, 19(%sp)
	fmul	%f1, %f1, %f0
	nop

	flw	%f4, 18(%sp)
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

	flw	%f2, 494(%zero)
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
	fblt	%f2, %f1, fbgt_else.34813

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34814

fbgt_else.34813:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.34814:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34815

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
	j	bnei_cont.34816

bnei_else.34815:
bnei_cont.34816:
	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.34817

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34818

fbgt_else.34817:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.34818:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34819

	flw	%f1, 17(%sp)
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
	j	bnei_cont.34820

bnei_else.34819:
bnei_cont.34820:
bnei_cont.34812:
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
	sw	%ra, 21(%sp)
	nop
	nop

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, 22
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
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	flw	%f0, 10(%sp)
	addi	%v0, %v0, -1
	nop

	flw	%f1, 17(%sp)
	lw	%v1, 5(%sp)
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
	jal	trace_reflections.2966

	flw	%f0, 441(%zero)
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	flw	%f1, 4(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34821

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34822

fbgt_else.34821:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34822:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34823

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.34824

	nop
	nop
	nop
	j	bgti_cont.34825

bgti_else.34824:
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

bgti_cont.34825:
	lw	%v1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.34826

	nop
	nop
	nop
	jr	%ra

bnei_else.34826:
	flw	%f0, 484(%zero)
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

bnei_else.34823:
	nop
	nop
	nop
	jr	%ra

bnei_else.34786:
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
	beqi	%v1, 0, bnei_else.34829

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

	flw	%f1, 494(%zero)
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
	fblt	%f1, %f0, fbgt_else.34830

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34831

fbgt_else.34830:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34831:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34832

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

bnei_else.34832:
	nop
	nop
	nop
	jr	%ra

bnei_else.34829:
	nop
	nop
	nop
	jr	%ra

bgt_else.34779:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_ray.2977:
	flw	%f1, 445(%zero)
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
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34843

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34844

fbgt_else.34843:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34844:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34845

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34847

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.34846

fbgt_else.34847:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34848:
	nop
	nop
	nop
	j	bnei_cont.34846

bnei_else.34845:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.34846:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34849

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
	beqi	%a0, 1, bnei_else.34850

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.34852

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
	beqi	%v1, 0, bnei_else.34854

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

	flw	%f7, 464(%zero)
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
	j	bnei_cont.34855

bnei_else.34854:
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

bnei_cont.34855:
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

	flw	%f4, 494(%zero)
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
	fbne	%f1, %f4, fbeq_else.34856

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34857

fbeq_else.34856:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.34857:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.34858

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34859

bnei_else.34858:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34860

	flw	%f4, 460(%zero)
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
	j	bnei_cont.34861

bnei_else.34860:
	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

bnei_cont.34861:
bnei_cont.34859:
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
	j	bnei_cont.34851

bnei_else.34852:
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

bnei_cont.34853:
	nop
	nop
	nop
	j	bnei_cont.34851

bnei_else.34850:
	lw	%a0, 136(%zero)
	flw	%f0, 494(%zero)
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
	fbne	%f1, %f0, fbeq_else.34862

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.34863

fbeq_else.34862:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.34863:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34864

	nop
	nop
	nop
	j	bnei_cont.34865

bnei_else.34864:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34866

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34867

fbgt_else.34866:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.34867:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.34868

	flw	%f0, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.34869

bnei_else.34868:
	flw	%f0, 460(%zero)
	nop
	nop
	nop

bnei_cont.34869:
bnei_cont.34865:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a0)
	nop
	nop
	nop

bnei_cont.34851:
	sw	%v0, 4(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -6
	nop

	lw	%ra, 5(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
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
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.34870

	nop
	nop
	nop
	jr	%ra

bnei_else.34870:
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

	flw	%f1, 494(%zero)
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
	fblt	%f1, %f0, fbgt_else.34872

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34873

fbgt_else.34872:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34873:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34874

	nop
	nop
	nop
	j	bnei_cont.34875

bnei_else.34874:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.34875:
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

bnei_else.34849:
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
	blti	%a1, 0, bgti_else.35092

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

	flw	%f2, 494(%zero)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35093

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35094

fbgt_else.35093:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.35094:
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
	beqi	%t0, 0, bnei_else.35095

	flw	%f5, 440(%zero)
	nop
	addi	%a3, %a1, 1
	nop

	flw	%f5, 445(%zero)
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
	beqi	%t3, -1, bnei_else.35097

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.35099

	sw	%t2, 13(%sp)
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0

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
	jal	solver_fast2.2865

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
	beqi	%v0, 0, bnei_else.35101

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35103

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35104

fbgt_else.35103:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35104:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35105

	lw	%v0, 13(%sp)
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
	beqi	%v1, -1, bnei_else.35107

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

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35109

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
	beqi	%v1, -1, bnei_else.35111

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
	beqi	%v1, -1, bnei_else.35113

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
	j	bnei_cont.35100

bnei_else.35113:
bnei_cont.35114:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35111:
bnei_cont.35112:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35109:
bnei_cont.35110:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35107:
bnei_cont.35108:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35105:
bnei_cont.35106:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35101:
bnei_cont.35102:
	nop
	nop
	nop
	j	bnei_cont.35100

bnei_else.35099:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.35115

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
	beqi	%v1, -1, bnei_else.35117

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
	beqi	%v1, -1, bnei_else.35119

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
	beqi	%v1, -1, bnei_else.35121

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
	j	bnei_cont.35116

bnei_else.35121:
bnei_cont.35122:
	nop
	nop
	nop
	j	bnei_cont.35116

bnei_else.35119:
bnei_cont.35120:
	nop
	nop
	nop
	j	bnei_cont.35116

bnei_else.35117:
bnei_cont.35118:
	nop
	nop
	nop
	j	bnei_cont.35116

bnei_else.35115:
bnei_cont.35116:
bnei_cont.35100:
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
	j	bnei_cont.35098

bnei_else.35097:
bnei_cont.35098:
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35123

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35124

fbgt_else.35123:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35124:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35125

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35127

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35126

fbgt_else.35127:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35128:
	nop
	nop
	nop
	j	bnei_cont.35126

bnei_else.35125:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35126:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35129

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
	beqi	%a0, 1, bnei_else.35131

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35133

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
	beqi	%v1, 0, bnei_else.35135

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

	flw	%f9, 464(%zero)
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
	j	bnei_cont.35136

bnei_else.35135:
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

bnei_cont.35136:
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
	fbne	%f1, %f4, fbeq_else.35137

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35138

fbeq_else.35137:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35138:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35139

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35140

bnei_else.35139:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35141

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35142

bnei_else.35141:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35142:
bnei_cont.35140:
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
	j	bnei_cont.35132

bnei_else.35133:
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

bnei_cont.35134:
	nop
	nop
	nop
	j	bnei_cont.35132

bnei_else.35131:
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
	fbne	%f1, %f0, fbeq_else.35143

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35144

fbeq_else.35143:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35144:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35145

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35146

bnei_else.35145:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35147

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35148

fbgt_else.35147:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35148:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35149

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35150

bnei_else.35149:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35150:
bnei_cont.35146:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35132:
	sw	%v0, 14(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	lw	%v1, 10(%sp)
	sw	%ra, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35151

	nop
	nop
	nop
	j	bnei_cont.35096

bnei_else.35151:
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
	fblt	%f1, %f0, fbgt_else.35153

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35154

fbgt_else.35153:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35154:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35155

	nop
	nop
	nop
	j	bnei_cont.35156

bnei_else.35155:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35156:
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

bnei_cont.35152:
	nop
	nop
	nop
	j	bnei_cont.35096

bnei_else.35129:
bnei_cont.35130:
	nop
	nop
	nop
	j	bnei_cont.35096

bnei_else.35095:
	flw	%f5, 439(%zero)
	nop
	nop
	nop

	flw	%f5, 445(%zero)
	nop
	fdiv	%f0, %f0, %f5
	nop

	fsw	%f5, 137(%zero)
	fsw	%f0, 15(%sp)
	nop
	nop

	lw	%t0, 134(%zero)
	nop
	nop
	nop

	lw	%t2, 0(%t0)
	sw	%t0, 16(%sp)
	nop
	nop

	lw	%t3, 0(%t2)
	sw	%a3, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.35157

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.35159

	sw	%t2, 18(%sp)
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t3, 0

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
	jal	solver_fast2.2865

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
	beqi	%v0, 0, bnei_else.35161

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35163

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35164

fbgt_else.35163:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35164:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35165

	lw	%v0, 18(%sp)
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
	beqi	%v1, -1, bnei_else.35167

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35169

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35171

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35173

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	addi	%v0, %zero, 5

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.35160

bnei_else.35173:
bnei_cont.35174:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35171:
bnei_cont.35172:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35169:
bnei_cont.35170:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35167:
bnei_cont.35168:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35165:
bnei_cont.35166:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35161:
bnei_cont.35162:
	nop
	nop
	nop
	j	bnei_cont.35160

bnei_else.35159:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.35175

	lw	%t3, 83(%t3)
	sw	%t2, 18(%sp)
	addi	%a0, %a3, 0
	addi	%v0, %a2, 0

	sw	%ra, 19(%sp)
	nop
	addi	%v1, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 2(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35177

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35179

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	lw	%v1, 4(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.35181

	lw	%v1, 83(%v1)
	lw	%a0, 2(%sp)
	nop
	nop

	lw	%a1, 17(%sp)
	sw	%ra, 19(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%a0, %a1, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	solve_each_element_fast.2936

	nop
	nop
	addi	%sp, %sp, -20
	addi	%v0, %zero, 5

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	solve_one_or_network_fast.2940

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
	j	bnei_cont.35176

bnei_else.35181:
bnei_cont.35182:
	nop
	nop
	nop
	j	bnei_cont.35176

bnei_else.35179:
bnei_cont.35180:
	nop
	nop
	nop
	j	bnei_cont.35176

bnei_else.35177:
bnei_cont.35178:
	nop
	nop
	nop
	j	bnei_cont.35176

bnei_else.35175:
bnei_cont.35176:
bnei_cont.35160:
	lw	%v0, 12(%sp)
	lw	%v1, 16(%sp)
	nop
	nop

	lw	%a0, 17(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

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
	j	bnei_cont.35158

bnei_else.35157:
bnei_cont.35158:
	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35183

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35184

fbgt_else.35183:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35184:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35185

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35187

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35186

fbgt_else.35187:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35188:
	nop
	nop
	nop
	j	bnei_cont.35186

bnei_else.35185:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35186:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35189

	lw	%v0, 141(%zero)
	lw	%v1, 17(%sp)
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
	beqi	%a0, 1, bnei_else.35191

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35193

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
	beqi	%v1, 0, bnei_else.35195

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

	flw	%f9, 464(%zero)
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
	j	bnei_cont.35196

bnei_else.35195:
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

bnei_cont.35196:
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
	fbne	%f1, %f4, fbeq_else.35197

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35198

fbeq_else.35197:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35198:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35199

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35200

bnei_else.35199:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35201

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35202

bnei_else.35201:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35202:
bnei_cont.35200:
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
	j	bnei_cont.35192

bnei_else.35193:
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

bnei_cont.35194:
	nop
	nop
	nop
	j	bnei_cont.35192

bnei_else.35191:
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
	fbne	%f1, %f0, fbeq_else.35203

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35204

fbeq_else.35203:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35204:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35205

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35206

bnei_else.35205:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35207

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35208

fbgt_else.35207:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35208:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35209

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35210

bnei_else.35209:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35210:
bnei_cont.35206:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35192:
	sw	%v0, 19(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	lw	%v1, 16(%sp)
	sw	%ra, 20(%sp)
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
	beqi	%v0, 0, bnei_else.35211

	nop
	nop
	nop
	j	bnei_cont.35190

bnei_else.35211:
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
	fblt	%f1, %f0, fbgt_else.35213

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35214

fbgt_else.35213:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35214:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35215

	nop
	nop
	nop
	j	bnei_cont.35216

bnei_else.35215:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35216:
	flw	%f2, 15(%sp)
	lw	%v0, 19(%sp)
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

bnei_cont.35212:
	nop
	nop
	nop
	j	bnei_cont.35190

bnei_else.35189:
bnei_cont.35190:
bnei_cont.35096:
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
	blti	%v0, 0, bgti_else.35217

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
	fblt	%f0, %f1, fbgt_else.35218

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35219

fbgt_else.35218:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.35219:
	sw	%v0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35220

	flw	%f2, 440(%zero)
	lw	%a2, 2(%sp)
	addi	%a0, %v0, 1
	nop

	flw	%f2, 445(%zero)
	nop
	add	%at, %v1, %a0
	fdiv	%f0, %f0, %f2

	lw	%a0, 0(%at)
	fsw	%f2, 137(%zero)
	addi	%v0, %a2, 0
	nop

	lw	%a1, 134(%zero)
	fsw	%f0, 21(%sp)
	nop
	nop

	sw	%a1, 22(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%a0, 23(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35222

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35223

fbgt_else.35222:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35223:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35224

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35226

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35225

fbgt_else.35226:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35227:
	nop
	nop
	nop
	j	bnei_cont.35225

bnei_else.35224:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35225:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35228

	lw	%v0, 141(%zero)
	lw	%v1, 23(%sp)
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
	beqi	%a0, 1, bnei_else.35230

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35232

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
	beqi	%v1, 0, bnei_else.35234

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

	flw	%f7, 464(%zero)
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
	j	bnei_cont.35235

bnei_else.35234:
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

bnei_cont.35235:
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
	fbne	%f1, %f4, fbeq_else.35236

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35237

fbeq_else.35236:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35237:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35238

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35239

bnei_else.35238:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35240

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35241

bnei_else.35240:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35241:
bnei_cont.35239:
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
	j	bnei_cont.35231

bnei_else.35232:
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

bnei_cont.35233:
	nop
	nop
	nop
	j	bnei_cont.35231

bnei_else.35230:
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
	fbne	%f1, %f0, fbeq_else.35242

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35243

fbeq_else.35242:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35243:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35244

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35245

bnei_else.35244:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35246

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35247

fbgt_else.35246:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35247:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35248

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35249

bnei_else.35248:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35249:
bnei_cont.35245:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35231:
	sw	%v0, 24(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	lw	%v1, 22(%sp)
	sw	%ra, 25(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.35250

	nop
	nop
	nop
	j	bnei_cont.35221

bnei_else.35250:
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
	fblt	%f1, %f0, fbgt_else.35252

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35253

fbgt_else.35252:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35253:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35254

	nop
	nop
	nop
	j	bnei_cont.35255

bnei_else.35254:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35255:
	flw	%f1, 21(%sp)
	lw	%v0, 24(%sp)
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

bnei_cont.35251:
	nop
	nop
	nop
	j	bnei_cont.35221

bnei_else.35228:
bnei_cont.35229:
	nop
	nop
	nop
	j	bnei_cont.35221

bnei_else.35220:
	flw	%f2, 439(%zero)
	lw	%a2, 2(%sp)
	nop
	nop

	flw	%f2, 445(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 25(%sp)
	nop
	nop

	lw	%a1, 134(%zero)
	nop
	nop
	nop

	sw	%a1, 26(%sp)
	nop
	addi	%v1, %a1, 0
	nop

	sw	%a0, 27(%sp)
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
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35256

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35257

fbgt_else.35256:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35257:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35258

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35260

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35259

fbgt_else.35260:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35261:
	nop
	nop
	nop
	j	bnei_cont.35259

bnei_else.35258:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35259:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35262

	lw	%v0, 141(%zero)
	lw	%v1, 27(%sp)
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
	beqi	%a0, 1, bnei_else.35264

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35266

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
	beqi	%v1, 0, bnei_else.35268

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

	flw	%f7, 464(%zero)
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
	j	bnei_cont.35269

bnei_else.35268:
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

bnei_cont.35269:
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
	fbne	%f1, %f4, fbeq_else.35270

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35271

fbeq_else.35270:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35271:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35272

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35273

bnei_else.35272:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35274

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35275

bnei_else.35274:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35275:
bnei_cont.35273:
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
	j	bnei_cont.35265

bnei_else.35266:
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

bnei_cont.35267:
	nop
	nop
	nop
	j	bnei_cont.35265

bnei_else.35264:
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
	fbne	%f1, %f0, fbeq_else.35276

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35277

fbeq_else.35276:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35277:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35278

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35279

bnei_else.35278:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35280

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35281

fbgt_else.35280:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35281:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35282

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35283

bnei_else.35282:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35283:
bnei_cont.35279:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35265:
	sw	%v0, 28(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	lw	%v1, 26(%sp)
	sw	%ra, 29(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.35284

	nop
	nop
	nop
	j	bnei_cont.35263

bnei_else.35284:
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
	fblt	%f1, %f0, fbgt_else.35286

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35287

fbgt_else.35286:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35287:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35288

	nop
	nop
	nop
	j	bnei_cont.35289

bnei_else.35288:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35289:
	flw	%f1, 25(%sp)
	lw	%v0, 28(%sp)
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

bnei_cont.35285:
	nop
	nop
	nop
	j	bnei_cont.35263

bnei_else.35262:
bnei_cont.35263:
bnei_cont.35221:
	lw	%v0, 20(%sp)
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

bgti_else.35217:
	nop
	nop
	nop
	jr	%ra

bgti_else.35092:
	nop
	nop
	nop
	jr	%ra

trace_diffuse_rays.2985:
	flw	%f0, 0(%a0)
	sw	%a0, 0(%sp)
	addi	%a1, %zero, 0
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
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%a2, %a2, -1
	addi	%v0, %a0, 0

	sw	%ra, 4(%sp)
	nop
	addi	%v1, %a2, 0
	nop

	nop
	nop
	addi	%sp, %sp, 5
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -5
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

	flw	%f1, 494(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35315

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35316

fbgt_else.35315:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35316:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35317

	lw	%a0, 119(%v0)
	flw	%f2, 440(%zero)
	nop
	nop

	flw	%f2, 445(%zero)
	lw	%a2, 1(%sp)
	fdiv	%f0, %f0, %f2
	nop

	fsw	%f2, 137(%zero)
	fsw	%f0, 4(%sp)
	addi	%v0, %a2, 0
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

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	trace_or_matrix_fast.2944

	flw	%f0, 137(%zero)
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35319

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35320

fbgt_else.35319:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35320:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35321

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35323

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35322

fbgt_else.35323:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35324:
	nop
	nop
	nop
	j	bnei_cont.35322

bnei_else.35321:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35322:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35325

	lw	%v0, 141(%zero)
	lw	%v1, 7(%sp)
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
	beqi	%a0, 1, bnei_else.35327

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35329

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
	beqi	%v1, 0, bnei_else.35331

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

	flw	%f7, 464(%zero)
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
	j	bnei_cont.35332

bnei_else.35331:
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

bnei_cont.35332:
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

	flw	%f4, 6(%sp)
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
	fbne	%f1, %f4, fbeq_else.35333

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35334

fbeq_else.35333:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35334:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35335

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35336

bnei_else.35335:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35337

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35338

bnei_else.35337:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35338:
bnei_cont.35336:
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
	j	bnei_cont.35328

bnei_else.35329:
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

bnei_cont.35330:
	nop
	nop
	nop
	j	bnei_cont.35328

bnei_else.35327:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
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
	fbne	%f1, %f0, fbeq_else.35339

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35340

fbeq_else.35339:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35340:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35341

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35342

bnei_else.35341:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35343

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35344

fbgt_else.35343:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35344:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35345

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35346

bnei_else.35345:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35346:
bnei_cont.35342:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35328:
	sw	%v0, 8(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
	nop
	nop

	lw	%v1, 5(%sp)
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
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.35347

	nop
	nop
	nop
	j	bnei_cont.35318

bnei_else.35347:
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

	flw	%f1, 6(%sp)
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
	fblt	%f1, %f0, fbgt_else.35349

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35350

fbgt_else.35349:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35350:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35351

	nop
	nop
	nop
	j	bnei_cont.35352

bnei_else.35351:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35352:
	flw	%f1, 4(%sp)
	lw	%v0, 8(%sp)
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

bnei_cont.35348:
	nop
	nop
	nop
	j	bnei_cont.35318

bnei_else.35325:
bnei_cont.35326:
	nop
	nop
	nop
	j	bnei_cont.35318

bnei_else.35317:
	flw	%f2, 439(%zero)
	lw	%a2, 1(%sp)
	nop
	nop

	flw	%f2, 445(%zero)
	nop
	fdiv	%f0, %f0, %f2
	addi	%v0, %a2, 0

	fsw	%f2, 137(%zero)
	fsw	%f0, 9(%sp)
	nop
	nop

	lw	%v1, 134(%zero)
	nop
	nop
	nop

	sw	%v1, 10(%sp)
	nop
	nop
	nop

	fsw	%f1, 6(%sp)
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
	flw	%f1, 457(%zero)
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35353

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35354

fbgt_else.35353:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35354:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35355

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35357

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35356

fbgt_else.35357:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35358:
	nop
	nop
	nop
	j	bnei_cont.35356

bnei_else.35355:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.35356:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35359

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
	beqi	%a0, 1, bnei_else.35361

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.35363

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
	beqi	%v1, 0, bnei_else.35365

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

	flw	%f7, 464(%zero)
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
	j	bnei_cont.35366

bnei_else.35365:
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

bnei_cont.35366:
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

	flw	%f4, 6(%sp)
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
	fbne	%f1, %f4, fbeq_else.35367

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35368

fbeq_else.35367:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.35368:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35369

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35370

bnei_else.35369:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35371

	flw	%f5, 460(%zero)
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
	j	bnei_cont.35372

bnei_else.35371:
	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35372:
bnei_cont.35370:
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
	j	bnei_cont.35362

bnei_else.35363:
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

bnei_cont.35364:
	nop
	nop
	nop
	j	bnei_cont.35362

bnei_else.35361:
	lw	%a0, 136(%zero)
	flw	%f0, 6(%sp)
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
	fbne	%f1, %f0, fbeq_else.35373

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35374

fbeq_else.35373:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35374:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35375

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.35376

bnei_else.35375:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35377

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35378

fbgt_else.35377:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35378:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35379

	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35380

bnei_else.35379:
	flw	%f1, 460(%zero)
	nop
	nop
	nop

bnei_cont.35380:
bnei_cont.35376:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.35362:
	sw	%v0, 12(%sp)
	nop
	addi	%v1, %zero, 138
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
	jal	utexture.2959

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	nop
	nop

	lw	%v1, 10(%sp)
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
	jal	shadow_check_one_or_matrix.2919

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
	beqi	%v0, 0, bnei_else.35381

	nop
	nop
	nop
	j	bnei_cont.35360

bnei_else.35381:
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

	flw	%f1, 6(%sp)
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
	fblt	%f1, %f0, fbgt_else.35383

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35384

fbgt_else.35383:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35384:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35385

	nop
	nop
	nop
	j	bnei_cont.35386

bnei_else.35385:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.35386:
	flw	%f1, 9(%sp)
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

bnei_cont.35382:
	nop
	nop
	nop
	j	bnei_cont.35360

bnei_else.35359:
bnei_cont.35360:
bnei_cont.35318:
	lw	%v0, 3(%sp)
	lw	%v1, 2(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	iter_trace_diffuse_rays.2980

do_without_neighbors.3002:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.35470

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
	blti	%a0, 0, bgti_else.35471

	lw	%a0, 3(%v0)
	sw	%v0, 0(%sp)
	nop
	nop

	sw	%v1, 1(%sp)
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
	beqi	%a0, 0, bnei_else.35472

	lw	%a0, 5(%v0)
	lw	%a1, 7(%v0)
	nop
	nop

	lw	%a2, 1(%v0)
	lw	%a3, 4(%v0)
	add	%at, %a0, %v1
	nop

	lw	%a0, 0(%at)
	sw	%a3, 2(%sp)
	add	%at, %a1, %v1
	nop

	flw	%f0, 0(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
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

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35474

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
	sw	%t0, 6(%sp)
	nop
	nop

	lw	%t1, 0(%zero)
	sw	%ra, 7(%sp)
	nop
	nop

	nop
	nop
	addi	%t1, %t1, -1
	addi	%sp, %sp, 8

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
	addi	%sp, %sp, -8
	addi	%a1, %zero, 118

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
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
	jal	iter_trace_diffuse_rays.2980

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
	j	bnei_cont.35475

bnei_else.35474:
bnei_cont.35475:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.35476

	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	flw	%f0, 0(%a0)
	sw	%v1, 7(%sp)
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
	sw	%ra, 8(%sp)
	nop
	nop

	lw	%a1, 0(%zero)
	nop
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

	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
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
	j	bnei_cont.35477

bnei_else.35476:
bnei_cont.35477:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.35478

	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
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

	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
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
	j	bnei_cont.35479

bnei_else.35478:
bnei_cont.35479:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.35480

	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
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

	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
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
	j	bnei_cont.35481

bnei_else.35480:
bnei_cont.35481:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.35482

	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	sw	%v0, 10(%sp)
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
	sw	%ra, 11(%sp)
	nop
	nop

	lw	%a0, 0(%zero)
	nop
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

	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
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
	j	bnei_cont.35483

bnei_else.35482:
bnei_cont.35483:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
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
	j	bnei_cont.35473

bnei_else.35472:
bnei_cont.35473:
	lw	%v0, 1(%sp)
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
	blt	%at, %v0, bgt_else.35484

	lw	%v1, 0(%sp)
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
	blti	%a0, 0, bgti_else.35485

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
	beqi	%a0, 0, bnei_else.35486

	lw	%a0, 5(%v1)
	lw	%a1, 7(%v1)
	nop
	nop

	lw	%a2, 1(%v1)
	lw	%a3, 4(%v1)
	add	%at, %a0, %v0
	nop

	lw	%a0, 0(%at)
	sw	%v0, 11(%sp)
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

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35488

	lw	%t0, 179(%zero)
	sw	%ra, 16(%sp)
	addi	%a0, %a2, 0
	addi	%v1, %a1, 0

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35489

bnei_else.35488:
bnei_cont.35489:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.35490

	lw	%v1, 180(%zero)
	lw	%a0, 14(%sp)
	nop
	nop

	lw	%a1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35491

bnei_else.35490:
bnei_cont.35491:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.35492

	lw	%v1, 181(%zero)
	lw	%a0, 14(%sp)
	nop
	nop

	lw	%a1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35493

bnei_else.35492:
bnei_cont.35493:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.35494

	lw	%v1, 182(%zero)
	lw	%a0, 14(%sp)
	nop
	nop

	lw	%a1, 13(%sp)
	sw	%ra, 16(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35495

bnei_else.35494:
bnei_cont.35495:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.35496

	lw	%v0, 183(%zero)
	lw	%v1, 14(%sp)
	nop
	nop

	lw	%a0, 13(%sp)
	sw	%ra, 16(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

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
	j	bnei_cont.35497

bnei_else.35496:
bnei_cont.35497:
	lw	%v0, 11(%sp)
	lw	%v1, 12(%sp)
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
	j	bnei_cont.35487

bnei_else.35486:
bnei_cont.35487:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.35485:
	nop
	nop
	nop
	jr	%ra

bgt_else.35484:
	nop
	nop
	nop
	jr	%ra

bgti_else.35471:
	nop
	nop
	nop
	jr	%ra

bgt_else.35470:
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
	blt	%at, %a3, bgt_else.35535

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
	blti	%t1, 0, bgti_else.35536

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
	add	%at, %a0, %v0
	nop

	lw	%t2, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t2)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35537

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35539

	nop
	nop
	addi	%t3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35541

	nop
	nop
	addi	%t3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35543

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.35538

beq_else.35543:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35544:
	nop
	nop
	nop
	j	beq_cont.35538

beq_else.35541:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35542:
	nop
	nop
	nop
	j	beq_cont.35538

beq_else.35539:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35540:
	nop
	nop
	nop
	j	beq_cont.35538

beq_else.35537:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35538:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.35545

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
	beqi	%t1, 0, bnei_else.35546

	lw	%t1, 5(%t2)
	lw	%t4, 5(%t0)
	addi	%t3, %v0, -1
	addi	%t5, %v0, 1

	nop
	nop
	add	%at, %a1, %t3
	nop

	lw	%t3, 0(%at)
	nop
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
	j	bnei_cont.35547

bnei_else.35546:
bnei_cont.35547:
	nop
	nop
	addi	%a3, %a3, 1
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.35548

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
	blti	%t1, 0, bgti_else.35549

	lw	%t1, 2(%t0)
	lw	%t3, 2(%t2)
	nop
	nop

	nop
	nop
	add	%at, %t1, %a3
	nop

	lw	%t1, 0(%at)
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35550

	nop
	nop
	add	%at, %a2, %v0
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35552

	nop
	nop
	addi	%t3, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35554

	nop
	nop
	addi	%t3, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	lw	%t3, 2(%t3)
	nop
	nop
	nop

	nop
	nop
	add	%at, %t3, %a3
	nop

	lw	%t3, 0(%at)
	nop
	nop
	nop

	nop
	nop
	nop
	bne	%t3, %t1, beq_else.35556

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.35551

beq_else.35556:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35557:
	nop
	nop
	nop
	j	beq_cont.35551

beq_else.35554:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35555:
	nop
	nop
	nop
	j	beq_cont.35551

beq_else.35552:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35553:
	nop
	nop
	nop
	j	beq_cont.35551

beq_else.35550:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.35551:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.35558

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
	beqi	%t1, 0, bnei_else.35559

	lw	%t1, 5(%t2)
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
	j	bnei_cont.35560

bnei_else.35559:
bnei_cont.35560:
	nop
	nop
	addi	%a3, %a3, 1
	nop

	nop
	nop
	nop
	j	try_exploit_neighbors.3018

bnei_else.35558:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.35549:
	nop
	nop
	nop
	jr	%ra

bgt_else.35548:
	nop
	nop
	nop
	jr	%ra

bnei_else.35545:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.35563

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
	blti	%v0, 0, bgti_else.35564

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
	beqi	%v0, 0, bnei_else.35565

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

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35567

	lw	%a2, 179(%zero)
	sw	%ra, 6(%sp)
	nop
	nop

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
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35568

bnei_else.35567:
bnei_cont.35568:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.35569

	lw	%v1, 180(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	lw	%a1, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35570

bnei_else.35569:
bnei_cont.35570:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.35571

	lw	%v1, 181(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	lw	%a1, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35572

bnei_else.35571:
bnei_cont.35572:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.35573

	lw	%v1, 182(%zero)
	lw	%a0, 4(%sp)
	nop
	nop

	lw	%a1, 3(%sp)
	sw	%ra, 6(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35574

bnei_else.35573:
bnei_cont.35574:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.35575

	lw	%v0, 183(%zero)
	lw	%v1, 4(%sp)
	nop
	nop

	lw	%a0, 3(%sp)
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
	jal	trace_diffuse_rays.2985

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
	j	bnei_cont.35576

bnei_else.35575:
bnei_cont.35576:
	lw	%v0, 1(%sp)
	lw	%v1, 2(%sp)
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
	j	bnei_cont.35566

bnei_else.35565:
bnei_cont.35566:
	lw	%v0, 1(%sp)
	nop
	nop
	nop

	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.35564:
	nop
	nop
	nop
	jr	%ra

bgt_else.35563:
	nop
	nop
	nop
	jr	%ra

bgti_else.35536:
	nop
	nop
	nop
	jr	%ra

bgt_else.35535:
	nop
	nop
	nop
	jr	%ra

pretrace_diffuse_rays.3031:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.35601

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
	blti	%a0, 0, bgti_else.35602

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
	beqi	%a0, 0, bnei_else.35603

	lw	%a0, 6(%v0)
	flw	%f0, 494(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)
	nop
	nop

	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1
	nop

	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)
	nop
	nop

	flw	%f0, 0(%a2)
	sw	%a2, 2(%sp)
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
	sw	%a1, 3(%sp)
	nop
	nop

	lw	%a3, 0(%zero)
	sw	%a0, 4(%sp)
	nop
	nop

	sw	%ra, 5(%sp)
	nop
	addi	%a3, %a3, -1
	nop

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

	lw	%ra, 5(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	lw	%v1, 3(%sp)
	lw	%a0, 2(%sp)
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
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -6
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
	nop
	add	%at, %v1, %a0
	nop

	lw	%v1, 0(%at)
	nop
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

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35604

bnei_else.35603:
bnei_cont.35604:
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
	blt	%at, %v1, bgt_else.35605

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
	blti	%a0, 0, bgti_else.35606

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
	beqi	%a0, 0, bnei_else.35607

	lw	%a0, 6(%v0)
	flw	%f0, 494(%zero)
	nop
	nop

	lw	%a0, 0(%a0)
	fsw	%f0, 148(%zero)
	nop
	nop

	fsw	%f0, 149(%zero)
	lw	%a1, 7(%v0)
	nop
	nop

	fsw	%f0, 150(%zero)
	lw	%a2, 1(%v0)
	add	%at, %a1, %v1
	nop

	lw	%a0, 179(%a0)
	lw	%a1, 0(%at)
	add	%at, %a2, %v1
	nop

	lw	%a2, 0(%at)
	sw	%v0, 1(%sp)
	nop
	nop

	flw	%f1, 0(%a2)
	sw	%a2, 6(%sp)
	addi	%v0, %a2, 0
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

	sw	%a0, 9(%sp)
	nop
	addi	%a3, %a3, -1
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v1, %a3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	setup_startp_constants.2882

	nop
	nop
	addi	%sp, %sp, -11
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

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 7(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35609

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35610

fbgt_else.35609:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.35610:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35611

	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
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
	jal	trace_diffuse_ray.2977

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
	j	bnei_cont.35612

bnei_else.35611:
	flw	%f1, 439(%zero)
	sw	%ra, 10(%sp)
	addi	%v0, %v1, 0
	nop

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
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.35612:
	lw	%v0, 9(%sp)
	lw	%v1, 8(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 6(%sp)
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
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -11
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
	nop
	add	%at, %v1, %a0
	nop

	lw	%v1, 0(%at)
	nop
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

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35608

bnei_else.35607:
bnei_cont.35608:
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
	j	pretrace_diffuse_rays.3031

bgti_else.35606:
	nop
	nop
	nop
	jr	%ra

bgt_else.35605:
	nop
	nop
	nop
	jr	%ra

bgti_else.35602:
	nop
	nop
	nop
	jr	%ra

bgt_else.35601:
	nop
	nop
	nop
	jr	%ra

pretrace_pixels.3034:
	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.35641

	flw	%f3, 158(%zero)
	lw	%a2, 156(%zero)
	nop
	nop

	nop
	nop
	sub	%a2, %v1, %a2
	nop

	nop
	nop
	itof	%f4, %a2
	nop

	flw	%f4, 165(%zero)
	nop
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fmul	%f4, %f3, %f4
	nop

	nop
	nop
	fadd	%f4, %f4, %f0
	nop

	fsw	%f4, 174(%zero)
	nop
	nop
	nop

	flw	%f4, 166(%zero)
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	fmul	%f4, %f3, %f4
	nop

	nop
	nop
	fadd	%f4, %f4, %f1
	nop

	fsw	%f4, 175(%zero)
	nop
	nop
	nop

	flw	%f4, 167(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f3, %f3, %f4
	nop

	nop
	nop
	fadd	%f3, %f3, %f2
	nop

	fsw	%f3, 176(%zero)
	nop
	nop
	nop

	flw	%f3, 174(%zero)
	flw	%f5, 175(%zero)
	nop
	nop

	nop
	nop
	fmul	%f4, %f3, %f3
	fmul	%f6, %f5, %f5

	flw	%f6, 176(%zero)
	nop
	fadd	%f4, %f4, %f6
	nop

	nop
	nop
	fmul	%f7, %f6, %f6
	nop

	flw	%f7, 494(%zero)
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
	fbne	%f4, %f7, fbeq_else.35642

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35643

fbeq_else.35642:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.35643:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.35644

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35645

bnei_else.35644:
	flw	%f8, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f8, %f4
	nop

bnei_cont.35645:
	fsw	%f2, 0(%sp)
	nop
	fmul	%f3, %f3, %f4
	add	%at, %v0, %v1

	fsw	%f3, 174(%zero)
	lw	%a3, 0(%at)
	fmul	%f3, %f5, %f4
	nop

	fsw	%f3, 175(%zero)
	fsw	%f1, 1(%sp)
	fmul	%f3, %f6, %f4
	fmov	%f1, %f7

	fsw	%f3, 176(%zero)
	fsw	%f0, 2(%sp)
	nop
	nop

	fsw	%f7, 151(%zero)
	sw	%v0, 3(%sp)
	addi	%v0, %a1, 0
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
	nop

	fsw	%f3, 159(%zero)
	sw	%a0, 7(%sp)
	addi	%a0, %a3, 0
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
	nop
	addi	%sp, %sp, 10
	nop

	fsw	%f3, 161(%zero)
	nop
	nop
	nop

	flw	%f3, 484(%zero)
	nop
	addi	%t0, %zero, 174
	nop

	nop
	nop
	addi	%v1, %t0, 0
	fmov	%f0, %f3

	nop
	nop
	nop
	jal	trace_ray.2971

	flw	%f0, 151(%zero)
	nop
	addi	%sp, %sp, -10
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

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.35646

	lw	%v1, 3(%v0)
	nop
	nop
	nop

	lw	%v1, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35648

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

	lw	%a2, 0(%a2)
	nop
	nop
	nop

	flw	%f1, 0(%a2)
	sw	%a2, 9(%sp)
	addi	%v0, %a2, 0
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

	sw	%ra, 12(%sp)
	nop
	addi	%a3, %a3, -1
	nop

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
	addi	%sp, %sp, -13
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

	flw	%f1, 1(%a0)
	nop
	fmul	%f0, %f0, %f1
	nop

	flw	%f2, 2(%a1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%a0)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 6(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35650

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35651

fbgt_else.35650:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.35651:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.35652

	lw	%v1, 119(%v0)
	flw	%f1, 440(%zero)
	nop
	nop

	sw	%ra, 12(%sp)
	nop
	fdiv	%f0, %f0, %f1
	addi	%v0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	trace_diffuse_ray.2977

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
	j	bnei_cont.35653

bnei_else.35652:
	flw	%f1, 439(%zero)
	sw	%ra, 12(%sp)
	addi	%v0, %v1, 0
	nop

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
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

bnei_cont.35653:
	lw	%v0, 11(%sp)
	lw	%v1, 10(%sp)
	addi	%a1, %zero, 116
	nop

	lw	%a0, 9(%sp)
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
	jal	iter_trace_diffuse_rays.2980

	flw	%f0, 148(%zero)
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	nop
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
	flw	%f0, 149(%zero)
	nop
	nop

	fsw	%f0, 1(%v1)
	flw	%f0, 150(%zero)
	nop
	nop

	fsw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35649

bnei_else.35648:
bnei_cont.35649:
	lw	%v1, 5(%sp)
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
	jal	pretrace_diffuse_rays.3031

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
	j	bgti_cont.35647

bgti_else.35646:
bgti_cont.35647:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	lw	%v0, 7(%sp)
	nop
	addi	%v1, %v0, -1
	nop

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.35654

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.35655

bgti_else.35654:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.35655:
	flw	%f0, 2(%sp)
	flw	%f1, 1(%sp)
	nop
	nop

	flw	%f2, 0(%sp)
	lw	%v0, 3(%sp)
	nop
	nop

	nop
	nop
	nop
	j	pretrace_pixels.3034

bgti_else.35641:
	nop
	nop
	nop
	jr	%ra

scan_pixel.3045:
	lw	%t0, 154(%zero)
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.37341

	nop
	nop
	nop
	jr	%ra

bgt_else.37341:
	nop
	nop
	add	%at, %a1, %v0
	addi	%t4, %v1, 1

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
	nop

	fsw	%f0, 151(%zero)
	flw	%f0, 1(%t2)
	nop
	nop

	fsw	%f0, 152(%zero)
	flw	%f0, 2(%t2)
	addi	%t3, %zero, 1
	nop

	fsw	%f0, 153(%zero)
	nop
	nop
	nop

	lw	%t2, 155(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%t4, %t2, bgt_else.37343

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37344

bgt_else.37343:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37345

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37346

bgt_else.37345:
	nop
	nop
	addi	%t5, %v0, 1
	nop

	nop
	nop
	nop
	blt	%t5, %t0, bgt_else.37347

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37348

bgt_else.37347:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37349

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37350

bgt_else.37349:
	nop
	nop
	addi	%t5, %zero, 1
	nop

bgt_cont.37350:
bgt_cont.37348:
bgt_cont.37346:
bgt_cont.37344:
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

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.37351

	lw	%t5, 2(%t1)
	nop
	nop
	nop

	lw	%t5, 0(%t5)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t5, 0, bgti_else.37353

	lw	%t5, 2(%t1)
	nop
	add	%at, %a0, %v0
	nop

	lw	%t5, 0(%t5)
	lw	%t6, 0(%at)
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

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.37355

	nop
	nop
	add	%at, %a2, %v0
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

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.37357

	nop
	nop
	addi	%t7, %v0, -1
	nop

	nop
	nop
	add	%at, %a1, %t7
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

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.37359

	nop
	nop
	addi	%t7, %v0, 1
	nop

	nop
	nop
	add	%at, %a1, %t7
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

	nop
	nop
	nop
	bne	%t7, %t5, beq_else.37361

	nop
	nop
	addi	%t5, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.37356

beq_else.37361:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.37362:
	nop
	nop
	nop
	j	beq_cont.37356

beq_else.37359:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.37360:
	nop
	nop
	nop
	j	beq_cont.37356

beq_else.37357:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.37358:
	nop
	nop
	nop
	j	beq_cont.37356

beq_else.37355:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.37356:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.37363

	lw	%t5, 3(%t1)
	nop
	nop
	nop

	lw	%t5, 0(%t5)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.37365

	lw	%t5, 5(%t6)
	lw	%t7, 5(%t1)
	addi	%t6, %v0, -1
	addi	%s0, %v0, 1

	lw	%t5, 0(%t5)
	lw	%t1, 4(%t1)
	add	%at, %a1, %t6
	nop

	lw	%t6, 0(%at)
	flw	%f0, 0(%t5)
	add	%at, %a1, %s0
	nop

	lw	%t6, 5(%t6)
	lw	%s0, 0(%at)
	add	%at, %a2, %v0
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

	flw	%f1, 1(%t5)
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

	flw	%f1, 2(%t5)
	lw	%t5, 0(%t7)
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

	flw	%f1, 0(%t5)
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

	flw	%f1, 1(%t5)
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

	flw	%f1, 2(%t5)
	lw	%t5, 0(%s0)
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

	flw	%f1, 0(%t5)
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

	flw	%f1, 1(%t5)
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

	flw	%f1, 2(%t5)
	lw	%t5, 0(%s1)
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

	flw	%f1, 0(%t5)
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

	flw	%f1, 1(%t5)
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

	flw	%f1, 2(%t5)
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
	j	bnei_cont.37366

bnei_else.37365:
bnei_cont.37366:
	sw	%ra, 9(%sp)
	nop
	addi	%a3, %t3, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	try_exploit_neighbors.3018

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
	j	bnei_cont.37352

bnei_else.37363:
	sw	%ra, 9(%sp)
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t1, 0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	nop
	nop
	nop

bnei_cont.37364:
	nop
	nop
	nop
	j	bnei_cont.37352

bgti_else.37353:
bgti_cont.37354:
	nop
	nop
	nop
	j	bnei_cont.37352

bnei_else.37351:
	lw	%t5, 2(%t1)
	nop
	nop
	nop

	lw	%t5, 0(%t5)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%t5, 0, bgti_else.37367

	lw	%t5, 3(%t1)
	sw	%t3, 9(%sp)
	nop
	nop

	lw	%t5, 0(%t5)
	sw	%t1, 10(%sp)
	nop
	nop

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.37369

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

	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.37371

	lw	%s1, 179(%zero)
	sw	%ra, 15(%sp)
	addi	%a0, %t7, 0
	addi	%v1, %t6, 0

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37372

bnei_else.37371:
bnei_cont.37372:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.37373

	lw	%v1, 180(%zero)
	lw	%a0, 13(%sp)
	nop
	nop

	lw	%a1, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37374

bnei_else.37373:
bnei_cont.37374:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.37375

	lw	%v1, 181(%zero)
	lw	%a0, 13(%sp)
	nop
	nop

	lw	%a1, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37376

bnei_else.37375:
bnei_cont.37376:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.37377

	lw	%v1, 182(%zero)
	lw	%a0, 13(%sp)
	nop
	nop

	lw	%a1, 12(%sp)
	sw	%ra, 15(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37378

bnei_else.37377:
bnei_cont.37378:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.37379

	lw	%v0, 183(%zero)
	lw	%v1, 13(%sp)
	nop
	nop

	lw	%a0, 12(%sp)
	sw	%ra, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	trace_diffuse_rays.2985

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37380

bnei_else.37379:
bnei_cont.37380:
	lw	%v0, 11(%sp)
	flw	%f0, 151(%zero)
	nop
	nop

	lw	%v0, 0(%v0)
	flw	%f2, 148(%zero)
	nop
	nop

	flw	%f1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 1(%v0)
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

	flw	%f1, 2(%v0)
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
	j	bnei_cont.37370

bnei_else.37369:
bnei_cont.37370:
	lw	%v0, 10(%sp)
	lw	%v1, 9(%sp)
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
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37368

bgti_else.37367:
bgti_cont.37368:
bnei_cont.37352:
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
	blt	%at, %v0, bgt_else.37381

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37383

	nop
	nop
	nop
	j	bgt_cont.37382

bgti_else.37383:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37384:
	nop
	nop
	nop
	j	bgt_cont.37382

bgt_else.37381:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37382:
	nop
	nop
	addi	%v1, %zero, 10
	nop

	sw	%v1, 15(%sp)
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
	blti	%v0, 10, bgti_else.37385

	nop
	nop
	addi	%a0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37387

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37389

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37391

	sw	%ra, 17(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37386

bgti_else.37391:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37392:
	nop
	nop
	nop
	j	bgti_cont.37386

bgti_else.37389:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37390:
	nop
	nop
	nop
	j	bgti_cont.37386

bgti_else.37387:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37388:
	nop
	nop
	nop
	j	bgti_cont.37386

bgti_else.37385:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37386:
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37393

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37395

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37397

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37399

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37401

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37403

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37405

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37407

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37409

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37411

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37413

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37415

	sw	%ra, 18(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37415:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37416:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37413:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37414:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37411:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37412:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37409:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37410:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37407:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37408:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37405:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37406:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37403:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37404:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37401:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37402:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37399:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37400:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37397:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37398:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37395:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37396:
	nop
	nop
	nop
	j	bgti_cont.37394

bgti_else.37393:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37394:
	lw	%v1, 17(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37417

	sw	%ra, 18(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37418

bgt_else.37417:
	sw	%v0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37419

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37421

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37423

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37425

	sw	%ra, 19(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37420

bgti_else.37425:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37426:
	nop
	nop
	nop
	j	bgti_cont.37420

bgti_else.37423:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37424:
	nop
	nop
	nop
	j	bgti_cont.37420

bgti_else.37421:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37422:
	nop
	nop
	nop
	j	bgti_cont.37420

bgti_else.37419:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37420:
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37427

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37429

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37431

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37433

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37435

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37437

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37439

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37441

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37443

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37445

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37447

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37449

	sw	%ra, 20(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37449:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37450:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37447:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37448:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37445:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37446:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37443:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37444:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37441:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37442:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37439:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37440:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37437:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37438:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37435:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37436:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37433:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37434:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37431:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37432:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37429:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37430:
	nop
	nop
	nop
	j	bgti_cont.37428

bgti_else.37427:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37428:
	lw	%v1, 19(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37451

	sw	%ra, 20(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	sw	%ra, 20(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37452

bgt_else.37451:
	sw	%v0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37453

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37455

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37457

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37459

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37461

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37463

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37465

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37467

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37469

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37471

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37473

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37475

	sw	%ra, 21(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37475:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37476:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37473:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37474:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37471:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37472:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37469:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37470:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37467:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37468:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37465:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37466:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37463:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37464:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37461:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37462:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37459:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37460:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37457:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37458:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37455:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37456:
	nop
	nop
	nop
	j	bgti_cont.37454

bgti_else.37453:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37454:
	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v0, 20(%sp)
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v0, 18(%sp)
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

bgt_cont.37452:
bgt_cont.37418:
	nop
	nop
	addi	%v0, %zero, 32
	nop

	sw	%v0, 21(%sp)
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
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -23
	addi	%at, %zero, 255

	lw	%ra, 22(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37477

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37479

	nop
	nop
	nop
	j	bgt_cont.37478

bgti_else.37479:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37480:
	nop
	nop
	nop
	j	bgt_cont.37478

bgt_else.37477:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37478:
	sw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.37481

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37483

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37485

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37487

	sw	%ra, 23(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 24
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37482

bgti_else.37487:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37488:
	nop
	nop
	nop
	j	bgti_cont.37482

bgti_else.37485:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37486:
	nop
	nop
	nop
	j	bgti_cont.37482

bgti_else.37483:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37484:
	nop
	nop
	nop
	j	bgti_cont.37482

bgti_else.37481:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37482:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37489

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37491

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37493

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37495

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37497

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37499

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37501

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37503

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37505

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37507

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37509

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37511

	sw	%ra, 24(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37511:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37512:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37509:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37510:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37507:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37508:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37505:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37506:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37503:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37504:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37501:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37502:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37499:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37500:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37497:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37498:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37495:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37496:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37493:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37494:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37491:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37492:
	nop
	nop
	nop
	j	bgti_cont.37490

bgti_else.37489:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37490:
	lw	%v1, 23(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37513

	sw	%ra, 24(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37514

bgt_else.37513:
	sw	%v0, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37515

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37517

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37519

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37521

	sw	%ra, 25(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37516

bgti_else.37521:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37522:
	nop
	nop
	nop
	j	bgti_cont.37516

bgti_else.37519:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37520:
	nop
	nop
	nop
	j	bgti_cont.37516

bgti_else.37517:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37518:
	nop
	nop
	nop
	j	bgti_cont.37516

bgti_else.37515:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37516:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37523

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37525

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37527

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37529

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37531

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37533

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37535

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37537

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37539

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37541

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37543

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37545

	sw	%ra, 26(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37545:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37546:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37543:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37544:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37541:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37542:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37539:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37540:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37537:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37538:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37535:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37536:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37533:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37534:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37531:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37532:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37529:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37530:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37527:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37528:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37525:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37526:
	nop
	nop
	nop
	j	bgti_cont.37524

bgti_else.37523:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37524:
	lw	%v1, 25(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37547

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37548

bgt_else.37547:
	sw	%v0, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37549

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37551

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37553

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37555

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37557

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37559

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37561

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37563

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37565

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37567

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37569

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37571

	sw	%ra, 27(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37571:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37572:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37569:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37570:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37567:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37568:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37565:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37566:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37563:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37564:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37561:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37562:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37559:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37560:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37557:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37558:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37555:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37556:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37553:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37554:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37551:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37552:
	nop
	nop
	nop
	j	bgti_cont.37550

bgti_else.37549:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37550:
	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

bgt_cont.37548:
bgt_cont.37514:
	lw	%v0, 21(%sp)
	sw	%ra, 27(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -28
	addi	%at, %zero, 255

	lw	%ra, 27(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37573

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37575

	nop
	nop
	nop
	j	bgt_cont.37574

bgti_else.37575:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37576:
	nop
	nop
	nop
	j	bgt_cont.37574

bgt_else.37573:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37574:
	sw	%v0, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.37577

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37579

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37581

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37583

	sw	%ra, 28(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 4

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37578

bgti_else.37583:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37584:
	nop
	nop
	nop
	j	bgti_cont.37578

bgti_else.37581:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37582:
	nop
	nop
	nop
	j	bgti_cont.37578

bgti_else.37579:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37580:
	nop
	nop
	nop
	j	bgti_cont.37578

bgti_else.37577:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37578:
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37585

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37587

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37589

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37591

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37593

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37595

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37597

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37599

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37601

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37603

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37605

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37607

	sw	%ra, 29(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37607:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37608:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37605:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37606:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37603:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37604:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37601:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37602:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37599:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37600:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37597:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37598:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37595:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37596:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37593:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37594:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37591:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37592:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37589:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37590:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37587:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37588:
	nop
	nop
	nop
	j	bgti_cont.37586

bgti_else.37585:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37586:
	lw	%v1, 28(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37609

	sw	%ra, 29(%sp)
	nop
	addi	%v0, %v0, 48
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
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37610

bgt_else.37609:
	sw	%v0, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37611

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37613

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37615

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37617

	sw	%ra, 30(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 4

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37612

bgti_else.37617:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.37618:
	nop
	nop
	nop
	j	bgti_cont.37612

bgti_else.37615:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37616:
	nop
	nop
	nop
	j	bgti_cont.37612

bgti_else.37613:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37614:
	nop
	nop
	nop
	j	bgti_cont.37612

bgti_else.37611:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37612:
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37619

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37621

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37623

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37625

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37627

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37629

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37631

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37633

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37635

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37637

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37639

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37641

	sw	%ra, 31(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37641:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37642:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37639:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37640:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37637:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37638:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37635:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37636:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37633:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37634:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37631:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37632:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37629:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37630:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37627:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37628:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37625:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37626:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37623:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37624:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37621:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37622:
	nop
	nop
	nop
	j	bgti_cont.37620

bgti_else.37619:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37620:
	lw	%v1, 30(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37643

	sw	%ra, 31(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	lw	%v0, 29(%sp)
	nop
	nop

	sw	%ra, 31(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37644

bgt_else.37643:
	sw	%v0, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37645

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37647

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37649

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37651

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37653

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37655

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37657

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37659

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37661

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37663

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37665

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37667

	sw	%ra, 32(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37667:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37668:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37665:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37666:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37663:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37664:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37661:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37662:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37659:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37660:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37657:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37658:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37655:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37656:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37653:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37654:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37651:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37652:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37649:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37650:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37647:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37648:
	nop
	nop
	nop
	j	bgti_cont.37646

bgti_else.37645:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37646:
	sw	%ra, 32(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	lw	%v0, 31(%sp)
	nop
	nop

	sw	%ra, 32(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	lw	%v0, 29(%sp)
	nop
	nop

	sw	%ra, 32(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	nop
	nop
	nop

bgt_cont.37644:
bgt_cont.37610:
	lw	%v0, 15(%sp)
	sw	%ra, 32(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%v1, 7(%sp)
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	blt	%v0, %v1, bgt_else.37669

	nop
	nop
	nop
	jr	%ra

bgt_else.37669:
	lw	%a1, 6(%sp)
	lw	%a3, 5(%sp)
	nop
	nop

	nop
	nop
	add	%at, %a1, %v0
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
	nop
	nop
	blt	%a2, %a3, bgt_else.37671

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37672

bgt_else.37671:
	lw	%a2, 3(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.37673

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37674

bgt_else.37673:
	nop
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	nop
	blt	%a3, %v1, bgt_else.37675

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37676

bgt_else.37675:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37677

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.37678

bgt_else.37677:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bgt_cont.37678:
bgt_cont.37676:
bgt_cont.37674:
bgt_cont.37672:
	sw	%v0, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.37679

	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%a2, 0(%sp)
	lw	%a3, 2(%sp)
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
	jal	try_exploit_neighbors.3018

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
	j	bnei_cont.37680

bnei_else.37679:
	lw	%v1, 2(%sp)
	sw	%ra, 33(%sp)
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	nop
	nop
	nop

bnei_cont.37680:
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
	blt	%at, %v0, bgt_else.37681

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37683

	nop
	nop
	nop
	j	bgt_cont.37682

bgti_else.37683:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37684:
	nop
	nop
	nop
	j	bgt_cont.37682

bgt_else.37681:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37682:
	sw	%v0, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.37685

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37687

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37689

	sw	%ra, 34(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37686

bgti_else.37689:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37690:
	nop
	nop
	nop
	j	bgti_cont.37686

bgti_else.37687:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37688:
	nop
	nop
	nop
	j	bgti_cont.37686

bgti_else.37685:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37686:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37691

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37693

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37695

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37697

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37699

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37701

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37703

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37705

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37707

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37709

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37711

	sw	%ra, 35(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -36
	nop

	lw	%ra, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37711:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37712:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37709:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37710:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37707:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37708:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37705:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37706:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37703:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37704:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37701:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37702:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37699:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37700:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37697:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37698:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37695:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37696:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37693:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37694:
	nop
	nop
	nop
	j	bgti_cont.37692

bgti_else.37691:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37692:
	lw	%v1, 34(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37713

	sw	%ra, 35(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 36
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -36
	nop

	lw	%ra, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37714

bgt_else.37713:
	sw	%v0, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37715

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37717

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37719

	sw	%ra, 36(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -37
	nop

	lw	%ra, 36(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37716

bgti_else.37719:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37720:
	nop
	nop
	nop
	j	bgti_cont.37716

bgti_else.37717:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37718:
	nop
	nop
	nop
	j	bgti_cont.37716

bgti_else.37715:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37716:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37721

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37723

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37725

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37727

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37729

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37731

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37733

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37735

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37737

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37739

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37741

	sw	%ra, 37(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37741:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37742:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37739:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37740:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37737:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37738:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37735:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37736:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37733:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37734:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37731:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37732:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37729:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37730:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37727:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37728:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37725:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37726:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37723:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37724:
	nop
	nop
	nop
	j	bgti_cont.37722

bgti_else.37721:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37722:
	lw	%v1, 36(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37743

	sw	%ra, 37(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	lw	%v0, 35(%sp)
	nop
	nop

	sw	%ra, 37(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37744

bgt_else.37743:
	sw	%v0, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37745

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37747

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37749

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37751

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37753

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37755

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37757

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37759

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37761

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37763

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37765

	sw	%ra, 38(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37765:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37766:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37763:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37764:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37761:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37762:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37759:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37760:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37757:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37758:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37755:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37756:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37753:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37754:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37751:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37752:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37749:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37750:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37747:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37748:
	nop
	nop
	nop
	j	bgti_cont.37746

bgti_else.37745:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37746:
	sw	%ra, 38(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v0, 37(%sp)
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v0, 35(%sp)
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	nop
	nop
	nop

bgt_cont.37744:
bgt_cont.37714:
	lw	%v0, 21(%sp)
	sw	%ra, 38(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -39
	addi	%at, %zero, 255

	lw	%ra, 38(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37767

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37769

	nop
	nop
	nop
	j	bgt_cont.37768

bgti_else.37769:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37770:
	nop
	nop
	nop
	j	bgt_cont.37768

bgt_else.37767:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37768:
	sw	%v0, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.37771

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37773

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37775

	sw	%ra, 39(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -40
	nop

	lw	%ra, 39(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37772

bgti_else.37775:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37776:
	nop
	nop
	nop
	j	bgti_cont.37772

bgti_else.37773:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37774:
	nop
	nop
	nop
	j	bgti_cont.37772

bgti_else.37771:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37772:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37777

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37779

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37781

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37783

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37785

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37787

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37789

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37791

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37793

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37795

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37797

	sw	%ra, 40(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37797:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37798:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37795:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37796:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37793:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37794:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37791:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37792:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37789:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37790:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37787:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37788:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37785:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37786:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37783:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37784:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37781:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37782:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37779:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37780:
	nop
	nop
	nop
	j	bgti_cont.37778

bgti_else.37777:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37778:
	lw	%v1, 39(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37799

	sw	%ra, 40(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37800

bgt_else.37799:
	sw	%v0, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37801

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37803

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37805

	sw	%ra, 41(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37802

bgti_else.37805:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37806:
	nop
	nop
	nop
	j	bgti_cont.37802

bgti_else.37803:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37804:
	nop
	nop
	nop
	j	bgti_cont.37802

bgti_else.37801:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37802:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37807

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37809

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37811

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37813

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37815

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37817

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37819

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37821

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37823

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37825

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37827

	sw	%ra, 42(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37827:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37828:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37825:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37826:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37823:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37824:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37821:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37822:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37819:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37820:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37817:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37818:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37815:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37816:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37813:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37814:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37811:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37812:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37809:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37810:
	nop
	nop
	nop
	j	bgti_cont.37808

bgti_else.37807:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37808:
	lw	%v1, 41(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37829

	sw	%ra, 42(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	lw	%v0, 40(%sp)
	nop
	nop

	sw	%ra, 42(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.37830

bgt_else.37829:
	sw	%v0, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37831

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37833

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37835

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37837

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37839

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37841

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37843

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37845

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37847

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37849

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37851

	sw	%ra, 43(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37851:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37852:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37849:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37850:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37847:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37848:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37845:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37846:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37843:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37844:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37841:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37842:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37839:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37840:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37837:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37838:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37835:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37836:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37833:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37834:
	nop
	nop
	nop
	j	bgti_cont.37832

bgti_else.37831:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37832:
	sw	%ra, 43(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v0, 42(%sp)
	nop
	nop

	sw	%ra, 43(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v0, 40(%sp)
	nop
	nop

	sw	%ra, 43(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	nop
	nop
	nop

bgt_cont.37830:
bgt_cont.37800:
	lw	%v0, 21(%sp)
	sw	%ra, 43(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -44
	addi	%at, %zero, 255

	lw	%ra, 43(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.37853

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.37855

	nop
	nop
	nop
	j	bgt_cont.37854

bgti_else.37855:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37856:
	nop
	nop
	nop
	j	bgt_cont.37854

bgt_else.37853:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.37854:
	sw	%v0, 43(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.37857

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37859

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37861

	sw	%ra, 44(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 45
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -45
	nop

	lw	%ra, 44(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37858

bgti_else.37861:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37862:
	nop
	nop
	nop
	j	bgti_cont.37858

bgti_else.37859:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37860:
	nop
	nop
	nop
	j	bgti_cont.37858

bgti_else.37857:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37858:
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37863

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37865

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37867

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37869

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37871

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37873

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37875

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37877

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37879

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37881

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37883

	sw	%ra, 45(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -46
	nop

	lw	%ra, 45(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37883:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37884:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37881:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37882:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37879:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37880:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37877:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37878:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37875:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37876:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37873:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37874:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37871:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37872:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37869:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37870:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37867:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37868:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37865:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37866:
	nop
	nop
	nop
	j	bgti_cont.37864

bgti_else.37863:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37864:
	lw	%v1, 44(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37885

	sw	%ra, 45(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 46
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -46
	nop

	lw	%ra, 45(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37886

bgt_else.37885:
	sw	%v0, 45(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37887

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37889

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.37891

	sw	%ra, 46(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.37888

bgti_else.37891:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.37892:
	nop
	nop
	nop
	j	bgti_cont.37888

bgti_else.37889:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.37890:
	nop
	nop
	nop
	j	bgti_cont.37888

bgti_else.37887:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.37888:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37893

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37895

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37897

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37899

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37901

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37903

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37905

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37907

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37909

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37911

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37913

	sw	%ra, 47(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37913:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37914:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37911:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37912:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37909:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37910:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37907:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37908:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37905:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37906:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37903:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37904:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37901:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37902:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37899:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37900:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37897:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37898:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37895:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37896:
	nop
	nop
	nop
	j	bgti_cont.37894

bgti_else.37893:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37894:
	lw	%v1, 46(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.37915

	sw	%ra, 47(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	lw	%v0, 45(%sp)
	nop
	nop

	sw	%ra, 47(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.37916

bgt_else.37915:
	sw	%v0, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37917

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37919

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37921

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37923

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37925

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37927

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37929

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37931

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37933

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37935

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.37937

	sw	%ra, 48(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37937:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37938:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37935:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37936:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37933:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37934:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37931:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37932:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37929:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37930:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37927:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37928:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37925:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37926:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37923:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37924:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37921:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37922:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37919:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37920:
	nop
	nop
	nop
	j	bgti_cont.37918

bgti_else.37917:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.37918:
	sw	%ra, 48(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	lw	%v0, 47(%sp)
	nop
	nop

	sw	%ra, 48(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	lw	%v0, 45(%sp)
	nop
	nop

	sw	%ra, 48(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	nop
	nop
	nop

bgt_cont.37916:
bgt_cont.37886:
	lw	%v0, 15(%sp)
	sw	%ra, 48(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	lw	%v0, 32(%sp)
	nop
	nop

	lw	%v1, 3(%sp)
	lw	%a0, 1(%sp)
	addi	%v0, %v0, 1
	nop

	lw	%a1, 6(%sp)
	lw	%a2, 0(%sp)
	nop
	nop

	nop
	nop
	nop
	j	scan_pixel.3045

scan_line.3051:
	lw	%t0, 155(%zero)
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	blt	%v0, %t0, bgt_else.38503

	nop
	nop
	nop
	jr	%ra

bgt_else.38503:
	nop
	nop
	addi	%t1, %t0, -1
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

	nop
	nop
	nop
	blt	%v0, %t1, bgt_else.38505

	nop
	nop
	nop
	j	bgt_cont.38506

bgt_else.38505:
	flw	%f0, 158(%zero)
	lw	%t3, 157(%zero)
	addi	%t2, %v0, 1
	addi	%a0, %a2, 0

	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)
	sub	%t2, %t2, %t3
	addi	%v0, %a1, 0

	lw	%t2, 154(%zero)
	sw	%ra, 8(%sp)
	itof	%f1, %t2
	nop

	flw	%f1, 168(%zero)
	nop
	fmul	%f0, %f0, %f1
	addi	%t2, %t2, -1

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %t2, 0

	flw	%f2, 169(%zero)
	nop
	fadd	%f1, %f1, %f2
	addi	%sp, %sp, 9

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	flw	%f3, 170(%zero)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 173(%zero)
	nop
	fmul	%f0, %f0, %f3
	fmov	%f29, %f2

	nop
	nop
	fadd	%f0, %f0, %f3
	nop

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f29
	nop

	nop
	nop
	nop
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

bgt_cont.38506:
	lw	%v0, 154(%zero)
	nop
	addi	%v1, %zero, 0
	addi	%at, %zero, 0

	sw	%v1, 8(%sp)
	nop
	nop
	nop

	sw	%v0, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38507

	nop
	nop
	nop
	j	bgt_cont.38508

bgt_else.38507:
	lw	%a1, 7(%sp)
	lw	%t0, 5(%sp)
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
	nop
	addi	%a3, %a2, 1
	nop

	nop
	nop
	nop
	blt	%a3, %t0, bgt_else.38509

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.38510

bgt_else.38509:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.38511

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.38512

bgt_else.38511:
	nop
	nop
	addi	%at, %zero, 1
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38513

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.38514

bgt_else.38513:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bgt_cont.38514:
bgt_cont.38512:
bgt_cont.38510:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38515

	lw	%a0, 4(%sp)
	lw	%a3, 3(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%k0, %a3, 0
	addi	%a3, %v1, 0

	nop
	nop
	addi	%v1, %a2, 0
	addi	%a2, %k0, 0

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	try_exploit_neighbors.3018

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
	j	bnei_cont.38516

bnei_else.38515:
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
	jal	do_without_neighbors.3002

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	nop
	nop
	nop

bnei_cont.38516:
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
	blt	%at, %v0, bgt_else.38517

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38519

	nop
	nop
	nop
	j	bgt_cont.38518

bgti_else.38519:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38520:
	nop
	nop
	nop
	j	bgt_cont.38518

bgt_else.38517:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38518:
	nop
	nop
	addi	%v1, %zero, 10
	nop

	sw	%v1, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.38521

	nop
	nop
	addi	%a0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38523

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38525

	sw	%ra, 12(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.38522

bgti_else.38525:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38526:
	nop
	nop
	nop
	j	bgti_cont.38522

bgti_else.38523:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38524:
	nop
	nop
	nop
	j	bgti_cont.38522

bgti_else.38521:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38522:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38527

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38529

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38531

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38533

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38535

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38537

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38539

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38541

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38543

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38545

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38547

	sw	%ra, 13(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38547:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38548:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38545:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38546:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38543:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38544:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38541:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38542:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38539:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38540:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38537:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38538:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38535:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38536:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38533:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38534:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38531:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38532:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38529:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38530:
	nop
	nop
	nop
	j	bgti_cont.38528

bgti_else.38527:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38528:
	lw	%v1, 12(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38549

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.38550

bgt_else.38549:
	sw	%v0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38551

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38553

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38555

	sw	%ra, 14(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.38552

bgti_else.38555:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38556:
	nop
	nop
	nop
	j	bgti_cont.38552

bgti_else.38553:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38554:
	nop
	nop
	nop
	j	bgti_cont.38552

bgti_else.38551:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38552:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38557

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38559

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38561

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38563

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38565

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38567

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38569

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38571

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38573

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38575

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38577

	sw	%ra, 15(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38577:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38578:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38575:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38576:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38573:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38574:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38571:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38572:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38569:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38570:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38567:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38568:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38565:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38566:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38563:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38564:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38561:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38562:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38559:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38560:
	nop
	nop
	nop
	j	bgti_cont.38558

bgti_else.38557:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38558:
	lw	%v1, 14(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38579

	sw	%ra, 15(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.38580

bgt_else.38579:
	sw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38581

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38583

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38585

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38587

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38589

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38591

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38593

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38595

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38597

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38599

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38601

	sw	%ra, 16(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38601:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38602:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38599:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38600:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38597:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38598:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38595:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38596:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38593:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38594:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38591:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38592:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38589:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38590:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38587:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38588:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38585:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38586:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38583:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38584:
	nop
	nop
	nop
	j	bgti_cont.38582

bgti_else.38581:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38582:
	sw	%ra, 16(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	lw	%v0, 15(%sp)
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 17
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	nop
	nop
	nop

bgt_cont.38580:
bgt_cont.38550:
	nop
	nop
	addi	%v0, %zero, 32
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
	jal	min_caml_print_char

	flw	%f0, 152(%zero)
	nop
	addi	%sp, %sp, -18
	addi	%at, %zero, 255

	lw	%ra, 17(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38603

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38605

	nop
	nop
	nop
	j	bgt_cont.38604

bgti_else.38605:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38606:
	nop
	nop
	nop
	j	bgt_cont.38604

bgt_else.38603:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38604:
	sw	%v0, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.38607

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38609

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38611

	sw	%ra, 18(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.38608

bgti_else.38611:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38612:
	nop
	nop
	nop
	j	bgti_cont.38608

bgti_else.38609:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38610:
	nop
	nop
	nop
	j	bgti_cont.38608

bgti_else.38607:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38608:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38613

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38615

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38617

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38619

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38621

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38623

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38625

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38627

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38629

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38631

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38633

	sw	%ra, 19(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38633:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38634:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38631:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38632:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38629:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38630:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38627:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38628:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38625:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38626:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38623:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38624:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38621:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38622:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38619:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38620:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38617:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38618:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38615:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38616:
	nop
	nop
	nop
	j	bgti_cont.38614

bgti_else.38613:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38614:
	lw	%v1, 18(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38635

	sw	%ra, 19(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.38636

bgt_else.38635:
	sw	%v0, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38637

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38639

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38641

	sw	%ra, 20(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.38638

bgti_else.38641:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38642:
	nop
	nop
	nop
	j	bgti_cont.38638

bgti_else.38639:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38640:
	nop
	nop
	nop
	j	bgti_cont.38638

bgti_else.38637:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38638:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38643

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38645

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38647

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38649

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38651

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38653

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38655

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38657

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38659

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38661

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38663

	sw	%ra, 21(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38663:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38664:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38661:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38662:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38659:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38660:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38657:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38658:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38655:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38656:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38653:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38654:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38651:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38652:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38649:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38650:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38647:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38648:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38645:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38646:
	nop
	nop
	nop
	j	bgti_cont.38644

bgti_else.38643:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38644:
	lw	%v1, 20(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38665

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v0, 19(%sp)
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.38666

bgt_else.38665:
	sw	%v0, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38667

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38669

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38671

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38673

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38675

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38677

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38679

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38681

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38683

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38685

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38687

	sw	%ra, 22(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38687:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38688:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38685:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38686:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38683:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38684:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38681:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38682:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38679:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38680:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38677:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38678:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38675:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38676:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38673:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38674:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38671:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38672:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38669:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38670:
	nop
	nop
	nop
	j	bgti_cont.38668

bgti_else.38667:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38668:
	sw	%ra, 22(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	lw	%v0, 21(%sp)
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	lw	%v0, 19(%sp)
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

bgt_cont.38666:
bgt_cont.38636:
	lw	%v0, 16(%sp)
	sw	%ra, 22(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 23
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	flw	%f0, 153(%zero)
	nop
	addi	%sp, %sp, -23
	addi	%at, %zero, 255

	lw	%ra, 22(%sp)
	nop
	ftoi	%v0, %f0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.38689

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.38691

	nop
	nop
	nop
	j	bgt_cont.38690

bgti_else.38691:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38692:
	nop
	nop
	nop
	j	bgt_cont.38690

bgt_else.38689:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.38690:
	sw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.38693

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38695

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38697

	sw	%ra, 23(%sp)
	nop
	addi	%v1, %v1, -10
	addi	%a0, %zero, 3

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 24
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38694

bgti_else.38697:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38698:
	nop
	nop
	nop
	j	bgti_cont.38694

bgti_else.38695:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38696:
	nop
	nop
	nop
	j	bgti_cont.38694

bgti_else.38693:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38694:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38699

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38701

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38703

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38705

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38707

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38709

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38711

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38713

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38715

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38717

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38719

	sw	%ra, 24(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38719:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38720:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38717:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38718:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38715:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38716:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38713:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38714:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38711:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38712:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38709:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38710:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38707:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38708:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38705:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38706:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38703:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38704:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38701:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38702:
	nop
	nop
	nop
	j	bgti_cont.38700

bgti_else.38699:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38700:
	lw	%v1, 23(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38721

	sw	%ra, 24(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.38722

bgt_else.38721:
	sw	%v0, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38723

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38725

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.38727

	sw	%ra, 25(%sp)
	nop
	addi	%a0, %a0, -10
	addi	%a1, %zero, 3

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.38724

bgti_else.38727:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.38728:
	nop
	nop
	nop
	j	bgti_cont.38724

bgti_else.38725:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.38726:
	nop
	nop
	nop
	j	bgti_cont.38724

bgti_else.38723:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.38724:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38729

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38731

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38733

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38735

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38737

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38739

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38741

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38743

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38745

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38747

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38749

	sw	%ra, 26(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38749:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38750:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38747:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38748:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38745:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38746:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38743:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38744:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38741:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38742:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38739:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38740:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38737:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38738:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38735:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38736:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38733:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38734:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38731:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38732:
	nop
	nop
	nop
	j	bgti_cont.38730

bgti_else.38729:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38730:
	lw	%v1, 25(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.38751

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	lw	%v0, 24(%sp)
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.38752

bgt_else.38751:
	sw	%v0, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38753

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38755

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38757

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38759

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38761

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38763

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38765

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38767

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38769

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38771

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.38773

	sw	%ra, 27(%sp)
	nop
	addi	%v1, %v1, -10
	nop

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
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38773:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38774:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38771:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38772:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38769:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38770:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38767:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38768:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38765:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38766:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38763:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38764:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38761:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38762:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38759:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38760:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38757:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38758:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38755:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38756:
	nop
	nop
	nop
	j	bgti_cont.38754

bgti_else.38753:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.38754:
	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	lw	%v0, 26(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	lw	%v0, 24(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

bgt_cont.38752:
bgt_cont.38722:
	lw	%v0, 10(%sp)
	sw	%ra, 27(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -28
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
	jal	scan_pixel.3045

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

bgt_cont.38508:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	addi	%v0, %v0, 2
	nop

	nop
	nop
	nop
	blti	%v0, 5, bgti_else.38775

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.38776

bgti_else.38775:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.38776:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.38777

	nop
	nop
	nop
	jr	%ra

bgt_else.38777:
	lw	%v0, 0(%sp)
	sw	%a0, 27(%sp)
	nop
	nop

	sw	%v1, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.38779

	nop
	nop
	nop
	j	bgt_cont.38780

bgt_else.38779:
	flw	%f0, 158(%zero)
	lw	%a1, 157(%zero)
	addi	%v0, %v1, 1
	nop

	flw	%f2, 171(%zero)
	flw	%f3, 172(%zero)
	sub	%v0, %v0, %a1
	nop

	lw	%v0, 9(%sp)
	lw	%a1, 4(%sp)
	itof	%f1, %v0
	nop

	flw	%f1, 168(%zero)
	sw	%ra, 29(%sp)
	fmul	%f0, %f0, %f1
	addi	%v0, %v0, -1

	nop
	nop
	fmul	%f1, %f0, %f1
	addi	%v1, %v0, 0

	flw	%f2, 169(%zero)
	nop
	fadd	%f1, %f1, %f2
	addi	%v0, %a1, 0

	nop
	nop
	fmul	%f2, %f0, %f2
	addi	%sp, %sp, 30

	flw	%f3, 170(%zero)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 173(%zero)
	nop
	fmul	%f0, %f0, %f3
	fmov	%f29, %f2

	nop
	nop
	fadd	%f0, %f0, %f3
	nop

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f29
	nop

	nop
	nop
	nop
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

bgt_cont.38780:
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
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	scan_pixel.3045

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v0, 28(%sp)
	nop
	nop

	lw	%v1, 27(%sp)
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
	blti	%v1, 5, bgti_else.38781

	nop
	nop
	addi	%a2, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.38782

bgti_else.38781:
	nop
	nop
	add	%a2, %zero, %v1
	nop

bgti_cont.38782:
	lw	%v1, 3(%sp)
	lw	%a0, 4(%sp)
	nop
	nop

	lw	%a1, 7(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	scan_line.3051

init_line_elements.3061:
	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.39088

	flw	%f0, 494(%zero)
	sw	%v1, 0(%sp)
	addi	%a1, %zero, 3
	nop

	sw	%v0, 1(%sp)
	nop
	addi	%v0, %a1, 0
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
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 5(%sp)
	nop
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %v0, 0

	lw	%ra, 6(%sp)
	nop
	addi	%v0, %zero, 5
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 1

	lw	%ra, 7(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%a0, 4(%sp)
	sw	%v1, 7(%sp)
	nop
	nop

	sw	%v0, 8(%sp)
	nop
	addi	%v0, %a0, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
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
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	sw	%v0, 9(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 10(%sp)
	nop
	addi	%v1, %a0, 0
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
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 10(%sp)
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
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
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
	addi	%v1, %v0, 0

	lw	%ra, 12(%sp)
	lw	%v0, 6(%sp)
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
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %v1, 0
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

	sw	%v0, 1(%v1)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -14
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

	sw	%v0, 3(%v1)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -14
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
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)
	nop
	nop

	sw	%ra, 14(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 14(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 14(%sp)
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	addi	%v0, %v1, 0
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
	lw	%v1, 14(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 1(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

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
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.39089

	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v0, 15(%sp)
	nop
	addi	%v0, %v1, 0
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
	nop

	lw	%ra, 16(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	nop
	nop

	sw	%ra, 17(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -18
	addi	%v1, %v0, 0

	lw	%ra, 17(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
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
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
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
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
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
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
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
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	sw	%v0, 18(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 19(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)
	nop
	nop

	sw	%ra, 20(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 20(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
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
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
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
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
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
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
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
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	addi	%v1, %v0, 0

	lw	%ra, 21(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 21(%sp)
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	addi	%v0, %v1, 0
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
	nop

	lw	%ra, 22(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 22(%sp)
	nop
	nop

	sw	%ra, 23(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 24
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -24
	addi	%v1, %v0, 0

	lw	%ra, 23(%sp)
	lw	%v0, 6(%sp)
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
	nop

	lw	%ra, 23(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	sw	%ra, 24(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
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
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
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
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
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
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	lw	%v1, 23(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 1(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

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
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.39090

	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v0, 24(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 25(%sp)
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -27
	addi	%v1, %v0, 0

	lw	%ra, 26(%sp)
	lw	%v0, 6(%sp)
	nop
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 26(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
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
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
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
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
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
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
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
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	sw	%v0, 27(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 28(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	addi	%v1, %v0, 0

	lw	%ra, 29(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)
	nop
	nop

	sw	%ra, 30(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
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
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
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
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
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
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
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
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
	addi	%v1, %v0, 0

	lw	%ra, 30(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)
	nop
	nop

	sw	%ra, 31(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
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
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
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
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
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
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
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
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 31(%sp)
	nop
	nop

	sw	%ra, 32(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -33
	addi	%v1, %v0, 0

	lw	%ra, 32(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	sw	%ra, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 32(%sp)
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -34
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
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -34
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
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -34
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
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	lw	%v1, 32(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 1(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

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
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.39091

	flw	%f0, 3(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v0, 33(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 34(%sp)
	nop
	nop

	sw	%ra, 35(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 36
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -36
	addi	%v1, %v0, 0

	lw	%ra, 35(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	sw	%ra, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 36
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -36
	nop

	lw	%ra, 35(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)
	nop
	nop

	sw	%ra, 36(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -37
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
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -37
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
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -37
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
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -37
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
	addi	%sp, %sp, -37
	nop

	lw	%ra, 36(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 2(%sp)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 37(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	addi	%v1, %v0, 0

	lw	%ra, 38(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)
	nop
	nop

	sw	%ra, 39(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
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
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
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
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
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
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
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
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
	addi	%v1, %v0, 0

	lw	%ra, 39(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -40
	nop

	lw	%ra, 39(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)
	nop
	nop

	sw	%ra, 40(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
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
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
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
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
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
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
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
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 40(%sp)
	nop
	nop

	sw	%ra, 41(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 42
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -42
	addi	%v1, %v0, 0

	lw	%ra, 41(%sp)
	lw	%v0, 6(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	flw	%f0, 3(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)
	nop
	nop

	sw	%ra, 42(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -43
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
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -43
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
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -43
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
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	lw	%v1, 41(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 1(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

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

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	sw	%v0, 0(%at)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	j	init_line_elements.3061

bgti_else.39091:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39090:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39089:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.39088:
	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.40096

	lw	%v0, 179(%v1)
	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1

	flw	%f3, 484(%zero)
	nop
	fadd	%f2, %f2, %f3
	add	%at, %v0, %a0

	lw	%v1, 0(%at)
	nop
	fadd	%f2, %f2, %f3
	nop

	lw	%v1, 0(%v1)
	nop
	fsqrt	%f2, %f2
	nop

	nop
	nop
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2

	fsw	%f0, 0(%v1)
	nop
	fdiv	%f2, %f3, %f2
	fneg	%f3, %f1

	fsw	%f1, 1(%v1)
	nop
	fneg	%f4, %f1
	fneg	%f5, %f2

	fsw	%f2, 2(%v1)
	nop
	nop
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
	fneg	%f3, %f0
	nop

	fsw	%f4, 2(%v1)
	nop
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
	fneg	%f3, %f0
	nop

	fsw	%f4, 1(%v1)
	nop
	fneg	%f4, %f2
	fneg	%f2, %f2

	fsw	%f5, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 41
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

bgti_else.40096:
	flw	%f1, 441(%zero)
	flw	%f4, 484(%zero)
	fmul	%f0, %f1, %f1
	nop

	sw	%a0, 0(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	sw	%v1, 1(%sp)
	nop
	fsqrt	%f0, %f0
	nop

	fsw	%f3, 2(%sp)
	nop
	fdiv	%f5, %f4, %f0
	nop

	fsw	%f1, 3(%sp)
	nop
	nop
	nop

	sw	%v0, 4(%sp)
	nop
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	fmov	%f0, %f5
	nop

	fsw	%f4, 6(%sp)
	nop
	nop
	nop

	fsw	%f2, 7(%sp)
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
	jal	atan.2627

	flw	%f2, 482(%zero)
	flw	%f3, 494(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.40098

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40099

fbgt_else.40098:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.40099:
	flw	%f5, 481(%zero)
	fsw	%f3, 8(%sp)
	fabs	%f4, %f0
	nop

	fsw	%f0, 9(%sp)
	nop
	nop
	nop

	sw	%v0, 10(%sp)
	nop
	nop
	nop

	fsw	%f2, 11(%sp)
	nop
	nop
	nop

	fsw	%f4, 12(%sp)
	nop
	nop
	nop

	fsw	%f5, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.40100

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40102

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40104

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40106

	flw	%f6, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40108

	flw	%f6, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40110

	flw	%f6, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40112

	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40114

	flw	%f6, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40116

	flw	%f6, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40118

	flw	%f6, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40120

	flw	%f6, 470(%zero)
	sw	%ra, 14(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

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
	j	fbgt_cont.40101

fbgt_else.40120:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40121:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40118:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40119:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40116:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40117:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40114:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40115:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40112:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40113:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40110:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40111:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40108:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40109:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40106:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40107:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40104:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40105:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40102:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40103:
	nop
	nop
	nop
	j	fbgt_cont.40101

fbgt_else.40100:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.40101:
	flw	%f1, 12(%sp)
	flw	%f2, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40122

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40124

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40126

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40128

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40130

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40132

	sw	%ra, 14(%sp)
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
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.40123

fbgt_else.40132:
	sw	%ra, 14(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

fbgt_cont.40133:
	nop
	nop
	nop
	j	fbgt_cont.40123

fbgt_else.40130:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40131:
	nop
	nop
	nop
	j	fbgt_cont.40123

fbgt_else.40128:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40134

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40136

	sw	%ra, 14(%sp)
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
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.40135

fbgt_else.40136:
	sw	%ra, 14(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

fbgt_cont.40137:
	nop
	nop
	nop
	j	fbgt_cont.40135

fbgt_else.40134:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40135:
fbgt_cont.40129:
	nop
	nop
	nop
	j	fbgt_cont.40123

fbgt_else.40126:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40127:
	nop
	nop
	nop
	j	fbgt_cont.40123

fbgt_else.40124:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40138

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40140

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40142

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40144

	sw	%ra, 14(%sp)
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
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.40139

fbgt_else.40144:
	sw	%ra, 14(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

fbgt_cont.40145:
	nop
	nop
	nop
	j	fbgt_cont.40139

fbgt_else.40142:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40143:
	nop
	nop
	nop
	j	fbgt_cont.40139

fbgt_else.40140:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40146

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40148

	sw	%ra, 14(%sp)
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
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.40147

fbgt_else.40148:
	sw	%ra, 14(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 15
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

fbgt_cont.40149:
	nop
	nop
	nop
	j	fbgt_cont.40147

fbgt_else.40146:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40147:
fbgt_cont.40141:
	nop
	nop
	nop
	j	fbgt_cont.40139

fbgt_else.40138:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40139:
fbgt_cont.40125:
	nop
	nop
	nop
	j	fbgt_cont.40123

fbgt_else.40122:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40123:
	flw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40150

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40152

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40151

bnei_else.40152:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.40153:
	nop
	nop
	nop
	j	fbgt_cont.40151

fbgt_else.40150:
	lw	%v0, 10(%sp)
	nop
	nop
	nop

fbgt_cont.40151:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40154

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40155

fbgt_else.40154:
fbgt_cont.40155:
	flw	%f2, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40156

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40157

fbgt_else.40156:
fbgt_cont.40157:
	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.40158

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.40159

fbgt_else.40158:
	flw	%f5, 464(%zero)
	flw	%f6, 6(%sp)
	fsub	%f0, %f2, %f0
	nop

	flw	%f7, 463(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	flw	%f7, 462(%zero)
	nop
	fadd	%f5, %f5, %f7
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

fbgt_cont.40159:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40160

	nop
	nop
	nop
	j	bnei_cont.40161

bnei_else.40160:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40161:
	flw	%f4, 9(%sp)
	flw	%f5, 13(%sp)
	nop
	nop

	fsw	%f0, 14(%sp)
	nop
	fabs	%f4, %f4
	nop

	fsw	%f3, 15(%sp)
	nop
	nop
	nop

	fsw	%f2, 16(%sp)
	nop
	nop
	nop

	fsw	%f4, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.40162

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40164

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40166

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40168

	flw	%f6, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40170

	flw	%f6, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40172

	flw	%f6, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40174

	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40176

	flw	%f6, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40178

	flw	%f6, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40180

	flw	%f6, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40182

	flw	%f6, 470(%zero)
	sw	%ra, 18(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f6
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
	j	fbgt_cont.40163

fbgt_else.40182:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40183:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40180:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40181:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40178:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40179:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40176:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40177:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40174:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40175:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40172:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40173:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40170:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40171:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40168:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40169:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40166:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40167:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40164:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40165:
	nop
	nop
	nop
	j	fbgt_cont.40163

fbgt_else.40162:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.40163:
	flw	%f1, 17(%sp)
	flw	%f2, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40184

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40186

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40188

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40190

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40192

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40194

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
	j	fbgt_cont.40185

fbgt_else.40194:
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

fbgt_cont.40195:
	nop
	nop
	nop
	j	fbgt_cont.40185

fbgt_else.40192:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40193:
	nop
	nop
	nop
	j	fbgt_cont.40185

fbgt_else.40190:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40196

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40198

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
	j	fbgt_cont.40197

fbgt_else.40198:
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

fbgt_cont.40199:
	nop
	nop
	nop
	j	fbgt_cont.40197

fbgt_else.40196:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40197:
fbgt_cont.40191:
	nop
	nop
	nop
	j	fbgt_cont.40185

fbgt_else.40188:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40189:
	nop
	nop
	nop
	j	fbgt_cont.40185

fbgt_else.40186:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40200

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40202

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40204

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40206

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
	j	fbgt_cont.40201

fbgt_else.40206:
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

fbgt_cont.40207:
	nop
	nop
	nop
	j	fbgt_cont.40201

fbgt_else.40204:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40205:
	nop
	nop
	nop
	j	fbgt_cont.40201

fbgt_else.40202:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40208

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40210

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
	j	fbgt_cont.40209

fbgt_else.40210:
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

fbgt_cont.40211:
	nop
	nop
	nop
	j	fbgt_cont.40209

fbgt_else.40208:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40209:
fbgt_cont.40203:
	nop
	nop
	nop
	j	fbgt_cont.40201

fbgt_else.40200:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40201:
fbgt_cont.40187:
	nop
	nop
	nop
	j	fbgt_cont.40185

fbgt_else.40184:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40185:
	flw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40212

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40213

fbgt_else.40212:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.40213:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40214

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40215

fbgt_else.40214:
fbgt_cont.40215:
	flw	%f2, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40216

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40218

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40217

bnei_else.40218:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.40219:
	nop
	nop
	nop
	j	fbgt_cont.40217

fbgt_else.40216:
fbgt_cont.40217:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40220

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40221

fbgt_else.40220:
fbgt_cont.40221:
	flw	%f3, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.40222

	flw	%f5, 464(%zero)
	flw	%f6, 6(%sp)
	fmul	%f0, %f0, %f0
	nop

	flw	%f7, 463(%zero)
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	flw	%f7, 462(%zero)
	nop
	fadd	%f5, %f5, %f7
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
	nop
	j	fbgt_cont.40223

fbgt_else.40222:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.40223:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40224

	nop
	nop
	nop
	j	bnei_cont.40225

bnei_else.40224:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40225:
	flw	%f4, 14(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	flw	%f4, 5(%sp)
	flw	%f5, 3(%sp)
	fdiv	%f0, %f4, %f0
	addi	%v0, %v0, 1

	nop
	nop
	fmul	%f0, %f0, %f4
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	nop

	flw	%f5, 6(%sp)
	fsw	%f0, 18(%sp)
	fadd	%f4, %f4, %f5
	nop

	sw	%v0, 19(%sp)
	nop
	fsqrt	%f4, %f4
	nop

	fsw	%f4, 20(%sp)
	nop
	fdiv	%f6, %f5, %f4
	nop

	sw	%ra, 21(%sp)
	nop
	fmov	%f0, %f6
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	atan.2627

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	flw	%f3, 2(%sp)
	nop
	nop

	flw	%f1, 8(%sp)
	nop
	fmul	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40226

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40227

fbgt_else.40226:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.40227:
	flw	%f2, 13(%sp)
	fsw	%f0, 21(%sp)
	fabs	%f1, %f0
	nop

	sw	%v0, 22(%sp)
	nop
	nop
	nop

	fsw	%f1, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40228

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40230

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40232

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40234

	flw	%f4, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40236

	flw	%f4, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40238

	flw	%f4, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40240

	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40242

	flw	%f4, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40244

	flw	%f4, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40246

	flw	%f4, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f4, fbgt_else.40248

	flw	%f4, 470(%zero)
	sw	%ra, 24(%sp)
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40248:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40249:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40246:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40247:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40244:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40245:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40242:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40243:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40240:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40241:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40238:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40239:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40236:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40237:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40234:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40235:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40232:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40233:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40230:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.40231:
	nop
	nop
	nop
	j	fbgt_cont.40229

fbgt_else.40228:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.40229:
	flw	%f1, 23(%sp)
	flw	%f2, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40250

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40252

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40254

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40256

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40258

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40260

	sw	%ra, 24(%sp)
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
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40260:
	sw	%ra, 24(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

fbgt_cont.40261:
	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40258:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40259:
	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40256:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40262

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40264

	sw	%ra, 24(%sp)
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
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.40263

fbgt_else.40264:
	sw	%ra, 24(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

fbgt_cont.40265:
	nop
	nop
	nop
	j	fbgt_cont.40263

fbgt_else.40262:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40263:
fbgt_cont.40257:
	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40254:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40255:
	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40252:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40266

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40268

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40270

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40272

	sw	%ra, 24(%sp)
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
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.40267

fbgt_else.40272:
	sw	%ra, 24(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

fbgt_cont.40273:
	nop
	nop
	nop
	j	fbgt_cont.40267

fbgt_else.40270:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40271:
	nop
	nop
	nop
	j	fbgt_cont.40267

fbgt_else.40268:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40274

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40276

	sw	%ra, 24(%sp)
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
	addi	%sp, %sp, 25

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.40275

fbgt_else.40276:
	sw	%ra, 24(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

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
	nop
	nop
	nop

fbgt_cont.40277:
	nop
	nop
	nop
	j	fbgt_cont.40275

fbgt_else.40274:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40275:
fbgt_cont.40269:
	nop
	nop
	nop
	j	fbgt_cont.40267

fbgt_else.40266:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40267:
fbgt_cont.40253:
	nop
	nop
	nop
	j	fbgt_cont.40251

fbgt_else.40250:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40251:
	flw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40278

	lw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40280

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40279

bnei_else.40280:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.40281:
	nop
	nop
	nop
	j	fbgt_cont.40279

fbgt_else.40278:
	lw	%v0, 22(%sp)
	nop
	nop
	nop

fbgt_cont.40279:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40282

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40283

fbgt_else.40282:
fbgt_cont.40283:
	flw	%f2, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40284

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40285

fbgt_else.40284:
fbgt_cont.40285:
	flw	%f3, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.40286

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.40287

fbgt_else.40286:
	flw	%f5, 464(%zero)
	flw	%f6, 6(%sp)
	fsub	%f0, %f2, %f0
	nop

	flw	%f7, 463(%zero)
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	flw	%f7, 462(%zero)
	nop
	fadd	%f5, %f5, %f7
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

fbgt_cont.40287:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40288

	nop
	nop
	nop
	j	bnei_cont.40289

bnei_else.40288:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40289:
	flw	%f4, 21(%sp)
	flw	%f5, 13(%sp)
	nop
	nop

	fsw	%f0, 24(%sp)
	nop
	fabs	%f4, %f4
	nop

	fsw	%f4, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.40290

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40292

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40294

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40296

	flw	%f6, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40298

	flw	%f6, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40300

	flw	%f6, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40302

	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40304

	flw	%f6, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40306

	flw	%f6, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40308

	flw	%f6, 471(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.40310

	flw	%f6, 470(%zero)
	sw	%ra, 26(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f6
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
	j	fbgt_cont.40291

fbgt_else.40310:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40311:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40308:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40309:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40306:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40307:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40304:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40305:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40302:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40303:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40300:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40301:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40298:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40299:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40296:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40297:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40294:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40295:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40292:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.40293:
	nop
	nop
	nop
	j	fbgt_cont.40291

fbgt_else.40290:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.40291:
	flw	%f1, 25(%sp)
	flw	%f2, 13(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40312

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40314

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40316

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40318

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40320

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40322

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
	j	fbgt_cont.40313

fbgt_else.40322:
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

fbgt_cont.40323:
	nop
	nop
	nop
	j	fbgt_cont.40313

fbgt_else.40320:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40321:
	nop
	nop
	nop
	j	fbgt_cont.40313

fbgt_else.40318:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40324

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40326

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
	j	fbgt_cont.40325

fbgt_else.40326:
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

fbgt_cont.40327:
	nop
	nop
	nop
	j	fbgt_cont.40325

fbgt_else.40324:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40325:
fbgt_cont.40319:
	nop
	nop
	nop
	j	fbgt_cont.40313

fbgt_else.40316:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40317:
	nop
	nop
	nop
	j	fbgt_cont.40313

fbgt_else.40314:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.40328

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40330

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40332

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40334

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
	j	fbgt_cont.40329

fbgt_else.40334:
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

fbgt_cont.40335:
	nop
	nop
	nop
	j	fbgt_cont.40329

fbgt_else.40332:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40333:
	nop
	nop
	nop
	j	fbgt_cont.40329

fbgt_else.40330:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.40336

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40338

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
	j	fbgt_cont.40337

fbgt_else.40338:
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

fbgt_cont.40339:
	nop
	nop
	nop
	j	fbgt_cont.40337

fbgt_else.40336:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40337:
fbgt_cont.40331:
	nop
	nop
	nop
	j	fbgt_cont.40329

fbgt_else.40328:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40329:
fbgt_cont.40315:
	nop
	nop
	nop
	j	fbgt_cont.40313

fbgt_else.40312:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.40313:
	flw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40340

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40341

fbgt_else.40340:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.40341:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.40342

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.40343

fbgt_else.40342:
fbgt_cont.40343:
	flw	%f2, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40344

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40346

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40345

bnei_else.40346:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.40347:
	nop
	nop
	nop
	j	fbgt_cont.40345

fbgt_else.40344:
fbgt_cont.40345:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.40348

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40349

fbgt_else.40348:
fbgt_cont.40349:
	flw	%f1, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40350

	flw	%f2, 464(%zero)
	flw	%f3, 6(%sp)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f2, %f2, %f0

	flw	%f3, 463(%zero)
	nop
	fsub	%f2, %f3, %f2
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 462(%zero)
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
	j	fbgt_cont.40351

fbgt_else.40350:
	flw	%f3, 467(%zero)
	flw	%f4, 466(%zero)
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

	flw	%f4, 465(%zero)
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

fbgt_cont.40351:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.40352

	nop
	nop
	nop
	j	bnei_cont.40353

bnei_else.40352:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.40353:
	flw	%f1, 24(%sp)
	flw	%f2, 7(%sp)
	nop
	nop

	flw	%f1, 20(%sp)
	flw	%f3, 2(%sp)
	fdiv	%f0, %f1, %f0
	nop

	flw	%f0, 18(%sp)
	lw	%v0, 19(%sp)
	fmul	%f1, %f0, %f1
	nop

	lw	%v1, 1(%sp)
	lw	%a0, 0(%sp)
	nop
	nop

	nop
	nop
	nop
	j	calc_dirvec.3071

calc_dirvecs.3079:
	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40382

	flw	%f2, 491(%zero)
	flw	%f3, 438(%zero)
	itof	%f1, %v0
	nop

	flw	%f4, 494(%zero)
	fsw	%f3, 0(%sp)
	fmul	%f1, %f1, %f2
	nop

	fsw	%f0, 1(%sp)
	nop
	fsub	%f1, %f1, %f3
	fmov	%f3, %f0

	fsw	%f4, 2(%sp)
	nop
	fmov	%f0, %f4
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
	nop
	nop

	fsw	%f2, 6(%sp)
	nop
	fmov	%f2, %f1
	fmov	%f1, %f4

	sw	%v0, 7(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	calc_dirvec.3071

	flw	%f2, 441(%zero)
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	flw	%f1, 6(%sp)
	lw	%v1, 5(%sp)
	itof	%f0, %v0
	nop

	flw	%f3, 2(%sp)
	flw	%f4, 1(%sp)
	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2

	lw	%a1, 4(%sp)
	lw	%a2, 3(%sp)
	fadd	%f0, %f0, %f2
	fmov	%f1, %f3

	sw	%a0, 8(%sp)
	nop
	addi	%v1, %a2, 0
	addi	%v0, %a1, 0

	fsw	%f2, 9(%sp)
	nop
	fmov	%f2, %f0
	fmov	%f0, %f3

	sw	%ra, 10(%sp)
	nop
	fmov	%f3, %f4
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	lw	%v1, 3(%sp)
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
	blti	%v1, 5, bgti_else.40383

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.40384

bgti_else.40383:
bgti_cont.40384:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40385

	flw	%f1, 6(%sp)
	flw	%f2, 0(%sp)
	itof	%f0, %v0
	nop

	flw	%f3, 1(%sp)
	lw	%a0, 4(%sp)
	fmul	%f0, %f0, %f1
	nop

	flw	%f0, 2(%sp)
	lw	%a1, 5(%sp)
	fsub	%f2, %f0, %f2
	nop

	sw	%v1, 10(%sp)
	nop
	fmov	%f1, %f0
	nop

	sw	%v0, 11(%sp)
	nop
	addi	%v0, %a0, 0
	addi	%a0, %a1, 0

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
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	flw	%f1, 6(%sp)
	flw	%f3, 1(%sp)
	itof	%f0, %v0
	nop

	flw	%f1, 9(%sp)
	lw	%v1, 4(%sp)
	fmul	%f0, %f0, %f1
	nop

	flw	%f0, 2(%sp)
	lw	%a0, 10(%sp)
	fadd	%f2, %f0, %f1
	addi	%v0, %v1, 0

	lw	%a1, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%v1, %a0, 0
	fmov	%f1, %f0

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
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	lw	%v1, 10(%sp)
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
	blti	%v1, 5, bgti_else.40386

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.40387

bgti_else.40386:
bgti_cont.40387:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	j	calc_dirvecs.3079

bgti_else.40385:
	nop
	nop
	nop
	jr	%ra

bgti_else.40382:
	nop
	nop
	nop
	jr	%ra

calc_dirvec_rows.3084:
	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40410

	flw	%f1, 491(%zero)
	flw	%f2, 438(%zero)
	itof	%f0, %v0
	addi	%a2, %zero, 4

	flw	%f4, 494(%zero)
	fsw	%f2, 0(%sp)
	fmul	%f0, %f0, %f1
	nop

	sw	%v0, 1(%sp)
	nop
	fsub	%f3, %f0, %f2
	itof	%f0, %a2

	fsw	%f3, 2(%sp)
	nop
	fmul	%f0, %f0, %f1
	addi	%v0, %a1, 0

	fsw	%f4, 3(%sp)
	nop
	fsub	%f0, %f0, %f2
	nop

	sw	%v1, 4(%sp)
	nop
	fmov	%f2, %f0
	fmov	%f0, %f4

	sw	%a1, 5(%sp)
	nop
	nop
	nop

	sw	%a0, 6(%sp)
	nop
	nop
	nop

	fsw	%f1, 7(%sp)
	nop
	fmov	%f1, %f4
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
	jal	calc_dirvec.3071

	flw	%f2, 441(%zero)
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	flw	%f1, 7(%sp)
	lw	%v1, 6(%sp)
	itof	%f0, %v0
	nop

	flw	%f3, 2(%sp)
	lw	%a1, 5(%sp)
	fmul	%f0, %f0, %f1
	addi	%a0, %v1, 2

	flw	%f0, 3(%sp)
	lw	%a2, 4(%sp)
	fadd	%f2, %f0, %f2
	addi	%v0, %a1, 0

	sw	%ra, 9(%sp)
	nop
	addi	%v1, %a2, 0
	fmov	%f1, %f0

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	calc_dirvec.3071

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v0, %zero, 3

	lw	%ra, 9(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %v1, 1
	nop

	nop
	nop
	nop
	blti	%a0, 5, bgti_else.40411

	nop
	nop
	addi	%a0, %a0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.40412

bgti_else.40411:
bgti_cont.40412:
	flw	%f0, 2(%sp)
	lw	%a1, 6(%sp)
	addi	%v1, %a0, 0
	nop

	sw	%ra, 9(%sp)
	nop
	addi	%a0, %a1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 10
	nop

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%sp, %sp, -10
	nop

	lw	%ra, 9(%sp)
	lw	%v0, 1(%sp)
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
	blti	%v1, 5, bgti_else.40413

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.40414

bgti_else.40413:
bgti_cont.40414:
	lw	%a0, 6(%sp)
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
	blti	%v0, 0, bgti_else.40415

	flw	%f1, 7(%sp)
	lw	%a1, 8(%sp)
	itof	%f0, %v0
	nop

	flw	%f1, 0(%sp)
	sw	%a0, 9(%sp)
	fmul	%f0, %f0, %f1
	nop

	sw	%v1, 10(%sp)
	nop
	fsub	%f0, %f0, %f1
	nop

	sw	%v0, 11(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	lw	%v1, 10(%sp)
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
	blti	%v1, 5, bgti_else.40416

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.40417

bgti_else.40416:
bgti_cont.40417:
	lw	%a0, 9(%sp)
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
	j	calc_dirvec_rows.3084

bgti_else.40415:
	nop
	nop
	nop
	jr	%ra

bgti_else.40410:
	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.40442

	flw	%f0, 494(%zero)
	nop
	addi	%a0, %zero, 3
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
	nop

	sw	%v0, 3(%sp)
	nop
	addi	%v0, %a0, 0
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
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0

	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
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
	lw	%a0, 3(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 2(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40443

	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	sw	%v0, 6(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)
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
	add	%v1, %zero, %hp

	lw	%ra, 8(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 7(%sp)
	lw	%a0, 3(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40444

	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	sw	%v0, 8(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %v0, 0

	lw	%ra, 9(%sp)
	lw	%v0, 4(%sp)
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
	lw	%a0, 3(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 8(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40445

	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	sw	%v0, 10(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 11(%sp)
	lw	%v0, 4(%sp)
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
	lw	%a0, 3(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 10(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	sw	%v0, 0(%at)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	j	create_dirvec_elements.3090

bgti_else.40445:
	nop
	nop
	nop
	jr	%ra

bgti_else.40444:
	nop
	nop
	nop
	jr	%ra

bgti_else.40443:
	nop
	nop
	nop
	jr	%ra

bgti_else.40442:
	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40488

	flw	%f0, 494(%zero)
	nop
	addi	%v1, %zero, 120
	addi	%a0, %zero, 3

	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	sw	%a0, 1(%sp)
	nop
	nop
	nop

	sw	%v0, 2(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%v1, 3(%sp)
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
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -5
	addi	%v1, %v0, 0

	lw	%ra, 4(%sp)
	sw	%v0, 4(%sp)
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
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%v0, 3(%sp)
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
	nop
	addi	%v0, %a0, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 7(%sp)
	lw	%v0, 4(%sp)
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
	add	%v1, %zero, %hp

	lw	%ra, 8(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 7(%sp)
	flw	%f0, 0(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)
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
	lw	%v0, 4(%sp)
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
	flw	%f0, 0(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%a0, 1(%sp)
	nop
	nop

	lw	%v1, 6(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	sw	%v0, 117(%v1)
	nop
	addi	%v0, %zero, 116
	nop

	sw	%v0, 9(%sp)
	nop
	addi	%v0, %a0, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -11
	addi	%v1, %v0, 0

	lw	%ra, 10(%sp)
	lw	%v0, 4(%sp)
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

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -12
	add	%v1, %zero, %hp

	lw	%ra, 11(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 6(%sp)
	sw	%ra, 11(%sp)
	add	%v0, %zero, %v1
	nop

	sw	%v0, 116(%v1)
	nop
	addi	%v0, %zero, 115
	addi	%sp, %sp, 12

	nop
	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0

	nop
	nop
	addi	%v0, %k0, 0
	nop

	nop
	nop
	nop
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40489

	flw	%f0, 0(%sp)
	lw	%v1, 1(%sp)
	nop
	nop

	sw	%v0, 11(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v1, %v0, 0

	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
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
	lw	%v0, 3(%sp)
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
	nop
	addi	%v0, %a0, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 14(%sp)
	lw	%v0, 4(%sp)
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

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -16
	add	%v1, %zero, %hp

	lw	%ra, 15(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 14(%sp)
	flw	%f0, 0(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 13(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	sw	%v0, 118(%v1)
	lw	%v0, 1(%sp)
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
	lw	%v0, 4(%sp)
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
	nop

	lw	%v0, 15(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	nop
	nop
	nop

	lw	%v1, 13(%sp)
	nop
	add	%v0, %zero, %v1
	nop

	sw	%v0, 117(%v1)
	lw	%v0, 9(%sp)
	nop
	nop

	sw	%ra, 16(%sp)
	nop
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0

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
	addi	%sp, %sp, -17
	nop

	lw	%ra, 16(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	j	create_dirvecs.3093

bgti_else.40489:
	nop
	nop
	nop
	jr	%ra

bgti_else.40488:
	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.40565

	lw	%a1, 0(%zero)
	nop
	add	%at, %v0, %v1
	nop

	lw	%a0, 0(%at)
	nop
	addi	%a1, %a1, -1
	nop

	sw	%a1, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 1(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%v1, 2(%sp)
	nop
	addi	%v1, %a1, 0
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
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -4
	nop

	lw	%ra, 3(%sp)
	lw	%v0, 2(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40566

	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 3(%sp)
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
	blti	%a1, 0, bgti_else.40567

	lw	%a2, 12(%a1)
	lw	%a3, 1(%a0)
	nop
	nop

	lw	%t0, 0(%a0)
	lw	%t1, 1(%a2)
	nop
	nop

	sw	%a0, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 1, bnei_else.40569

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.40571

	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	addi	%t1, %zero, 5
	nop

	fsw	%f0, 6(%sp)
	nop
	addi	%v0, %t1, 0
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
	nop

	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 7(%sp)
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
	beqi	%a0, 0, bnei_else.40573

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
	j	bnei_cont.40574

bnei_else.40573:
bnei_cont.40574:
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
	beqi	%a0, 0, bnei_else.40575

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

	flw	%f8, 464(%zero)
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
	j	bnei_cont.40576

bnei_else.40575:
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

bnei_cont.40576:
	flw	%f0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.40577

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40578

fbeq_else.40577:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.40578:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40579

	nop
	nop
	nop
	j	bnei_cont.40580

bnei_else.40579:
	flw	%f0, 484(%zero)
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

bnei_cont.40580:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
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
	j	bnei_cont.40570

bnei_else.40571:
	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	addi	%t1, %zero, 4
	nop

	fsw	%f0, 9(%sp)
	nop
	addi	%v0, %t1, 0
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
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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

	flw	%f1, 9(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40581

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40582

fbgt_else.40581:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.40582:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40583

	flw	%f1, 460(%zero)
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
	j	bnei_cont.40584

bnei_else.40583:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.40584:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
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

bnei_cont.40572:
	nop
	nop
	nop
	j	bnei_cont.40570

bnei_else.40569:
	flw	%f0, 494(%zero)
	sw	%a3, 5(%sp)
	addi	%t1, %zero, 6
	nop

	sw	%a2, 7(%sp)
	nop
	addi	%v0, %t1, 0
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
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40585

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40586

fbeq_else.40585:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.40586:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40587

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40588

bnei_else.40587:
	lw	%a0, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40589

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40590

fbgt_else.40589:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.40590:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40591

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40593

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40592

bnei_else.40593:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.40594:
	nop
	nop
	nop
	j	bnei_cont.40592

bnei_else.40591:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.40592:
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
	beqi	%a1, 0, bnei_else.40595

	nop
	nop
	nop
	j	bnei_cont.40596

bnei_else.40595:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.40596:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.40588:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40597

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40598

fbeq_else.40597:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.40598:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40599

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40600

bnei_else.40599:
	lw	%a0, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40601

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40602

fbgt_else.40601:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.40602:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40603

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40605

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40604

bnei_else.40605:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.40606:
	nop
	nop
	nop
	j	bnei_cont.40604

bnei_else.40603:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.40604:
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
	beqi	%a1, 0, bnei_else.40607

	nop
	nop
	nop
	j	bnei_cont.40608

bnei_else.40607:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.40608:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.40600:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40609

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40610

fbeq_else.40609:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.40610:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40611

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40612

bnei_else.40611:
	lw	%v1, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40613

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40614

fbgt_else.40613:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.40614:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40615

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40617

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40616

bnei_else.40617:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.40618:
	nop
	nop
	nop
	j	bnei_cont.40616

bnei_else.40615:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.40616:
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
	beqi	%a0, 0, bnei_else.40619

	nop
	nop
	nop
	j	bnei_cont.40620

bnei_else.40619:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.40620:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
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

bnei_cont.40612:
	lw	%v1, 0(%sp)
	lw	%a0, 5(%sp)
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

bnei_cont.40570:
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)
	addi	%v0, %v1, -1
	nop

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

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
	j	bgti_cont.40568

bgti_else.40567:
bgti_cont.40568:
	lw	%v0, 3(%sp)
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
	blti	%v0, 0, bgti_else.40621

	lw	%v1, 1(%sp)
	lw	%a1, 0(%sp)
	nop
	nop

	sw	%v0, 11(%sp)
	nop
	add	%at, %v1, %v0
	addi	%v1, %a1, 0

	lw	%a0, 0(%at)
	sw	%ra, 12(%sp)
	nop
	nop

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
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40622

	lw	%v1, 1(%sp)
	sw	%v0, 12(%sp)
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	add	%at, %v1, %v0
	nop

	lw	%a0, 0(%at)
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	lw	%v0, 12(%sp)
	nop
	nop

	lw	%v0, 1(%sp)
	nop
	addi	%v1, %v0, -1
	nop

	nop
	nop
	nop
	j	init_dirvec_constants.3095

bgti_else.40622:
	nop
	nop
	nop
	jr	%ra

bgti_else.40621:
	nop
	nop
	nop
	jr	%ra

bgti_else.40566:
	nop
	nop
	nop
	jr	%ra

bgti_else.40565:
	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40679

	lw	%v1, 179(%v0)
	lw	%a2, 0(%zero)
	addi	%a0, %zero, 119
	nop

	lw	%a1, 119(%v1)
	sw	%a0, 0(%sp)
	addi	%a2, %a2, -1
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

	nop
	nop
	nop
	blti	%a2, 0, bgti_else.40680

	lw	%a3, 12(%a2)
	lw	%t0, 1(%a1)
	nop
	nop

	lw	%t1, 0(%a1)
	lw	%t2, 1(%a3)
	nop
	nop

	sw	%a1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t2, 1, bnei_else.40682

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.40684

	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	addi	%t2, %zero, 5
	nop

	fsw	%f0, 6(%sp)
	nop
	addi	%v0, %t2, 0
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
	nop

	lw	%ra, 9(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 1(%v1)
	nop
	nop

	flw	%f2, 2(%v1)
	lw	%v1, 7(%sp)
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
	beqi	%a0, 0, bnei_else.40686

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
	j	bnei_cont.40687

bnei_else.40686:
bnei_cont.40687:
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
	beqi	%a0, 0, bnei_else.40688

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

	flw	%f8, 464(%zero)
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
	j	bnei_cont.40689

bnei_else.40688:
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

bnei_cont.40689:
	flw	%f0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.40690

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40691

fbeq_else.40690:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.40691:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40692

	nop
	nop
	nop
	j	bnei_cont.40693

bnei_else.40692:
	flw	%f0, 484(%zero)
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

bnei_cont.40693:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
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
	j	bnei_cont.40683

bnei_else.40684:
	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	addi	%t2, %zero, 4
	nop

	fsw	%f0, 9(%sp)
	nop
	addi	%v0, %t2, 0
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
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	lw	%a0, 7(%sp)
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

	flw	%f1, 9(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.40694

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40695

fbgt_else.40694:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.40695:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40696

	flw	%f1, 460(%zero)
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
	j	bnei_cont.40697

bnei_else.40696:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.40697:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
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

bnei_cont.40685:
	nop
	nop
	nop
	j	bnei_cont.40683

bnei_else.40682:
	flw	%f0, 494(%zero)
	sw	%t0, 5(%sp)
	addi	%t2, %zero, 6
	nop

	sw	%a3, 7(%sp)
	nop
	addi	%v0, %t2, 0
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
	lw	%v1, 8(%sp)
	nop
	nop

	flw	%f0, 0(%v1)
	flw	%f1, 10(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40698

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40699

fbeq_else.40698:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.40699:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40700

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40701

bnei_else.40700:
	lw	%a0, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40702

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40703

fbgt_else.40702:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.40703:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40704

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40706

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40705

bnei_else.40706:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.40707:
	nop
	nop
	nop
	j	bnei_cont.40705

bnei_else.40704:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.40705:
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
	beqi	%a1, 0, bnei_else.40708

	nop
	nop
	nop
	j	bnei_cont.40709

bnei_else.40708:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.40709:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.40701:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40710

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40711

fbeq_else.40710:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.40711:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40712

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40713

bnei_else.40712:
	lw	%a0, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40714

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40715

fbgt_else.40714:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.40715:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40716

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.40718

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40717

bnei_else.40718:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.40719:
	nop
	nop
	nop
	j	bnei_cont.40717

bnei_else.40716:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.40717:
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
	beqi	%a1, 0, bnei_else.40720

	nop
	nop
	nop
	j	bnei_cont.40721

bnei_else.40720:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.40721:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.40713:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.40722

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.40723

fbeq_else.40722:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.40723:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.40724

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.40725

bnei_else.40724:
	lw	%v1, 7(%sp)
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
	fblt	%f0, %f1, fbgt_else.40726

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.40727

fbgt_else.40726:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.40727:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.40728

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.40730

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.40729

bnei_else.40730:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.40731:
	nop
	nop
	nop
	j	bnei_cont.40729

bnei_else.40728:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.40729:
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
	beqi	%a0, 0, bnei_else.40732

	nop
	nop
	nop
	j	bnei_cont.40733

bnei_else.40732:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.40733:
	fsw	%f1, 4(%v0)
	flw	%f1, 484(%zero)
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

bnei_cont.40725:
	lw	%v1, 2(%sp)
	lw	%a0, 5(%sp)
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

bnei_cont.40683:
	lw	%a0, 4(%sp)
	sw	%ra, 11(%sp)
	addi	%v0, %v1, -1
	nop

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 12
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

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
	j	bgti_cont.40681

bgti_else.40680:
bgti_cont.40681:
	lw	%v1, 3(%sp)
	lw	%a1, 2(%sp)
	addi	%v0, %zero, 118
	nop

	lw	%a0, 118(%v1)
	sw	%v0, 11(%sp)
	addi	%v1, %a1, 0
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
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -13
	addi	%v0, %zero, 117

	lw	%ra, 12(%sp)
	lw	%v1, 3(%sp)
	nop
	nop

	lw	%a0, 117(%v1)
	sw	%v0, 12(%sp)
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 14
	nop

	nop
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%sp, %sp, -14
	addi	%v1, %zero, 116

	lw	%ra, 13(%sp)
	lw	%v0, 3(%sp)
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
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%sp, %sp, -14
	nop

	lw	%ra, 13(%sp)
	lw	%v0, 1(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40734

	lw	%v1, 179(%v0)
	lw	%a1, 2(%sp)
	nop
	nop

	lw	%a0, 119(%v1)
	sw	%v0, 13(%sp)
	nop
	nop

	sw	%v1, 14(%sp)
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

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
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	nop
	nop

	lw	%v1, 118(%v0)
	sw	%ra, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v0, 14(%sp)
	nop
	nop

	lw	%v1, 12(%sp)
	sw	%ra, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v0, 13(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40735

	lw	%v1, 179(%v0)
	sw	%v0, 15(%sp)
	nop
	nop

	lw	%a0, 119(%v1)
	sw	%v1, 16(%sp)
	nop
	nop

	sw	%ra, 17(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	setup_dirvec_constants.2880

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	lw	%v0, 16(%sp)
	nop
	nop

	lw	%v1, 11(%sp)
	sw	%ra, 17(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	lw	%v0, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40736

	lw	%v1, 179(%v0)
	lw	%a0, 0(%sp)
	nop
	nop

	sw	%v0, 17(%sp)
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

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
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v0, 17(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, -1
	nop

	nop
	nop
	nop
	j	init_vecset_constants.3098

bgti_else.40736:
	nop
	nop
	nop
	jr	%ra

bgti_else.40735:
	nop
	nop
	nop
	jr	%ra

bgti_else.40734:
	nop
	nop
	nop
	jr	%ra

bgti_else.40679:
	nop
	nop
	nop
	jr	%ra

min_caml_start:
	nop
	nop
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0

	sw	%v0, 0(%sp)
	nop
	addi	%a0, %zero, 0
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
	jal	min_caml_create_extarray

	flw	%f0, 494(%zero)
	nop
	addi	%sp, %sp, -3
	addi	%v1, %zero, 1

	lw	%ra, 2(%sp)
	lw	%v0, 1(%sp)
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
	jal	min_caml_create_float_extarray

	sw	%v0, 11(%zero)
	nop
	addi	%sp, %sp, -4
	addi	%v1, %zero, 60

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
	nop
	addi	%sp, %sp, 5
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
	nop

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
	addi	%v1, %a1, 0
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -5
	addi	%v0, %zero, 3

	lw	%ra, 4(%sp)
	flw	%f0, 2(%sp)
	addi	%v1, %zero, 72
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 75

	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 78

	lw	%ra, 5(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	flw	%f0, 451(%zero)
	nop
	addi	%sp, %sp, -6
	addi	%v1, %zero, 81

	lw	%ra, 5(%sp)
	lw	%v0, 0(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -6
	addi	%v0, %zero, 50

	lw	%ra, 5(%sp)
	lw	%a1, 0(%sp)
	addi	%v1, %zero, -1
	addi	%a0, %zero, 82

	sw	%v0, 5(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 83

	lw	%ra, 6(%sp)
	lw	%v0, 5(%sp)
	addi	%v1, %zero, 82
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
	jal	min_caml_create_extarray

	lw	%v1, 83(%zero)
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 133

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 134

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %zero, 133
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 135

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 136

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
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
	jal	min_caml_create_extarray

	flw	%f0, 445(%zero)
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 137

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 138

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%a0, %zero, 141

	lw	%ra, 6(%sp)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 142

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 145

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 148

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v1, %zero, 151

	lw	%ra, 6(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -7
	addi	%v0, %zero, 2

	lw	%ra, 6(%sp)
	lw	%v1, 1(%sp)
	addi	%a0, %zero, 154
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 156

	lw	%ra, 7(%sp)
	lw	%v0, 6(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 158

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 0(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 159

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 162

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 165

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 168

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 171

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 174

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%v1, %zero, 177

	lw	%ra, 7(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 1(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -8
	addi	%a0, %zero, 177

	lw	%ra, 7(%sp)
	lw	%a1, 1(%sp)
	addi	%v1, %zero, 177
	nop

	sw	%v0, 7(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_extarray

	sw	%v0, 178(%zero)
	nop
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	sw	%v0, 177(%zero)
	lw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 8(%sp)
	nop
	addi	%a0, %zero, 179
	addi	%v1, %zero, 177

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -9
	addi	%v0, %zero, 5

	lw	%ra, 8(%sp)
	sw	%v0, 8(%sp)
	addi	%a0, %zero, 179
	addi	%v1, %zero, 179

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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 184

	lw	%ra, 9(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 1(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%v1, %zero, 184

	lw	%ra, 9(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -10
	addi	%a0, %zero, 187

	lw	%ra, 9(%sp)
	lw	%a1, 3(%sp)
	addi	%v1, %zero, 184
	nop

	sw	%v0, 9(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_extarray

	sw	%v0, 248(%zero)
	nop
	addi	%sp, %sp, -11
	nop

	lw	%ra, 10(%sp)
	lw	%v0, 9(%sp)
	nop
	nop

	sw	%v0, 247(%zero)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 1(%sp)
	sw	%ra, 10(%sp)
	addi	%v1, %zero, 249
	nop

	nop
	nop
	addi	%sp, %sp, 11
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_extarray

	nop
	nop
	addi	%sp, %sp, -11
	addi	%a0, %zero, 249

	lw	%ra, 10(%sp)
	lw	%a1, 1(%sp)
	addi	%v1, %zero, 249
	nop

	sw	%v0, 10(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_extarray

	sw	%v0, 250(%zero)
	nop
	addi	%sp, %sp, -12
	addi	%v1, %zero, 249

	lw	%ra, 11(%sp)
	lw	%v0, 10(%sp)
	nop
	nop

	sw	%v0, 249(%zero)
	flw	%f0, 2(%sp)
	nop
	nop

	fsw	%f0, 253(%zero)
	nop
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180

	sw	%v0, 252(%zero)
	lw	%v0, 1(%sp)
	nop
	nop

	sw	%v0, 251(%zero)
	sw	%ra, 11(%sp)
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%a0, %zero, 254
	addi	%a1, %zero, 251

	nop
	nop
	addi	%v1, %a1, 0
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -12
	addi	%a0, %zero, 434

	lw	%ra, 11(%sp)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%v1, 1(%sp)
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
	jal	min_caml_create_extarray

	nop
	nop
	addi	%sp, %sp, -12
	addi	%v0, %zero, 2

	lw	%ra, 11(%sp)
	sw	%v0, 154(%zero)
	itof	%f1, %v0
	nop

	sw	%v0, 155(%zero)
	nop
	nop
	nop

	nop
	nop
	addi	%v1, %zero, 1
	nop

	sw	%v1, 156(%zero)
	nop
	nop
	nop

	sw	%v1, 157(%zero)
	lw	%v1, 4(%sp)
	nop
	nop

	flw	%f0, 437(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f0, %f0, %f1
	nop

	fsw	%f0, 158(%zero)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 154(%zero)
	nop
	nop
	nop

	sw	%v0, 11(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	nop
	nop

	sw	%ra, 13(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 13(%sp)
	lw	%v0, 8(%sp)
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
	nop

	lw	%ra, 13(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 13(%sp)
	nop
	nop

	sw	%ra, 14(%sp)
	nop
	addi	%v0, %v1, 0
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
	lw	%v1, 13(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	lw	%v1, 13(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	addi	%v0, %zero, 4
	nop

	lw	%a0, 4(%sp)
	sw	%v0, 14(%sp)
	nop
	nop

	sw	%ra, 15(%sp)
	nop
	addi	%v0, %a0, 0
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
	lw	%v1, 13(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 15(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 16

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 15(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 16(%sp)
	nop
	addi	%v1, %a0, 0
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
	nop

	lw	%ra, 16(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 16(%sp)
	nop
	nop

	sw	%ra, 17(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 18
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -18
	addi	%v1, %v0, 0

	lw	%ra, 17(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -18
	nop

	lw	%ra, 17(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 17(%sp)
	nop
	nop

	sw	%ra, 18(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	nop

	lw	%ra, 18(%sp)
	lw	%v1, 17(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 18(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 19
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -19
	addi	%v1, %v0, 0

	lw	%ra, 18(%sp)
	lw	%v0, 8(%sp)
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
	nop

	lw	%ra, 18(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 18(%sp)
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	lw	%v1, 18(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 19(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 19(%sp)
	nop
	nop

	sw	%ra, 20(%sp)
	nop
	addi	%v0, %v1, 0
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
	addi	%v1, %v0, 0

	lw	%ra, 20(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 20(%sp)
	nop
	nop

	sw	%ra, 21(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 21(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v1, 20(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 19(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 18(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 17(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 16(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 15(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 13(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 12(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	lw	%v0, 11(%sp)
	sw	%ra, 21(%sp)
	add	%v1, %zero, %v0
	nop

	nop
	nop
	addi	%sp, %sp, 22
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -22
	nop

	lw	%ra, 21(%sp)
	lw	%v1, 11(%sp)
	nop
	nop

	nop
	nop
	addi	%a0, %v1, -2
	nop

	sw	%a0, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%a0, 0, bgti_else.43426

	flw	%f0, 2(%sp)
	lw	%a1, 4(%sp)
	nop
	nop

	sw	%v0, 22(%sp)
	nop
	addi	%v0, %a1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	sw	%ra, 24(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 25
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -25
	addi	%v1, %v0, 0

	lw	%ra, 24(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 24(%sp)
	nop
	nop

	sw	%ra, 25(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 25(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 26
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v1, 24(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 25(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 26

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 25(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 26(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 27
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 26(%sp)
	nop
	nop

	sw	%ra, 27(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -28
	addi	%v1, %v0, 0

	lw	%ra, 27(%sp)
	lw	%v0, 8(%sp)
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
	nop

	lw	%ra, 27(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 27(%sp)
	nop
	nop

	sw	%ra, 28(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	lw	%v1, 27(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 29
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -29
	addi	%v1, %v0, 0

	lw	%ra, 28(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 28(%sp)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 29(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 30
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	lw	%v1, 28(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 29(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 29(%sp)
	nop
	nop

	sw	%ra, 30(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -31
	addi	%v1, %v0, 0

	lw	%ra, 30(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 30(%sp)
	nop
	nop

	sw	%ra, 31(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 31(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 32
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -32
	nop

	lw	%ra, 31(%sp)
	lw	%v1, 30(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 22(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 29(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 28(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 27(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 26(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 25(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 24(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 23(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	nop
	nop

	sw	%ra, 31(%sp)
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	addi	%sp, %sp, 32

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	init_line_elements.3061

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
	j	bgti_cont.43427

bgti_else.43426:
bgti_cont.43427:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v0, 31(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	sw	%ra, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 33
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -33
	nop

	lw	%ra, 32(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 32(%sp)
	nop
	nop

	sw	%ra, 33(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 34
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -34
	addi	%v1, %v0, 0

	lw	%ra, 33(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -34
	nop

	lw	%ra, 33(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 33(%sp)
	nop
	nop

	sw	%ra, 34(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 34(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 35
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	lw	%v1, 33(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 34(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 35

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 34(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 35(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 36
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -36
	nop

	lw	%ra, 35(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 35(%sp)
	nop
	nop

	sw	%ra, 36(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -37
	addi	%v1, %v0, 0

	lw	%ra, 36(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 36(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 37
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -37
	nop

	lw	%ra, 36(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 36(%sp)
	nop
	nop

	sw	%ra, 37(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 37(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -38
	addi	%v1, %v0, 0

	lw	%ra, 37(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 38
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 37(%sp)
	nop
	nop

	sw	%ra, 38(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 38(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 39
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	lw	%v1, 37(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 38(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 39

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -39
	nop

	lw	%ra, 38(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 38(%sp)
	nop
	nop

	sw	%ra, 39(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 40
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -40
	addi	%v1, %v0, 0

	lw	%ra, 39(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -40
	nop

	lw	%ra, 39(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 39(%sp)
	nop
	nop

	sw	%ra, 40(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 40(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	lw	%v1, 39(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 38(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 37(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 36(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 35(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 34(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 33(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 32(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	lw	%v0, 11(%sp)
	sw	%ra, 40(%sp)
	add	%v1, %zero, %v0
	nop

	nop
	nop
	addi	%sp, %sp, 41
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -41
	nop

	lw	%ra, 40(%sp)
	lw	%v1, 21(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.43428

	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	nop
	nop

	sw	%v0, 40(%sp)
	nop
	addi	%v0, %a0, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -42
	nop

	lw	%ra, 41(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 41(%sp)
	nop
	nop

	sw	%ra, 42(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -43
	addi	%v1, %v0, 0

	lw	%ra, 42(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 43
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -43
	nop

	lw	%ra, 42(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 42(%sp)
	nop
	nop

	sw	%ra, 43(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 43(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 44
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v1, 42(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 43(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 44

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -44
	nop

	lw	%ra, 43(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 43(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 44(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 45
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -45
	nop

	lw	%ra, 44(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 44(%sp)
	nop
	nop

	sw	%ra, 45(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 46
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -46
	addi	%v1, %v0, 0

	lw	%ra, 45(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -46
	nop

	lw	%ra, 45(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 45(%sp)
	nop
	nop

	sw	%ra, 46(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	lw	%v1, 45(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 46(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 47
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -47
	addi	%v1, %v0, 0

	lw	%ra, 46(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -47
	nop

	lw	%ra, 46(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 46(%sp)
	nop
	nop

	sw	%ra, 47(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 48
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	lw	%v1, 46(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 47(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 48

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -48
	nop

	lw	%ra, 47(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 47(%sp)
	nop
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
	addi	%v1, %v0, 0

	lw	%ra, 48(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 48(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 49
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -49
	nop

	lw	%ra, 48(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 48(%sp)
	nop
	nop

	sw	%ra, 49(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 50
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	lw	%v1, 48(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 40(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 47(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 46(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 45(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 44(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 43(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 42(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 41(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	nop
	nop

	sw	%ra, 49(%sp)
	nop
	add	%at, %a0, %v1
	nop

	sw	%v0, 0(%at)
	nop
	addi	%v0, %v1, -1
	addi	%sp, %sp, 50

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	nop
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -50
	nop

	lw	%ra, 49(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43429

bgti_else.43428:
bgti_cont.43429:
	flw	%f0, 2(%sp)
	lw	%v1, 4(%sp)
	nop
	nop

	sw	%v0, 49(%sp)
	nop
	addi	%v0, %v1, 0
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -51
	nop

	lw	%ra, 50(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 50(%sp)
	nop
	nop

	sw	%ra, 51(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 52
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -52
	addi	%v1, %v0, 0

	lw	%ra, 51(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -52
	nop

	lw	%ra, 51(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 51(%sp)
	nop
	nop

	sw	%ra, 52(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 52(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 53
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	lw	%v1, 51(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 52(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 53

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -53
	nop

	lw	%ra, 52(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 52(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 53(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 54
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -54
	nop

	lw	%ra, 53(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 53(%sp)
	nop
	nop

	sw	%ra, 54(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 55
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -55
	addi	%v1, %v0, 0

	lw	%ra, 54(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -55
	nop

	lw	%ra, 54(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 54(%sp)
	nop
	nop

	sw	%ra, 55(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	nop

	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	nop

	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	nop

	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	nop

	lw	%ra, 55(%sp)
	lw	%v1, 54(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 55(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -56
	addi	%v1, %v0, 0

	lw	%ra, 55(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 55(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 56
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -56
	nop

	lw	%ra, 55(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 55(%sp)
	nop
	nop

	sw	%ra, 56(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 57
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -57
	nop

	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 57
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -57
	nop

	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 57
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -57
	nop

	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 56(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 57
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -57
	nop

	lw	%ra, 56(%sp)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 56(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 57

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -57
	nop

	lw	%ra, 56(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 56(%sp)
	nop
	nop

	sw	%ra, 57(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 58
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -58
	addi	%v1, %v0, 0

	lw	%ra, 57(%sp)
	lw	%v0, 8(%sp)
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -58
	nop

	lw	%ra, 57(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 57(%sp)
	nop
	nop

	sw	%ra, 58(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 59
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -59
	nop

	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 59
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -59
	nop

	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 59
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -59
	nop

	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 58(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 59
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -59
	nop

	lw	%ra, 58(%sp)
	lw	%v1, 57(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	nop
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 56(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 55(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 54(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 53(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 52(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 51(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 50(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	lw	%v0, 11(%sp)
	sw	%ra, 58(%sp)
	add	%v1, %zero, %v0
	nop

	nop
	nop
	addi	%sp, %sp, 59
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -59
	nop

	lw	%ra, 58(%sp)
	lw	%v1, 21(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.43430

	flw	%f0, 2(%sp)
	lw	%a0, 4(%sp)
	nop
	nop

	sw	%v0, 58(%sp)
	nop
	addi	%v0, %a0, 0
	nop

	sw	%ra, 59(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 60
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -60
	nop

	lw	%ra, 59(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 59(%sp)
	nop
	nop

	sw	%ra, 60(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 61
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -61
	addi	%v1, %v0, 0

	lw	%ra, 60(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 60(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 61
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -61
	nop

	lw	%ra, 60(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 60(%sp)
	nop
	nop

	sw	%ra, 61(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 61(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 62
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	lw	%v1, 60(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 61(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 62

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -62
	nop

	lw	%ra, 61(%sp)
	lw	%v1, 8(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%v0, 61(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 62(%sp)
	nop
	addi	%v1, %a0, 0
	nop

	nop
	nop
	addi	%sp, %sp, 63
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -63
	nop

	lw	%ra, 62(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 62(%sp)
	nop
	nop

	sw	%ra, 63(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 64
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -64
	addi	%v1, %v0, 0

	lw	%ra, 63(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 63(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 64
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -64
	nop

	lw	%ra, 63(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 63(%sp)
	nop
	nop

	sw	%ra, 64(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -65
	nop

	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -65
	nop

	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -65
	nop

	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -65
	nop

	lw	%ra, 64(%sp)
	lw	%v1, 63(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 64(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -65
	addi	%v1, %v0, 0

	lw	%ra, 64(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 64(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 65
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -65
	nop

	lw	%ra, 64(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 64(%sp)
	nop
	nop

	sw	%ra, 65(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 66
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
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
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	lw	%v1, 64(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	nop
	nop

	lw	%a0, 1(%sp)
	sw	%ra, 65(%sp)
	nop
	nop

	nop
	nop
	addi	%v1, %a0, 0
	addi	%sp, %sp, 66

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -66
	nop

	lw	%ra, 65(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 65(%sp)
	nop
	nop

	sw	%ra, 66(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 67
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -67
	addi	%v1, %v0, 0

	lw	%ra, 66(%sp)
	lw	%v0, 8(%sp)
	nop
	nop

	sw	%ra, 66(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 67
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -67
	nop

	lw	%ra, 66(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 66(%sp)
	nop
	nop

	sw	%ra, 67(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 68
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -68
	nop

	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	nop
	nop

	sw	%v0, 1(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 68
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -68
	nop

	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	nop
	nop

	sw	%v0, 2(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 68
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -68
	nop

	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	nop
	nop

	sw	%v0, 3(%v1)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v0, 4(%sp)
	sw	%ra, 67(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 68
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -68
	nop

	lw	%ra, 67(%sp)
	lw	%v1, 66(%sp)
	nop
	nop

	sw	%v0, 4(%v1)
	lw	%a0, 58(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8

	sw	%v1, 7(%v0)
	lw	%v1, 65(%sp)
	nop
	nop

	sw	%v1, 6(%v0)
	lw	%v1, 64(%sp)
	nop
	nop

	sw	%v1, 5(%v0)
	lw	%v1, 63(%sp)
	nop
	nop

	sw	%v1, 4(%v0)
	lw	%v1, 62(%sp)
	nop
	nop

	sw	%v1, 3(%v0)
	lw	%v1, 61(%sp)
	nop
	nop

	sw	%v1, 2(%v0)
	lw	%v1, 60(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 59(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 21(%sp)
	nop
	nop

	sw	%ra, 67(%sp)
	nop
	add	%at, %a0, %v1
	addi	%v1, %v1, -1

	sw	%v0, 0(%at)
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 68

	nop
	nop
	nop
	jal	init_line_elements.3061

	nop
	nop
	addi	%sp, %sp, -68
	nop

	lw	%ra, 67(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43431

bgti_else.43430:
bgti_cont.43431:
	sw	%v0, 67(%sp)
	nop
	nop
	nop

	sw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 72(%zero)
	nop
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	sw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 73(%zero)
	nop
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	sw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 74(%zero)
	nop
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	nop
	nop
	nop

	sw	%ra, 68(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 69
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	flw	%f1, 461(%zero)
	flw	%f2, 482(%zero)
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	flw	%f4, 481(%zero)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f1, 68(%sp)
	nop
	fabs	%f3, %f0
	nop

	fsw	%f0, 69(%sp)
	nop
	nop
	nop

	fsw	%f2, 70(%sp)
	nop
	nop
	nop

	fsw	%f3, 71(%sp)
	nop
	nop
	nop

	fsw	%f4, 72(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.43432

	flw	%f5, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43434

	flw	%f5, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43436

	flw	%f5, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43438

	flw	%f5, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43440

	flw	%f5, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43442

	flw	%f5, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43444

	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43446

	flw	%f5, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43448

	flw	%f5, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43450

	flw	%f5, 471(%zero)
	sw	%ra, 73(%sp)
	fmov	%f0, %f3
	nop

	nop
	nop
	fmov	%f1, %f5
	addi	%sp, %sp, 74

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -74
	nop

	lw	%ra, 73(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43450:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43451:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43448:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43449:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43446:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43447:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43444:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43445:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43442:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43443:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43440:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43441:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43438:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43439:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43436:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43437:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43434:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43435:
	nop
	nop
	nop
	j	fbgt_cont.43433

fbgt_else.43432:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43433:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43452

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43454

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43456

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43458

	sw	%ra, 73(%sp)
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
	addi	%sp, %sp, 74

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -74
	nop

	lw	%ra, 73(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43453

fbgt_else.43458:
	sw	%ra, 73(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 74
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -74
	nop

	lw	%ra, 73(%sp)
	nop
	nop
	nop

fbgt_cont.43459:
	nop
	nop
	nop
	j	fbgt_cont.43453

fbgt_else.43456:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43457:
	nop
	nop
	nop
	j	fbgt_cont.43453

fbgt_else.43454:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43460

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43462

	sw	%ra, 73(%sp)
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
	addi	%sp, %sp, 74

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -74
	nop

	lw	%ra, 73(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43461

fbgt_else.43462:
	sw	%ra, 73(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 74
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -74
	nop

	lw	%ra, 73(%sp)
	nop
	nop
	nop

fbgt_cont.43463:
	nop
	nop
	nop
	j	fbgt_cont.43461

fbgt_else.43460:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43461:
fbgt_cont.43455:
	nop
	nop
	nop
	j	fbgt_cont.43453

fbgt_else.43452:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43453:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43464

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43465

fbgt_else.43464:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.43465:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43466

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43467

fbgt_else.43466:
fbgt_cont.43467:
	flw	%f2, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43468

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43470

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43469

bnei_else.43470:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43471:
	nop
	nop
	nop
	j	fbgt_cont.43469

fbgt_else.43468:
fbgt_cont.43469:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43472

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43473

fbgt_else.43472:
fbgt_cont.43473:
	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43474

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.43475

fbgt_else.43474:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.43475:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43476

	nop
	nop
	nop
	j	bnei_cont.43477

bnei_else.43476:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43477:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.43478

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43479

fbgt_else.43478:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.43479:
	flw	%f6, 72(%sp)
	fsw	%f0, 73(%sp)
	fabs	%f4, %f4
	nop

	fsw	%f3, 74(%sp)
	nop
	nop
	nop

	fsw	%f2, 75(%sp)
	nop
	nop
	nop

	sw	%v0, 76(%sp)
	nop
	nop
	nop

	fsw	%f4, 77(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.43480

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43482

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43484

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43486

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43488

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43490

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43492

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43494

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43496

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43498

	flw	%f7, 471(%zero)
	sw	%ra, 78(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f7
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
	j	fbgt_cont.43481

fbgt_else.43498:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43499:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43496:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43497:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43494:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43495:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43492:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43493:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43490:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43491:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43488:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43489:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43486:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43487:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43484:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43485:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43482:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43483:
	nop
	nop
	nop
	j	fbgt_cont.43481

fbgt_else.43480:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43481:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43500

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43502

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43504

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43506

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
	j	fbgt_cont.43501

fbgt_else.43506:
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

fbgt_cont.43507:
	nop
	nop
	nop
	j	fbgt_cont.43501

fbgt_else.43504:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43505:
	nop
	nop
	nop
	j	fbgt_cont.43501

fbgt_else.43502:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43508

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43510

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
	j	fbgt_cont.43509

fbgt_else.43510:
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

fbgt_cont.43511:
	nop
	nop
	nop
	j	fbgt_cont.43509

fbgt_else.43508:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43509:
fbgt_cont.43503:
	nop
	nop
	nop
	j	fbgt_cont.43501

fbgt_else.43500:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43501:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43512

	lw	%v0, 76(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43514

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43513

bnei_else.43514:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43515:
	nop
	nop
	nop
	j	fbgt_cont.43513

fbgt_else.43512:
	lw	%v0, 76(%sp)
	nop
	nop
	nop

fbgt_cont.43513:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43516

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43517

fbgt_else.43516:
fbgt_cont.43517:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43518

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43519

fbgt_else.43518:
fbgt_cont.43519:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43520

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.43521

fbgt_else.43520:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.43521:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43522

	nop
	nop
	nop
	j	bnei_cont.43523

bnei_else.43522:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43523:
	fsw	%f0, 78(%sp)
	nop
	nop
	nop

	sw	%ra, 79(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 80
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -80
	nop

	lw	%ra, 79(%sp)
	flw	%f1, 68(%sp)
	nop
	nop

	flw	%f3, 72(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 79(%sp)
	nop
	fabs	%f2, %f0
	nop

	fsw	%f2, 80(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.43524

	flw	%f4, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43526

	flw	%f4, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43528

	flw	%f4, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43530

	flw	%f4, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43532

	flw	%f4, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43534

	flw	%f4, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43536

	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43538

	flw	%f4, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43540

	flw	%f4, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.43542

	flw	%f4, 471(%zero)
	sw	%ra, 81(%sp)
	fmov	%f0, %f2
	nop

	nop
	nop
	fmov	%f1, %f4
	addi	%sp, %sp, 82

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43542:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43543:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43540:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43541:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43538:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43539:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43536:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43537:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43534:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43535:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43532:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43533:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43530:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43531:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43528:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43529:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43526:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43527:
	nop
	nop
	nop
	j	fbgt_cont.43525

fbgt_else.43524:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43525:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43544

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43546

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43548

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43550

	sw	%ra, 81(%sp)
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
	addi	%sp, %sp, 82

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43545

fbgt_else.43550:
	sw	%ra, 81(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 82
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

fbgt_cont.43551:
	nop
	nop
	nop
	j	fbgt_cont.43545

fbgt_else.43548:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43549:
	nop
	nop
	nop
	j	fbgt_cont.43545

fbgt_else.43546:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43552

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43554

	sw	%ra, 81(%sp)
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
	addi	%sp, %sp, 82

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43553

fbgt_else.43554:
	sw	%ra, 81(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 82
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -82
	nop

	lw	%ra, 81(%sp)
	nop
	nop
	nop

fbgt_cont.43555:
	nop
	nop
	nop
	j	fbgt_cont.43553

fbgt_else.43552:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43553:
fbgt_cont.43547:
	nop
	nop
	nop
	j	fbgt_cont.43545

fbgt_else.43544:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43545:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43556

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43557

fbgt_else.43556:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.43557:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43558

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43559

fbgt_else.43558:
fbgt_cont.43559:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43560

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43562

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43561

bnei_else.43562:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43563:
	nop
	nop
	nop
	j	fbgt_cont.43561

fbgt_else.43560:
fbgt_cont.43561:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43564

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43565

fbgt_else.43564:
fbgt_cont.43565:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43566

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.43567

fbgt_else.43566:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.43567:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43568

	nop
	nop
	nop
	j	bnei_cont.43569

bnei_else.43568:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43569:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.43570

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43571

fbgt_else.43570:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.43571:
	flw	%f6, 72(%sp)
	fsw	%f0, 81(%sp)
	fabs	%f4, %f4
	nop

	sw	%v0, 82(%sp)
	nop
	nop
	nop

	fsw	%f4, 83(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.43572

	flw	%f7, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43574

	flw	%f7, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43576

	flw	%f7, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43578

	flw	%f7, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43580

	flw	%f7, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43582

	flw	%f7, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43584

	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43586

	flw	%f7, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43588

	flw	%f7, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.43590

	flw	%f7, 471(%zero)
	sw	%ra, 84(%sp)
	fmov	%f0, %f4
	nop

	nop
	nop
	fmov	%f1, %f7
	addi	%sp, %sp, 85

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -85
	nop

	lw	%ra, 84(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43590:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43591:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43588:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43589:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43586:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43587:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43584:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43585:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43582:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43583:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43580:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43581:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43578:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43579:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43576:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43577:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43574:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43575:
	nop
	nop
	nop
	j	fbgt_cont.43573

fbgt_else.43572:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43573:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43592

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43594

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43596

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43598

	sw	%ra, 84(%sp)
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
	addi	%sp, %sp, 85

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -85
	nop

	lw	%ra, 84(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43593

fbgt_else.43598:
	sw	%ra, 84(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 85
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -85
	nop

	lw	%ra, 84(%sp)
	nop
	nop
	nop

fbgt_cont.43599:
	nop
	nop
	nop
	j	fbgt_cont.43593

fbgt_else.43596:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43597:
	nop
	nop
	nop
	j	fbgt_cont.43593

fbgt_else.43594:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43600

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43602

	sw	%ra, 84(%sp)
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
	addi	%sp, %sp, 85

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -85
	nop

	lw	%ra, 84(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43601

fbgt_else.43602:
	sw	%ra, 84(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 85
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -85
	nop

	lw	%ra, 84(%sp)
	nop
	nop
	nop

fbgt_cont.43603:
	nop
	nop
	nop
	j	fbgt_cont.43601

fbgt_else.43600:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43601:
fbgt_cont.43595:
	nop
	nop
	nop
	j	fbgt_cont.43593

fbgt_else.43592:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43593:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43604

	lw	%v0, 82(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43606

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43605

bnei_else.43606:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43607:
	nop
	nop
	nop
	j	fbgt_cont.43605

fbgt_else.43604:
	lw	%v0, 82(%sp)
	nop
	nop
	nop

fbgt_cont.43605:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43608

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43609

fbgt_else.43608:
fbgt_cont.43609:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43610

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43611

fbgt_else.43610:
fbgt_cont.43611:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43612

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.43613

fbgt_else.43612:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.43613:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43614

	nop
	nop
	nop
	j	bnei_cont.43615

bnei_else.43614:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43615:
	flw	%f4, 73(%sp)
	flw	%f6, 436(%zero)
	nop
	nop

	flw	%f7, 78(%sp)
	nop
	fmul	%f5, %f4, %f0
	nop

	nop
	nop
	fmul	%f5, %f5, %f6
	nop

	fsw	%f5, 171(%zero)
	nop
	nop
	nop

	flw	%f5, 435(%zero)
	nop
	nop
	nop

	nop
	nop
	fmul	%f5, %f7, %f5
	nop

	fsw	%f5, 172(%zero)
	flw	%f5, 81(%sp)
	nop
	nop

	nop
	nop
	fmul	%f8, %f4, %f5
	nop

	nop
	nop
	fmul	%f6, %f8, %f6
	fneg	%f8, %f0

	fsw	%f6, 173(%zero)
	flw	%f6, 2(%sp)
	nop
	nop

	fsw	%f5, 165(%zero)
	nop
	nop
	nop

	fsw	%f6, 166(%zero)
	nop
	nop
	nop

	fsw	%f8, 167(%zero)
	nop
	fneg	%f8, %f7
	nop

	nop
	nop
	fmul	%f0, %f8, %f0
	nop

	fsw	%f0, 168(%zero)
	nop
	fneg	%f0, %f4
	nop

	fsw	%f0, 169(%zero)
	nop
	fneg	%f0, %f7
	nop

	nop
	nop
	fmul	%f0, %f0, %f5
	nop

	fsw	%f0, 170(%zero)
	nop
	nop
	nop

	flw	%f0, 72(%zero)
	flw	%f4, 171(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f4
	nop

	fsw	%f0, 75(%zero)
	nop
	nop
	nop

	flw	%f0, 73(%zero)
	flw	%f5, 172(%zero)
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f5
	nop

	fsw	%f0, 76(%zero)
	nop
	nop
	nop

	flw	%f0, 74(%zero)
	flw	%f7, 173(%zero)
	nop
	nop

	fsw	%f7, 84(%sp)
	nop
	fsub	%f0, %f0, %f7
	nop

	fsw	%f0, 77(%zero)
	fsw	%f5, 85(%sp)
	nop
	nop

	fsw	%f4, 86(%sp)
	nop
	nop
	nop

	sw	%ra, 87(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 88
	nop

	nop
	nop
	nop
	jal	min_caml_read_int

	nop
	nop
	addi	%sp, %sp, -88
	nop

	lw	%ra, 87(%sp)
	nop
	nop
	nop

	sw	%ra, 87(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 88
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -88
	nop

	lw	%ra, 87(%sp)
	flw	%f1, 68(%sp)
	nop
	nop

	flw	%f2, 2(%sp)
	nop
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43616

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43617

fbgt_else.43616:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.43617:
	flw	%f4, 72(%sp)
	fsw	%f0, 87(%sp)
	fabs	%f3, %f0
	nop

	sw	%v0, 88(%sp)
	nop
	nop
	nop

	fsw	%f3, 89(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.43618

	flw	%f5, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43620

	flw	%f5, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43622

	flw	%f5, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43624

	flw	%f5, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43626

	flw	%f5, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43628

	flw	%f5, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43630

	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43632

	flw	%f5, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43634

	flw	%f5, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.43636

	flw	%f5, 471(%zero)
	sw	%ra, 90(%sp)
	fmov	%f0, %f3
	nop

	nop
	nop
	fmov	%f1, %f5
	addi	%sp, %sp, 91

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43636:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43637:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43634:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43635:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43632:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43633:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43630:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43631:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43628:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43629:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43626:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43627:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43624:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43625:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43622:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43623:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43620:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43621:
	nop
	nop
	nop
	j	fbgt_cont.43619

fbgt_else.43618:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.43619:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43638

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43640

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43642

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43644

	sw	%ra, 90(%sp)
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
	addi	%sp, %sp, 91

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43639

fbgt_else.43644:
	sw	%ra, 90(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 91
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	nop
	nop
	nop

fbgt_cont.43645:
	nop
	nop
	nop
	j	fbgt_cont.43639

fbgt_else.43642:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43643:
	nop
	nop
	nop
	j	fbgt_cont.43639

fbgt_else.43640:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43646

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43648

	sw	%ra, 90(%sp)
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
	addi	%sp, %sp, 91

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43647

fbgt_else.43648:
	sw	%ra, 90(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 91
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	nop
	nop
	nop

fbgt_cont.43649:
	nop
	nop
	nop
	j	fbgt_cont.43647

fbgt_else.43646:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43647:
fbgt_cont.43641:
	nop
	nop
	nop
	j	fbgt_cont.43639

fbgt_else.43638:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43639:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43650

	lw	%v0, 88(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43652

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43651

bnei_else.43652:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43653:
	nop
	nop
	nop
	j	fbgt_cont.43651

fbgt_else.43650:
	lw	%v0, 88(%sp)
	nop
	nop
	nop

fbgt_cont.43651:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43654

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43655

fbgt_else.43654:
fbgt_cont.43655:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43656

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43657

fbgt_else.43656:
fbgt_cont.43657:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43658

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.43659

fbgt_else.43658:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.43659:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43660

	nop
	nop
	nop
	j	bnei_cont.43661

bnei_else.43660:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43661:
	sw	%ra, 90(%sp)
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 79(%zero)
	nop
	addi	%sp, %sp, 91
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	nop
	nop
	addi	%sp, %sp, -91
	nop

	lw	%ra, 90(%sp)
	flw	%f1, 68(%sp)
	nop
	nop

	flw	%f1, 87(%sp)
	flw	%f2, 72(%sp)
	fmul	%f0, %f0, %f1
	nop

	fsw	%f0, 90(%sp)
	nop
	fabs	%f1, %f1
	nop

	fsw	%f1, 91(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43662

	flw	%f3, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43664

	flw	%f3, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43666

	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43668

	flw	%f3, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43670

	flw	%f3, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43672

	flw	%f3, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43674

	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43676

	flw	%f3, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43678

	flw	%f3, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.43680

	flw	%f3, 471(%zero)
	sw	%ra, 92(%sp)
	fmov	%f0, %f1
	nop

	nop
	nop
	fmov	%f1, %f3
	addi	%sp, %sp, 93

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -93
	nop

	lw	%ra, 92(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43680:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43681:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43678:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43679:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43676:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43677:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43674:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43675:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43672:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43673:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43670:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43671:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43668:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43669:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43666:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43667:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43664:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.43665:
	nop
	nop
	nop
	j	fbgt_cont.43663

fbgt_else.43662:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.43663:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43682

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43684

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43686

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43688

	sw	%ra, 92(%sp)
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
	addi	%sp, %sp, 93

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -93
	nop

	lw	%ra, 92(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43683

fbgt_else.43688:
	sw	%ra, 92(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 93
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -93
	nop

	lw	%ra, 92(%sp)
	nop
	nop
	nop

fbgt_cont.43689:
	nop
	nop
	nop
	j	fbgt_cont.43683

fbgt_else.43686:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43687:
	nop
	nop
	nop
	j	fbgt_cont.43683

fbgt_else.43684:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43690

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43692

	sw	%ra, 92(%sp)
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
	addi	%sp, %sp, 93

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -93
	nop

	lw	%ra, 92(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43691

fbgt_else.43692:
	sw	%ra, 92(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 93
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -93
	nop

	lw	%ra, 92(%sp)
	nop
	nop
	nop

fbgt_cont.43693:
	nop
	nop
	nop
	j	fbgt_cont.43691

fbgt_else.43690:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43691:
fbgt_cont.43685:
	nop
	nop
	nop
	j	fbgt_cont.43683

fbgt_else.43682:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43683:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43694

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43695

fbgt_else.43694:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.43695:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43696

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43697

fbgt_else.43696:
fbgt_cont.43697:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43698

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43700

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43699

bnei_else.43700:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43701:
	nop
	nop
	nop
	j	fbgt_cont.43699

fbgt_else.43698:
fbgt_cont.43699:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43702

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43703

fbgt_else.43702:
fbgt_cont.43703:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43704

	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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
	j	fbgt_cont.43705

fbgt_else.43704:
	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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

fbgt_cont.43705:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43706

	nop
	nop
	nop
	j	bnei_cont.43707

bnei_else.43706:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43707:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.43708

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43709

fbgt_else.43708:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.43709:
	flw	%f7, 72(%sp)
	fsw	%f0, 92(%sp)
	fabs	%f6, %f4
	nop

	sw	%v0, 93(%sp)
	nop
	nop
	nop

	fsw	%f6, 94(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.43710

	flw	%f8, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43712

	flw	%f8, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43714

	flw	%f8, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43716

	flw	%f8, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43718

	flw	%f8, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43720

	flw	%f8, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43722

	flw	%f8, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43724

	flw	%f8, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43726

	flw	%f8, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.43728

	flw	%f8, 471(%zero)
	sw	%ra, 95(%sp)
	fmov	%f0, %f6
	nop

	nop
	nop
	fmov	%f1, %f8
	addi	%sp, %sp, 96

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -96
	nop

	lw	%ra, 95(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43728:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43729:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43726:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43727:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43724:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43725:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43722:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43723:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43720:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43721:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43718:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43719:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43716:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43717:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43714:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43715:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43712:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.43713:
	nop
	nop
	nop
	j	fbgt_cont.43711

fbgt_else.43710:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.43711:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43730

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43732

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43734

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43736

	sw	%ra, 95(%sp)
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
	addi	%sp, %sp, 96

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -96
	nop

	lw	%ra, 95(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43731

fbgt_else.43736:
	sw	%ra, 95(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 96
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -96
	nop

	lw	%ra, 95(%sp)
	nop
	nop
	nop

fbgt_cont.43737:
	nop
	nop
	nop
	j	fbgt_cont.43731

fbgt_else.43734:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43735:
	nop
	nop
	nop
	j	fbgt_cont.43731

fbgt_else.43732:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43738

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43740

	sw	%ra, 95(%sp)
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
	addi	%sp, %sp, 96

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -96
	nop

	lw	%ra, 95(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43739

fbgt_else.43740:
	sw	%ra, 95(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 96
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -96
	nop

	lw	%ra, 95(%sp)
	nop
	nop
	nop

fbgt_cont.43741:
	nop
	nop
	nop
	j	fbgt_cont.43739

fbgt_else.43738:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43739:
fbgt_cont.43733:
	nop
	nop
	nop
	j	fbgt_cont.43731

fbgt_else.43730:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43731:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43742

	lw	%v0, 93(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43744

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43743

bnei_else.43744:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43745:
	nop
	nop
	nop
	j	fbgt_cont.43743

fbgt_else.43742:
	lw	%v0, 93(%sp)
	nop
	nop
	nop

fbgt_cont.43743:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43746

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43747

fbgt_else.43746:
fbgt_cont.43747:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43748

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43749

fbgt_else.43748:
fbgt_cont.43749:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.43750

	flw	%f6, 467(%zero)
	flw	%f7, 466(%zero)
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

	flw	%f7, 465(%zero)
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
	j	fbgt_cont.43751

fbgt_else.43750:
	flw	%f5, 484(%zero)
	flw	%f6, 464(%zero)
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

	flw	%f6, 463(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 462(%zero)
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

fbgt_cont.43751:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43752

	nop
	nop
	nop
	j	bnei_cont.43753

bnei_else.43752:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43753:
	flw	%f4, 92(%sp)
	flw	%f5, 72(%sp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f4, %f0
	nop

	fsw	%f0, 78(%zero)
	flw	%f0, 90(%sp)
	nop
	nop

	nop
	nop
	fabs	%f0, %f0
	nop

	fsw	%f0, 95(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f5, fbgt_else.43754

	flw	%f6, 480(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43756

	flw	%f6, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43758

	flw	%f6, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43760

	flw	%f6, 477(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43762

	flw	%f6, 476(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43764

	flw	%f6, 475(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43766

	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43768

	flw	%f6, 473(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43770

	flw	%f6, 472(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.43772

	flw	%f6, 471(%zero)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	fmov	%f1, %f6
	addi	%sp, %sp, 97

	nop
	nop
	nop
	jal	reduction_2pi_sub1.2614

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43772:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43773:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43770:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43771:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43768:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43769:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43766:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43767:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43764:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43765:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43762:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43763:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43760:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43761:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43758:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43759:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43756:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.43757:
	nop
	nop
	nop
	j	fbgt_cont.43755

fbgt_else.43754:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.43755:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43774

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43776

	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43778

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43780

	sw	%ra, 96(%sp)
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
	addi	%sp, %sp, 97

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43775

fbgt_else.43780:
	sw	%ra, 96(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

fbgt_cont.43781:
	nop
	nop
	nop
	j	fbgt_cont.43775

fbgt_else.43778:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43779:
	nop
	nop
	nop
	j	fbgt_cont.43775

fbgt_else.43776:
	flw	%f3, 495(%zero)
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
	fblt	%f1, %f2, fbgt_else.43782

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43784

	sw	%ra, 96(%sp)
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
	addi	%sp, %sp, 97

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43783

fbgt_else.43784:
	sw	%ra, 96(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

fbgt_cont.43785:
	nop
	nop
	nop
	j	fbgt_cont.43783

fbgt_else.43782:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43783:
fbgt_cont.43777:
	nop
	nop
	nop
	j	fbgt_cont.43775

fbgt_else.43774:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43775:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43786

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43787

fbgt_else.43786:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.43787:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.43788

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43789

fbgt_else.43788:
fbgt_cont.43789:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43790

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43792

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43791

bnei_else.43792:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.43793:
	nop
	nop
	nop
	j	fbgt_cont.43791

fbgt_else.43790:
fbgt_cont.43791:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.43794

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.43795

fbgt_else.43794:
fbgt_cont.43795:
	flw	%f1, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43796

	flw	%f2, 484(%zero)
	flw	%f3, 464(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 463(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 462(%zero)
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
	j	fbgt_cont.43797

fbgt_else.43796:
	flw	%f3, 467(%zero)
	flw	%f4, 466(%zero)
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

	flw	%f4, 465(%zero)
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

fbgt_cont.43797:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43798

	nop
	nop
	nop
	j	bnei_cont.43799

bnei_else.43798:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.43799:
	flw	%f1, 92(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	fmul	%f0, %f1, %f0
	addi	%sp, %sp, 97

	fsw	%f0, 80(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	jal	min_caml_read_float

	fsw	%f0, 81(%zero)
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	lw	%v0, 1(%sp)
	nop
	nop

	sw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43800

	lw	%v0, 0(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43802

	lw	%v0, 6(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43804

	lw	%v0, 4(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_nth_object.2770

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.43806

	lw	%v0, 14(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_object.2772

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.43801

bnei_else.43806:
	lw	%v0, 4(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
	nop

bnei_cont.43807:
	nop
	nop
	nop
	j	bnei_cont.43801

bnei_else.43804:
	lw	%v0, 6(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
	nop

bnei_cont.43805:
	nop
	nop
	nop
	j	bnei_cont.43801

bnei_else.43802:
	lw	%v0, 0(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
	nop

bnei_cont.43803:
	nop
	nop
	nop
	j	bnei_cont.43801

bnei_else.43800:
	lw	%v0, 1(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%zero)
	nop
	nop
	nop

bnei_cont.43801:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_net_item.2776

	lw	%v1, 0(%v0)
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.43808

	sw	%v0, 83(%zero)
	lw	%v0, 0(%sp)
	nop
	nop

	sw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_and_network.2780

	nop
	nop
	addi	%sp, %sp, -97
	nop

	lw	%ra, 96(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.43809

bnei_else.43808:
bnei_cont.43809:
	lw	%v0, 1(%sp)
	sw	%ra, 96(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 97
	nop

	nop
	nop
	nop
	jal	read_net_item.2776

	nop
	nop
	addi	%sp, %sp, -97
	addi	%v1, %v0, 0

	lw	%ra, 96(%sp)
	lw	%v0, 0(%v1)
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.43810

	lw	%v0, 0(%sp)
	sw	%v1, 96(%sp)
	nop
	nop

	sw	%ra, 97(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 98
	nop

	nop
	nop
	nop
	jal	read_or_network.2778

	nop
	nop
	addi	%sp, %sp, -98
	nop

	lw	%ra, 97(%sp)
	lw	%v1, 96(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.43811

bnei_else.43810:
	lw	%v0, 0(%sp)
	sw	%ra, 97(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 98
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -98
	nop

	lw	%ra, 97(%sp)
	nop
	nop
	nop

bnei_cont.43811:
	sw	%v0, 134(%zero)
	sw	%ra, 97(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %zero, 80
	addi	%sp, %sp, 98

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -98
	addi	%v0, %zero, 51

	lw	%ra, 97(%sp)
	nop
	nop
	nop

	sw	%ra, 97(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 98
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -98
	addi	%v0, %zero, 10

	lw	%ra, 97(%sp)
	sw	%v0, 97(%sp)
	nop
	nop

	sw	%ra, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 99
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -99
	nop

	lw	%ra, 98(%sp)
	lw	%v0, 11(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.43812

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43814

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43816

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43818

	lw	%a0, 14(%sp)
	sw	%ra, 98(%sp)
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 99
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

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
	j	bgti_cont.43813

bgti_else.43818:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.43819:
	nop
	nop
	nop
	j	bgti_cont.43813

bgti_else.43816:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.43817:
	nop
	nop
	nop
	j	bgti_cont.43813

bgti_else.43814:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.43815:
	nop
	nop
	nop
	j	bgti_cont.43813

bgti_else.43812:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.43813:
	lw	%v1, 11(%sp)
	sw	%v0, 98(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43820

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43822

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43824

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43826

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43828

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43830

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43832

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43834

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43836

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43838

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43840

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43842

	sw	%ra, 99(%sp)
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	addi	%v0, %a0, 0
	addi	%sp, %sp, 100

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -100
	nop

	lw	%ra, 99(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43842:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43843:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43840:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43841:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43838:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43839:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43836:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43837:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43834:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43835:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43832:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43833:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43830:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43831:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43828:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43829:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43826:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43827:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43824:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43825:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43822:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.43823:
	nop
	nop
	nop
	j	bgti_cont.43821

bgti_else.43820:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43821:
	lw	%v1, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.43844

	sw	%ra, 99(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 100
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -100
	nop

	lw	%ra, 99(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.43845

bgt_else.43844:
	sw	%v0, 99(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43846

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43848

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43850

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43852

	lw	%a1, 14(%sp)
	sw	%ra, 100(%sp)
	addi	%a0, %a0, -10
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 101
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -101
	nop

	lw	%ra, 100(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43847

bgti_else.43852:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.43853:
	nop
	nop
	nop
	j	bgti_cont.43847

bgti_else.43850:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.43851:
	nop
	nop
	nop
	j	bgti_cont.43847

bgti_else.43848:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.43849:
	nop
	nop
	nop
	j	bgti_cont.43847

bgti_else.43846:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.43847:
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43854

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43856

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43858

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43860

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43862

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43864

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43866

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43868

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43870

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43872

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43874

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43876

	sw	%ra, 101(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 102

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -102
	nop

	lw	%ra, 101(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43876:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43877:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43874:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43875:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43872:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43873:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43870:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43871:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43868:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43869:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43866:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43867:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43864:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43865:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43862:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43863:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43860:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43861:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43858:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43859:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43856:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43857:
	nop
	nop
	nop
	j	bgti_cont.43855

bgti_else.43854:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43855:
	lw	%v1, 100(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.43878

	sw	%ra, 101(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 102
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -102
	nop

	lw	%ra, 101(%sp)
	lw	%v0, 99(%sp)
	nop
	nop

	sw	%ra, 101(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 102
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -102
	nop

	lw	%ra, 101(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.43879

bgt_else.43878:
	sw	%v0, 101(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43880

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43882

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43884

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43886

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43888

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43890

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43892

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43894

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43896

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43898

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43900

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43902

	sw	%ra, 102(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 103

	nop
	nop
	nop
	jal	print_int_sub2.2632

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
	j	bgti_cont.43881

bgti_else.43902:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43903:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43900:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43901:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43898:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43899:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43896:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43897:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43894:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43895:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43892:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43893:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43890:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43891:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43888:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43889:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43886:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43887:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43884:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43885:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43882:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43883:
	nop
	nop
	nop
	j	bgti_cont.43881

bgti_else.43880:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43881:
	sw	%ra, 102(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	lw	%v0, 101(%sp)
	nop
	nop

	sw	%ra, 102(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	lw	%v0, 99(%sp)
	nop
	nop

	sw	%ra, 102(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 103
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -103
	nop

	lw	%ra, 102(%sp)
	nop
	nop
	nop

bgt_cont.43879:
bgt_cont.43845:
	nop
	nop
	addi	%v0, %zero, 32
	nop

	sw	%v0, 102(%sp)
	nop
	nop
	nop

	sw	%ra, 103(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 104
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	lw	%v0, 155(%zero)
	nop
	addi	%sp, %sp, -104
	nop

	lw	%ra, 103(%sp)
	sw	%v0, 103(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.43904

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43906

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43908

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43910

	lw	%a0, 14(%sp)
	sw	%ra, 104(%sp)
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0

	nop
	nop
	addi	%sp, %sp, 105
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -105
	nop

	lw	%ra, 104(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43905

bgti_else.43910:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.43911:
	nop
	nop
	nop
	j	bgti_cont.43905

bgti_else.43908:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.43909:
	nop
	nop
	nop
	j	bgti_cont.43905

bgti_else.43906:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.43907:
	nop
	nop
	nop
	j	bgti_cont.43905

bgti_else.43904:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.43905:
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43912

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43914

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43916

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43918

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43920

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43922

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43924

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43926

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43928

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43930

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43932

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43934

	sw	%ra, 105(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 106

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -106
	nop

	lw	%ra, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43934:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43935:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43932:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43933:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43930:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43931:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43928:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43929:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43926:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43927:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43924:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43925:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43922:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43923:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43920:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43921:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43918:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43919:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43916:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43917:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43914:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43915:
	nop
	nop
	nop
	j	bgti_cont.43913

bgti_else.43912:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43913:
	lw	%v1, 104(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.43936

	sw	%ra, 105(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 106
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -106
	nop

	lw	%ra, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.43937

bgt_else.43936:
	sw	%v0, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43938

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43940

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43942

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.43944

	lw	%a1, 14(%sp)
	sw	%ra, 106(%sp)
	addi	%a0, %a0, -10
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 107
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -107
	nop

	lw	%ra, 106(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43939

bgti_else.43944:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.43945:
	nop
	nop
	nop
	j	bgti_cont.43939

bgti_else.43942:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.43943:
	nop
	nop
	nop
	j	bgti_cont.43939

bgti_else.43940:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.43941:
	nop
	nop
	nop
	j	bgti_cont.43939

bgti_else.43938:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.43939:
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43946

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43948

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43950

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43952

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43954

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43956

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43958

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43960

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43962

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43964

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43966

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43968

	sw	%ra, 107(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 108

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -108
	nop

	lw	%ra, 107(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43968:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43969:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43966:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43967:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43964:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43965:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43962:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43963:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43960:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43961:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43958:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43959:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43956:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43957:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43954:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43955:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43952:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43953:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43950:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43951:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43948:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43949:
	nop
	nop
	nop
	j	bgti_cont.43947

bgti_else.43946:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43947:
	lw	%v1, 106(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.43970

	sw	%ra, 107(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 108
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -108
	nop

	lw	%ra, 107(%sp)
	lw	%v0, 105(%sp)
	nop
	nop

	sw	%ra, 107(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 108
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -108
	nop

	lw	%ra, 107(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.43971

bgt_else.43970:
	sw	%v0, 107(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43972

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43974

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43976

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43978

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43980

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43982

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43984

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43986

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43988

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43990

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43992

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43994

	sw	%ra, 108(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 109

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -109
	nop

	lw	%ra, 108(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43994:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43995:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43992:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43993:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43990:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43991:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43988:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43989:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43986:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43987:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43984:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43985:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43982:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43983:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43980:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43981:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43978:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43979:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43976:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43977:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43974:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43975:
	nop
	nop
	nop
	j	bgti_cont.43973

bgti_else.43972:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.43973:
	sw	%ra, 108(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 109
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -109
	nop

	lw	%ra, 108(%sp)
	lw	%v0, 107(%sp)
	nop
	nop

	sw	%ra, 108(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 109
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -109
	nop

	lw	%ra, 108(%sp)
	lw	%v0, 105(%sp)
	nop
	nop

	sw	%ra, 108(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 109
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -109
	nop

	lw	%ra, 108(%sp)
	nop
	nop
	nop

bgt_cont.43971:
bgt_cont.43937:
	lw	%v0, 102(%sp)
	sw	%ra, 108(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 109
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -109
	addi	%v0, %zero, 215

	lw	%ra, 108(%sp)
	lw	%v1, 14(%sp)
	nop
	nop

	sw	%ra, 108(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 109
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -109
	addi	%v1, %zero, 135

	lw	%ra, 108(%sp)
	sw	%v0, 108(%sp)
	addi	%v0, %v1, 0
	nop

	sw	%ra, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 110
	nop

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -110
	nop

	lw	%ra, 109(%sp)
	lw	%v1, 108(%sp)
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.43996

	sw	%ra, 109(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 110
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

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
	j	bgt_cont.43997

bgt_else.43996:
	sw	%v0, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.43998

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44000

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44002

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.44004

	lw	%a1, 14(%sp)
	sw	%ra, 110(%sp)
	addi	%a0, %a0, -10
	nop

	nop
	nop
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 111
	nop

	nop
	nop
	nop
	jal	print_int_sub1.2629

	nop
	nop
	addi	%sp, %sp, -111
	nop

	lw	%ra, 110(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.43999

bgti_else.44004:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.44005:
	nop
	nop
	nop
	j	bgti_cont.43999

bgti_else.44002:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.44003:
	nop
	nop
	nop
	j	bgti_cont.43999

bgti_else.44000:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.44001:
	nop
	nop
	nop
	j	bgti_cont.43999

bgti_else.43998:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.43999:
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44006

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44008

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44010

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44012

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44014

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44016

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44018

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44020

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44022

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44024

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44026

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44028

	sw	%ra, 111(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 112

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -112
	nop

	lw	%ra, 111(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44028:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44029:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44026:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44027:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44024:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44025:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44022:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44023:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44020:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44021:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44018:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44019:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44016:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44017:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44014:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44015:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44012:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44013:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44010:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44011:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44008:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44009:
	nop
	nop
	nop
	j	bgti_cont.44007

bgti_else.44006:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44007:
	lw	%v1, 110(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.44030

	sw	%ra, 111(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 112
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -112
	nop

	lw	%ra, 111(%sp)
	lw	%v0, 109(%sp)
	nop
	nop

	sw	%ra, 111(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 112
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -112
	nop

	lw	%ra, 111(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgt_cont.44031

bgt_else.44030:
	sw	%v0, 111(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44032

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44034

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44036

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44038

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44040

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44042

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44044

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44046

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44048

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44050

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44052

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.44054

	sw	%ra, 112(%sp)
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	addi	%v0, %v1, 0
	addi	%sp, %sp, 113

	nop
	nop
	nop
	jal	print_int_sub2.2632

	nop
	nop
	addi	%sp, %sp, -113
	nop

	lw	%ra, 112(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44054:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44055:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44052:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44053:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44050:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44051:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44048:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44049:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44046:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44047:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44044:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44045:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44042:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44043:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44040:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44041:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44038:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44039:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44036:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44037:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44034:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44035:
	nop
	nop
	nop
	j	bgti_cont.44033

bgti_else.44032:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.44033:
	sw	%ra, 112(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 113
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -113
	nop

	lw	%ra, 112(%sp)
	lw	%v0, 111(%sp)
	nop
	nop

	sw	%ra, 112(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 113
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -113
	nop

	lw	%ra, 112(%sp)
	lw	%v0, 109(%sp)
	nop
	nop

	sw	%ra, 112(%sp)
	nop
	addi	%v0, %v0, 48
	nop

	nop
	nop
	addi	%sp, %sp, 113
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -113
	nop

	lw	%ra, 112(%sp)
	nop
	nop
	nop

bgt_cont.44031:
bgt_cont.43997:
	lw	%v0, 97(%sp)
	sw	%ra, 112(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 113
	nop

	nop
	nop
	nop
	jal	min_caml_print_char

	nop
	nop
	addi	%sp, %sp, -113
	addi	%v0, %zero, 120

	lw	%ra, 112(%sp)
	flw	%f0, 2(%sp)
	nop
	nop

	lw	%v1, 4(%sp)
	sw	%v0, 112(%sp)
	nop
	nop

	sw	%ra, 113(%sp)
	nop
	addi	%v0, %v1, 0
	nop

	nop
	nop
	addi	%sp, %sp, 114
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	lw	%v0, 0(%zero)
	nop
	addi	%sp, %sp, -114
	addi	%v1, %v0, 0

	lw	%ra, 113(%sp)
	sw	%v0, 113(%sp)
	nop
	nop

	sw	%v1, 114(%sp)
	nop
	nop
	nop

	sw	%ra, 115(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 116
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -116
	add	%v1, %zero, %hp

	lw	%ra, 115(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 114(%sp)
	nop
	nop
	nop

	sw	%v0, 0(%v1)
	lw	%v0, 112(%sp)
	nop
	nop

	sw	%ra, 115(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 116
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	sw	%v0, 183(%zero)
	nop
	addi	%sp, %sp, -116
	nop

	lw	%ra, 115(%sp)
	lw	%v0, 183(%zero)
	addi	%v1, %zero, 118
	nop

	sw	%v0, 115(%sp)
	nop
	nop
	nop

	sw	%ra, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	create_dirvec_elements.3090

	nop
	nop
	addi	%sp, %sp, -117
	nop

	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	sw	%ra, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	create_dirvecs.3093

	flw	%f1, 491(%zero)
	nop
	addi	%sp, %sp, -117
	addi	%v0, %zero, 9

	lw	%ra, 116(%sp)
	lw	%v0, 14(%sp)
	itof	%f0, %v0
	nop

	flw	%f1, 438(%zero)
	lw	%v1, 1(%sp)
	fmul	%f0, %f0, %f1
	nop

	sw	%ra, 116(%sp)
	nop
	fsub	%f0, %f0, %f1
	addi	%a0, %v1, 0

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	calc_dirvecs.3079

	nop
	nop
	addi	%sp, %sp, -117
	addi	%v0, %zero, 8

	lw	%ra, 116(%sp)
	lw	%v1, 6(%sp)
	nop
	nop

	lw	%a0, 14(%sp)
	sw	%ra, 116(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	calc_dirvec_rows.3084

	nop
	nop
	addi	%sp, %sp, -117
	addi	%v1, %zero, 119

	lw	%ra, 116(%sp)
	lw	%v0, 115(%sp)
	nop
	nop

	sw	%ra, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	init_dirvec_constants.3095

	nop
	nop
	addi	%sp, %sp, -117
	nop

	lw	%ra, 116(%sp)
	lw	%v0, 4(%sp)
	nop
	nop

	sw	%ra, 116(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 117
	nop

	nop
	nop
	nop
	jal	init_vecset_constants.3098

	flw	%f0, 78(%zero)
	nop
	addi	%sp, %sp, -117
	nop

	lw	%ra, 116(%sp)
	fsw	%f0, 184(%zero)
	nop
	nop

	flw	%f1, 79(%zero)
	lw	%v0, 113(%sp)
	nop
	nop

	fsw	%f1, 185(%zero)
	nop
	addi	%v1, %v0, -1
	nop

	flw	%f2, 80(%zero)
	nop
	nop
	nop

	fsw	%f2, 186(%zero)
	fsw	%f2, 116(%sp)
	nop
	nop

	fsw	%f1, 117(%sp)
	nop
	nop
	nop

	fsw	%f0, 118(%sp)
	nop
	nop
	nop

	sw	%v1, 119(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 0, bgti_else.44056

	lw	%a0, 12(%v1)
	nop
	nop
	nop

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 1, bnei_else.44058

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.44060

	flw	%f3, 2(%sp)
	lw	%a1, 8(%sp)
	nop
	nop

	sw	%a0, 120(%sp)
	nop
	addi	%v0, %a1, 0
	fmov	%f0, %f3

	sw	%ra, 121(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 122
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 184(%zero)
	flw	%f1, 185(%zero)
	addi	%sp, %sp, -122
	nop

	lw	%ra, 121(%sp)
	flw	%f2, 186(%zero)
	fmul	%f3, %f0, %f0
	nop

	lw	%v1, 120(%sp)
	nop
	nop
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
	beqi	%a0, 0, bnei_else.44062

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
	j	bnei_cont.44063

bnei_else.44062:
bnei_cont.44063:
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
	beqi	%a0, 0, bnei_else.44064

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

	flw	%f8, 464(%zero)
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
	j	bnei_cont.44065

bnei_else.44064:
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

bnei_cont.44065:
	flw	%f0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.44066

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44067

fbeq_else.44066:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44067:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44068

	nop
	nop
	nop
	j	bnei_cont.44069

bnei_else.44068:
	flw	%f1, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	fsw	%f1, 4(%v0)
	nop
	nop
	nop

bnei_cont.44069:
	lw	%v1, 119(%sp)
	nop
	nop
	nop

	sw	%v0, 187(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44059

bnei_else.44060:
	flw	%f3, 2(%sp)
	lw	%a1, 14(%sp)
	nop
	nop

	sw	%a0, 120(%sp)
	nop
	addi	%v0, %a1, 0
	fmov	%f0, %f3

	sw	%ra, 121(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 122
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 184(%zero)
	nop
	addi	%sp, %sp, -122
	nop

	lw	%ra, 121(%sp)
	lw	%v1, 120(%sp)
	nop
	nop

	lw	%a0, 4(%v1)
	nop
	nop
	nop

	flw	%f1, 0(%a0)
	lw	%a0, 4(%v1)
	nop
	nop

	flw	%f1, 185(%zero)
	flw	%f2, 1(%a0)
	fmul	%f0, %f0, %f1
	nop

	lw	%a0, 4(%v1)
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 186(%zero)
	flw	%f2, 2(%a0)
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	fmul	%f1, %f1, %f2
	nop

	flw	%f1, 2(%sp)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44070

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44071

fbgt_else.44070:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.44071:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44072

	flw	%f2, 460(%zero)
	lw	%a0, 4(%v1)
	nop
	nop

	nop
	nop
	fdiv	%f2, %f2, %f0
	nop

	fsw	%f2, 0(%v0)
	flw	%f2, 0(%a0)
	nop
	nop

	lw	%a0, 4(%v1)
	lw	%v1, 4(%v1)
	fdiv	%f2, %f2, %f0
	nop

	nop
	nop
	fneg	%f2, %f2
	nop

	fsw	%f2, 1(%v0)
	flw	%f2, 1(%a0)
	nop
	nop

	nop
	nop
	fdiv	%f2, %f2, %f0
	nop

	nop
	nop
	fneg	%f2, %f2
	nop

	fsw	%f2, 2(%v0)
	flw	%f2, 2(%v1)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
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
	j	bnei_cont.44073

bnei_else.44072:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.44073:
	lw	%v1, 119(%sp)
	nop
	nop
	nop

	sw	%v0, 187(%v1)
	nop
	nop
	nop

bnei_cont.44061:
	nop
	nop
	nop
	j	bnei_cont.44059

bnei_else.44058:
	flw	%f3, 2(%sp)
	sw	%a0, 120(%sp)
	addi	%a1, %zero, 6
	nop

	sw	%ra, 121(%sp)
	nop
	addi	%v0, %a1, 0
	fmov	%f0, %f3

	nop
	nop
	addi	%sp, %sp, 122
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	flw	%f0, 184(%zero)
	nop
	addi	%sp, %sp, -122
	nop

	lw	%ra, 121(%sp)
	flw	%f1, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44074

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44075

fbeq_else.44074:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44075:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44076

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44077

bnei_else.44076:
	lw	%v1, 120(%sp)
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
	fblt	%f0, %f1, fbgt_else.44078

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44079

fbgt_else.44078:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.44079:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44080

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44082

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44081

bnei_else.44082:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.44083:
	nop
	nop
	nop
	j	bnei_cont.44081

bnei_else.44080:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.44081:
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
	nop
	beqi	%a0, 0, bnei_else.44084

	nop
	nop
	nop
	j	bnei_cont.44085

bnei_else.44084:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44085:
	fsw	%f2, 0(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.44077:
	flw	%f0, 185(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44086

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44087

fbeq_else.44086:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44087:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44088

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44089

bnei_else.44088:
	lw	%v1, 120(%sp)
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
	fblt	%f0, %f1, fbgt_else.44090

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44091

fbgt_else.44090:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.44091:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44092

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44094

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44093

bnei_else.44094:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.44095:
	nop
	nop
	nop
	j	bnei_cont.44093

bnei_else.44092:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.44093:
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
	nop
	beqi	%a0, 0, bnei_else.44096

	nop
	nop
	nop
	j	bnei_cont.44097

bnei_else.44096:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44097:
	fsw	%f2, 2(%v0)
	flw	%f2, 484(%zero)
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

bnei_cont.44089:
	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44098

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44099

fbeq_else.44098:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44099:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44100

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44101

bnei_else.44100:
	lw	%v1, 120(%sp)
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
	fblt	%f0, %f1, fbgt_else.44102

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44103

fbgt_else.44102:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.44103:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44104

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44106

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44105

bnei_else.44106:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.44107:
	nop
	nop
	nop
	j	bnei_cont.44105

bnei_else.44104:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.44105:
	lw	%v1, 4(%v1)
	nop
	nop
	nop

	flw	%f2, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44108

	nop
	nop
	nop
	j	bnei_cont.44109

bnei_else.44108:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44109:
	fsw	%f2, 4(%v0)
	flw	%f2, 484(%zero)
	nop
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

	fsw	%f0, 5(%v0)
	nop
	nop
	nop

bnei_cont.44101:
	lw	%v1, 119(%sp)
	nop
	nop
	nop

	sw	%v0, 187(%v1)
	nop
	nop
	nop

bnei_cont.44059:
	sw	%ra, 121(%sp)
	nop
	addi	%v0, %v1, -1
	addi	%a0, %zero, 247

	nop
	nop
	addi	%v1, %v0, 0
	addi	%v0, %a0, 0

	nop
	nop
	addi	%sp, %sp, 122
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -122
	nop

	lw	%ra, 121(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bgti_cont.44057

bgti_else.44056:
bgti_cont.44057:
	lw	%v0, 119(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.44110

	lw	%v1, 12(%v0)
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
	beqi	%a0, 2, bnei_else.44112

	nop
	nop
	nop
	j	bgti_cont.44111

bnei_else.44112:
	lw	%a0, 7(%v1)
	flw	%f1, 484(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44114

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44115

fbgt_else.44114:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.44115:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44116

	lw	%a0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.44118

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.44120

	nop
	nop
	nop
	j	bnei_cont.44117

bnei_else.44120:
	lw	%a1, 434(%zero)
	lw	%a2, 7(%v1)
	sll	%a0, %v0, 2
	nop

	flw	%f0, 0(%a2)
	lw	%a2, 4(%v1)
	addi	%a0, %a0, 1
	nop

	flw	%f1, 0(%a2)
	flw	%f2, 118(%sp)
	fsub	%f0, %f1, %f0
	nop

	flw	%f3, 1(%a2)
	flw	%f4, 117(%sp)
	fmul	%f1, %f2, %f1
	nop

	flw	%f5, 116(%sp)
	nop
	fmul	%f3, %f4, %f3
	nop

	flw	%f3, 2(%a2)
	lw	%a2, 4(%v1)
	fadd	%f1, %f1, %f3
	nop

	flw	%f6, 0(%a2)
	lw	%a2, 4(%v1)
	fmul	%f3, %f5, %f3
	nop

	flw	%f3, 495(%zero)
	lw	%v1, 4(%v1)
	fadd	%f1, %f1, %f3
	nop

	nop
	nop
	fmul	%f6, %f3, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f1
	nop

	flw	%f6, 1(%a2)
	nop
	fsub	%f2, %f6, %f2
	nop

	nop
	nop
	fmul	%f6, %f3, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f1
	nop

	flw	%f6, 2(%v1)
	lw	%v1, 4(%sp)
	fsub	%f4, %f6, %f4
	nop

	nop
	nop
	fmul	%f3, %f3, %f6
	addi	%v0, %v1, 0

	flw	%f3, 2(%sp)
	sw	%a1, 121(%sp)
	fmul	%f1, %f3, %f1
	nop

	sw	%a0, 122(%sp)
	nop
	fsub	%f1, %f1, %f5
	nop

	fsw	%f0, 123(%sp)
	nop
	fmov	%f0, %f3
	nop

	fsw	%f1, 124(%sp)
	nop
	nop
	nop

	fsw	%f4, 125(%sp)
	nop
	nop
	nop

	fsw	%f2, 126(%sp)
	nop
	nop
	nop

	sw	%ra, 127(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 128
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -128
	addi	%v1, %v0, 0

	lw	%ra, 127(%sp)
	lw	%v0, 113(%sp)
	nop
	nop

	sw	%v1, 127(%sp)
	nop
	nop
	nop

	sw	%ra, 128(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 129
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -129
	add	%v1, %zero, %hp

	lw	%ra, 128(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 127(%sp)
	flw	%f0, 126(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f0, 125(%sp)
	nop
	addi	%k0, %v1, 0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 124(%sp)
	nop
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 119(%sp)
	sw	%v1, 128(%sp)
	nop
	nop

	sw	%ra, 129(%sp)
	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	addi	%sp, %sp, 130
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -130
	add	%v0, %zero, %hp

	lw	%ra, 129(%sp)
	flw	%f0, 123(%sp)
	addi	%hp, %hp, 3
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 128(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 122(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 121(%sp)
	nop
	nop

	sw	%v0, 254(%v1)
	nop
	nop
	nop

	nop
	nop
	addi	%v0, %v1, 1
	nop

	sw	%v0, 434(%zero)
	nop
	nop
	nop

bnei_cont.44121:
	nop
	nop
	nop
	j	bnei_cont.44117

bnei_else.44118:
	lw	%a1, 434(%zero)
	lw	%v1, 7(%v1)
	sll	%a0, %v0, 2
	nop

	flw	%f0, 0(%v1)
	flw	%f3, 117(%sp)
	addi	%v1, %a0, 1
	nop

	flw	%f1, 118(%sp)
	flw	%f5, 116(%sp)
	fsub	%f0, %f1, %f0
	fneg	%f4, %f3

	flw	%f7, 2(%sp)
	lw	%a2, 4(%sp)
	fneg	%f2, %f1
	fneg	%f6, %f5

	fsw	%f2, 129(%sp)
	nop
	addi	%v0, %a2, 0
	nop

	sw	%a0, 130(%sp)
	nop
	nop
	nop

	sw	%a1, 131(%sp)
	nop
	nop
	nop

	sw	%v1, 132(%sp)
	nop
	nop
	nop

	fsw	%f0, 133(%sp)
	nop
	fmov	%f0, %f7
	nop

	fsw	%f6, 134(%sp)
	nop
	nop
	nop

	fsw	%f4, 135(%sp)
	nop
	nop
	nop

	sw	%ra, 136(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 137
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -137
	addi	%v1, %v0, 0

	lw	%ra, 136(%sp)
	lw	%v0, 113(%sp)
	nop
	nop

	sw	%v1, 136(%sp)
	nop
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
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -138
	add	%v1, %zero, %hp

	lw	%ra, 137(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 136(%sp)
	flw	%f0, 118(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f0, 135(%sp)
	flw	%f1, 134(%sp)
	addi	%k0, %v1, 0
	nop

	fsw	%f0, 1(%v0)
	nop
	nop
	nop

	fsw	%f1, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 119(%sp)
	sw	%v1, 137(%sp)
	nop
	nop

	sw	%ra, 138(%sp)
	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	addi	%sp, %sp, 139
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -139
	add	%v0, %zero, %hp

	lw	%ra, 138(%sp)
	flw	%f0, 133(%sp)
	addi	%hp, %hp, 3
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 137(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 132(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 131(%sp)
	nop
	nop

	sw	%v0, 254(%v1)
	lw	%a0, 130(%sp)
	nop
	nop

	flw	%f1, 2(%sp)
	lw	%a2, 4(%sp)
	addi	%v0, %v1, 1
	addi	%a1, %a0, 2

	sw	%v0, 138(%sp)
	nop
	addi	%v0, %a2, 0
	fmov	%f0, %f1

	sw	%a1, 139(%sp)
	nop
	nop
	nop

	sw	%ra, 140(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 141
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -141
	addi	%v1, %v0, 0

	lw	%ra, 140(%sp)
	lw	%v0, 113(%sp)
	nop
	nop

	sw	%v1, 140(%sp)
	nop
	nop
	nop

	sw	%ra, 141(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 142
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -142
	add	%v1, %zero, %hp

	lw	%ra, 141(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 140(%sp)
	flw	%f0, 129(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f1, 117(%sp)
	nop
	addi	%k0, %v1, 0
	nop

	fsw	%f1, 1(%v0)
	flw	%f1, 134(%sp)
	nop
	nop

	fsw	%f1, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 119(%sp)
	sw	%v1, 141(%sp)
	nop
	nop

	sw	%ra, 142(%sp)
	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	addi	%sp, %sp, 143
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -143
	add	%v0, %zero, %hp

	lw	%ra, 142(%sp)
	flw	%f0, 133(%sp)
	addi	%hp, %hp, 3
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 141(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 139(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 138(%sp)
	nop
	nop

	sw	%v0, 254(%v1)
	lw	%v0, 131(%sp)
	nop
	nop

	lw	%a0, 130(%sp)
	flw	%f1, 2(%sp)
	addi	%v1, %v0, 2
	nop

	lw	%a1, 4(%sp)
	sw	%v1, 142(%sp)
	addi	%a0, %a0, 3
	fmov	%f0, %f1

	sw	%a0, 143(%sp)
	nop
	addi	%v0, %a1, 0
	nop

	sw	%ra, 144(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 145
	nop

	nop
	nop
	nop
	jal	min_caml_create_float_array

	nop
	nop
	addi	%sp, %sp, -145
	addi	%v1, %v0, 0

	lw	%ra, 144(%sp)
	lw	%v0, 113(%sp)
	nop
	nop

	sw	%v1, 144(%sp)
	nop
	nop
	nop

	sw	%ra, 145(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 146
	nop

	nop
	nop
	nop
	jal	min_caml_create_array

	nop
	nop
	addi	%sp, %sp, -146
	add	%v1, %zero, %hp

	lw	%ra, 145(%sp)
	sw	%v0, 1(%v1)
	addi	%hp, %hp, 2
	nop

	lw	%v0, 144(%sp)
	flw	%f0, 129(%sp)
	nop
	nop

	sw	%v0, 0(%v1)
	fsw	%f0, 0(%v0)
	nop
	nop

	flw	%f0, 135(%sp)
	nop
	addi	%k0, %v1, 0
	nop

	fsw	%f0, 1(%v0)
	flw	%f0, 116(%sp)
	nop
	nop

	fsw	%f0, 2(%v0)
	nop
	nop
	nop

	lw	%v0, 119(%sp)
	sw	%v1, 145(%sp)
	nop
	nop

	sw	%ra, 146(%sp)
	nop
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0

	nop
	nop
	addi	%sp, %sp, 147
	nop

	nop
	nop
	nop
	jal	iter_setup_dirvec_constants.2877

	nop
	nop
	addi	%sp, %sp, -147
	add	%v0, %zero, %hp

	lw	%ra, 146(%sp)
	flw	%f0, 133(%sp)
	addi	%hp, %hp, 3
	nop

	fsw	%f0, 2(%v0)
	lw	%v1, 145(%sp)
	nop
	nop

	sw	%v1, 1(%v0)
	lw	%v1, 143(%sp)
	nop
	nop

	sw	%v1, 0(%v0)
	lw	%v1, 142(%sp)
	nop
	nop

	sw	%v0, 254(%v1)
	lw	%v0, 131(%sp)
	nop
	nop

	nop
	nop
	addi	%v0, %v0, 3
	nop

	sw	%v0, 434(%zero)
	nop
	nop
	nop

bnei_cont.44119:
	nop
	nop
	nop
	j	bnei_cont.44117

bnei_else.44116:
bnei_cont.44117:
bnei_cont.44113:
	nop
	nop
	nop
	j	bgti_cont.44111

bgti_else.44110:
bgti_cont.44111:
	flw	%f0, 158(%zero)
	lw	%v0, 157(%zero)
	nop
	nop

	lw	%a0, 1(%sp)
	flw	%f2, 86(%sp)
	nop
	nop

	flw	%f3, 85(%sp)
	nop
	sub	%v0, %a0, %v0
	nop

	lw	%v0, 11(%sp)
	nop
	itof	%f1, %v0
	nop

	flw	%f1, 168(%zero)
	lw	%v0, 49(%sp)
	fmul	%f0, %f0, %f1
	addi	%v1, %v0, -1

	nop
	nop
	fmul	%f1, %f0, %f1
	nop

	flw	%f2, 169(%zero)
	nop
	fadd	%f1, %f1, %f2
	nop

	nop
	nop
	fmul	%f2, %f0, %f2
	nop

	flw	%f3, 170(%zero)
	nop
	fadd	%f2, %f2, %f3
	nop

	flw	%f3, 84(%sp)
	sw	%ra, 146(%sp)
	fmul	%f0, %f0, %f3
	fmov	%f29, %f2

	nop
	nop
	fadd	%f0, %f0, %f3
	addi	%sp, %sp, 147

	nop
	nop
	fmov	%f2, %f0
	fmov	%f0, %f1

	nop
	nop
	fmov	%f1, %f29
	nop

	nop
	nop
	nop
	jal	pretrace_pixels.3034

	nop
	nop
	addi	%sp, %sp, -147
	nop

	lw	%ra, 146(%sp)
	lw	%v0, 1(%sp)
	nop
	nop

	lw	%v1, 31(%sp)
	lw	%a0, 49(%sp)
	nop
	nop

	lw	%a1, 67(%sp)
	lw	%a2, 6(%sp)
	nop
	nop

	sw	%ra, 146(%sp)
	nop
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 147
	nop

	nop
	nop
	nop
	jal	scan_line.3051

	nop
	nop
	addi	%sp, %sp, -147
	nop

	lw	%ra, 146(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	ret

