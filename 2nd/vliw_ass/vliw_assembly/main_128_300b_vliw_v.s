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
	fblt	%f0, %f1, fbgt_else.33196

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
	fblt	%f0, %f1, fbgt_else.33197

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33198

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33199

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33200

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33201

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33202

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33203

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33204

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33205

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33206

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33207

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33208

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33209

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33210

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33211

	nop
	nop
	fmul	%f1, %f2, %f1
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub1.2614

fbgt_else.33211:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33210:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33209:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33208:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33207:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33206:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33205:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33204:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33203:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33202:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33201:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33200:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33199:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33198:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33197:
	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	jr	%ra

fbgt_else.33196:
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
	fblt	%f0, %f2, fbgt_else.33212

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33213

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
	fblt	%f0, %f2, fbgt_else.33214

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33215

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33216

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33217

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33218

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33219

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33219:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33218:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33217:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33220

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33221

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33221:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33220:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33216:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33215:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33222

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33223

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33224

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33225

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33225:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33224:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33223:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33226

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33227

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33227:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33226:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33222:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33214:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33213:
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
	fblt	%f0, %f2, fbgt_else.33228

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33229

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33230

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33231

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33232

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33233

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33233:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33232:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33231:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33234

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33235

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33235:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33234:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33230:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33229:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33236

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33237

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33238

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33239

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33239:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33238:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33237:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.33240

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.33241

	nop
	nop
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33241:
	nop
	nop
	fdiv	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	j	reduction_2pi_sub2.2617

fbgt_else.33240:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33236:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33228:
	nop
	nop
	nop
	jr	%ra

fbgt_else.33212:
	nop
	nop
	nop
	jr	%ra

print_int_sub1.2629:
	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33242

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33243

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33244

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33245

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33246

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33247

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33248

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33249

	nop
	nop
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1

	nop
	nop
	nop
	j	print_int_sub1.2629

bgti_else.33249:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33248:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33247:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33246:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33245:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33244:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33243:
	nop
	nop
	add	%v0, %zero, %v1
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.33242:
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
	blti	%v0, 10, bgti_else.33250

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33251

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33252

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33253

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33254

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33255

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33256

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33257

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33258

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33259

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33260

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33261

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33262

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33263

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33264

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.33265

	nop
	nop
	addi	%v0, %v0, -10
	nop

	nop
	nop
	nop
	j	print_int_sub2.2632

bgti_else.33265:
	nop
	nop
	nop
	jr	%ra

bgti_else.33264:
	nop
	nop
	nop
	jr	%ra

bgti_else.33263:
	nop
	nop
	nop
	jr	%ra

bgti_else.33262:
	nop
	nop
	nop
	jr	%ra

bgti_else.33261:
	nop
	nop
	nop
	jr	%ra

bgti_else.33260:
	nop
	nop
	nop
	jr	%ra

bgti_else.33259:
	nop
	nop
	nop
	jr	%ra

bgti_else.33258:
	nop
	nop
	nop
	jr	%ra

bgti_else.33257:
	nop
	nop
	nop
	jr	%ra

bgti_else.33256:
	nop
	nop
	nop
	jr	%ra

bgti_else.33255:
	nop
	nop
	nop
	jr	%ra

bgti_else.33254:
	nop
	nop
	nop
	jr	%ra

bgti_else.33253:
	nop
	nop
	nop
	jr	%ra

bgti_else.33252:
	nop
	nop
	nop
	jr	%ra

bgti_else.33251:
	nop
	nop
	nop
	jr	%ra

bgti_else.33250:
	nop
	nop
	nop
	jr	%ra

rotate_quadratic_matrix.2767:
	flw	%f0, 0(%v1)
	flw	%f1, 494(%zero)
	nop
	nop

	flw	%f3, 493(%zero)
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
	fblt	%f2, %f3, fbgt_else.34389

	flw	%f4, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34391

	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34393

	flw	%f4, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34395

	flw	%f4, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34397

	flw	%f4, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34399

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34401

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34403

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34405

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34407

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34409

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34411

	flw	%f4, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.34413

	flw	%f4, 480(%zero)
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
	j	fbgt_cont.34390

fbgt_else.34413:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34414:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34411:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34412:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34409:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34410:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34407:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34408:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34405:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34406:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34403:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34404:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34401:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34402:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34399:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34400:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34397:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34398:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34395:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34396:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34393:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34394:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34391:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.34392:
	nop
	nop
	nop
	j	fbgt_cont.34390

fbgt_else.34389:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.34390:
	flw	%f1, 4(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34415

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34417

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
	j	fbgt_cont.34416

fbgt_else.34417:
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

fbgt_cont.34418:
	nop
	nop
	nop
	j	fbgt_cont.34416

fbgt_else.34415:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34416:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34419

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34420

fbgt_else.34419:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34420:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34421

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34422

fbgt_else.34421:
fbgt_cont.34422:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34423

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34425

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34424

bnei_else.34425:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34426:
	nop
	nop
	nop
	j	fbgt_cont.34424

fbgt_else.34423:
fbgt_cont.34424:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34427

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34428

fbgt_else.34427:
fbgt_cont.34428:
	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34429

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.34430

fbgt_else.34429:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.34430:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34431

	nop
	nop
	nop
	j	bnei_cont.34432

bnei_else.34431:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34432:
	flw	%f4, 470(%zero)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.34433

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34434

fbgt_else.34433:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.34434:
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
	fblt	%f5, %f6, fbgt_else.34435

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34437

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34439

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34441

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34443

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34445

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34447

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34449

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34451

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34453

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34455

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34457

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34459

	flw	%f7, 480(%zero)
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
	j	fbgt_cont.34436

fbgt_else.34459:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34460:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34457:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34458:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34455:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34456:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34453:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34454:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34451:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34452:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34449:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34450:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34447:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34448:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34445:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34446:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34443:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34444:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34441:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34442:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34439:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34440:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34437:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34438:
	nop
	nop
	nop
	j	fbgt_cont.34436

fbgt_else.34435:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34436:
	flw	%f1, 11(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34461

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34463

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
	j	fbgt_cont.34462

fbgt_else.34463:
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

fbgt_cont.34464:
	nop
	nop
	nop
	j	fbgt_cont.34462

fbgt_else.34461:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34462:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34465

	lw	%v0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34467

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34466

bnei_else.34467:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34468:
	nop
	nop
	nop
	j	fbgt_cont.34466

fbgt_else.34465:
	lw	%v0, 10(%sp)
	nop
	nop
	nop

fbgt_cont.34466:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34469

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34470

fbgt_else.34469:
fbgt_cont.34470:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34471

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34472

fbgt_else.34471:
fbgt_cont.34472:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34473

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.34474

fbgt_else.34473:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.34474:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34475

	nop
	nop
	nop
	j	bnei_cont.34476

bnei_else.34475:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34476:
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
	fblt	%f5, %f6, fbgt_else.34477

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34479

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34481

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34483

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34485

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34487

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34489

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34491

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34493

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34495

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34497

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34499

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34501

	flw	%f7, 480(%zero)
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
	j	fbgt_cont.34478

fbgt_else.34501:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34502:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34499:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34500:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34497:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34498:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34495:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34496:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34493:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34494:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34491:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34492:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34489:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34490:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34487:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34488:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34485:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34486:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34483:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34484:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34481:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34482:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34479:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34480:
	nop
	nop
	nop
	j	fbgt_cont.34478

fbgt_else.34477:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34478:
	flw	%f1, 14(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34503

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34505

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
	j	fbgt_cont.34504

fbgt_else.34505:
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

fbgt_cont.34506:
	nop
	nop
	nop
	j	fbgt_cont.34504

fbgt_else.34503:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34504:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34507

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34508

fbgt_else.34507:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34508:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34509

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34510

fbgt_else.34509:
fbgt_cont.34510:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34511

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34513

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34512

bnei_else.34513:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34514:
	nop
	nop
	nop
	j	fbgt_cont.34512

fbgt_else.34511:
fbgt_cont.34512:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34515

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34516

fbgt_else.34515:
fbgt_cont.34516:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34517

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.34518

fbgt_else.34517:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.34518:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34519

	nop
	nop
	nop
	j	bnei_cont.34520

bnei_else.34519:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34520:
	flw	%f4, 13(%sp)
	flw	%f5, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.34521

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34522

fbgt_else.34521:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.34522:
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
	fblt	%f4, %f6, fbgt_else.34523

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34525

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34527

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34529

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34531

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34533

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34535

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34537

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34539

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34541

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34543

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34545

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.34547

	flw	%f7, 480(%zero)
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
	j	fbgt_cont.34524

fbgt_else.34547:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34548:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34545:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34546:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34543:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34544:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34541:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34542:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34539:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34540:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34537:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34538:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34535:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34536:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34533:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34534:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34531:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34532:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34529:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34530:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34527:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34528:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34525:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34526:
	nop
	nop
	nop
	j	fbgt_cont.34524

fbgt_else.34523:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34524:
	flw	%f1, 17(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34549

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34551

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
	j	fbgt_cont.34550

fbgt_else.34551:
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

fbgt_cont.34552:
	nop
	nop
	nop
	j	fbgt_cont.34550

fbgt_else.34549:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34550:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34553

	lw	%v0, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34555

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34554

bnei_else.34555:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34556:
	nop
	nop
	nop
	j	fbgt_cont.34554

fbgt_else.34553:
	lw	%v0, 16(%sp)
	nop
	nop
	nop

fbgt_cont.34554:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34557

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34558

fbgt_else.34557:
fbgt_cont.34558:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34559

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34560

fbgt_else.34559:
fbgt_cont.34560:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34561

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.34562

fbgt_else.34561:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.34562:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34563

	nop
	nop
	nop
	j	bnei_cont.34564

bnei_else.34563:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34564:
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
	fblt	%f5, %f6, fbgt_else.34565

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34567

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34569

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34571

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34573

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34575

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34577

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34579

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34581

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34583

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34585

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34587

	flw	%f7, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.34589

	flw	%f7, 480(%zero)
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
	j	fbgt_cont.34566

fbgt_else.34589:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34590:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34587:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34588:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34585:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34586:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34583:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34584:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34581:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34582:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34579:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34580:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34577:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34578:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34575:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34576:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34573:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34574:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34571:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34572:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34569:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34570:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34567:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.34568:
	nop
	nop
	nop
	j	fbgt_cont.34566

fbgt_else.34565:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34566:
	flw	%f1, 20(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34591

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34593

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
	j	fbgt_cont.34592

fbgt_else.34593:
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

fbgt_cont.34594:
	nop
	nop
	nop
	j	fbgt_cont.34592

fbgt_else.34591:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34592:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34595

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34596

fbgt_else.34595:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.34596:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34597

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34598

fbgt_else.34597:
fbgt_cont.34598:
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34599

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34601

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34600

bnei_else.34601:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34602:
	nop
	nop
	nop
	j	fbgt_cont.34600

fbgt_else.34599:
fbgt_cont.34600:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34603

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34604

fbgt_else.34603:
fbgt_cont.34604:
	flw	%f3, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.34605

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.34606

fbgt_else.34605:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.34606:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34607

	nop
	nop
	nop
	j	bnei_cont.34608

bnei_else.34607:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34608:
	flw	%f4, 19(%sp)
	flw	%f5, 7(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.34609

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.34610

fbgt_else.34609:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.34610:
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
	fblt	%f4, %f5, fbgt_else.34611

	flw	%f6, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34613

	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34615

	flw	%f6, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34617

	flw	%f6, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34619

	flw	%f6, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34621

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34623

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34625

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34627

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34629

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34631

	flw	%f6, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34633

	flw	%f6, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.34635

	flw	%f6, 480(%zero)
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
	j	fbgt_cont.34612

fbgt_else.34635:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34636:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34633:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34634:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34631:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34632:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34629:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34630:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34627:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34628:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34625:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34626:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34623:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34624:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34621:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34622:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34619:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34620:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34617:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34618:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34615:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34616:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34613:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.34614:
	nop
	nop
	nop
	j	fbgt_cont.34612

fbgt_else.34611:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.34612:
	flw	%f1, 23(%sp)
	flw	%f2, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.34637

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34639

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
	j	fbgt_cont.34638

fbgt_else.34639:
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

fbgt_cont.34640:
	nop
	nop
	nop
	j	fbgt_cont.34638

fbgt_else.34637:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.34638:
	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.34641

	lw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34643

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34642

bnei_else.34643:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.34644:
	nop
	nop
	nop
	j	fbgt_cont.34642

fbgt_else.34641:
	lw	%v0, 22(%sp)
	nop
	nop
	nop

fbgt_cont.34642:
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
	flw	%f2, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.34647

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.34648

fbgt_else.34647:
fbgt_cont.34648:
	flw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.34649

	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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
	j	fbgt_cont.34650

fbgt_else.34649:
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
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

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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

fbgt_cont.34650:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.34651

	nop
	nop
	nop
	j	bnei_cont.34652

bnei_else.34651:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.34652:
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
	beqi	%v0, -1, bnei_else.35698

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

	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.35699

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35700

fbgt_else.35699:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35700:
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
	beqi	%v1, 0, bnei_else.35701

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

	flw	%f1, 469(%zero)
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
	j	bnei_cont.35702

bnei_else.35701:
bnei_cont.35702:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.35703

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35704

bnei_else.35703:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.35704:
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
	beqi	%a2, 3, bnei_else.35705

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.35707

	nop
	nop
	nop
	j	bnei_cont.35706

bnei_else.35707:
	lw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35709

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.35710

bnei_else.35709:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.35710:
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
	fbne	%f1, %f4, fbeq_else.35711

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35712

fbeq_else.35711:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.35712:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.35713

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35714

bnei_else.35713:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35715

	flw	%f5, 468(%zero)
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
	j	bnei_cont.35716

bnei_else.35715:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.35716:
bnei_cont.35714:
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

bnei_cont.35708:
	nop
	nop
	nop
	j	bnei_cont.35706

bnei_else.35705:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.35717

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35718

fbeq_else.35717:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35718:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35719

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35720

bnei_else.35719:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.35721

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35722

fbeq_else.35721:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35722:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35723

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35724

bnei_else.35723:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35725

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35726

fbgt_else.35725:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35726:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35727

	flw	%f2, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35728

bnei_else.35727:
	flw	%f2, 468(%zero)
	nop
	nop
	nop

bnei_cont.35728:
bnei_cont.35724:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.35720:
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
	fbne	%f0, %f1, fbeq_else.35729

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35730

fbeq_else.35729:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35730:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35731

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35732

bnei_else.35731:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.35733

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35734

fbeq_else.35733:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35734:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35735

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35736

bnei_else.35735:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35737

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35738

fbgt_else.35737:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35738:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35739

	flw	%f2, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35740

bnei_else.35739:
	flw	%f2, 468(%zero)
	nop
	nop
	nop

bnei_cont.35740:
bnei_cont.35736:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.35732:
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
	fbne	%f0, %f1, fbeq_else.35741

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35742

fbeq_else.35741:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35742:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35743

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35744

bnei_else.35743:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.35745

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.35746

fbeq_else.35745:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.35746:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35747

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.35748

bnei_else.35747:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35749

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35750

fbgt_else.35749:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.35750:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.35751

	flw	%f2, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.35752

bnei_else.35751:
	flw	%f2, 468(%zero)
	nop
	nop
	nop

bnei_cont.35752:
bnei_cont.35748:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.35744:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.35706:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.35753

	flw	%f0, 0(%v0)
	flw	%f1, 494(%zero)
	nop
	nop

	flw	%f3, 493(%zero)
	fsw	%f0, 16(%sp)
	fabs	%f2, %f0
	nop

	fsw	%f1, 17(%sp)
	nop
	nop
	nop

	fsw	%f3, 18(%sp)
	nop
	nop
	nop

	fsw	%f2, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.35755

	flw	%f4, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35757

	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35759

	flw	%f4, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35761

	flw	%f4, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35763

	flw	%f4, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35765

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35767

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35769

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35771

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35773

	flw	%f4, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35775

	flw	%f4, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.35777

	flw	%f4, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35777:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35778:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35775:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35776:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35773:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35774:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35771:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35772:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35769:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35770:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35767:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35768:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35765:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35766:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35763:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35764:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35761:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35762:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35759:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35760:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35757:
	nop
	nop
	fmov	%f1, %f4
	nop

fbgt_cont.35758:
	nop
	nop
	nop
	j	fbgt_cont.35756

fbgt_else.35755:
	nop
	nop
	fmov	%f1, %f3
	nop

fbgt_cont.35756:
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
	fblt	%f0, %f1, fbgt_else.35779

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35780

fbgt_else.35779:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35780:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35781

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35782

fbgt_else.35781:
fbgt_cont.35782:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35783

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35785

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35784

bnei_else.35785:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35786:
	nop
	nop
	nop
	j	fbgt_cont.35784

fbgt_else.35783:
fbgt_cont.35784:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35787

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35788

fbgt_else.35787:
fbgt_cont.35788:
	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.35789

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.35790

fbgt_else.35789:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.35790:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35791

	nop
	nop
	nop
	j	bnei_cont.35792

bnei_else.35791:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35792:
	flw	%f4, 16(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.35793

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35794

fbgt_else.35793:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.35794:
	flw	%f6, 18(%sp)
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
	fblt	%f4, %f6, fbgt_else.35795

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35797

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35799

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35801

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35803

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35805

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35807

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35809

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35811

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35813

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35815

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35817

	flw	%f7, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35817:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35818:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35815:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35816:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35813:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35814:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35811:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35812:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35809:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35810:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35807:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35808:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35805:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35806:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35803:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35804:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35801:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35802:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35799:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35800:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35797:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35798:
	nop
	nop
	nop
	j	fbgt_cont.35796

fbgt_else.35795:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35796:
	flw	%f0, 24(%sp)
	flw	%f2, 18(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35819

	lw	%v0, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35821

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35820

bnei_else.35821:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35822:
	nop
	nop
	nop
	j	fbgt_cont.35820

fbgt_else.35819:
	lw	%v0, 23(%sp)
	nop
	nop
	nop

fbgt_cont.35820:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35823

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35824

fbgt_else.35823:
fbgt_cont.35824:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35825

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35826

fbgt_else.35825:
fbgt_cont.35826:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.35827

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.35828

fbgt_else.35827:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.35828:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35829

	nop
	nop
	nop
	j	bnei_cont.35830

bnei_else.35829:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35830:
	lw	%v0, 13(%sp)
	flw	%f6, 18(%sp)
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
	fblt	%f5, %f6, fbgt_else.35831

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35833

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35835

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35837

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35839

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35841

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35843

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35845

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35847

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35849

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35851

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35853

	flw	%f7, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35853:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35854:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35851:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35852:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35849:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35850:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35847:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35848:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35845:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35846:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35843:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35844:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35841:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35842:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35839:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35840:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35837:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35838:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35835:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35836:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35833:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35834:
	nop
	nop
	nop
	j	fbgt_cont.35832

fbgt_else.35831:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35832:
	flw	%f0, 27(%sp)
	flw	%f2, 18(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35855

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35856

fbgt_else.35855:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35856:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35857

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35858

fbgt_else.35857:
fbgt_cont.35858:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35859

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35861

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35860

bnei_else.35861:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35862:
	nop
	nop
	nop
	j	fbgt_cont.35860

fbgt_else.35859:
fbgt_cont.35860:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35863

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35864

fbgt_else.35863:
fbgt_cont.35864:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.35865

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.35866

fbgt_else.35865:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.35866:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35867

	nop
	nop
	nop
	j	bnei_cont.35868

bnei_else.35867:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35868:
	flw	%f4, 26(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.35869

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35870

fbgt_else.35869:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.35870:
	flw	%f6, 18(%sp)
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
	fblt	%f4, %f6, fbgt_else.35871

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35873

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35875

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35877

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35879

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35881

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35883

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35885

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35887

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35889

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35891

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.35893

	flw	%f7, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35893:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35894:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35891:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35892:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35889:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35890:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35887:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35888:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35885:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35886:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35883:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35884:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35881:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35882:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35879:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35880:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35877:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35878:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35875:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35876:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35873:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35874:
	nop
	nop
	nop
	j	fbgt_cont.35872

fbgt_else.35871:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35872:
	flw	%f0, 30(%sp)
	flw	%f2, 18(%sp)
	nop
	nop

	sw	%ra, 31(%sp)
	nop
	nop
	nop

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
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35895

	lw	%v0, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35897

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35896

bnei_else.35897:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35898:
	nop
	nop
	nop
	j	fbgt_cont.35896

fbgt_else.35895:
	lw	%v0, 29(%sp)
	nop
	nop
	nop

fbgt_cont.35896:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35899

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35900

fbgt_else.35899:
fbgt_cont.35900:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35901

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35902

fbgt_else.35901:
fbgt_cont.35902:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.35903

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.35904

fbgt_else.35903:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.35904:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35905

	nop
	nop
	nop
	j	bnei_cont.35906

bnei_else.35905:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35906:
	lw	%v0, 13(%sp)
	flw	%f6, 18(%sp)
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
	fblt	%f5, %f6, fbgt_else.35907

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35909

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35911

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35913

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35915

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35917

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35919

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35921

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35923

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35925

	flw	%f7, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35927

	flw	%f7, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f7, fbgt_else.35929

	flw	%f7, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 34(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35929:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35930:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35927:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35928:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35925:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35926:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35923:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35924:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35921:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35922:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35919:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35920:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35917:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35918:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35915:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35916:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35913:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35914:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35911:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35912:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35909:
	nop
	nop
	fmov	%f1, %f7
	nop

fbgt_cont.35910:
	nop
	nop
	nop
	j	fbgt_cont.35908

fbgt_else.35907:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35908:
	flw	%f0, 33(%sp)
	flw	%f2, 18(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -35
	nop

	lw	%ra, 34(%sp)
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35931

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35932

fbgt_else.35931:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.35932:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35933

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35934

fbgt_else.35933:
fbgt_cont.35934:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35935

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35937

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35936

bnei_else.35937:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35938:
	nop
	nop
	nop
	j	fbgt_cont.35936

fbgt_else.35935:
fbgt_cont.35936:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35939

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35940

fbgt_else.35939:
fbgt_cont.35940:
	flw	%f3, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.35941

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.35942

fbgt_else.35941:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.35942:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35943

	nop
	nop
	nop
	j	bnei_cont.35944

bnei_else.35943:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35944:
	flw	%f4, 32(%sp)
	flw	%f5, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.35945

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35946

fbgt_else.35945:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.35946:
	flw	%f5, 18(%sp)
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
	fblt	%f4, %f5, fbgt_else.35947

	flw	%f6, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35949

	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35951

	flw	%f6, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35953

	flw	%f6, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35955

	flw	%f6, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35957

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35959

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35961

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35963

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35965

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35967

	flw	%f6, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.35969

	flw	%f6, 481(%zero)
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
	fmov	%f1, %f0

	lw	%ra, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35969:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35970:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35967:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35968:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35965:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35966:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35963:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35964:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35961:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35962:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35959:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35960:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35957:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35958:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35955:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35956:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35953:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35954:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35951:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35952:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35949:
	nop
	nop
	fmov	%f1, %f6
	nop

fbgt_cont.35950:
	nop
	nop
	nop
	j	fbgt_cont.35948

fbgt_else.35947:
	nop
	nop
	fmov	%f1, %f5
	nop

fbgt_cont.35948:
	flw	%f0, 36(%sp)
	flw	%f2, 18(%sp)
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
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -38
	nop

	lw	%ra, 37(%sp)
	flw	%f1, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35971

	lw	%v0, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35973

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35972

bnei_else.35973:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.35974:
	nop
	nop
	nop
	j	fbgt_cont.35972

fbgt_else.35971:
	lw	%v0, 35(%sp)
	nop
	nop
	nop

fbgt_cont.35972:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.35975

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.35976

fbgt_else.35975:
fbgt_cont.35976:
	flw	%f2, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.35977

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.35978

fbgt_else.35977:
fbgt_cont.35978:
	flw	%f1, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.35979

	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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
	j	fbgt_cont.35980

fbgt_else.35979:
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
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

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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

fbgt_cont.35980:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.35981

	nop
	nop
	nop
	j	bnei_cont.35982

bnei_else.35981:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.35982:
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
	flw	%f12, 495(%zero)
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
	j	bnei_cont.35754

bnei_else.35753:
bnei_cont.35754:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.35698:
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
	blti	%v0, 60, bgti_else.36033

	nop
	nop
	nop
	jr	%ra

bgti_else.36033:
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
	beqi	%v0, -1, bnei_else.36035

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

	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.36037

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36038

fbgt_else.36037:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.36038:
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
	beqi	%v1, 0, bnei_else.36039

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

	flw	%f1, 469(%zero)
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
	j	bnei_cont.36040

bnei_else.36039:
bnei_cont.36040:
	lw	%v1, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.36041

	lw	%a0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36042

bnei_else.36041:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36042:
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
	beqi	%a2, 3, bnei_else.36043

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.36045

	nop
	nop
	nop
	j	bnei_cont.36044

bnei_else.36045:
	lw	%v1, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36047

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36048

bnei_else.36047:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bnei_cont.36048:
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
	fbne	%f1, %f4, fbeq_else.36049

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36050

fbeq_else.36049:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.36050:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36051

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36052

bnei_else.36051:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36053

	flw	%f4, 468(%zero)
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
	j	bnei_cont.36054

bnei_else.36053:
	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

bnei_cont.36054:
bnei_cont.36052:
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

bnei_cont.36046:
	nop
	nop
	nop
	j	bnei_cont.36044

bnei_else.36043:
	flw	%f0, 0(%a0)
	flw	%f1, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36055

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36056

fbeq_else.36055:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36056:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36057

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.36058

bnei_else.36057:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36059

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36060

fbeq_else.36059:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36060:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36061

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.36062

bnei_else.36061:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36063

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36064

fbgt_else.36063:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36064:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36065

	flw	%f2, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36066

bnei_else.36065:
	flw	%f2, 468(%zero)
	nop
	nop
	nop

bnei_cont.36066:
bnei_cont.36062:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.36058:
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
	fbne	%f0, %f1, fbeq_else.36067

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36068

fbeq_else.36067:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36068:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36069

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.36070

bnei_else.36069:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36071

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36072

fbeq_else.36071:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36072:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36073

	nop
	nop
	fmov	%f2, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.36074

bnei_else.36073:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36075

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36076

fbgt_else.36075:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36076:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36077

	flw	%f2, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36078

bnei_else.36077:
	flw	%f2, 468(%zero)
	nop
	nop
	nop

bnei_cont.36078:
bnei_cont.36074:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f2, %f0
	nop

bnei_cont.36070:
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
	fbne	%f0, %f1, fbeq_else.36079

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36080

fbeq_else.36079:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36080:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36081

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.36082

bnei_else.36081:
	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36083

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36084

fbeq_else.36083:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36084:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36085

	nop
	nop
	nop
	j	bnei_cont.36086

bnei_else.36085:
	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.36087

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36088

fbgt_else.36087:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36088:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36089

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36090

bnei_else.36089:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.36090:
bnei_cont.36086:
	nop
	nop
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fdiv	%f0, %f1, %f0
	nop

bnei_cont.36082:
	fsw	%f0, 2(%a0)
	nop
	nop
	nop

bnei_cont.36044:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36091

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
	j	bnei_cont.36092

bnei_else.36091:
bnei_cont.36092:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36036

bnei_else.36035:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36036:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36093

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
	blti	%v0, 60, bgti_else.36094

	nop
	nop
	nop
	jr	%ra

bgti_else.36094:
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
	jal	read_nth_object.2770

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
	beqi	%v0, 0, bnei_else.36096

	lw	%v0, 16(%sp)
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

bnei_else.36096:
	lw	%v0, 16(%sp)
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

bnei_else.36093:
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
	beqi	%v0, -1, bnei_else.36112

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
	beqi	%v0, -1, bnei_else.36113

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
	beqi	%v0, -1, bnei_else.36115

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
	beqi	%v0, -1, bnei_else.36117

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
	j	bnei_cont.36118

bnei_else.36117:
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

bnei_cont.36118:
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
	j	bnei_cont.36116

bnei_else.36115:
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

bnei_cont.36116:
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
	j	bnei_cont.36114

bnei_else.36113:
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

bnei_cont.36114:
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

bnei_else.36112:
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
	beqi	%v0, -1, bnei_else.36136

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
	beqi	%v0, -1, bnei_else.36138

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
	beqi	%v0, -1, bnei_else.36140

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
	j	bnei_cont.36141

bnei_else.36140:
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

bnei_cont.36141:
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
	j	bnei_cont.36139

bnei_else.36138:
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

bnei_cont.36139:
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
	j	bnei_cont.36137

bnei_else.36136:
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

bnei_cont.36137:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.36142

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
	beqi	%v0, -1, bnei_else.36143

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
	beqi	%v0, -1, bnei_else.36145

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
	j	bnei_cont.36146

bnei_else.36145:
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

bnei_cont.36146:
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
	j	bnei_cont.36144

bnei_else.36143:
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

bnei_cont.36144:
	lw	%v0, 0(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, -1, bnei_else.36147

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
	j	bnei_cont.36148

bnei_else.36147:
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

bnei_cont.36148:
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

bnei_else.36142:
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
	beqi	%v0, -1, bnei_else.36170

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
	beqi	%v0, -1, bnei_else.36172

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
	beqi	%v0, -1, bnei_else.36174

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
	j	bnei_cont.36175

bnei_else.36174:
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

bnei_cont.36175:
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
	j	bnei_cont.36173

bnei_else.36172:
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

bnei_cont.36173:
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
	j	bnei_cont.36171

bnei_else.36170:
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

bnei_cont.36171:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.36176

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
	beqi	%v0, -1, bnei_else.36177

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
	beqi	%v0, -1, bnei_else.36179

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
	j	bnei_cont.36180

bnei_else.36179:
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

bnei_cont.36180:
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
	j	bnei_cont.36178

bnei_else.36177:
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

bnei_cont.36178:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.36181

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
	beqi	%v0, -1, bnei_else.36182

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
	j	bnei_cont.36183

bnei_else.36182:
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

bnei_cont.36183:
	lw	%v1, 0(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, -1, bnei_else.36184

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
	beqi	%v1, -1, bnei_else.36185

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

bnei_else.36185:
	nop
	nop
	nop
	jr	%ra

bnei_else.36184:
	nop
	nop
	nop
	jr	%ra

bnei_else.36181:
	nop
	nop
	nop
	jr	%ra

bnei_else.36176:
	nop
	nop
	nop
	jr	%ra

iter_setup_dirvec_constants.2877:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.36231

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
	beqi	%a3, 1, bnei_else.36232

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.36234

	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36236

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
	j	bnei_cont.36237

bnei_else.36236:
bnei_cont.36237:
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
	beqi	%a0, 0, bnei_else.36238

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

	flw	%f10, 473(%zero)
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
	j	bnei_cont.36239

bnei_else.36238:
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

bnei_cont.36239:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.36240

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36241

fbeq_else.36240:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36241:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36242

	nop
	nop
	nop
	j	bnei_cont.36243

bnei_else.36242:
	flw	%f0, 474(%zero)
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

bnei_cont.36243:
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
	j	bnei_cont.36233

bnei_else.36234:
	flw	%f0, 470(%zero)
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
	fblt	%f2, %f0, fbgt_else.36244

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36245

fbgt_else.36244:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36245:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36246

	flw	%f2, 468(%zero)
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
	j	bnei_cont.36247

bnei_else.36246:
	fsw	%f2, 0(%v0)
	nop
	nop
	nop

bnei_cont.36247:
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

bnei_cont.36235:
	nop
	nop
	nop
	j	bnei_cont.36233

bnei_else.36232:
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36248

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36249

fbeq_else.36248:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36249:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36250

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36251

bnei_else.36250:
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
	fblt	%f0, %f1, fbgt_else.36252

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36253

fbgt_else.36252:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36253:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36254

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36256

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36255

bnei_else.36256:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36257:
	nop
	nop
	nop
	j	bnei_cont.36255

bnei_else.36254:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36255:
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
	beqi	%a1, 0, bnei_else.36258

	nop
	nop
	nop
	j	bnei_cont.36259

bnei_else.36258:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36259:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36251:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36260

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36261

fbeq_else.36260:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36261:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36262

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36263

bnei_else.36262:
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
	fblt	%f0, %f1, fbgt_else.36264

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36265

fbgt_else.36264:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36265:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36266

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36268

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36267

bnei_else.36268:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36269:
	nop
	nop
	nop
	j	bnei_cont.36267

bnei_else.36266:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36267:
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
	beqi	%a1, 0, bnei_else.36270

	nop
	nop
	nop
	j	bnei_cont.36271

bnei_else.36270:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36271:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36263:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36272

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36273

fbeq_else.36272:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36273:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36274

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36275

bnei_else.36274:
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
	fblt	%f0, %f1, fbgt_else.36276

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36277

fbgt_else.36276:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36277:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36278

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36280

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36279

bnei_else.36280:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36281:
	nop
	nop
	nop
	j	bnei_cont.36279

bnei_else.36278:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36279:
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
	beqi	%a0, 0, bnei_else.36282

	nop
	nop
	nop
	j	bnei_cont.36283

bnei_else.36282:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.36283:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
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

bnei_cont.36275:
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

bnei_cont.36233:
	nop
	nop
	addi	%v0, %v1, -1
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.36284

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
	beqi	%a3, 1, bnei_else.36285

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.36287

	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36289

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
	j	bnei_cont.36290

bnei_else.36289:
bnei_cont.36290:
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
	beqi	%a0, 0, bnei_else.36291

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

	flw	%f8, 473(%zero)
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
	j	bnei_cont.36292

bnei_else.36291:
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

bnei_cont.36292:
	flw	%f0, 10(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.36293

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36294

fbeq_else.36293:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36294:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36295

	nop
	nop
	nop
	j	bnei_cont.36296

bnei_else.36295:
	flw	%f0, 474(%zero)
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

bnei_cont.36296:
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
	j	bnei_cont.36286

bnei_else.36287:
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.36297

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36298

fbgt_else.36297:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36298:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36299

	flw	%f1, 468(%zero)
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
	j	bnei_cont.36300

bnei_else.36299:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.36300:
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

bnei_cont.36288:
	nop
	nop
	nop
	j	bnei_cont.36286

bnei_else.36285:
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36301

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36302

fbeq_else.36301:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36302:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36303

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36304

bnei_else.36303:
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
	fblt	%f0, %f1, fbgt_else.36305

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36306

fbgt_else.36305:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36306:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36307

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36309

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36308

bnei_else.36309:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36310:
	nop
	nop
	nop
	j	bnei_cont.36308

bnei_else.36307:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36308:
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
	beqi	%a1, 0, bnei_else.36311

	nop
	nop
	nop
	j	bnei_cont.36312

bnei_else.36311:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36312:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36304:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36313

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36314

fbeq_else.36313:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36314:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36315

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36316

bnei_else.36315:
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
	fblt	%f0, %f1, fbgt_else.36317

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36318

fbgt_else.36317:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36318:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36319

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36321

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36320

bnei_else.36321:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36322:
	nop
	nop
	nop
	j	bnei_cont.36320

bnei_else.36319:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36320:
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
	beqi	%a1, 0, bnei_else.36323

	nop
	nop
	nop
	j	bnei_cont.36324

bnei_else.36323:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36324:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36316:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36325

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36326

fbeq_else.36325:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36326:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36327

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36328

bnei_else.36327:
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
	fblt	%f0, %f1, fbgt_else.36329

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36330

fbgt_else.36329:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36330:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36331

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36333

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36332

bnei_else.36333:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36334:
	nop
	nop
	nop
	j	bnei_cont.36332

bnei_else.36331:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36332:
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
	beqi	%a0, 0, bnei_else.36335

	nop
	nop
	nop
	j	bnei_cont.36336

bnei_else.36335:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.36336:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
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

bnei_cont.36328:
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

bnei_cont.36286:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.36284:
	nop
	nop
	nop
	jr	%ra

bgti_else.36231:
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
	blti	%v1, 0, bgti_else.36360

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
	beqi	%a3, 1, bnei_else.36361

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.36363

	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.36365

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
	j	bnei_cont.36366

bnei_else.36365:
bnei_cont.36366:
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
	beqi	%a0, 0, bnei_else.36367

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

	flw	%f8, 473(%zero)
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
	j	bnei_cont.36368

bnei_else.36367:
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

bnei_cont.36368:
	flw	%f0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.36369

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36370

fbeq_else.36369:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36370:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36371

	nop
	nop
	nop
	j	bnei_cont.36372

bnei_else.36371:
	flw	%f0, 474(%zero)
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

bnei_cont.36372:
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
	j	bnei_cont.36362

bnei_else.36363:
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.36373

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36374

fbgt_else.36373:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.36374:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36375

	flw	%f1, 468(%zero)
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
	j	bnei_cont.36376

bnei_else.36375:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.36376:
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

bnei_cont.36364:
	nop
	nop
	nop
	j	bnei_cont.36362

bnei_else.36361:
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.36377

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36378

fbeq_else.36377:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36378:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36379

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36380

bnei_else.36379:
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
	fblt	%f0, %f1, fbgt_else.36381

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36382

fbgt_else.36381:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36382:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36383

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36385

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36384

bnei_else.36385:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36386:
	nop
	nop
	nop
	j	bnei_cont.36384

bnei_else.36383:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36384:
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
	beqi	%a1, 0, bnei_else.36387

	nop
	nop
	nop
	j	bnei_cont.36388

bnei_else.36387:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36388:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36380:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36389

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36390

fbeq_else.36389:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36390:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36391

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36392

bnei_else.36391:
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
	fblt	%f0, %f1, fbgt_else.36393

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36394

fbgt_else.36393:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36394:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36395

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36397

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36396

bnei_else.36397:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.36398:
	nop
	nop
	nop
	j	bnei_cont.36396

bnei_else.36395:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.36396:
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
	beqi	%a1, 0, bnei_else.36399

	nop
	nop
	nop
	j	bnei_cont.36400

bnei_else.36399:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.36400:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.36392:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.36401

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36402

fbeq_else.36401:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.36402:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.36403

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36404

bnei_else.36403:
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
	fblt	%f0, %f1, fbgt_else.36405

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36406

fbgt_else.36405:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36406:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36407

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36409

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36408

bnei_else.36409:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36410:
	nop
	nop
	nop
	j	bnei_cont.36408

bnei_else.36407:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36408:
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
	beqi	%a0, 0, bnei_else.36411

	nop
	nop
	nop
	j	bnei_cont.36412

bnei_else.36411:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.36412:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
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

bnei_cont.36404:
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

bnei_cont.36362:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	iter_setup_dirvec_constants.2877

bgti_else.36360:
	nop
	nop
	nop
	jr	%ra

setup_startp_constants.2882:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.36415

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
	beqi	%a2, 2, bnei_else.36416

	nop
	nop
	addi	%at, %zero, 2
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.36418

	nop
	nop
	nop
	j	bnei_cont.36417

bgt_else.36418:
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
	beqi	%a3, 0, bnei_else.36420

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
	j	bnei_cont.36421

bnei_else.36420:
	nop
	nop
	fmov	%f0, %f3
	nop

bnei_cont.36421:
	nop
	nop
	nop
	beqi	%a2, 3, bnei_else.36422

	nop
	nop
	nop
	j	bnei_cont.36423

bnei_else.36422:
	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.36423:
	fsw	%f0, 3(%a1)
	nop
	nop
	nop

bgt_cont.36419:
	nop
	nop
	nop
	j	bnei_cont.36417

bnei_else.36416:
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

bnei_cont.36417:
	nop
	nop
	addi	%v1, %v1, -1
	nop

	nop
	nop
	nop
	j	setup_startp_constants.2882

bgti_else.36415:
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
	beqi	%a0, -1, bnei_else.36425

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
	beqi	%a1, 1, bnei_else.36426

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36428

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
	beqi	%a1, 0, bnei_else.36430

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
	j	bnei_cont.36431

bnei_else.36430:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.36431:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.36432

	nop
	nop
	nop
	j	bnei_cont.36433

bnei_else.36432:
	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.36433:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36434

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36435

fbgt_else.36434:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36435:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36436

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36438

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36437

bnei_else.36438:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36439:
	nop
	nop
	nop
	j	bnei_cont.36437

bnei_else.36436:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36437:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36440

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36427

bnei_else.36440:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36441:
	nop
	nop
	nop
	j	bnei_cont.36427

bnei_else.36428:
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

	flw	%f4, 470(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36442

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36443

fbgt_else.36442:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36443:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36444

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36446

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36445

bnei_else.36446:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36447:
	nop
	nop
	nop
	j	bnei_cont.36445

bnei_else.36444:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36445:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36448

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36449

bnei_else.36448:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36449:
bnei_cont.36429:
	nop
	nop
	nop
	j	bnei_cont.36427

bnei_else.36426:
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
	fblt	%f3, %f6, fbgt_else.36450

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36451

fbgt_else.36450:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36451:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36452

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
	fblt	%f3, %f4, fbgt_else.36454

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36455

fbgt_else.36454:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36455:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36456

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
	fblt	%f3, %f4, fbgt_else.36458

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36453

fbgt_else.36458:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36459:
	nop
	nop
	nop
	j	bnei_cont.36453

bnei_else.36456:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36457:
	nop
	nop
	nop
	j	bnei_cont.36453

bnei_else.36452:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36453:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36460

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36461

bnei_else.36460:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36462

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36463

bnei_else.36462:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36463:
bnei_cont.36461:
bnei_cont.36427:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36464

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36464:
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
	beqi	%a0, -1, bnei_else.36465

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
	beqi	%a1, 1, bnei_else.36466

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36468

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
	beqi	%a1, 0, bnei_else.36470

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
	j	bnei_cont.36471

bnei_else.36470:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.36471:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.36472

	nop
	nop
	nop
	j	bnei_cont.36473

bnei_else.36472:
	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.36473:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36474

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36475

fbgt_else.36474:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36475:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36476

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36478

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36477

bnei_else.36478:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36479:
	nop
	nop
	nop
	j	bnei_cont.36477

bnei_else.36476:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36477:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36480

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36467

bnei_else.36480:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36481:
	nop
	nop
	nop
	j	bnei_cont.36467

bnei_else.36468:
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

	flw	%f4, 470(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36482

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36483

fbgt_else.36482:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36483:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36484

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36486

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36485

bnei_else.36486:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36487:
	nop
	nop
	nop
	j	bnei_cont.36485

bnei_else.36484:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36485:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36488

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36489

bnei_else.36488:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36489:
bnei_cont.36469:
	nop
	nop
	nop
	j	bnei_cont.36467

bnei_else.36466:
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
	fblt	%f3, %f6, fbgt_else.36490

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36491

fbgt_else.36490:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36491:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36492

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
	fblt	%f3, %f4, fbgt_else.36494

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36495

fbgt_else.36494:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36495:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36496

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
	fblt	%f3, %f4, fbgt_else.36498

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36493

fbgt_else.36498:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36499:
	nop
	nop
	nop
	j	bnei_cont.36493

bnei_else.36496:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36497:
	nop
	nop
	nop
	j	bnei_cont.36493

bnei_else.36492:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36493:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36500

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36501

bnei_else.36500:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36502

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36503

bnei_else.36502:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36503:
bnei_cont.36501:
bnei_cont.36467:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36504

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36504:
	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	check_all_inside.2907

bnei_else.36465:
	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36425:
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
	beqi	%a0, -1, bnei_else.36511

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
	beqi	%a3, 1, bnei_else.36512

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.36514

	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.36516

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36517

fbeq_else.36516:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.36517:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36518

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36513

bnei_else.36518:
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
	beqi	%a3, 0, bnei_else.36520

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
	j	bnei_cont.36521

bnei_else.36520:
	nop
	nop
	fmov	%f1, %f9
	nop

bnei_cont.36521:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.36522

	nop
	nop
	nop
	j	bnei_cont.36523

bnei_else.36522:
	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f3
	nop

bnei_cont.36523:
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
	fblt	%f7, %f1, fbgt_else.36524

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36525

fbgt_else.36524:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36525:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36526

	lw	%a3, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36528

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
	j	bnei_cont.36529

bnei_else.36528:
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

bnei_cont.36529:
	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36527

bnei_else.36526:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36527:
bnei_cont.36519:
	nop
	nop
	nop
	j	bnei_cont.36513

bnei_else.36514:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.36530

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36531

fbgt_else.36530:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36531:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36532

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
	j	bnei_cont.36533

bnei_else.36532:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36533:
bnei_cont.36515:
	nop
	nop
	nop
	j	bnei_cont.36513

bnei_else.36512:
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
	fblt	%f9, %f10, fbgt_else.36534

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36535

fbgt_else.36534:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36535:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36536

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
	fblt	%f9, %f10, fbgt_else.36538

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36539

fbgt_else.36538:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36539:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36540

	flw	%f9, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f9, fbeq_else.36542

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36543

fbeq_else.36542:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.36543:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36544

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36537

bnei_else.36544:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.36545:
	nop
	nop
	nop
	j	bnei_cont.36537

bnei_else.36540:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.36541:
	nop
	nop
	nop
	j	bnei_cont.36537

bnei_else.36536:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.36537:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36546

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
	j	bnei_cont.36547

bnei_else.36546:
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
	fblt	%f10, %f11, fbgt_else.36548

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36549

fbgt_else.36548:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36549:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36550

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
	fblt	%f10, %f11, fbgt_else.36552

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36553

fbgt_else.36552:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36553:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36554

	flw	%f10, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f7, %f10, fbeq_else.36556

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36557

fbeq_else.36556:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.36557:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36558

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36551

bnei_else.36558:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.36559:
	nop
	nop
	nop
	j	bnei_cont.36551

bnei_else.36554:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.36555:
	nop
	nop
	nop
	j	bnei_cont.36551

bnei_else.36550:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.36551:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36560

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
	j	bnei_cont.36561

bnei_else.36560:
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
	fblt	%f1, %f7, fbgt_else.36562

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36563

fbgt_else.36562:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.36563:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36564

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
	fblt	%f1, %f3, fbgt_else.36566

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36567

fbgt_else.36566:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.36567:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36568

	flw	%f1, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f1, fbeq_else.36570

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36571

fbeq_else.36570:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.36571:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36572

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36565

bnei_else.36572:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36573:
	nop
	nop
	nop
	j	bnei_cont.36565

bnei_else.36568:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36569:
	nop
	nop
	nop
	j	bnei_cont.36565

bnei_else.36564:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36565:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36574

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
	j	bnei_cont.36575

bnei_else.36574:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36575:
bnei_cont.36561:
bnei_cont.36547:
bnei_cont.36513:
	flw	%f1, 135(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36576

	flw	%f3, 467(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.36578

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36577

fbgt_else.36578:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.36579:
	nop
	nop
	nop
	j	bnei_cont.36577

bnei_else.36576:
	nop
	nop
	addi	%a0, %zero, 0
	nop

bnei_cont.36577:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36580

	flw	%f3, 466(%zero)
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
	beqi	%a0, -1, bnei_else.36581

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
	beqi	%a1, 1, bnei_else.36583

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.36585

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
	beqi	%a1, 0, bnei_else.36587

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
	j	bnei_cont.36588

bnei_else.36587:
	nop
	nop
	fmov	%f3, %f6
	nop

bnei_cont.36588:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 3, bnei_else.36589

	nop
	nop
	nop
	j	bnei_cont.36590

bnei_else.36589:
	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f3, %f3, %f4
	nop

bnei_cont.36590:
	lw	%a0, 6(%a0)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36591

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36592

fbgt_else.36591:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36592:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36593

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36595

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36594

bnei_else.36595:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36596:
	nop
	nop
	nop
	j	bnei_cont.36594

bnei_else.36593:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36594:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36597

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36584

bnei_else.36597:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36598:
	nop
	nop
	nop
	j	bnei_cont.36584

bnei_else.36585:
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

	flw	%f4, 470(%zero)
	nop
	fadd	%f3, %f3, %f4
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36599

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36600

fbgt_else.36599:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36600:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36601

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36603

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36602

bnei_else.36603:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36604:
	nop
	nop
	nop
	j	bnei_cont.36602

bnei_else.36601:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.36602:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36605

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36606

bnei_else.36605:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36606:
bnei_cont.36586:
	nop
	nop
	nop
	j	bnei_cont.36584

bnei_else.36583:
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
	fblt	%f3, %f6, fbgt_else.36607

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36608

fbgt_else.36607:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36608:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36609

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
	fblt	%f3, %f4, fbgt_else.36611

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36612

fbgt_else.36611:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36612:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36613

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
	fblt	%f3, %f4, fbgt_else.36615

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36610

fbgt_else.36615:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.36616:
	nop
	nop
	nop
	j	bnei_cont.36610

bnei_else.36613:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36614:
	nop
	nop
	nop
	j	bnei_cont.36610

bnei_else.36609:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.36610:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36617

	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36618

bnei_else.36617:
	lw	%a0, 6(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36619

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36620

bnei_else.36619:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.36620:
bnei_cont.36618:
bnei_cont.36584:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36621

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36582

bnei_else.36621:
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

bnei_cont.36622:
	nop
	nop
	nop
	j	bnei_cont.36582

bnei_else.36581:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.36582:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36623

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36623:
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

bnei_else.36580:
	lw	%a0, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.36624

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	shadow_check_and_group.2913

bnei_else.36624:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36511:
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
	beqi	%a0, -1, bnei_else.36636

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
	beqi	%v0, 0, bnei_else.36637

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36637:
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
	beqi	%a0, -1, bnei_else.36638

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
	beqi	%v0, 0, bnei_else.36639

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36639:
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
	beqi	%a0, -1, bnei_else.36640

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
	beqi	%v0, 0, bnei_else.36641

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36641:
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
	beqi	%a0, -1, bnei_else.36642

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
	beqi	%v0, 0, bnei_else.36643

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36643:
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

bnei_else.36642:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36640:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36638:
	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36636:
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
	beqi	%a2, -1, bnei_else.36676

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
	beqi	%a2, 99, bnei_else.36677

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
	beqi	%t0, 1, bnei_else.36679

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.36681

	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.36683

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36684

fbeq_else.36683:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36684:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36685

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36680

bnei_else.36685:
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
	beqi	%t0, 0, bnei_else.36687

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
	j	bnei_cont.36688

bnei_else.36687:
	nop
	nop
	fmov	%f0, %f6
	nop

bnei_cont.36688:
	lw	%t0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.36689

	nop
	nop
	nop
	j	bnei_cont.36690

bnei_else.36689:
	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.36690:
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
	fblt	%f4, %f0, fbgt_else.36691

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36692

fbgt_else.36691:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36692:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36693

	lw	%a3, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36695

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
	j	bnei_cont.36696

bnei_else.36695:
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

bnei_cont.36696:
	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36694

bnei_else.36693:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.36694:
bnei_cont.36686:
	nop
	nop
	nop
	j	bnei_cont.36680

bnei_else.36681:
	flw	%f3, 0(%a2)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.36697

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36698

fbgt_else.36697:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.36698:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.36699

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
	j	bnei_cont.36700

bnei_else.36699:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.36700:
bnei_cont.36682:
	nop
	nop
	nop
	j	bnei_cont.36680

bnei_else.36679:
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
	fblt	%f6, %f7, fbgt_else.36701

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36702

fbgt_else.36701:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36702:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36703

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
	fblt	%f6, %f7, fbgt_else.36705

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36706

fbgt_else.36705:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36706:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36707

	flw	%f6, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.36709

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36710

fbeq_else.36709:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36710:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36711

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36704

bnei_else.36711:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.36712:
	nop
	nop
	nop
	j	bnei_cont.36704

bnei_else.36707:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36708:
	nop
	nop
	nop
	j	bnei_cont.36704

bnei_else.36703:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36704:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36713

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
	j	bnei_cont.36714

bnei_else.36713:
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
	fblt	%f7, %f8, fbgt_else.36715

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36716

fbgt_else.36715:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36716:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36717

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
	fblt	%f7, %f8, fbgt_else.36719

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36720

fbgt_else.36719:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36720:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36721

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.36723

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36724

fbeq_else.36723:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36724:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36725

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36725:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.36726:
	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36721:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36722:
	nop
	nop
	nop
	j	bnei_cont.36718

bnei_else.36717:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36718:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36727

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
	j	bnei_cont.36728

bnei_else.36727:
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
	fblt	%f0, %f4, fbgt_else.36729

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36730

fbgt_else.36729:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36730:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36731

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
	fblt	%f0, %f1, fbgt_else.36733

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36734

fbgt_else.36733:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36734:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36735

	flw	%f0, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.36737

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36738

fbeq_else.36737:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.36738:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36739

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36732

bnei_else.36739:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36740:
	nop
	nop
	nop
	j	bnei_cont.36732

bnei_else.36735:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.36736:
	nop
	nop
	nop
	j	bnei_cont.36732

bnei_else.36731:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.36732:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36741

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
	j	bnei_cont.36742

bnei_else.36741:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.36742:
bnei_cont.36728:
bnei_cont.36714:
bnei_cont.36680:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36743

	flw	%f0, 135(%zero)
	flw	%f1, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.36745

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36746

fbgt_else.36745:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36746:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36747

	lw	%a2, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, -1, bnei_else.36749

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
	beqi	%v0, 0, bnei_else.36751

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36750

bnei_else.36751:
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
	beqi	%v1, -1, bnei_else.36753

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
	beqi	%v0, 0, bnei_else.36755

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36754

bnei_else.36755:
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
	beqi	%v1, -1, bnei_else.36757

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
	beqi	%v0, 0, bnei_else.36759

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36758

bnei_else.36759:
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

bnei_cont.36760:
	nop
	nop
	nop
	j	bnei_cont.36758

bnei_else.36757:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36758:
bnei_cont.36756:
	nop
	nop
	nop
	j	bnei_cont.36754

bnei_else.36753:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36754:
bnei_cont.36752:
	nop
	nop
	nop
	j	bnei_cont.36750

bnei_else.36749:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36750:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36761

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36678

bnei_else.36761:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36762:
	nop
	nop
	nop
	j	bnei_cont.36678

bnei_else.36747:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36748:
	nop
	nop
	nop
	j	bnei_cont.36678

bnei_else.36743:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36744:
	nop
	nop
	nop
	j	bnei_cont.36678

bnei_else.36677:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.36678:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36763

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
	beqi	%v1, -1, bnei_else.36764

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
	beqi	%v0, 0, bnei_else.36766

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36765

bnei_else.36766:
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
	beqi	%v1, -1, bnei_else.36768

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
	beqi	%v0, 0, bnei_else.36770

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36769

bnei_else.36770:
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
	beqi	%v1, -1, bnei_else.36772

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
	beqi	%v0, 0, bnei_else.36774

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36773

bnei_else.36774:
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

bnei_cont.36775:
	nop
	nop
	nop
	j	bnei_cont.36773

bnei_else.36772:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36773:
bnei_cont.36771:
	nop
	nop
	nop
	j	bnei_cont.36769

bnei_else.36768:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36769:
bnei_cont.36767:
	nop
	nop
	nop
	j	bnei_cont.36765

bnei_else.36764:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.36765:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36776

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	jr	%ra

bnei_else.36776:
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

bnei_else.36763:
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

bnei_else.36676:
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
	beqi	%a1, -1, bnei_else.36811

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
	beqi	%t0, 1, bnei_else.36812

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.36814

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
	beqi	%t0, 0, bnei_else.36816

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
	j	bnei_cont.36817

bnei_else.36816:
bnei_cont.36817:
	flw	%f11, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f9, %f11, fbeq_else.36818

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36819

fbeq_else.36818:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.36819:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36820

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36813

bnei_else.36820:
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
	beqi	%t0, 0, bnei_else.36822

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.36823

bnei_else.36822:
	nop
	nop
	fmov	%f6, %f14
	nop

bnei_cont.36823:
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
	beqi	%t0, 0, bnei_else.36824

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
	j	bnei_cont.36825

bnei_else.36824:
	nop
	nop
	fmov	%f1, %f7
	nop

bnei_cont.36825:
	lw	%t0, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.36826

	nop
	nop
	nop
	j	bnei_cont.36827

bnei_else.36826:
	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f1, %f1, %f3
	nop

bnei_cont.36827:
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
	fblt	%f11, %f1, fbgt_else.36828

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36829

fbgt_else.36828:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36829:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36830

	lw	%t0, 6(%a2)
	nop
	fsqrt	%f1, %f1
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36832

	nop
	nop
	nop
	j	bnei_cont.36833

bnei_else.36832:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.36833:
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
	j	bnei_cont.36831

bnei_else.36830:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36831:
bnei_cont.36821:
	nop
	nop
	nop
	j	bnei_cont.36813

bnei_else.36814:
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

	flw	%f8, 470(%zero)
	nop
	fadd	%f6, %f6, %f8
	nop

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.36834

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36835

fbgt_else.36834:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36835:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36836

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
	j	bnei_cont.36837

bnei_else.36836:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36837:
bnei_cont.36815:
	nop
	nop
	nop
	j	bnei_cont.36813

bnei_else.36812:
	flw	%f6, 0(%a0)
	flw	%f7, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.36838

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36839

fbeq_else.36838:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36839:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36840

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36841

bnei_else.36840:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.36842

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36843

fbgt_else.36842:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.36843:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36844

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.36846

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36845

bnei_else.36846:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.36847:
	nop
	nop
	nop
	j	bnei_cont.36845

bnei_else.36844:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.36845:
	flw	%f8, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36848

	nop
	nop
	nop
	j	bnei_cont.36849

bnei_else.36848:
	nop
	nop
	fneg	%f8, %f8
	nop

bnei_cont.36849:
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
	fblt	%f9, %f10, fbgt_else.36850

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36851

fbgt_else.36850:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36851:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36852

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
	fblt	%f9, %f10, fbgt_else.36854

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36855

fbgt_else.36854:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36855:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36856

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
	j	bnei_cont.36853

bnei_else.36856:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36857:
	nop
	nop
	nop
	j	bnei_cont.36853

bnei_else.36852:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36853:
bnei_cont.36841:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36858

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.36859

bnei_else.36858:
	flw	%f8, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f7, fbeq_else.36860

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36861

fbeq_else.36860:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36861:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36862

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36863

bnei_else.36862:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f8, %f7, fbgt_else.36864

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36865

fbgt_else.36864:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.36865:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36866

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.36868

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36867

bnei_else.36868:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.36869:
	nop
	nop
	nop
	j	bnei_cont.36867

bnei_else.36866:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.36867:
	flw	%f9, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36870

	nop
	nop
	nop
	j	bnei_cont.36871

bnei_else.36870:
	nop
	nop
	fneg	%f9, %f9
	nop

bnei_cont.36871:
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
	fblt	%f10, %f11, fbgt_else.36872

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36873

fbgt_else.36872:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36873:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36874

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
	fblt	%f10, %f11, fbgt_else.36876

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36877

fbgt_else.36876:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36877:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36878

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
	j	bnei_cont.36875

bnei_else.36878:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36879:
	nop
	nop
	nop
	j	bnei_cont.36875

bnei_else.36874:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36875:
bnei_cont.36863:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36880

	nop
	nop
	addi	%t0, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.36881

bnei_else.36880:
	flw	%f9, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f9, %f7, fbeq_else.36882

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.36883

fbeq_else.36882:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.36883:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36884

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36885

bnei_else.36884:
	lw	%t0, 4(%a2)
	lw	%t1, 6(%a2)
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f7, fbgt_else.36886

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36887

fbgt_else.36886:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.36887:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36888

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.36890

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36889

bnei_else.36890:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.36891:
	nop
	nop
	nop
	j	bnei_cont.36889

bnei_else.36888:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.36889:
	flw	%f7, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36892

	nop
	nop
	nop
	j	bnei_cont.36893

bnei_else.36892:
	nop
	nop
	fneg	%f7, %f7
	nop

bnei_cont.36893:
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
	fblt	%f1, %f6, fbgt_else.36894

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36895

fbgt_else.36894:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36895:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36896

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
	fblt	%f1, %f3, fbgt_else.36898

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36899

fbgt_else.36898:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.36899:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36900

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
	j	bnei_cont.36897

bnei_else.36900:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36901:
	nop
	nop
	nop
	j	bnei_cont.36897

bnei_else.36896:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36897:
bnei_cont.36885:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36902

	nop
	nop
	addi	%t0, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.36903

bnei_else.36902:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.36903:
bnei_cont.36881:
bnei_cont.36859:
bnei_cont.36813:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.36904

	flw	%f1, 135(%zero)
	flw	%f3, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.36905

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36906

fbgt_else.36905:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36906:
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
	beqi	%a2, 0, bnei_else.36907

	flw	%f5, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f5, fbgt_else.36909

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36910

fbgt_else.36909:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.36910:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36911

	flw	%f5, 466(%zero)
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
	beqi	%a2, -1, bnei_else.36913

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
	beqi	%t1, 1, bnei_else.36915

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.36917

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
	beqi	%t1, 0, bnei_else.36919

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
	j	bnei_cont.36920

bnei_else.36919:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.36920:
	lw	%t1, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 3, bnei_else.36921

	nop
	nop
	nop
	j	bnei_cont.36922

bnei_else.36921:
	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.36922:
	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.36923

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36924

fbgt_else.36923:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36924:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36925

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36927

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36926

bnei_else.36927:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36928:
	nop
	nop
	nop
	j	bnei_cont.36926

bnei_else.36925:
	nop
	nop
	add	%a2, %zero, %t1
	nop

bnei_cont.36926:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36929

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36916

bnei_else.36929:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36930:
	nop
	nop
	nop
	j	bnei_cont.36916

bnei_else.36917:
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
	fblt	%f5, %f3, fbgt_else.36931

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36932

fbgt_else.36931:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36932:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36933

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36935

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36934

bnei_else.36935:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36936:
	nop
	nop
	nop
	j	bnei_cont.36934

bnei_else.36933:
	nop
	nop
	add	%a2, %zero, %t1
	nop

bnei_cont.36934:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36937

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36938

bnei_else.36937:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36938:
bnei_cont.36918:
	nop
	nop
	nop
	j	bnei_cont.36916

bnei_else.36915:
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
	fblt	%f3, %f5, fbgt_else.36939

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36940

fbgt_else.36939:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36940:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36941

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
	fblt	%f3, %f5, fbgt_else.36943

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.36944

fbgt_else.36943:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36944:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36945

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
	fblt	%f3, %f5, fbgt_else.36947

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36942

fbgt_else.36947:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.36948:
	nop
	nop
	nop
	j	bnei_cont.36942

bnei_else.36945:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.36946:
	nop
	nop
	nop
	j	bnei_cont.36942

bnei_else.36941:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.36942:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.36949

	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.36950

bnei_else.36949:
	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36951

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36952

bnei_else.36951:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.36952:
bnei_cont.36950:
bnei_cont.36916:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.36953

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.36914

bnei_else.36953:
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

bnei_cont.36954:
	nop
	nop
	nop
	j	bnei_cont.36914

bnei_else.36913:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.36914:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.36955

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
	j	bnei_cont.36908

bnei_else.36955:
bnei_cont.36956:
	nop
	nop
	nop
	j	bnei_cont.36908

bnei_else.36911:
bnei_cont.36912:
	nop
	nop
	nop
	j	bnei_cont.36908

bnei_else.36907:
bnei_cont.36908:
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

bnei_else.36904:
	lw	%a1, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.36957

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element.2922

bnei_else.36957:
	nop
	nop
	nop
	jr	%ra

bnei_else.36811:
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
	beqi	%a1, -1, bnei_else.36992

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
	beqi	%a0, -1, bnei_else.36993

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
	beqi	%a0, -1, bnei_else.36994

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
	beqi	%a0, -1, bnei_else.36995

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
	beqi	%a0, -1, bnei_else.36996

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
	beqi	%a0, -1, bnei_else.36997

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
	beqi	%a0, -1, bnei_else.36998

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
	beqi	%a0, -1, bnei_else.36999

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

bnei_else.36999:
	nop
	nop
	nop
	jr	%ra

bnei_else.36998:
	nop
	nop
	nop
	jr	%ra

bnei_else.36997:
	nop
	nop
	nop
	jr	%ra

bnei_else.36996:
	nop
	nop
	nop
	jr	%ra

bnei_else.36995:
	nop
	nop
	nop
	jr	%ra

bnei_else.36994:
	nop
	nop
	nop
	jr	%ra

bnei_else.36993:
	nop
	nop
	nop
	jr	%ra

bnei_else.36992:
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
	beqi	%a3, -1, bnei_else.37130

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
	beqi	%a3, 99, bnei_else.37131

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
	beqi	%t0, 1, bnei_else.37133

	nop
	nop
	nop
	beqi	%t0, 2, bnei_else.37135

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
	beqi	%t0, 0, bnei_else.37137

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
	j	bnei_cont.37138

bnei_else.37137:
bnei_cont.37138:
	flw	%f8, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f8, fbeq_else.37139

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37140

fbeq_else.37139:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.37140:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37141

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37134

bnei_else.37141:
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
	beqi	%t0, 0, bnei_else.37143

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

	flw	%f4, 473(%zero)
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
	j	bnei_cont.37144

bnei_else.37143:
	nop
	nop
	fmov	%f3, %f11
	nop

bnei_cont.37144:
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
	beqi	%t0, 0, bnei_else.37145

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
	j	bnei_cont.37146

bnei_else.37145:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.37146:
	lw	%t0, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 3, bnei_else.37147

	nop
	nop
	nop
	j	bnei_cont.37148

bnei_else.37147:
	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.37148:
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
	fblt	%f8, %f0, fbgt_else.37149

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37150

fbgt_else.37149:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37150:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37151

	lw	%a3, 6(%a3)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37153

	nop
	nop
	nop
	j	bnei_cont.37154

bnei_else.37153:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37154:
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
	j	bnei_cont.37152

bnei_else.37151:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37152:
bnei_cont.37142:
	nop
	nop
	nop
	j	bnei_cont.37134

bnei_else.37135:
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

	flw	%f5, 470(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.37155

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37156

fbgt_else.37155:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37156:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37157

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
	j	bnei_cont.37158

bnei_else.37157:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37158:
bnei_cont.37136:
	nop
	nop
	nop
	j	bnei_cont.37134

bnei_else.37133:
	flw	%f3, 0(%a0)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.37159

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37160

fbeq_else.37159:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.37160:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37161

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37162

bnei_else.37161:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.37163

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37164

fbgt_else.37163:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37164:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37165

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37167

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37166

bnei_else.37167:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.37168:
	nop
	nop
	nop
	j	bnei_cont.37166

bnei_else.37165:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.37166:
	flw	%f5, 0(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37169

	nop
	nop
	nop
	j	bnei_cont.37170

bnei_else.37169:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.37170:
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
	fblt	%f6, %f7, fbgt_else.37171

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37172

fbgt_else.37171:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37172:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37173

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
	fblt	%f6, %f7, fbgt_else.37175

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37176

fbgt_else.37175:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37176:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37177

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
	j	bnei_cont.37174

bnei_else.37177:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37178:
	nop
	nop
	nop
	j	bnei_cont.37174

bnei_else.37173:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37174:
bnei_cont.37162:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37179

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.37180

bnei_else.37179:
	flw	%f5, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.37181

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37182

fbeq_else.37181:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.37182:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37183

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37184

bnei_else.37183:
	lw	%t0, 4(%a3)
	lw	%t1, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.37185

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37186

fbgt_else.37185:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37186:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37187

	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37189

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37188

bnei_else.37189:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.37190:
	nop
	nop
	nop
	j	bnei_cont.37188

bnei_else.37187:
	nop
	nop
	add	%t1, %zero, %t2
	nop

bnei_cont.37188:
	flw	%f6, 1(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37191

	nop
	nop
	nop
	j	bnei_cont.37192

bnei_else.37191:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.37192:
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
	fblt	%f7, %f8, fbgt_else.37193

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37194

fbgt_else.37193:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37194:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37195

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
	fblt	%f7, %f8, fbgt_else.37197

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37198

fbgt_else.37197:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37198:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37199

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
	j	bnei_cont.37196

bnei_else.37199:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37200:
	nop
	nop
	nop
	j	bnei_cont.37196

bnei_else.37195:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37196:
bnei_cont.37184:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37201

	nop
	nop
	addi	%a3, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.37202

bnei_else.37201:
	flw	%f6, 2(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.37203

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37204

fbeq_else.37203:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.37204:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37205

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37206

bnei_else.37205:
	lw	%t0, 4(%a3)
	lw	%a3, 6(%a3)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.37207

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37208

fbgt_else.37207:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37208:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37209

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37211

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37210

bnei_else.37211:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.37212:
	nop
	nop
	nop
	j	bnei_cont.37210

bnei_else.37209:
	nop
	nop
	add	%a3, %zero, %t1
	nop

bnei_cont.37210:
	flw	%f4, 2(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37213

	nop
	nop
	nop
	j	bnei_cont.37214

bnei_else.37213:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.37214:
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
	fblt	%f0, %f3, fbgt_else.37215

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37216

fbgt_else.37215:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37216:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37217

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
	fblt	%f0, %f1, fbgt_else.37219

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37220

fbgt_else.37219:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37220:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37221

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
	j	bnei_cont.37218

bnei_else.37221:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37222:
	nop
	nop
	nop
	j	bnei_cont.37218

bnei_else.37217:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37218:
bnei_cont.37206:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37223

	nop
	nop
	addi	%a3, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.37224

bnei_else.37223:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37224:
bnei_cont.37202:
bnei_cont.37180:
bnei_cont.37134:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37225

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37227

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37228

fbgt_else.37227:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37228:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37229

	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.37231

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
	beqi	%v1, -1, bnei_else.37233

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
	beqi	%v1, -1, bnei_else.37235

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
	beqi	%v1, -1, bnei_else.37237

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
	beqi	%v1, -1, bnei_else.37239

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
	beqi	%v1, -1, bnei_else.37241

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
	beqi	%v1, -1, bnei_else.37243

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
	j	bnei_cont.37132

bnei_else.37243:
bnei_cont.37244:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37241:
bnei_cont.37242:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37239:
bnei_cont.37240:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37237:
bnei_cont.37238:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37235:
bnei_cont.37236:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37233:
bnei_cont.37234:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37231:
bnei_cont.37232:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37229:
bnei_cont.37230:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37225:
bnei_cont.37226:
	nop
	nop
	nop
	j	bnei_cont.37132

bnei_else.37131:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.37245

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
	beqi	%v1, -1, bnei_else.37247

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
	beqi	%v1, -1, bnei_else.37249

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
	beqi	%v1, -1, bnei_else.37251

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
	beqi	%v1, -1, bnei_else.37253

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
	beqi	%v1, -1, bnei_else.37255

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
	beqi	%v1, -1, bnei_else.37257

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
	j	bnei_cont.37246

bnei_else.37257:
bnei_cont.37258:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37255:
bnei_cont.37256:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37253:
bnei_cont.37254:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37251:
bnei_cont.37252:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37249:
bnei_cont.37250:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37247:
bnei_cont.37248:
	nop
	nop
	nop
	j	bnei_cont.37246

bnei_else.37245:
bnei_cont.37246:
bnei_cont.37132:
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
	beqi	%a1, -1, bnei_else.37259

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.37260

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
	beqi	%a2, 1, bnei_else.37262

	nop
	nop
	nop
	beqi	%a2, 2, bnei_else.37264

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
	beqi	%a3, 0, bnei_else.37266

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
	j	bnei_cont.37267

bnei_else.37266:
bnei_cont.37267:
	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f7, fbeq_else.37268

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37269

fbeq_else.37268:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.37269:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37270

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37263

bnei_else.37270:
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
	beqi	%a3, 0, bnei_else.37272

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

	flw	%f4, 473(%zero)
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
	j	bnei_cont.37273

bnei_else.37272:
	nop
	nop
	fmov	%f3, %f8
	nop

bnei_cont.37273:
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
	beqi	%a3, 0, bnei_else.37274

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
	j	bnei_cont.37275

bnei_else.37274:
	nop
	nop
	fmov	%f0, %f4
	nop

bnei_cont.37275:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.37276

	nop
	nop
	nop
	j	bnei_cont.37277

bnei_else.37276:
	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

bnei_cont.37277:
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
	fblt	%f7, %f0, fbgt_else.37278

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37279

fbgt_else.37278:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37279:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37280

	lw	%a1, 6(%a1)
	nop
	fsqrt	%f0, %f0
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37282

	nop
	nop
	nop
	j	bnei_cont.37283

bnei_else.37282:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.37283:
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
	j	bnei_cont.37281

bnei_else.37280:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37281:
bnei_cont.37271:
	nop
	nop
	nop
	j	bnei_cont.37263

bnei_else.37264:
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

	flw	%f5, 470(%zero)
	nop
	fadd	%f3, %f3, %f5
	nop

	nop
	nop
	nop
	fblt	%f5, %f3, fbgt_else.37284

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37285

fbgt_else.37284:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37285:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37286

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
	j	bnei_cont.37287

bnei_else.37286:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37287:
bnei_cont.37265:
	nop
	nop
	nop
	j	bnei_cont.37263

bnei_else.37262:
	lw	%a2, 0(%sp)
	flw	%f4, 470(%zero)
	nop
	nop

	flw	%f3, 0(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.37288

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37289

fbeq_else.37288:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.37289:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37290

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37291

bnei_else.37290:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.37292

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37293

fbgt_else.37292:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37293:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37294

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37296

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37295

bnei_else.37296:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.37297:
	nop
	nop
	nop
	j	bnei_cont.37295

bnei_else.37294:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.37295:
	flw	%f5, 0(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37298

	nop
	nop
	nop
	j	bnei_cont.37299

bnei_else.37298:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.37299:
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
	fblt	%f6, %f7, fbgt_else.37300

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37301

fbgt_else.37300:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37301:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37302

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
	fblt	%f6, %f7, fbgt_else.37304

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37305

fbgt_else.37304:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37305:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37306

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
	j	bnei_cont.37303

bnei_else.37306:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37307:
	nop
	nop
	nop
	j	bnei_cont.37303

bnei_else.37302:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37303:
bnei_cont.37291:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37308

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.37309

bnei_else.37308:
	flw	%f5, 1(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f5, %f4, fbeq_else.37310

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37311

fbeq_else.37310:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.37311:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37312

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37313

bnei_else.37312:
	lw	%a3, 4(%a1)
	lw	%t0, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f4, fbgt_else.37314

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37315

fbgt_else.37314:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37315:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37316

	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37318

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37317

bnei_else.37318:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.37319:
	nop
	nop
	nop
	j	bnei_cont.37317

bnei_else.37316:
	nop
	nop
	add	%t0, %zero, %t1
	nop

bnei_cont.37317:
	flw	%f6, 1(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37320

	nop
	nop
	nop
	j	bnei_cont.37321

bnei_else.37320:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.37321:
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
	fblt	%f7, %f8, fbgt_else.37322

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37323

fbgt_else.37322:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37323:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37324

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
	fblt	%f7, %f8, fbgt_else.37326

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37327

fbgt_else.37326:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37327:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37328

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
	j	bnei_cont.37325

bnei_else.37328:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37329:
	nop
	nop
	nop
	j	bnei_cont.37325

bnei_else.37324:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37325:
bnei_cont.37313:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37330

	nop
	nop
	addi	%a1, %zero, 2
	nop

	nop
	nop
	nop
	j	bnei_cont.37331

bnei_else.37330:
	flw	%f6, 2(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f6, %f4, fbeq_else.37332

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37333

fbeq_else.37332:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.37333:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37334

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37335

bnei_else.37334:
	lw	%a3, 4(%a1)
	lw	%a1, 6(%a1)
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f4, fbgt_else.37336

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37337

fbgt_else.37336:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37337:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37338

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37340

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37339

bnei_else.37340:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37341:
	nop
	nop
	nop
	j	bnei_cont.37339

bnei_else.37338:
	nop
	nop
	add	%a1, %zero, %t0
	nop

bnei_cont.37339:
	flw	%f4, 2(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37342

	nop
	nop
	nop
	j	bnei_cont.37343

bnei_else.37342:
	nop
	nop
	fneg	%f4, %f4
	nop

bnei_cont.37343:
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
	fblt	%f0, %f3, fbgt_else.37344

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37345

fbgt_else.37344:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37345:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37346

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
	fblt	%f0, %f1, fbgt_else.37348

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37349

fbgt_else.37348:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37349:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37350

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
	j	bnei_cont.37347

bnei_else.37350:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37351:
	nop
	nop
	nop
	j	bnei_cont.37347

bnei_else.37346:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37347:
bnei_cont.37335:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37352

	nop
	nop
	addi	%a1, %zero, 3
	nop

	nop
	nop
	nop
	j	bnei_cont.37353

bnei_else.37352:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37353:
bnei_cont.37331:
bnei_cont.37309:
bnei_cont.37263:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37354

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37356

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37357

fbgt_else.37356:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37357:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37358

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.37360

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
	beqi	%v1, -1, bnei_else.37362

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
	beqi	%v1, -1, bnei_else.37364

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
	beqi	%v1, -1, bnei_else.37366

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
	beqi	%v1, -1, bnei_else.37368

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
	beqi	%v1, -1, bnei_else.37370

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
	j	bnei_cont.37261

bnei_else.37370:
bnei_cont.37371:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37368:
bnei_cont.37369:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37366:
bnei_cont.37367:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37364:
bnei_cont.37365:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37362:
bnei_cont.37363:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37360:
bnei_cont.37361:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37358:
bnei_cont.37359:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37354:
bnei_cont.37355:
	nop
	nop
	nop
	j	bnei_cont.37261

bnei_else.37260:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.37372

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
	beqi	%v1, -1, bnei_else.37374

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
	beqi	%v1, -1, bnei_else.37376

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
	beqi	%v1, -1, bnei_else.37378

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
	beqi	%v1, -1, bnei_else.37380

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
	beqi	%v1, -1, bnei_else.37382

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
	j	bnei_cont.37373

bnei_else.37382:
bnei_cont.37383:
	nop
	nop
	nop
	j	bnei_cont.37373

bnei_else.37380:
bnei_cont.37381:
	nop
	nop
	nop
	j	bnei_cont.37373

bnei_else.37378:
bnei_cont.37379:
	nop
	nop
	nop
	j	bnei_cont.37373

bnei_else.37376:
bnei_cont.37377:
	nop
	nop
	nop
	j	bnei_cont.37373

bnei_else.37374:
bnei_cont.37375:
	nop
	nop
	nop
	j	bnei_cont.37373

bnei_else.37372:
bnei_cont.37373:
bnei_cont.37261:
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

bnei_else.37259:
	nop
	nop
	nop
	jr	%ra

bnei_else.37130:
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
	beqi	%a2, -1, bnei_else.37420

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
	beqi	%t3, 1, bnei_else.37421

	nop
	nop
	nop
	beqi	%t3, 2, bnei_else.37423

	flw	%f3, 0(%t2)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.37425

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37426

fbeq_else.37425:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.37426:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37427

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37422

bnei_else.37427:
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
	fblt	%f4, %f1, fbgt_else.37429

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37430

fbgt_else.37429:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37430:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37431

	lw	%t0, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37433

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
	j	bnei_cont.37434

bnei_else.37433:
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

bnei_cont.37434:
	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.37432

bnei_else.37431:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37432:
bnei_cont.37428:
	nop
	nop
	nop
	j	bnei_cont.37422

bnei_else.37423:
	flw	%f0, 0(%t2)
	flw	%f1, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37435

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37436

fbgt_else.37435:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37436:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37437

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
	j	bnei_cont.37438

bnei_else.37437:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37438:
bnei_cont.37424:
	nop
	nop
	nop
	j	bnei_cont.37422

bnei_else.37421:
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
	fblt	%f6, %f7, fbgt_else.37439

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37440

fbgt_else.37439:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.37440:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37441

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
	fblt	%f6, %f7, fbgt_else.37443

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37444

fbgt_else.37443:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.37444:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37445

	flw	%f6, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.37447

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37448

fbeq_else.37447:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.37448:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37449

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37442

bnei_else.37449:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.37450:
	nop
	nop
	nop
	j	bnei_cont.37442

bnei_else.37445:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.37446:
	nop
	nop
	nop
	j	bnei_cont.37442

bnei_else.37441:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.37442:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37451

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
	j	bnei_cont.37452

bnei_else.37451:
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
	fblt	%f7, %f8, fbgt_else.37453

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37454

fbgt_else.37453:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.37454:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.37455

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
	fblt	%f7, %f8, fbgt_else.37457

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37458

fbgt_else.37457:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37458:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37459

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.37461

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37462

fbeq_else.37461:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.37462:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37463

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37456

bnei_else.37463:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.37464:
	nop
	nop
	nop
	j	bnei_cont.37456

bnei_else.37459:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37460:
	nop
	nop
	nop
	j	bnei_cont.37456

bnei_else.37455:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37456:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37465

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
	j	bnei_cont.37466

bnei_else.37465:
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
	fblt	%f0, %f4, fbgt_else.37467

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37468

fbgt_else.37467:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37468:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37469

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
	fblt	%f0, %f1, fbgt_else.37471

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37472

fbgt_else.37471:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.37472:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37473

	flw	%f0, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.37475

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37476

fbeq_else.37475:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.37476:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37477

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37470

bnei_else.37477:
	nop
	nop
	addi	%t0, %zero, 1
	nop

bnei_cont.37478:
	nop
	nop
	nop
	j	bnei_cont.37470

bnei_else.37473:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37474:
	nop
	nop
	nop
	j	bnei_cont.37470

bnei_else.37469:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37470:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37479

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
	j	bnei_cont.37480

bnei_else.37479:
	nop
	nop
	addi	%t0, %zero, 0
	nop

bnei_cont.37480:
bnei_cont.37466:
bnei_cont.37452:
bnei_cont.37422:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37481

	flw	%f0, 135(%zero)
	flw	%f1, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.37482

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37483

fbgt_else.37482:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37483:
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
	beqi	%a3, 0, bnei_else.37484

	flw	%f2, 137(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.37486

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37487

fbgt_else.37486:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37487:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37488

	flw	%f2, 466(%zero)
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
	beqi	%a1, -1, bnei_else.37490

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
	beqi	%a3, 1, bnei_else.37492

	nop
	nop
	nop
	beqi	%a3, 2, bnei_else.37494

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
	beqi	%a3, 0, bnei_else.37496

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
	j	bnei_cont.37497

bnei_else.37496:
	nop
	nop
	fmov	%f5, %f8
	nop

bnei_cont.37497:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, 3, bnei_else.37498

	nop
	nop
	nop
	j	bnei_cont.37499

bnei_else.37498:
	flw	%f6, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fsub	%f5, %f5, %f6
	nop

bnei_cont.37499:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f1, fbgt_else.37500

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37501

fbgt_else.37500:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37501:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37502

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37504

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37503

bnei_else.37504:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37505:
	nop
	nop
	nop
	j	bnei_cont.37503

bnei_else.37502:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.37503:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37506

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37493

bnei_else.37506:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37507:
	nop
	nop
	nop
	j	bnei_cont.37493

bnei_else.37494:
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
	fblt	%f5, %f1, fbgt_else.37508

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37509

fbgt_else.37508:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37509:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37510

	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37512

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37511

bnei_else.37512:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37513:
	nop
	nop
	nop
	j	bnei_cont.37511

bnei_else.37510:
	nop
	nop
	add	%a1, %zero, %a3
	nop

bnei_cont.37511:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37514

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37515

bnei_else.37514:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37515:
bnei_cont.37495:
	nop
	nop
	nop
	j	bnei_cont.37493

bnei_else.37492:
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
	fblt	%f1, %f5, fbgt_else.37516

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37517

fbgt_else.37516:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37517:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37518

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
	fblt	%f1, %f5, fbgt_else.37520

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37521

fbgt_else.37520:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37521:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37522

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
	fblt	%f1, %f5, fbgt_else.37524

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37519

fbgt_else.37524:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37525:
	nop
	nop
	nop
	j	bnei_cont.37519

bnei_else.37522:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37523:
	nop
	nop
	nop
	j	bnei_cont.37519

bnei_else.37518:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37519:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37526

	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.37527

bnei_else.37526:
	lw	%a1, 6(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37528

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37529

bnei_else.37528:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37529:
bnei_cont.37527:
bnei_cont.37493:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37530

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37491

bnei_else.37530:
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

bnei_cont.37531:
	nop
	nop
	nop
	j	bnei_cont.37491

bnei_else.37490:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.37491:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.37532

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
	j	bnei_cont.37485

bnei_else.37532:
bnei_cont.37533:
	nop
	nop
	nop
	j	bnei_cont.37485

bnei_else.37488:
bnei_cont.37489:
	nop
	nop
	nop
	j	bnei_cont.37485

bnei_else.37484:
bnei_cont.37485:
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

bnei_else.37481:
	lw	%a1, 6(%a3)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37534

	nop
	nop
	addi	%v0, %v0, 1
	nop

	nop
	nop
	nop
	j	solve_each_element_fast.2936

bnei_else.37534:
	nop
	nop
	nop
	jr	%ra

bnei_else.37420:
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
	beqi	%a1, -1, bnei_else.37569

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
	beqi	%a0, -1, bnei_else.37570

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
	beqi	%a0, -1, bnei_else.37571

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
	beqi	%a0, -1, bnei_else.37572

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
	beqi	%a0, -1, bnei_else.37573

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
	beqi	%a0, -1, bnei_else.37574

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
	beqi	%a0, -1, bnei_else.37575

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
	beqi	%a0, -1, bnei_else.37576

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

bnei_else.37576:
	nop
	nop
	nop
	jr	%ra

bnei_else.37575:
	nop
	nop
	nop
	jr	%ra

bnei_else.37574:
	nop
	nop
	nop
	jr	%ra

bnei_else.37573:
	nop
	nop
	nop
	jr	%ra

bnei_else.37572:
	nop
	nop
	nop
	jr	%ra

bnei_else.37571:
	nop
	nop
	nop
	jr	%ra

bnei_else.37570:
	nop
	nop
	nop
	jr	%ra

bnei_else.37569:
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
	beqi	%a3, -1, bnei_else.37707

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
	beqi	%a3, 99, bnei_else.37708

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
	beqi	%t2, 1, bnei_else.37710

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.37712

	flw	%f3, 0(%a3)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.37714

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37715

fbeq_else.37714:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.37715:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37716

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37711

bnei_else.37716:
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
	fblt	%f4, %f1, fbgt_else.37718

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37719

fbgt_else.37718:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37719:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37720

	lw	%t0, 6(%t0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.37722

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
	j	bnei_cont.37723

bnei_else.37722:
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

bnei_cont.37723:
	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.37721

bnei_else.37720:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37721:
bnei_cont.37717:
	nop
	nop
	nop
	j	bnei_cont.37711

bnei_else.37712:
	flw	%f0, 0(%a3)
	flw	%f1, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37724

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37725

fbgt_else.37724:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37725:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37726

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
	j	bnei_cont.37727

bnei_else.37726:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37727:
bnei_cont.37713:
	nop
	nop
	nop
	j	bnei_cont.37711

bnei_else.37710:
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
	fblt	%f6, %f7, fbgt_else.37728

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37729

fbgt_else.37728:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37729:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37730

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
	fblt	%f6, %f7, fbgt_else.37732

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37733

fbgt_else.37732:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37733:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37734

	flw	%f6, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.37736

	nop
	nop
	addi	%t2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37737

fbeq_else.37736:
	nop
	nop
	addi	%t2, %zero, 0
	nop

fbeq_cont.37737:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37738

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37731

bnei_else.37738:
	nop
	nop
	addi	%t2, %zero, 1
	nop

bnei_cont.37739:
	nop
	nop
	nop
	j	bnei_cont.37731

bnei_else.37734:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.37735:
	nop
	nop
	nop
	j	bnei_cont.37731

bnei_else.37730:
	nop
	nop
	addi	%t2, %zero, 0
	nop

bnei_cont.37731:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37740

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
	j	bnei_cont.37741

bnei_else.37740:
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
	fblt	%f7, %f8, fbgt_else.37742

	nop
	nop
	addi	%t2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37743

fbgt_else.37742:
	nop
	nop
	addi	%t2, %zero, 1
	nop

fbgt_cont.37743:
	nop
	nop
	nop
	beqi	%t2, 0, bnei_else.37744

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
	fblt	%f7, %f8, fbgt_else.37746

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37747

fbgt_else.37746:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37747:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37748

	flw	%f7, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f7, fbeq_else.37750

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37751

fbeq_else.37750:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.37751:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37752

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37745

bnei_else.37752:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.37753:
	nop
	nop
	nop
	j	bnei_cont.37745

bnei_else.37748:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.37749:
	nop
	nop
	nop
	j	bnei_cont.37745

bnei_else.37744:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.37745:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37754

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
	j	bnei_cont.37755

bnei_else.37754:
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
	fblt	%f0, %f4, fbgt_else.37756

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37757

fbgt_else.37756:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37757:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37758

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
	fblt	%f0, %f1, fbgt_else.37760

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37761

fbgt_else.37760:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37761:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37762

	flw	%f0, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.37764

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37765

fbeq_else.37764:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.37765:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37766

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37759

bnei_else.37766:
	nop
	nop
	addi	%a3, %zero, 1
	nop

bnei_cont.37767:
	nop
	nop
	nop
	j	bnei_cont.37759

bnei_else.37762:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37763:
	nop
	nop
	nop
	j	bnei_cont.37759

bnei_else.37758:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37759:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37768

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
	j	bnei_cont.37769

bnei_else.37768:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bnei_cont.37769:
bnei_cont.37755:
bnei_cont.37741:
bnei_cont.37711:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37770

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37772

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37773

fbgt_else.37772:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37773:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37774

	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.37776

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
	beqi	%v1, -1, bnei_else.37778

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
	beqi	%v1, -1, bnei_else.37780

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
	beqi	%v1, -1, bnei_else.37782

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
	beqi	%v1, -1, bnei_else.37784

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
	beqi	%v1, -1, bnei_else.37786

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
	beqi	%v1, -1, bnei_else.37788

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
	j	bnei_cont.37709

bnei_else.37788:
bnei_cont.37789:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37786:
bnei_cont.37787:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37784:
bnei_cont.37785:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37782:
bnei_cont.37783:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37780:
bnei_cont.37781:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37778:
bnei_cont.37779:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37776:
bnei_cont.37777:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37774:
bnei_cont.37775:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37770:
bnei_cont.37771:
	nop
	nop
	nop
	j	bnei_cont.37709

bnei_else.37708:
	lw	%a3, 1(%a1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a3, -1, bnei_else.37790

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
	beqi	%v1, -1, bnei_else.37792

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
	beqi	%v1, -1, bnei_else.37794

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
	beqi	%v1, -1, bnei_else.37796

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
	beqi	%v1, -1, bnei_else.37798

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
	beqi	%v1, -1, bnei_else.37800

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
	beqi	%v1, -1, bnei_else.37802

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
	j	bnei_cont.37791

bnei_else.37802:
bnei_cont.37803:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37800:
bnei_cont.37801:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37798:
bnei_cont.37799:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37796:
bnei_cont.37797:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37794:
bnei_cont.37795:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37792:
bnei_cont.37793:
	nop
	nop
	nop
	j	bnei_cont.37791

bnei_else.37790:
bnei_cont.37791:
bnei_cont.37709:
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
	beqi	%a1, -1, bnei_else.37804

	sw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 99, bnei_else.37805

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
	beqi	%t1, 1, bnei_else.37807

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.37809

	flw	%f3, 0(%a1)
	flw	%f4, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f4, fbeq_else.37811

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37812

fbeq_else.37811:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.37812:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37813

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37808

bnei_else.37813:
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
	fblt	%f4, %f1, fbgt_else.37815

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37816

fbgt_else.37815:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.37816:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.37817

	lw	%a2, 6(%a2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37819

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
	j	bnei_cont.37820

bnei_else.37819:
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

bnei_cont.37820:
	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.37818

bnei_else.37817:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37818:
bnei_cont.37814:
	nop
	nop
	nop
	j	bnei_cont.37808

bnei_else.37809:
	flw	%f0, 0(%a1)
	flw	%f1, 470(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37821

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37822

fbgt_else.37821:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37822:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37823

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
	j	bnei_cont.37824

bnei_else.37823:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37824:
bnei_cont.37810:
	nop
	nop
	nop
	j	bnei_cont.37808

bnei_else.37807:
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
	fblt	%f6, %f7, fbgt_else.37825

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37826

fbgt_else.37825:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37826:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37827

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
	fblt	%f6, %f8, fbgt_else.37829

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37830

fbgt_else.37829:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37830:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37831

	flw	%f6, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f6, fbeq_else.37833

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37834

fbeq_else.37833:
	nop
	nop
	addi	%t1, %zero, 0
	nop

fbeq_cont.37834:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37835

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37828

bnei_else.37835:
	nop
	nop
	addi	%t1, %zero, 1
	nop

bnei_cont.37836:
	nop
	nop
	nop
	j	bnei_cont.37828

bnei_else.37831:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.37832:
	nop
	nop
	nop
	j	bnei_cont.37828

bnei_else.37827:
	nop
	nop
	addi	%t1, %zero, 0
	nop

bnei_cont.37828:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37837

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
	j	bnei_cont.37838

bnei_else.37837:
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
	fblt	%f8, %f9, fbgt_else.37839

	nop
	nop
	addi	%t1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37840

fbgt_else.37839:
	nop
	nop
	addi	%t1, %zero, 1
	nop

fbgt_cont.37840:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.37841

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
	fblt	%f8, %f10, fbgt_else.37843

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37844

fbgt_else.37843:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.37844:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37845

	flw	%f8, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f4, %f8, fbeq_else.37847

	nop
	nop
	addi	%a2, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37848

fbeq_else.37847:
	nop
	nop
	addi	%a2, %zero, 0
	nop

fbeq_cont.37848:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37849

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37842

bnei_else.37849:
	nop
	nop
	addi	%a2, %zero, 1
	nop

bnei_cont.37850:
	nop
	nop
	nop
	j	bnei_cont.37842

bnei_else.37845:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.37846:
	nop
	nop
	nop
	j	bnei_cont.37842

bnei_else.37841:
	nop
	nop
	addi	%a2, %zero, 0
	nop

bnei_cont.37842:
	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.37851

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
	j	bnei_cont.37852

bnei_else.37851:
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
	fblt	%f0, %f9, fbgt_else.37853

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37854

fbgt_else.37853:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37854:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37855

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
	fblt	%f0, %f7, fbgt_else.37857

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37858

fbgt_else.37857:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37858:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37859

	flw	%f0, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.37861

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.37862

fbeq_else.37861:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbeq_cont.37862:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37863

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.37856

bnei_else.37863:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.37864:
	nop
	nop
	nop
	j	bnei_cont.37856

bnei_else.37859:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37860:
	nop
	nop
	nop
	j	bnei_cont.37856

bnei_else.37855:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37856:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37865

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
	j	bnei_cont.37866

bnei_else.37865:
	nop
	nop
	addi	%a1, %zero, 0
	nop

bnei_cont.37866:
bnei_cont.37852:
bnei_cont.37838:
bnei_cont.37808:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37867

	flw	%f0, 135(%zero)
	flw	%f1, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.37869

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.37870

fbgt_else.37869:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.37870:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.37871

	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.37873

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
	beqi	%v1, -1, bnei_else.37875

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
	beqi	%v1, -1, bnei_else.37877

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
	beqi	%v1, -1, bnei_else.37879

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
	beqi	%v1, -1, bnei_else.37881

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
	beqi	%v1, -1, bnei_else.37883

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
	j	bnei_cont.37806

bnei_else.37883:
bnei_cont.37884:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37881:
bnei_cont.37882:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37879:
bnei_cont.37880:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37877:
bnei_cont.37878:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37875:
bnei_cont.37876:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37873:
bnei_cont.37874:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37871:
bnei_cont.37872:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37867:
bnei_cont.37868:
	nop
	nop
	nop
	j	bnei_cont.37806

bnei_else.37805:
	lw	%a1, 1(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, -1, bnei_else.37885

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
	beqi	%v1, -1, bnei_else.37887

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
	beqi	%v1, -1, bnei_else.37889

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
	beqi	%v1, -1, bnei_else.37891

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
	beqi	%v1, -1, bnei_else.37893

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
	beqi	%v1, -1, bnei_else.37895

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
	j	bnei_cont.37886

bnei_else.37895:
bnei_cont.37896:
	nop
	nop
	nop
	j	bnei_cont.37886

bnei_else.37893:
bnei_cont.37894:
	nop
	nop
	nop
	j	bnei_cont.37886

bnei_else.37891:
bnei_cont.37892:
	nop
	nop
	nop
	j	bnei_cont.37886

bnei_else.37889:
bnei_cont.37890:
	nop
	nop
	nop
	j	bnei_cont.37886

bnei_else.37887:
bnei_cont.37888:
	nop
	nop
	nop
	j	bnei_cont.37886

bnei_else.37885:
bnei_cont.37886:
bnei_cont.37806:
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

bnei_else.37804:
	nop
	nop
	nop
	jr	%ra

bnei_else.37707:
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
	beqi	%a0, 1, bnei_else.37998

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.37999

	nop
	nop
	nop
	beqi	%a0, 3, bnei_else.38000

	nop
	nop
	nop
	beqi	%a0, 4, bnei_else.38001

	nop
	nop
	nop
	jr	%ra

bnei_else.38001:
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
	flw	%f4, 464(%zero)
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
	fblt	%f3, %f4, fbgt_else.38003

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38004

fbgt_else.38003:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.38004:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38005

	flw	%f0, 463(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38006

bnei_else.38005:
	flw	%f1, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.38007

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.38008

fbgt_else.38007:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbgt_cont.38008:
	flw	%f3, 462(%zero)
	nop
	fabs	%f1, %f0
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.38009

	flw	%f0, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38011

	flw	%f0, 479(%zero)
	flw	%f3, 474(%zero)
	nop
	nop

	flw	%f7, 461(%zero)
	flw	%f8, 460(%zero)
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

	flw	%f8, 459(%zero)
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

	flw	%f8, 458(%zero)
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

	flw	%f8, 457(%zero)
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

	flw	%f7, 456(%zero)
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
	j	fbgt_cont.38012

fbgt_else.38011:
	flw	%f0, 478(%zero)
	flw	%f3, 474(%zero)
	nop
	nop

	flw	%f7, 461(%zero)
	flw	%f8, 460(%zero)
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

	flw	%f8, 459(%zero)
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

	flw	%f8, 458(%zero)
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

	flw	%f8, 457(%zero)
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

	flw	%f7, 456(%zero)
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

fbgt_cont.38012:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38013

	nop
	nop
	nop
	j	fbgt_cont.38010

bnei_else.38013:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38014:
	nop
	nop
	nop
	j	fbgt_cont.38010

fbgt_else.38009:
	flw	%f6, 461(%zero)
	flw	%f7, 460(%zero)
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

	flw	%f7, 459(%zero)
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

	flw	%f7, 458(%zero)
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

	flw	%f7, 457(%zero)
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

	flw	%f6, 456(%zero)
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

fbgt_cont.38010:
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

bnei_cont.38006:
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
	fblt	%f3, %f4, fbgt_else.38015

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38016

fbgt_else.38015:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38016:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38017

	flw	%f1, 463(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38018

bnei_else.38017:
	flw	%f2, 470(%zero)
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
	fblt	%f1, %f2, fbgt_else.38019

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.38020

fbgt_else.38019:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.38020:
	flw	%f3, 462(%zero)
	nop
	fabs	%f2, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f3, fbgt_else.38021

	flw	%f1, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.38023

	flw	%f1, 479(%zero)
	flw	%f3, 474(%zero)
	nop
	nop

	flw	%f6, 461(%zero)
	flw	%f7, 460(%zero)
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

	flw	%f7, 459(%zero)
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

	flw	%f7, 458(%zero)
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

	flw	%f7, 457(%zero)
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

	flw	%f6, 456(%zero)
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
	j	fbgt_cont.38024

fbgt_else.38023:
	flw	%f1, 478(%zero)
	flw	%f3, 474(%zero)
	nop
	nop

	flw	%f6, 461(%zero)
	flw	%f7, 460(%zero)
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

	flw	%f7, 459(%zero)
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

	flw	%f7, 458(%zero)
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

	flw	%f7, 457(%zero)
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

	flw	%f6, 456(%zero)
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

fbgt_cont.38024:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38025

	nop
	nop
	nop
	j	fbgt_cont.38022

bnei_else.38025:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.38026:
	nop
	nop
	nop
	j	fbgt_cont.38022

fbgt_else.38021:
	flw	%f5, 461(%zero)
	flw	%f6, 460(%zero)
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

	flw	%f6, 459(%zero)
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

	flw	%f6, 458(%zero)
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

	flw	%f6, 457(%zero)
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

	flw	%f5, 456(%zero)
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

fbgt_cont.38022:
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

bnei_cont.38018:
	flw	%f3, 473(%zero)
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

	flw	%f1, 470(%zero)
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38027

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38028

fbgt_else.38027:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38028:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38029

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	bnei_cont.38030

bnei_else.38029:
bnei_cont.38030:
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

bnei_else.38000:
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

	flw	%f2, 493(%zero)
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

	flw	%f1, 494(%zero)
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
	fblt	%f0, %f2, fbgt_else.38032

	flw	%f3, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38034

	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38036

	flw	%f3, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38038

	flw	%f3, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38040

	flw	%f3, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38042

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38044

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38046

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38048

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38050

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38052

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38054

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38056

	flw	%f3, 480(%zero)
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
	j	fbgt_cont.38033

fbgt_else.38056:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38057:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38054:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38055:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38052:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38053:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38050:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38051:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38048:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38049:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38046:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38047:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38044:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38045:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38042:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38043:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38040:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38041:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38038:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38039:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38036:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38037:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38034:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38035:
	nop
	nop
	nop
	j	fbgt_cont.38033

fbgt_else.38032:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.38033:
	flw	%f1, 1(%sp)
	flw	%f2, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.38058

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38060

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
	j	fbgt_cont.38059

fbgt_else.38060:
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

fbgt_cont.38061:
	nop
	nop
	nop
	j	fbgt_cont.38059

fbgt_else.38058:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.38059:
	flw	%f1, 0(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38062

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38063

fbgt_else.38062:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38063:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38064

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.38065

fbgt_else.38064:
fbgt_cont.38065:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38066

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38068

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38067

bnei_else.38068:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.38069:
	nop
	nop
	nop
	j	fbgt_cont.38067

fbgt_else.38066:
fbgt_cont.38067:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38070

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38071

fbgt_else.38070:
fbgt_cont.38071:
	flw	%f1, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38072

	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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
	j	fbgt_cont.38073

fbgt_else.38072:
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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

fbgt_cont.38073:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38074

	nop
	nop
	nop
	j	bnei_cont.38075

bnei_else.38074:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38075:
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

	flw	%f2, 474(%zero)
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

bnei_else.37999:
	flw	%f0, 1(%v1)
	flw	%f1, 448(%zero)
	nop
	nop

	flw	%f1, 494(%zero)
	flw	%f2, 470(%zero)
	fmul	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38077

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.38078

fbgt_else.38077:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.38078:
	flw	%f2, 493(%zero)
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
	fblt	%f0, %f2, fbgt_else.38079

	flw	%f3, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38081

	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38083

	flw	%f3, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38085

	flw	%f3, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38087

	flw	%f3, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38089

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38091

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38093

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38095

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38097

	flw	%f3, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38099

	flw	%f3, 482(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38101

	flw	%f3, 481(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f3, fbgt_else.38103

	flw	%f3, 480(%zero)
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
	j	fbgt_cont.38080

fbgt_else.38103:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38104:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38101:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38102:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38099:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38100:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38097:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38098:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38095:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38096:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38093:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38094:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38091:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38092:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38089:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38090:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38087:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38088:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38085:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38086:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38083:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38084:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38081:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.38082:
	nop
	nop
	nop
	j	fbgt_cont.38080

fbgt_else.38079:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.38080:
	flw	%f1, 5(%sp)
	flw	%f2, 6(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.38105

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38107

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
	j	fbgt_cont.38106

fbgt_else.38107:
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

fbgt_cont.38108:
	nop
	nop
	nop
	j	fbgt_cont.38106

fbgt_else.38105:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.38106:
	flw	%f1, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38109

	lw	%v0, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38111

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38110

bnei_else.38111:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.38112:
	nop
	nop
	nop
	j	fbgt_cont.38110

fbgt_else.38109:
	lw	%v0, 3(%sp)
	nop
	nop
	nop

fbgt_cont.38110:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38113

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.38114

fbgt_else.38113:
fbgt_cont.38114:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38115

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38116

fbgt_else.38115:
fbgt_cont.38116:
	flw	%f1, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38117

	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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
	j	fbgt_cont.38118

fbgt_else.38117:
	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
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

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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

fbgt_cont.38118:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38119

	nop
	nop
	nop
	j	bnei_cont.38120

bnei_else.38119:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.38120:
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

	flw	%f2, 474(%zero)
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

bnei_else.37998:
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
	fblt	%f0, %f2, fbgt_else.38122

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38123

fbgt_else.38122:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.38123:
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
	fblt	%f0, %f2, fbgt_else.38124

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38125

fbgt_else.38124:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38125:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38126

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38128

	flw	%f0, 451(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38127

bnei_else.38128:
	flw	%f0, 470(%zero)
	nop
	nop
	nop

bnei_cont.38129:
	nop
	nop
	nop
	j	bnei_cont.38127

bnei_else.38126:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38130

	flw	%f0, 470(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38131

bnei_else.38130:
	flw	%f0, 451(%zero)
	nop
	nop
	nop

bnei_cont.38131:
bnei_cont.38127:
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
	blti	%v0, 0, bgti_else.38143

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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38144

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38145

fbgt_else.38144:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38145:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38146

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38148

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38147

fbgt_else.38148:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38149:
	nop
	nop
	nop
	j	bnei_cont.38147

bnei_else.38146:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38147:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38150

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
	bne	%v0, %a0, beq_else.38152

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
	beqi	%v0, 0, bnei_else.38154

	nop
	nop
	nop
	j	bnei_cont.38151

bnei_else.38154:
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

	flw	%f3, 470(%zero)
	nop
	fmul	%f1, %f1, %f3
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.38156

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38157

fbgt_else.38156:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38157:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38158

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
	j	bnei_cont.38159

bnei_else.38158:
bnei_cont.38159:
	nop
	nop
	nop
	fblt	%f3, %f1, fbgt_else.38160

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38161

fbgt_else.38160:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38161:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38162

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
	j	bnei_cont.38163

bnei_else.38162:
bnei_cont.38163:
bnei_cont.38155:
	nop
	nop
	nop
	j	bnei_cont.38151

beq_else.38152:
beq_cont.38153:
	nop
	nop
	nop
	j	bnei_cont.38151

bnei_else.38150:
bnei_cont.38151:
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

bgti_else.38143:
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
	blt	%at, %v0, bgt_else.38198

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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38199

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38200

fbgt_else.38199:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38200:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38201

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38203

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38202

fbgt_else.38203:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38204:
	nop
	nop
	nop
	j	bnei_cont.38202

bnei_else.38201:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38202:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38205

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
	beqi	%a1, 1, bnei_else.38206

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.38208

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
	beqi	%a1, 0, bnei_else.38210

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

	flw	%f10, 473(%zero)
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
	j	bnei_cont.38211

bnei_else.38210:
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

bnei_cont.38211:
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

	flw	%f7, 470(%zero)
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
	fbne	%f4, %f7, fbeq_else.38212

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38213

fbeq_else.38212:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.38213:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38214

	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38215

bnei_else.38214:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38216

	flw	%f7, 468(%zero)
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
	j	bnei_cont.38217

bnei_else.38216:
	flw	%f7, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f7, %f4
	nop

bnei_cont.38217:
bnei_cont.38215:
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
	j	bnei_cont.38207

bnei_else.38208:
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

bnei_cont.38209:
	nop
	nop
	nop
	j	bnei_cont.38207

bnei_else.38206:
	lw	%a1, 136(%zero)
	flw	%f3, 470(%zero)
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
	fbne	%f4, %f3, fbeq_else.38218

	nop
	nop
	addi	%t0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38219

fbeq_else.38218:
	nop
	nop
	addi	%t0, %zero, 0
	nop

fbeq_cont.38219:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.38220

	nop
	nop
	nop
	j	bnei_cont.38221

bnei_else.38220:
	nop
	nop
	nop
	fblt	%f3, %f4, fbgt_else.38222

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38223

fbgt_else.38222:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.38223:
	nop
	nop
	nop
	beqi	%t0, 0, bnei_else.38224

	flw	%f3, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38225

bnei_else.38224:
	flw	%f3, 468(%zero)
	nop
	nop
	nop

bnei_cont.38225:
bnei_cont.38221:
	nop
	nop
	fneg	%f3, %f3
	nop

	fsw	%f3, 142(%a1)
	nop
	nop
	nop

bnei_cont.38207:
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
	flw	%f4, 473(%zero)
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
	fblt	%f3, %f4, fbgt_else.38226

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38227

fbgt_else.38226:
	nop
	nop
	addi	%a3, %zero, 1
	nop

fbgt_cont.38227:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.38228

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
	j	bnei_cont.38229

bnei_else.38228:
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

bnei_cont.38229:
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
	beqi	%v0, 0, bnei_else.38230

	nop
	nop
	nop
	j	bnei_cont.38231

bnei_else.38230:
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

	flw	%f2, 470(%zero)
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
	fblt	%f2, %f1, fbgt_else.38232

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38233

fbgt_else.38232:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38233:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38234

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
	j	bnei_cont.38235

bnei_else.38234:
bnei_cont.38235:
	nop
	nop
	nop
	fblt	%f2, %f0, fbgt_else.38236

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38237

fbgt_else.38236:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38237:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38238

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
	j	bnei_cont.38239

bnei_else.38238:
bnei_cont.38239:
bnei_cont.38231:
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
	fblt	%f0, %f1, fbgt_else.38240

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38241

fbgt_else.38240:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38241:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38242

	lw	%v0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 4, bgti_else.38243

	nop
	nop
	nop
	j	bgti_cont.38244

bgti_else.38243:
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

bgti_cont.38244:
	lw	%v1, 9(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 2, bnei_else.38245

	nop
	nop
	nop
	jr	%ra

bnei_else.38245:
	flw	%f0, 474(%zero)
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

bnei_else.38242:
	nop
	nop
	nop
	jr	%ra

bnei_else.38205:
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
	beqi	%v1, 0, bnei_else.38248

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

	flw	%f1, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.38249

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38250

fbgt_else.38249:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38250:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38251

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

bnei_else.38251:
	nop
	nop
	nop
	jr	%ra

bnei_else.38248:
	nop
	nop
	nop
	jr	%ra

bgt_else.38198:
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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38262

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38263

fbgt_else.38262:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38263:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38264

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38266

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38265

fbgt_else.38266:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38267:
	nop
	nop
	nop
	j	bnei_cont.38265

bnei_else.38264:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38265:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38268

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
	beqi	%a0, 1, bnei_else.38269

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38271

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
	beqi	%v1, 0, bnei_else.38273

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.38274

bnei_else.38273:
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

bnei_cont.38274:
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

	flw	%f4, 470(%zero)
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
	fbne	%f1, %f4, fbeq_else.38275

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38276

fbeq_else.38275:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38276:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38277

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38278

bnei_else.38277:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38279

	flw	%f4, 468(%zero)
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
	j	bnei_cont.38280

bnei_else.38279:
	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f4, %f1
	nop

bnei_cont.38280:
bnei_cont.38278:
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
	j	bnei_cont.38270

bnei_else.38271:
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

bnei_cont.38272:
	nop
	nop
	nop
	j	bnei_cont.38270

bnei_else.38269:
	lw	%a0, 136(%zero)
	flw	%f0, 470(%zero)
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
	fbne	%f1, %f0, fbeq_else.38281

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38282

fbeq_else.38281:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38282:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38283

	nop
	nop
	nop
	j	bnei_cont.38284

bnei_else.38283:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38285

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38286

fbgt_else.38285:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38286:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38287

	flw	%f0, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38288

bnei_else.38287:
	flw	%f0, 468(%zero)
	nop
	nop
	nop

bnei_cont.38288:
bnei_cont.38284:
	nop
	nop
	fneg	%f0, %f0
	nop

	fsw	%f0, 142(%a0)
	nop
	nop
	nop

bnei_cont.38270:
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
	beqi	%v0, 0, bnei_else.38289

	nop
	nop
	nop
	jr	%ra

bnei_else.38289:
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

	flw	%f1, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.38291

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38292

fbgt_else.38291:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38292:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38293

	nop
	nop
	nop
	j	bnei_cont.38294

bnei_else.38293:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38294:
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

bnei_else.38268:
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
	blti	%a1, 0, bgti_else.38583

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

	flw	%f2, 470(%zero)
	nop
	fadd	%f0, %f0, %f2
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.38584

	nop
	nop
	addi	%t0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38585

fbgt_else.38584:
	nop
	nop
	addi	%t0, %zero, 1
	nop

fbgt_cont.38585:
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
	beqi	%t0, 0, bnei_else.38586

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
	beqi	%t3, -1, bnei_else.38588

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.38590

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
	beqi	%t6, 1, bnei_else.38592

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.38594

	flw	%f8, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.38596

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38597

fbeq_else.38596:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.38597:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38598

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38593

bnei_else.38598:
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
	fblt	%f2, %f6, fbgt_else.38600

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38601

fbgt_else.38600:
	nop
	nop
	addi	%t5, %zero, 1
	nop

fbgt_cont.38601:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.38602

	lw	%t4, 6(%t4)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38604

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
	j	bnei_cont.38605

bnei_else.38604:
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

bnei_cont.38605:
	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.38603

bnei_else.38602:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38603:
bnei_cont.38599:
	nop
	nop
	nop
	j	bnei_cont.38593

bnei_else.38594:
	flw	%f5, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.38606

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38607

fbgt_else.38606:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38607:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38608

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
	j	bnei_cont.38609

bnei_else.38608:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38609:
bnei_cont.38595:
	nop
	nop
	nop
	j	bnei_cont.38593

bnei_else.38592:
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
	fblt	%f11, %f12, fbgt_else.38610

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38611

fbgt_else.38610:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38611:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38612

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
	fblt	%f11, %f13, fbgt_else.38614

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38615

fbgt_else.38614:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38615:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38616

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.38618

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38619

fbeq_else.38618:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.38619:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38620

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38613

bnei_else.38620:
	nop
	nop
	addi	%t6, %zero, 1
	nop

bnei_cont.38621:
	nop
	nop
	nop
	j	bnei_cont.38613

bnei_else.38616:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.38617:
	nop
	nop
	nop
	j	bnei_cont.38613

bnei_else.38612:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.38613:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38622

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
	j	bnei_cont.38623

bnei_else.38622:
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
	fblt	%f13, %f14, fbgt_else.38624

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38625

fbgt_else.38624:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38625:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38626

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
	fblt	%f13, %f15, fbgt_else.38628

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38629

fbgt_else.38628:
	nop
	nop
	addi	%t4, %zero, 1
	nop

fbgt_cont.38629:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38630

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.38632

	nop
	nop
	addi	%t4, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38633

fbeq_else.38632:
	nop
	nop
	addi	%t4, %zero, 0
	nop

fbeq_cont.38633:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38634

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38627

bnei_else.38634:
	nop
	nop
	addi	%t4, %zero, 1
	nop

bnei_cont.38635:
	nop
	nop
	nop
	j	bnei_cont.38627

bnei_else.38630:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.38631:
	nop
	nop
	nop
	j	bnei_cont.38627

bnei_else.38626:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.38627:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38636

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
	j	bnei_cont.38637

bnei_else.38636:
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
	fblt	%f5, %f14, fbgt_else.38638

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38639

fbgt_else.38638:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38639:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38640

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
	fblt	%f5, %f12, fbgt_else.38642

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38643

fbgt_else.38642:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38643:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38644

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.38646

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38647

fbeq_else.38646:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.38647:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38648

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38641

bnei_else.38648:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.38649:
	nop
	nop
	nop
	j	bnei_cont.38641

bnei_else.38644:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38645:
	nop
	nop
	nop
	j	bnei_cont.38641

bnei_else.38640:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38641:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38650

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
	j	bnei_cont.38651

bnei_else.38650:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38651:
bnei_cont.38637:
bnei_cont.38623:
bnei_cont.38593:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38652

	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.38654

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38655

fbgt_else.38654:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38655:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38656

	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.38658

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
	beqi	%v1, -1, bnei_else.38660

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
	beqi	%v1, -1, bnei_else.38662

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
	beqi	%v1, -1, bnei_else.38664

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
	j	bnei_cont.38591

bnei_else.38664:
bnei_cont.38665:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38662:
bnei_cont.38663:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38660:
bnei_cont.38661:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38658:
bnei_cont.38659:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38656:
bnei_cont.38657:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38652:
bnei_cont.38653:
	nop
	nop
	nop
	j	bnei_cont.38591

bnei_else.38590:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.38666

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
	beqi	%v1, -1, bnei_else.38668

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
	beqi	%v1, -1, bnei_else.38670

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
	beqi	%v1, -1, bnei_else.38672

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
	j	bnei_cont.38667

bnei_else.38672:
bnei_cont.38673:
	nop
	nop
	nop
	j	bnei_cont.38667

bnei_else.38670:
bnei_cont.38671:
	nop
	nop
	nop
	j	bnei_cont.38667

bnei_else.38668:
bnei_cont.38669:
	nop
	nop
	nop
	j	bnei_cont.38667

bnei_else.38666:
bnei_cont.38667:
bnei_cont.38591:
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
	j	bnei_cont.38589

bnei_else.38588:
bnei_cont.38589:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38674

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38675

fbgt_else.38674:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38675:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38676

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38678

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38677

fbgt_else.38678:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38679:
	nop
	nop
	nop
	j	bnei_cont.38677

bnei_else.38676:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38677:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38680

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
	beqi	%a0, 1, bnei_else.38682

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38684

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
	beqi	%v1, 0, bnei_else.38686

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

	flw	%f9, 473(%zero)
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
	j	bnei_cont.38687

bnei_else.38686:
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

bnei_cont.38687:
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
	fbne	%f1, %f4, fbeq_else.38688

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38689

fbeq_else.38688:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38689:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38690

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38691

bnei_else.38690:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38692

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38693

bnei_else.38692:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38693:
bnei_cont.38691:
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
	j	bnei_cont.38683

bnei_else.38684:
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

bnei_cont.38685:
	nop
	nop
	nop
	j	bnei_cont.38683

bnei_else.38682:
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
	fbne	%f1, %f0, fbeq_else.38694

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38695

fbeq_else.38694:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38695:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38696

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38697

bnei_else.38696:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38698

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38699

fbgt_else.38698:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38699:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38700

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38701

bnei_else.38700:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38701:
bnei_cont.38697:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38683:
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
	beqi	%v0, 0, bnei_else.38702

	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38702:
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
	fblt	%f1, %f0, fbgt_else.38704

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38705

fbgt_else.38704:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38705:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38706

	nop
	nop
	nop
	j	bnei_cont.38707

bnei_else.38706:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38707:
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

bnei_cont.38703:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38680:
bnei_cont.38681:
	nop
	nop
	nop
	j	bnei_cont.38587

bnei_else.38586:
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
	beqi	%t3, -1, bnei_else.38708

	sw	%t1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, 99, bnei_else.38710

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
	beqi	%t6, 1, bnei_else.38712

	nop
	nop
	nop
	beqi	%t6, 2, bnei_else.38714

	flw	%f8, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.38716

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38717

fbeq_else.38716:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.38717:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38718

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38713

bnei_else.38718:
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
	fblt	%f2, %f6, fbgt_else.38720

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38721

fbgt_else.38720:
	nop
	nop
	addi	%t5, %zero, 1
	nop

fbgt_cont.38721:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.38722

	lw	%t4, 6(%t4)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38724

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
	j	bnei_cont.38725

bnei_else.38724:
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

bnei_cont.38725:
	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	bnei_cont.38723

bnei_else.38722:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38723:
bnei_cont.38719:
	nop
	nop
	nop
	j	bnei_cont.38713

bnei_else.38714:
	flw	%f5, 0(%t3)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f2, fbgt_else.38726

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38727

fbgt_else.38726:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38727:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38728

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
	j	bnei_cont.38729

bnei_else.38728:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38729:
bnei_cont.38715:
	nop
	nop
	nop
	j	bnei_cont.38713

bnei_else.38712:
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
	fblt	%f11, %f12, fbgt_else.38730

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38731

fbgt_else.38730:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38731:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38732

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
	fblt	%f11, %f13, fbgt_else.38734

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38735

fbgt_else.38734:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38735:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38736

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.38738

	nop
	nop
	addi	%t6, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38739

fbeq_else.38738:
	nop
	nop
	addi	%t6, %zero, 0
	nop

fbeq_cont.38739:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38740

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38733

bnei_else.38740:
	nop
	nop
	addi	%t6, %zero, 1
	nop

bnei_cont.38741:
	nop
	nop
	nop
	j	bnei_cont.38733

bnei_else.38736:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.38737:
	nop
	nop
	nop
	j	bnei_cont.38733

bnei_else.38732:
	nop
	nop
	addi	%t6, %zero, 0
	nop

bnei_cont.38733:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38742

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
	j	bnei_cont.38743

bnei_else.38742:
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
	fblt	%f13, %f14, fbgt_else.38744

	nop
	nop
	addi	%t6, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38745

fbgt_else.38744:
	nop
	nop
	addi	%t6, %zero, 1
	nop

fbgt_cont.38745:
	nop
	nop
	nop
	beqi	%t6, 0, bnei_else.38746

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
	fblt	%f13, %f15, fbgt_else.38748

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38749

fbgt_else.38748:
	nop
	nop
	addi	%t4, %zero, 1
	nop

fbgt_cont.38749:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38750

	nop
	nop
	nop
	fbne	%f9, %f2, fbeq_else.38752

	nop
	nop
	addi	%t4, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38753

fbeq_else.38752:
	nop
	nop
	addi	%t4, %zero, 0
	nop

fbeq_cont.38753:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38754

	nop
	nop
	addi	%t4, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38747

bnei_else.38754:
	nop
	nop
	addi	%t4, %zero, 1
	nop

bnei_cont.38755:
	nop
	nop
	nop
	j	bnei_cont.38747

bnei_else.38750:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.38751:
	nop
	nop
	nop
	j	bnei_cont.38747

bnei_else.38746:
	nop
	nop
	addi	%t4, %zero, 0
	nop

bnei_cont.38747:
	nop
	nop
	nop
	beqi	%t4, 0, bnei_else.38756

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
	j	bnei_cont.38757

bnei_else.38756:
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
	fblt	%f5, %f14, fbgt_else.38758

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38759

fbgt_else.38758:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38759:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38760

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
	fblt	%f5, %f12, fbgt_else.38762

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38763

fbgt_else.38762:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38763:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38764

	nop
	nop
	nop
	fbne	%f8, %f2, fbeq_else.38766

	nop
	nop
	addi	%t3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38767

fbeq_else.38766:
	nop
	nop
	addi	%t3, %zero, 0
	nop

fbeq_cont.38767:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38768

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38761

bnei_else.38768:
	nop
	nop
	addi	%t3, %zero, 1
	nop

bnei_cont.38769:
	nop
	nop
	nop
	j	bnei_cont.38761

bnei_else.38764:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38765:
	nop
	nop
	nop
	j	bnei_cont.38761

bnei_else.38760:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38761:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38770

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
	j	bnei_cont.38771

bnei_else.38770:
	nop
	nop
	addi	%t3, %zero, 0
	nop

bnei_cont.38771:
bnei_cont.38757:
bnei_cont.38743:
bnei_cont.38713:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38772

	flw	%f5, 135(%zero)
	flw	%f6, 137(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.38774

	nop
	nop
	addi	%t3, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38775

fbgt_else.38774:
	nop
	nop
	addi	%t3, %zero, 1
	nop

fbgt_cont.38775:
	nop
	nop
	nop
	beqi	%t3, 0, bnei_else.38776

	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.38778

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
	beqi	%v1, -1, bnei_else.38780

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
	beqi	%v1, -1, bnei_else.38782

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
	beqi	%v1, -1, bnei_else.38784

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
	j	bnei_cont.38711

bnei_else.38784:
bnei_cont.38785:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38782:
bnei_cont.38783:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38780:
bnei_cont.38781:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38778:
bnei_cont.38779:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38776:
bnei_cont.38777:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38772:
bnei_cont.38773:
	nop
	nop
	nop
	j	bnei_cont.38711

bnei_else.38710:
	lw	%t3, 1(%t2)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%t3, -1, bnei_else.38786

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
	beqi	%v1, -1, bnei_else.38788

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
	beqi	%v1, -1, bnei_else.38790

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
	beqi	%v1, -1, bnei_else.38792

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
	j	bnei_cont.38787

bnei_else.38792:
bnei_cont.38793:
	nop
	nop
	nop
	j	bnei_cont.38787

bnei_else.38790:
bnei_cont.38791:
	nop
	nop
	nop
	j	bnei_cont.38787

bnei_else.38788:
bnei_cont.38789:
	nop
	nop
	nop
	j	bnei_cont.38787

bnei_else.38786:
bnei_cont.38787:
bnei_cont.38711:
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
	j	bnei_cont.38709

bnei_else.38708:
bnei_cont.38709:
	flw	%f0, 137(%zero)
	flw	%f1, 465(%zero)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38794

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38795

fbgt_else.38794:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38795:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38796

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38798

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38797

fbgt_else.38798:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38799:
	nop
	nop
	nop
	j	bnei_cont.38797

bnei_else.38796:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38797:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38800

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
	beqi	%a0, 1, bnei_else.38802

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38804

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
	beqi	%v1, 0, bnei_else.38806

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

	flw	%f9, 473(%zero)
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
	j	bnei_cont.38807

bnei_else.38806:
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

bnei_cont.38807:
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
	fbne	%f1, %f4, fbeq_else.38808

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38809

fbeq_else.38808:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38809:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38810

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38811

bnei_else.38810:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38812

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38813

bnei_else.38812:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38813:
bnei_cont.38811:
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
	j	bnei_cont.38803

bnei_else.38804:
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

bnei_cont.38805:
	nop
	nop
	nop
	j	bnei_cont.38803

bnei_else.38802:
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
	fbne	%f1, %f0, fbeq_else.38814

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38815

fbeq_else.38814:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38815:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38816

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38817

bnei_else.38816:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38818

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38819

fbgt_else.38818:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38819:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38820

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38821

bnei_else.38820:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38821:
bnei_cont.38817:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38803:
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
	beqi	%v0, 0, bnei_else.38822

	nop
	nop
	nop
	j	bnei_cont.38801

bnei_else.38822:
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
	fblt	%f1, %f0, fbgt_else.38824

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38825

fbgt_else.38824:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38825:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38826

	nop
	nop
	nop
	j	bnei_cont.38827

bnei_else.38826:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38827:
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

bnei_cont.38823:
	nop
	nop
	nop
	j	bnei_cont.38801

bnei_else.38800:
bnei_cont.38801:
bnei_cont.38587:
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
	blti	%v0, 0, bgti_else.38828

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
	fblt	%f0, %f1, fbgt_else.38829

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38830

fbgt_else.38829:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.38830:
	sw	%v0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.38831

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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -25
	nop

	lw	%ra, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38833

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38834

fbgt_else.38833:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38834:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38835

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38837

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38836

fbgt_else.38837:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38838:
	nop
	nop
	nop
	j	bnei_cont.38836

bnei_else.38835:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38836:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38839

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
	beqi	%a0, 1, bnei_else.38841

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38843

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
	beqi	%v1, 0, bnei_else.38845

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.38846

bnei_else.38845:
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

bnei_cont.38846:
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
	fbne	%f1, %f4, fbeq_else.38847

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38848

fbeq_else.38847:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38848:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38849

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38850

bnei_else.38849:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38851

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38852

bnei_else.38851:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38852:
bnei_cont.38850:
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
	j	bnei_cont.38842

bnei_else.38843:
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

bnei_cont.38844:
	nop
	nop
	nop
	j	bnei_cont.38842

bnei_else.38841:
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
	fbne	%f1, %f0, fbeq_else.38853

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38854

fbeq_else.38853:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38854:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38855

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38856

bnei_else.38855:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38857

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38858

fbgt_else.38857:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38858:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38859

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38860

bnei_else.38859:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38860:
bnei_cont.38856:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38842:
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
	beqi	%v0, 0, bnei_else.38861

	nop
	nop
	nop
	j	bnei_cont.38832

bnei_else.38861:
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
	fblt	%f1, %f0, fbgt_else.38863

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38864

fbgt_else.38863:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38864:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38865

	nop
	nop
	nop
	j	bnei_cont.38866

bnei_else.38865:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38866:
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

bnei_cont.38862:
	nop
	nop
	nop
	j	bnei_cont.38832

bnei_else.38839:
bnei_cont.38840:
	nop
	nop
	nop
	j	bnei_cont.38832

bnei_else.38831:
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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -29
	nop

	lw	%ra, 28(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38867

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38868

fbgt_else.38867:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38868:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38869

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38871

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38870

fbgt_else.38871:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38872:
	nop
	nop
	nop
	j	bnei_cont.38870

bnei_else.38869:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38870:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38873

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
	beqi	%a0, 1, bnei_else.38875

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38877

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
	beqi	%v1, 0, bnei_else.38879

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.38880

bnei_else.38879:
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

bnei_cont.38880:
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
	fbne	%f1, %f4, fbeq_else.38881

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38882

fbeq_else.38881:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38882:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38883

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38884

bnei_else.38883:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38885

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38886

bnei_else.38885:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38886:
bnei_cont.38884:
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
	j	bnei_cont.38876

bnei_else.38877:
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

bnei_cont.38878:
	nop
	nop
	nop
	j	bnei_cont.38876

bnei_else.38875:
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
	fbne	%f1, %f0, fbeq_else.38887

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38888

fbeq_else.38887:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38888:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38889

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38890

bnei_else.38889:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38891

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38892

fbgt_else.38891:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38892:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38893

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38894

bnei_else.38893:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38894:
bnei_cont.38890:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38876:
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
	beqi	%v0, 0, bnei_else.38895

	nop
	nop
	nop
	j	bnei_cont.38874

bnei_else.38895:
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
	fblt	%f1, %f0, fbgt_else.38897

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38898

fbgt_else.38897:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38898:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38899

	nop
	nop
	nop
	j	bnei_cont.38900

bnei_else.38899:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38900:
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

bnei_cont.38896:
	nop
	nop
	nop
	j	bnei_cont.38874

bnei_else.38873:
bnei_cont.38874:
bnei_cont.38832:
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

bgti_else.38828:
	nop
	nop
	nop
	jr	%ra

bgti_else.38583:
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

	flw	%f1, 470(%zero)
	nop
	fadd	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38926

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38927

fbgt_else.38926:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38927:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38928

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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -9
	nop

	lw	%ra, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38930

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38931

fbgt_else.38930:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38931:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38932

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38934

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38933

fbgt_else.38934:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38935:
	nop
	nop
	nop
	j	bnei_cont.38933

bnei_else.38932:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38933:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38936

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
	beqi	%a0, 1, bnei_else.38938

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38940

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
	beqi	%v1, 0, bnei_else.38942

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.38943

bnei_else.38942:
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

bnei_cont.38943:
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
	fbne	%f1, %f4, fbeq_else.38944

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38945

fbeq_else.38944:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38945:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38946

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38947

bnei_else.38946:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38948

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38949

bnei_else.38948:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38949:
bnei_cont.38947:
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
	j	bnei_cont.38939

bnei_else.38940:
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

bnei_cont.38941:
	nop
	nop
	nop
	j	bnei_cont.38939

bnei_else.38938:
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
	fbne	%f1, %f0, fbeq_else.38950

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38951

fbeq_else.38950:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38951:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38952

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38953

bnei_else.38952:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38954

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38955

fbgt_else.38954:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38955:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38956

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38957

bnei_else.38956:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38957:
bnei_cont.38953:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38939:
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
	beqi	%v0, 0, bnei_else.38958

	nop
	nop
	nop
	j	bnei_cont.38929

bnei_else.38958:
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
	fblt	%f1, %f0, fbgt_else.38960

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38961

fbgt_else.38960:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38961:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38962

	nop
	nop
	nop
	j	bnei_cont.38963

bnei_else.38962:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38963:
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

bnei_cont.38959:
	nop
	nop
	nop
	j	bnei_cont.38929

bnei_else.38936:
bnei_cont.38937:
	nop
	nop
	nop
	j	bnei_cont.38929

bnei_else.38928:
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
	flw	%f1, 465(%zero)
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.38964

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38965

fbgt_else.38964:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38965:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38966

	flw	%f1, 444(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38968

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.38967

fbgt_else.38968:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38969:
	nop
	nop
	nop
	j	bnei_cont.38967

bnei_else.38966:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bnei_cont.38967:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38970

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
	beqi	%a0, 1, bnei_else.38972

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.38974

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
	beqi	%v1, 0, bnei_else.38976

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

	flw	%f7, 473(%zero)
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
	j	bnei_cont.38977

bnei_else.38976:
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

bnei_cont.38977:
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
	fbne	%f1, %f4, fbeq_else.38978

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38979

fbeq_else.38978:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.38979:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.38980

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38981

bnei_else.38980:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38982

	flw	%f5, 468(%zero)
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
	j	bnei_cont.38983

bnei_else.38982:
	flw	%f5, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f1, %f5, %f1
	nop

bnei_cont.38983:
bnei_cont.38981:
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
	j	bnei_cont.38973

bnei_else.38974:
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

bnei_cont.38975:
	nop
	nop
	nop
	j	bnei_cont.38973

bnei_else.38972:
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
	fbne	%f1, %f0, fbeq_else.38984

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.38985

fbeq_else.38984:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.38985:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38986

	nop
	nop
	fmov	%f1, %f0
	nop

	nop
	nop
	nop
	j	bnei_cont.38987

bnei_else.38986:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.38988

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38989

fbgt_else.38988:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.38989:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.38990

	flw	%f1, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.38991

bnei_else.38990:
	flw	%f1, 468(%zero)
	nop
	nop
	nop

bnei_cont.38991:
bnei_cont.38987:
	nop
	nop
	fneg	%f1, %f1
	nop

	fsw	%f1, 142(%a0)
	nop
	nop
	nop

bnei_cont.38973:
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
	beqi	%v0, 0, bnei_else.38992

	nop
	nop
	nop
	j	bnei_cont.38971

bnei_else.38992:
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
	fblt	%f1, %f0, fbgt_else.38994

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.38995

fbgt_else.38994:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.38995:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.38996

	nop
	nop
	nop
	j	bnei_cont.38997

bnei_else.38996:
	nop
	nop
	fmov	%f0, %f1
	nop

bnei_cont.38997:
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

bnei_cont.38993:
	nop
	nop
	nop
	j	bnei_cont.38971

bnei_else.38970:
bnei_cont.38971:
bnei_cont.38929:
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
	blt	%at, %v1, bgt_else.39081

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
	blti	%a0, 0, bgti_else.39082

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
	beqi	%a0, 0, bnei_else.39083

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
	beqi	%a0, 0, bnei_else.39085

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
	j	bnei_cont.39086

bnei_else.39085:
bnei_cont.39086:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.39087

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
	j	bnei_cont.39088

bnei_else.39087:
bnei_cont.39088:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.39089

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
	j	bnei_cont.39090

bnei_else.39089:
bnei_cont.39090:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.39091

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
	j	bnei_cont.39092

bnei_else.39091:
bnei_cont.39092:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.39093

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
	j	bnei_cont.39094

bnei_else.39093:
bnei_cont.39094:
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
	j	bnei_cont.39084

bnei_else.39083:
bnei_cont.39084:
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
	blt	%at, %v0, bgt_else.39095

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
	blti	%a0, 0, bgti_else.39096

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
	beqi	%a0, 0, bnei_else.39097

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
	beqi	%a0, 0, bnei_else.39099

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
	j	bnei_cont.39100

bnei_else.39099:
bnei_cont.39100:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.39101

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
	j	bnei_cont.39102

bnei_else.39101:
bnei_cont.39102:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.39103

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
	j	bnei_cont.39104

bnei_else.39103:
bnei_cont.39104:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.39105

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
	j	bnei_cont.39106

bnei_else.39105:
bnei_cont.39106:
	lw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.39107

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
	j	bnei_cont.39108

bnei_else.39107:
bnei_cont.39108:
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
	j	bnei_cont.39098

bnei_else.39097:
bnei_cont.39098:
	lw	%v0, 0(%sp)
	nop
	addi	%v1, %v0, 1
	nop

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.39096:
	nop
	nop
	nop
	jr	%ra

bgt_else.39095:
	nop
	nop
	nop
	jr	%ra

bgti_else.39082:
	nop
	nop
	nop
	jr	%ra

bgt_else.39081:
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
	blt	%at, %a3, bgt_else.39146

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
	blti	%t1, 0, bgti_else.39147

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
	bne	%t3, %t1, beq_else.39148

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
	bne	%t3, %t1, beq_else.39150

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
	bne	%t3, %t1, beq_else.39152

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
	bne	%t3, %t1, beq_else.39154

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.39149

beq_else.39154:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39155:
	nop
	nop
	nop
	j	beq_cont.39149

beq_else.39152:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39153:
	nop
	nop
	nop
	j	beq_cont.39149

beq_else.39150:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39151:
	nop
	nop
	nop
	j	beq_cont.39149

beq_else.39148:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39149:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.39156

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
	beqi	%t1, 0, bnei_else.39157

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
	j	bnei_cont.39158

bnei_else.39157:
bnei_cont.39158:
	nop
	nop
	addi	%a3, %a3, 1
	addi	%at, %zero, 4

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.39159

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
	blti	%t1, 0, bgti_else.39160

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
	bne	%t3, %t1, beq_else.39161

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
	bne	%t3, %t1, beq_else.39163

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
	bne	%t3, %t1, beq_else.39165

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
	bne	%t3, %t1, beq_else.39167

	nop
	nop
	addi	%t1, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.39162

beq_else.39167:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39168:
	nop
	nop
	nop
	j	beq_cont.39162

beq_else.39165:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39166:
	nop
	nop
	nop
	j	beq_cont.39162

beq_else.39163:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39164:
	nop
	nop
	nop
	j	beq_cont.39162

beq_else.39161:
	nop
	nop
	addi	%t1, %zero, 0
	nop

beq_cont.39162:
	nop
	nop
	nop
	beqi	%t1, 0, bnei_else.39169

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
	beqi	%t1, 0, bnei_else.39170

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
	j	bnei_cont.39171

bnei_else.39170:
bnei_cont.39171:
	nop
	nop
	addi	%a3, %a3, 1
	nop

	nop
	nop
	nop
	j	try_exploit_neighbors.3018

bnei_else.39169:
	nop
	nop
	addi	%v1, %a3, 0
	addi	%v0, %t0, 0

	nop
	nop
	nop
	j	do_without_neighbors.3002

bgti_else.39160:
	nop
	nop
	nop
	jr	%ra

bgt_else.39159:
	nop
	nop
	nop
	jr	%ra

bnei_else.39156:
	nop
	nop
	addi	%at, %zero, 4
	nop

	nop
	nop
	nop
	blt	%at, %a3, bgt_else.39174

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
	blti	%v0, 0, bgti_else.39175

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
	beqi	%v0, 0, bnei_else.39176

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
	beqi	%v0, 0, bnei_else.39178

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
	j	bnei_cont.39179

bnei_else.39178:
bnei_cont.39179:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.39180

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
	j	bnei_cont.39181

bnei_else.39180:
bnei_cont.39181:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.39182

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
	j	bnei_cont.39183

bnei_else.39182:
bnei_cont.39183:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.39184

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
	j	bnei_cont.39185

bnei_else.39184:
bnei_cont.39185:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.39186

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
	j	bnei_cont.39187

bnei_else.39186:
bnei_cont.39187:
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
	j	bnei_cont.39177

bnei_else.39176:
bnei_cont.39177:
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

bgti_else.39175:
	nop
	nop
	nop
	jr	%ra

bgt_else.39174:
	nop
	nop
	nop
	jr	%ra

bgti_else.39147:
	nop
	nop
	nop
	jr	%ra

bgt_else.39146:
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
	blt	%at, %v1, bgt_else.39212

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
	blti	%a0, 0, bgti_else.39213

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
	beqi	%a0, 0, bnei_else.39214

	lw	%a0, 6(%v0)
	flw	%f0, 470(%zero)
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
	j	bnei_cont.39215

bnei_else.39214:
bnei_cont.39215:
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
	blt	%at, %v1, bgt_else.39216

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
	blti	%a0, 0, bgti_else.39217

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
	beqi	%a0, 0, bnei_else.39218

	lw	%a0, 6(%v0)
	flw	%f0, 470(%zero)
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
	fblt	%f0, %f1, fbgt_else.39220

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.39221

fbgt_else.39220:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.39221:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39222

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
	j	bnei_cont.39223

bnei_else.39222:
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

bnei_cont.39223:
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
	j	bnei_cont.39219

bnei_else.39218:
bnei_cont.39219:
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

bgti_else.39217:
	nop
	nop
	nop
	jr	%ra

bgt_else.39216:
	nop
	nop
	nop
	jr	%ra

bgti_else.39213:
	nop
	nop
	nop
	jr	%ra

bgt_else.39212:
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
	blti	%v1, 0, bgti_else.39252

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

	flw	%f7, 470(%zero)
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
	fbne	%f4, %f7, fbeq_else.39253

	nop
	nop
	addi	%a3, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.39254

fbeq_else.39253:
	nop
	nop
	addi	%a3, %zero, 0
	nop

fbeq_cont.39254:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.39255

	flw	%f4, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.39256

bnei_else.39255:
	flw	%f8, 474(%zero)
	nop
	nop
	nop

	nop
	nop
	fdiv	%f4, %f8, %f4
	nop

bnei_cont.39256:
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

	flw	%f3, 474(%zero)
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
	blti	%v1, 0, bgti_else.39257

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
	beqi	%v1, 0, bnei_else.39259

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
	fblt	%f0, %f1, fbgt_else.39261

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.39262

fbgt_else.39261:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.39262:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.39263

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
	j	bnei_cont.39264

bnei_else.39263:
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

bnei_cont.39264:
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
	j	bnei_cont.39260

bnei_else.39259:
bnei_cont.39260:
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
	j	bgti_cont.39258

bgti_else.39257:
bgti_cont.39258:
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
	blti	%v0, 5, bgti_else.39265

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.39266

bgti_else.39265:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.39266:
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

bgti_else.39252:
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
	blt	%v0, %t0, bgt_else.40952

	nop
	nop
	nop
	jr	%ra

bgt_else.40952:
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
	blt	%t4, %t2, bgt_else.40954

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.40955

bgt_else.40954:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.40956

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.40957

bgt_else.40956:
	nop
	nop
	addi	%t5, %v0, 1
	nop

	nop
	nop
	nop
	blt	%t5, %t0, bgt_else.40958

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.40959

bgt_else.40958:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.40960

	nop
	nop
	addi	%t5, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.40961

bgt_else.40960:
	nop
	nop
	addi	%t5, %zero, 1
	nop

bgt_cont.40961:
bgt_cont.40959:
bgt_cont.40957:
bgt_cont.40955:
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
	beqi	%t5, 0, bnei_else.40962

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
	blti	%t5, 0, bgti_else.40964

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
	bne	%t7, %t5, beq_else.40966

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
	bne	%t7, %t5, beq_else.40968

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
	bne	%t7, %t5, beq_else.40970

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
	bne	%t7, %t5, beq_else.40972

	nop
	nop
	addi	%t5, %zero, 1
	nop

	nop
	nop
	nop
	j	beq_cont.40967

beq_else.40972:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.40973:
	nop
	nop
	nop
	j	beq_cont.40967

beq_else.40970:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.40971:
	nop
	nop
	nop
	j	beq_cont.40967

beq_else.40968:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.40969:
	nop
	nop
	nop
	j	beq_cont.40967

beq_else.40966:
	nop
	nop
	addi	%t5, %zero, 0
	nop

beq_cont.40967:
	nop
	nop
	nop
	beqi	%t5, 0, bnei_else.40974

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
	beqi	%t5, 0, bnei_else.40976

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
	j	bnei_cont.40977

bnei_else.40976:
bnei_cont.40977:
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
	j	bnei_cont.40963

bnei_else.40974:
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

bnei_cont.40975:
	nop
	nop
	nop
	j	bnei_cont.40963

bgti_else.40964:
bgti_cont.40965:
	nop
	nop
	nop
	j	bnei_cont.40963

bnei_else.40962:
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
	blti	%t5, 0, bgti_else.40978

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
	beqi	%t5, 0, bnei_else.40980

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
	beqi	%t5, 0, bnei_else.40982

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
	j	bnei_cont.40983

bnei_else.40982:
bnei_cont.40983:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 1, bnei_else.40984

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
	j	bnei_cont.40985

bnei_else.40984:
bnei_cont.40985:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 2, bnei_else.40986

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
	j	bnei_cont.40987

bnei_else.40986:
bnei_cont.40987:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 3, bnei_else.40988

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
	j	bnei_cont.40989

bnei_else.40988:
bnei_cont.40989:
	lw	%v0, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 4, bnei_else.40990

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
	j	bnei_cont.40991

bnei_else.40990:
bnei_cont.40991:
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
	j	bnei_cont.40981

bnei_else.40980:
bnei_cont.40981:
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
	j	bgti_cont.40979

bgti_else.40978:
bgti_cont.40979:
bnei_cont.40963:
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
	blt	%at, %v0, bgt_else.40992

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.40994

	nop
	nop
	nop
	j	bgt_cont.40993

bgti_else.40994:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.40995:
	nop
	nop
	nop
	j	bgt_cont.40993

bgt_else.40992:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.40993:
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
	blti	%v0, 10, bgti_else.40996

	nop
	nop
	addi	%a0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.40998

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41000

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41002

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
	j	bgti_cont.40997

bgti_else.41002:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41003:
	nop
	nop
	nop
	j	bgti_cont.40997

bgti_else.41000:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41001:
	nop
	nop
	nop
	j	bgti_cont.40997

bgti_else.40998:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.40999:
	nop
	nop
	nop
	j	bgti_cont.40997

bgti_else.40996:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.40997:
	lw	%v1, 16(%sp)
	sw	%v0, 17(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41004

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41006

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41008

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41010

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41012

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41014

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41016

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41018

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41020

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41022

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41024

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41026

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
	j	bgti_cont.41005

bgti_else.41026:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41027:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41024:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41025:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41022:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41023:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41020:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41021:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41018:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41019:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41016:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41017:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41014:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41015:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41012:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41013:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41010:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41011:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41008:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41009:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41006:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41007:
	nop
	nop
	nop
	j	bgti_cont.41005

bgti_else.41004:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41005:
	lw	%v1, 17(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41028

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
	j	bgt_cont.41029

bgt_else.41028:
	sw	%v0, 18(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41030

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41032

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41034

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41036

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
	j	bgti_cont.41031

bgti_else.41036:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41037:
	nop
	nop
	nop
	j	bgti_cont.41031

bgti_else.41034:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41035:
	nop
	nop
	nop
	j	bgti_cont.41031

bgti_else.41032:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41033:
	nop
	nop
	nop
	j	bgti_cont.41031

bgti_else.41030:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41031:
	lw	%v1, 17(%sp)
	sw	%v0, 19(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41038

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41040

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41042

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41044

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41046

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41048

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41050

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41052

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41054

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41056

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41058

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41060

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
	j	bgti_cont.41039

bgti_else.41060:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41061:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41058:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41059:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41056:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41057:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41054:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41055:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41052:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41053:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41050:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41051:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41048:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41049:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41046:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41047:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41044:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41045:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41042:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41043:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41040:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41041:
	nop
	nop
	nop
	j	bgti_cont.41039

bgti_else.41038:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41039:
	lw	%v1, 19(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41062

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
	j	bgt_cont.41063

bgt_else.41062:
	sw	%v0, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41064

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41066

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41068

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41070

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41072

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41074

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41076

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41078

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41080

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41082

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41084

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41086

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
	j	bgti_cont.41065

bgti_else.41086:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41087:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41084:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41085:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41082:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41083:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41080:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41081:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41078:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41079:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41076:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41077:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41074:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41075:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41072:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41073:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41070:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41071:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41068:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41069:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41066:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41067:
	nop
	nop
	nop
	j	bgti_cont.41065

bgti_else.41064:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41065:
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

bgt_cont.41063:
bgt_cont.41029:
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
	blt	%at, %v0, bgt_else.41088

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.41090

	nop
	nop
	nop
	j	bgt_cont.41089

bgti_else.41090:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41091:
	nop
	nop
	nop
	j	bgt_cont.41089

bgt_else.41088:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.41089:
	sw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41092

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41094

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41096

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41098

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
	j	bgti_cont.41093

bgti_else.41098:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41099:
	nop
	nop
	nop
	j	bgti_cont.41093

bgti_else.41096:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41097:
	nop
	nop
	nop
	j	bgti_cont.41093

bgti_else.41094:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41095:
	nop
	nop
	nop
	j	bgti_cont.41093

bgti_else.41092:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41093:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41100

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41102

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41104

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41106

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41108

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41110

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41112

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41114

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41116

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41118

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41120

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41122

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
	j	bgti_cont.41101

bgti_else.41122:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41123:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41120:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41121:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41118:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41119:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41116:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41117:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41114:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41115:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41112:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41113:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41110:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41111:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41108:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41109:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41106:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41107:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41104:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41105:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41102:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41103:
	nop
	nop
	nop
	j	bgti_cont.41101

bgti_else.41100:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41101:
	lw	%v1, 23(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41124

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
	j	bgt_cont.41125

bgt_else.41124:
	sw	%v0, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41126

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41128

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41130

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41132

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
	j	bgti_cont.41127

bgti_else.41132:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41133:
	nop
	nop
	nop
	j	bgti_cont.41127

bgti_else.41130:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41131:
	nop
	nop
	nop
	j	bgti_cont.41127

bgti_else.41128:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41129:
	nop
	nop
	nop
	j	bgti_cont.41127

bgti_else.41126:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41127:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41134

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41136

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41138

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41140

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41142

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41144

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41146

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41148

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41150

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41152

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41154

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41156

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
	j	bgti_cont.41135

bgti_else.41156:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41157:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41154:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41155:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41152:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41153:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41150:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41151:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41148:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41149:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41146:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41147:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41144:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41145:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41142:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41143:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41140:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41141:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41138:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41139:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41136:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41137:
	nop
	nop
	nop
	j	bgti_cont.41135

bgti_else.41134:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41135:
	lw	%v1, 25(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41158

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
	j	bgt_cont.41159

bgt_else.41158:
	sw	%v0, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41160

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41162

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41164

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41166

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41168

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41170

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41172

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41174

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41176

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41178

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41180

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41182

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
	j	bgti_cont.41161

bgti_else.41182:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41183:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41180:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41181:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41178:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41179:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41176:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41177:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41174:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41175:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41172:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41173:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41170:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41171:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41168:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41169:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41166:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41167:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41164:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41165:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41162:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41163:
	nop
	nop
	nop
	j	bgti_cont.41161

bgti_else.41160:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41161:
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

bgt_cont.41159:
bgt_cont.41125:
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
	blt	%at, %v0, bgt_else.41184

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.41186

	nop
	nop
	nop
	j	bgt_cont.41185

bgti_else.41186:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41187:
	nop
	nop
	nop
	j	bgt_cont.41185

bgt_else.41184:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.41185:
	sw	%v0, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41188

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41190

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41192

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41194

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
	j	bgti_cont.41189

bgti_else.41194:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41195:
	nop
	nop
	nop
	j	bgti_cont.41189

bgti_else.41192:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41193:
	nop
	nop
	nop
	j	bgti_cont.41189

bgti_else.41190:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41191:
	nop
	nop
	nop
	j	bgti_cont.41189

bgti_else.41188:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41189:
	lw	%v1, 27(%sp)
	sw	%v0, 28(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41196

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41198

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41200

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41202

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41204

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41206

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41208

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41210

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41212

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41214

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41216

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41218

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
	j	bgti_cont.41197

bgti_else.41218:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41219:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41216:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41217:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41214:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41215:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41212:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41213:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41210:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41211:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41208:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41209:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41206:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41207:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41204:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41205:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41202:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41203:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41200:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41201:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41198:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41199:
	nop
	nop
	nop
	j	bgti_cont.41197

bgti_else.41196:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41197:
	lw	%v1, 28(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41220

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
	j	bgt_cont.41221

bgt_else.41220:
	sw	%v0, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41222

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41224

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41226

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41228

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
	j	bgti_cont.41223

bgti_else.41228:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.41229:
	nop
	nop
	nop
	j	bgti_cont.41223

bgti_else.41226:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41227:
	nop
	nop
	nop
	j	bgti_cont.41223

bgti_else.41224:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41225:
	nop
	nop
	nop
	j	bgti_cont.41223

bgti_else.41222:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41223:
	lw	%v1, 28(%sp)
	sw	%v0, 30(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41230

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41232

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41234

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41236

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41238

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41240

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41242

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41244

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41246

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41248

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41250

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41252

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
	j	bgti_cont.41231

bgti_else.41252:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41253:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41250:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41251:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41248:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41249:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41246:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41247:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41244:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41245:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41242:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41243:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41240:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41241:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41238:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41239:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41236:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41237:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41234:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41235:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41232:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41233:
	nop
	nop
	nop
	j	bgti_cont.41231

bgti_else.41230:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41231:
	lw	%v1, 30(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41254

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
	j	bgt_cont.41255

bgt_else.41254:
	sw	%v0, 31(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41256

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41258

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41260

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41262

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41264

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41266

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41268

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41270

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41272

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41274

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41276

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41278

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
	j	bgti_cont.41257

bgti_else.41278:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41279:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41276:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41277:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41274:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41275:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41272:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41273:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41270:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41271:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41268:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41269:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41266:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41267:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41264:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41265:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41262:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41263:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41260:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41261:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41258:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41259:
	nop
	nop
	nop
	j	bgti_cont.41257

bgti_else.41256:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41257:
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

bgt_cont.41255:
bgt_cont.41221:
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
	blt	%v0, %v1, bgt_else.41280

	nop
	nop
	nop
	jr	%ra

bgt_else.41280:
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
	blt	%a2, %a3, bgt_else.41282

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.41283

bgt_else.41282:
	lw	%a2, 3(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.41284

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.41285

bgt_else.41284:
	nop
	nop
	addi	%a3, %v0, 1
	nop

	nop
	nop
	nop
	blt	%a3, %v1, bgt_else.41286

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.41287

bgt_else.41286:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.41288

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.41289

bgt_else.41288:
	nop
	nop
	addi	%v1, %zero, 1
	nop

bgt_cont.41289:
bgt_cont.41287:
bgt_cont.41285:
bgt_cont.41283:
	sw	%v0, 32(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.41290

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
	j	bnei_cont.41291

bnei_else.41290:
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

bnei_cont.41291:
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
	blt	%at, %v0, bgt_else.41292

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.41294

	nop
	nop
	nop
	j	bgt_cont.41293

bgti_else.41294:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41295:
	nop
	nop
	nop
	j	bgt_cont.41293

bgt_else.41292:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.41293:
	sw	%v0, 33(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41296

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41298

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41300

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
	j	bgti_cont.41297

bgti_else.41300:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41301:
	nop
	nop
	nop
	j	bgti_cont.41297

bgti_else.41298:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41299:
	nop
	nop
	nop
	j	bgti_cont.41297

bgti_else.41296:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41297:
	lw	%v1, 33(%sp)
	sw	%v0, 34(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41302

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41304

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41306

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41308

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41310

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41312

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41314

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41316

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41318

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41320

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41322

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
	j	bgti_cont.41303

bgti_else.41322:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41323:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41320:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41321:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41318:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41319:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41316:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41317:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41314:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41315:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41312:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41313:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41310:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41311:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41308:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41309:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41306:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41307:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41304:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41305:
	nop
	nop
	nop
	j	bgti_cont.41303

bgti_else.41302:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41303:
	lw	%v1, 34(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41324

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
	j	bgt_cont.41325

bgt_else.41324:
	sw	%v0, 35(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41326

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41328

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41330

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
	j	bgti_cont.41327

bgti_else.41330:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41331:
	nop
	nop
	nop
	j	bgti_cont.41327

bgti_else.41328:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41329:
	nop
	nop
	nop
	j	bgti_cont.41327

bgti_else.41326:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41327:
	lw	%v1, 34(%sp)
	sw	%v0, 36(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41332

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41334

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41336

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41338

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41340

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41342

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41344

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41346

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41348

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41350

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41352

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
	j	bgti_cont.41333

bgti_else.41352:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41353:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41350:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41351:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41348:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41349:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41346:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41347:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41344:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41345:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41342:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41343:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41340:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41341:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41338:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41339:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41336:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41337:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41334:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41335:
	nop
	nop
	nop
	j	bgti_cont.41333

bgti_else.41332:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41333:
	lw	%v1, 36(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41354

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
	j	bgt_cont.41355

bgt_else.41354:
	sw	%v0, 37(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41356

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41358

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41360

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41362

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41364

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41366

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41368

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41370

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41372

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41374

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41376

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
	j	bgti_cont.41357

bgti_else.41376:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41377:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41374:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41375:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41372:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41373:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41370:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41371:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41368:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41369:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41366:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41367:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41364:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41365:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41362:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41363:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41360:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41361:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41358:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41359:
	nop
	nop
	nop
	j	bgti_cont.41357

bgti_else.41356:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41357:
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

bgt_cont.41355:
bgt_cont.41325:
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
	blt	%at, %v0, bgt_else.41378

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.41380

	nop
	nop
	nop
	j	bgt_cont.41379

bgti_else.41380:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41381:
	nop
	nop
	nop
	j	bgt_cont.41379

bgt_else.41378:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.41379:
	sw	%v0, 38(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41382

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41384

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41386

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
	j	bgti_cont.41383

bgti_else.41386:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41387:
	nop
	nop
	nop
	j	bgti_cont.41383

bgti_else.41384:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41385:
	nop
	nop
	nop
	j	bgti_cont.41383

bgti_else.41382:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41383:
	lw	%v1, 38(%sp)
	sw	%v0, 39(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41388

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41390

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41392

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41394

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41396

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41398

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41400

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41402

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41404

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41406

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41408

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
	j	bgti_cont.41389

bgti_else.41408:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41409:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41406:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41407:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41404:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41405:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41402:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41403:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41400:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41401:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41398:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41399:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41396:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41397:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41394:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41395:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41392:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41393:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41390:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41391:
	nop
	nop
	nop
	j	bgti_cont.41389

bgti_else.41388:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41389:
	lw	%v1, 39(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41410

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
	j	bgt_cont.41411

bgt_else.41410:
	sw	%v0, 40(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41412

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41414

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41416

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
	j	bgti_cont.41413

bgti_else.41416:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41417:
	nop
	nop
	nop
	j	bgti_cont.41413

bgti_else.41414:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41415:
	nop
	nop
	nop
	j	bgti_cont.41413

bgti_else.41412:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41413:
	lw	%v1, 39(%sp)
	sw	%v0, 41(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41418

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41420

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41422

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41424

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41426

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41428

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41430

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41432

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41434

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41436

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41438

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
	j	bgti_cont.41419

bgti_else.41438:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41439:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41436:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41437:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41434:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41435:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41432:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41433:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41430:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41431:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41428:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41429:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41426:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41427:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41424:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41425:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41422:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41423:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41420:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41421:
	nop
	nop
	nop
	j	bgti_cont.41419

bgti_else.41418:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41419:
	lw	%v1, 41(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41440

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
	j	bgt_cont.41441

bgt_else.41440:
	sw	%v0, 42(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41442

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41444

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41446

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41448

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41450

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41452

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41454

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41456

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41458

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41460

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41462

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
	j	bgti_cont.41443

bgti_else.41462:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41463:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41460:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41461:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41458:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41459:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41456:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41457:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41454:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41455:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41452:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41453:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41450:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41451:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41448:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41449:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41446:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41447:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41444:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41445:
	nop
	nop
	nop
	j	bgti_cont.41443

bgti_else.41442:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41443:
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

bgt_cont.41441:
bgt_cont.41411:
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
	blt	%at, %v0, bgt_else.41464

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.41466

	nop
	nop
	nop
	j	bgt_cont.41465

bgti_else.41466:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41467:
	nop
	nop
	nop
	j	bgt_cont.41465

bgt_else.41464:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.41465:
	sw	%v0, 43(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.41468

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41470

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41472

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
	j	bgti_cont.41469

bgti_else.41472:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41473:
	nop
	nop
	nop
	j	bgti_cont.41469

bgti_else.41470:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41471:
	nop
	nop
	nop
	j	bgti_cont.41469

bgti_else.41468:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41469:
	lw	%v1, 43(%sp)
	sw	%v0, 44(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41474

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41476

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41478

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41480

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41482

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41484

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41486

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41488

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41490

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41492

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41494

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
	j	bgti_cont.41475

bgti_else.41494:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41495:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41492:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41493:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41490:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41491:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41488:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41489:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41486:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41487:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41484:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41485:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41482:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41483:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41480:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41481:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41478:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41479:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41476:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41477:
	nop
	nop
	nop
	j	bgti_cont.41475

bgti_else.41474:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41475:
	lw	%v1, 44(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41496

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
	j	bgt_cont.41497

bgt_else.41496:
	sw	%v0, 45(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41498

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41500

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.41502

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
	j	bgti_cont.41499

bgti_else.41502:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.41503:
	nop
	nop
	nop
	j	bgti_cont.41499

bgti_else.41500:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.41501:
	nop
	nop
	nop
	j	bgti_cont.41499

bgti_else.41498:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.41499:
	lw	%v1, 44(%sp)
	sw	%v0, 46(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41504

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41506

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41508

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41510

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41512

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41514

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41516

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41518

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41520

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41522

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41524

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
	j	bgti_cont.41505

bgti_else.41524:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41525:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41522:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41523:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41520:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41521:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41518:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41519:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41516:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41517:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41514:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41515:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41512:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41513:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41510:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41511:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41508:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41509:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41506:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41507:
	nop
	nop
	nop
	j	bgti_cont.41505

bgti_else.41504:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41505:
	lw	%v1, 46(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.41526

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
	j	bgt_cont.41527

bgt_else.41526:
	sw	%v0, 47(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41528

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41530

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41532

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41534

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41536

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41538

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41540

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41542

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41544

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41546

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.41548

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
	j	bgti_cont.41529

bgti_else.41548:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41549:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41546:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41547:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41544:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41545:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41542:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41543:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41540:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41541:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41538:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41539:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41536:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41537:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41534:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41535:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41532:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41533:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41530:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41531:
	nop
	nop
	nop
	j	bgti_cont.41529

bgti_else.41528:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.41529:
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

bgt_cont.41527:
bgt_cont.41497:
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
	blt	%v0, %t0, bgt_else.42114

	nop
	nop
	nop
	jr	%ra

bgt_else.42114:
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
	blt	%v0, %t1, bgt_else.42116

	nop
	nop
	nop
	j	bgt_cont.42117

bgt_else.42116:
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

bgt_cont.42117:
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
	blt	%at, %v0, bgt_else.42118

	nop
	nop
	nop
	j	bgt_cont.42119

bgt_else.42118:
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
	blt	%a3, %t0, bgt_else.42120

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.42121

bgt_else.42120:
	nop
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %a2, bgt_else.42122

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.42123

bgt_else.42122:
	nop
	nop
	addi	%at, %zero, 1
	nop

	nop
	nop
	nop
	blt	%at, %v0, bgt_else.42124

	nop
	nop
	addi	%a3, %zero, 0
	nop

	nop
	nop
	nop
	j	bgt_cont.42125

bgt_else.42124:
	nop
	nop
	addi	%a3, %zero, 0
	nop

bgt_cont.42125:
bgt_cont.42123:
bgt_cont.42121:
	nop
	nop
	nop
	beqi	%a3, 0, bnei_else.42126

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
	j	bnei_cont.42127

bnei_else.42126:
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

bnei_cont.42127:
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
	blt	%at, %v0, bgt_else.42128

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.42130

	nop
	nop
	nop
	j	bgt_cont.42129

bgti_else.42130:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42131:
	nop
	nop
	nop
	j	bgt_cont.42129

bgt_else.42128:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.42129:
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
	blti	%v0, 10, bgti_else.42132

	nop
	nop
	addi	%a0, %v0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42134

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42136

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
	j	bgti_cont.42133

bgti_else.42136:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42137:
	nop
	nop
	nop
	j	bgti_cont.42133

bgti_else.42134:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42135:
	nop
	nop
	nop
	j	bgti_cont.42133

bgti_else.42132:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42133:
	lw	%v1, 11(%sp)
	sw	%v0, 12(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42138

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42140

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42142

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42144

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42146

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42148

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42150

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42152

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42154

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42156

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42158

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
	j	bgti_cont.42139

bgti_else.42158:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42159:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42156:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42157:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42154:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42155:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42152:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42153:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42150:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42151:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42148:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42149:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42146:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42147:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42144:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42145:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42142:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42143:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42140:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42141:
	nop
	nop
	nop
	j	bgti_cont.42139

bgti_else.42138:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42139:
	lw	%v1, 12(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42160

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
	j	bgt_cont.42161

bgt_else.42160:
	sw	%v0, 13(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42162

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42164

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42166

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
	j	bgti_cont.42163

bgti_else.42166:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42167:
	nop
	nop
	nop
	j	bgti_cont.42163

bgti_else.42164:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42165:
	nop
	nop
	nop
	j	bgti_cont.42163

bgti_else.42162:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42163:
	lw	%v1, 12(%sp)
	sw	%v0, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42168

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42170

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42172

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42174

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42176

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42178

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42180

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42182

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42184

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42186

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42188

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
	j	bgti_cont.42169

bgti_else.42188:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42189:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42186:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42187:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42184:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42185:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42182:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42183:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42180:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42181:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42178:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42179:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42176:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42177:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42174:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42175:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42172:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42173:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42170:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42171:
	nop
	nop
	nop
	j	bgti_cont.42169

bgti_else.42168:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42169:
	lw	%v1, 14(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42190

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
	j	bgt_cont.42191

bgt_else.42190:
	sw	%v0, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42192

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42194

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42196

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42198

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42200

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42202

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42204

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42206

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42208

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42210

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42212

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
	j	bgti_cont.42193

bgti_else.42212:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42213:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42210:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42211:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42208:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42209:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42206:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42207:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42204:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42205:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42202:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42203:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42200:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42201:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42198:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42199:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42196:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42197:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42194:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42195:
	nop
	nop
	nop
	j	bgti_cont.42193

bgti_else.42192:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42193:
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

bgt_cont.42191:
bgt_cont.42161:
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
	blt	%at, %v0, bgt_else.42214

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.42216

	nop
	nop
	nop
	j	bgt_cont.42215

bgti_else.42216:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42217:
	nop
	nop
	nop
	j	bgt_cont.42215

bgt_else.42214:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.42215:
	sw	%v0, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.42218

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42220

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42222

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
	j	bgti_cont.42219

bgti_else.42222:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42223:
	nop
	nop
	nop
	j	bgti_cont.42219

bgti_else.42220:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42221:
	nop
	nop
	nop
	j	bgti_cont.42219

bgti_else.42218:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42219:
	lw	%v1, 17(%sp)
	sw	%v0, 18(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42224

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42226

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42228

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42230

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42232

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42234

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42236

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42238

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42240

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42242

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42244

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
	j	bgti_cont.42225

bgti_else.42244:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42245:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42242:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42243:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42240:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42241:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42238:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42239:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42236:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42237:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42234:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42235:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42232:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42233:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42230:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42231:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42228:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42229:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42226:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42227:
	nop
	nop
	nop
	j	bgti_cont.42225

bgti_else.42224:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42225:
	lw	%v1, 18(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42246

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
	j	bgt_cont.42247

bgt_else.42246:
	sw	%v0, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42248

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42250

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42252

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
	j	bgti_cont.42249

bgti_else.42252:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42253:
	nop
	nop
	nop
	j	bgti_cont.42249

bgti_else.42250:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42251:
	nop
	nop
	nop
	j	bgti_cont.42249

bgti_else.42248:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42249:
	lw	%v1, 18(%sp)
	sw	%v0, 20(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42254

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42256

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42258

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42260

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42262

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42264

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42266

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42268

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42270

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42272

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42274

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
	j	bgti_cont.42255

bgti_else.42274:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42275:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42272:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42273:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42270:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42271:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42268:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42269:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42266:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42267:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42264:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42265:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42262:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42263:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42260:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42261:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42258:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42259:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42256:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42257:
	nop
	nop
	nop
	j	bgti_cont.42255

bgti_else.42254:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42255:
	lw	%v1, 20(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42276

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
	j	bgt_cont.42277

bgt_else.42276:
	sw	%v0, 21(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42278

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42280

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42282

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42284

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42286

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42288

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42290

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42292

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42294

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42296

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42298

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
	j	bgti_cont.42279

bgti_else.42298:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42299:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42296:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42297:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42294:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42295:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42292:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42293:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42290:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42291:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42288:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42289:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42286:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42287:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42284:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42285:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42282:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42283:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42280:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42281:
	nop
	nop
	nop
	j	bgti_cont.42279

bgti_else.42278:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42279:
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

bgt_cont.42277:
bgt_cont.42247:
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
	blt	%at, %v0, bgt_else.42300

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.42302

	nop
	nop
	nop
	j	bgt_cont.42301

bgti_else.42302:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42303:
	nop
	nop
	nop
	j	bgt_cont.42301

bgt_else.42300:
	nop
	nop
	addi	%v0, %zero, 255
	nop

bgt_cont.42301:
	sw	%v0, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 10, bgti_else.42304

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42306

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42308

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
	j	bgti_cont.42305

bgti_else.42308:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42309:
	nop
	nop
	nop
	j	bgti_cont.42305

bgti_else.42306:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42307:
	nop
	nop
	nop
	j	bgti_cont.42305

bgti_else.42304:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42305:
	lw	%v1, 22(%sp)
	sw	%v0, 23(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42310

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42312

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42314

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42316

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42318

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42320

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42322

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42324

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42326

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42328

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42330

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
	j	bgti_cont.42311

bgti_else.42330:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42331:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42328:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42329:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42326:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42327:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42324:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42325:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42322:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42323:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42320:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42321:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42318:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42319:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42316:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42317:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42314:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42315:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42312:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42313:
	nop
	nop
	nop
	j	bgti_cont.42311

bgti_else.42310:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42311:
	lw	%v1, 23(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42332

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
	j	bgt_cont.42333

bgt_else.42332:
	sw	%v0, 24(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42334

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42336

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.42338

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
	j	bgti_cont.42335

bgti_else.42338:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.42339:
	nop
	nop
	nop
	j	bgti_cont.42335

bgti_else.42336:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.42337:
	nop
	nop
	nop
	j	bgti_cont.42335

bgti_else.42334:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.42335:
	lw	%v1, 23(%sp)
	sw	%v0, 25(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42340

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42342

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42344

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42346

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42348

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42350

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42352

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42354

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42356

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42358

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42360

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
	j	bgti_cont.42341

bgti_else.42360:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42361:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42358:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42359:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42356:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42357:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42354:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42355:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42352:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42353:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42350:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42351:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42348:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42349:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42346:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42347:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42344:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42345:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42342:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42343:
	nop
	nop
	nop
	j	bgti_cont.42341

bgti_else.42340:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42341:
	lw	%v1, 25(%sp)
	nop
	addi	%at, %zero, 0
	nop

	nop
	nop
	nop
	blt	%at, %v1, bgt_else.42362

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
	j	bgt_cont.42363

bgt_else.42362:
	sw	%v0, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42364

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42366

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42368

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42370

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42372

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42374

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42376

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42378

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42380

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42382

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.42384

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
	j	bgti_cont.42365

bgti_else.42384:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42385:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42382:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42383:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42380:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42381:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42378:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42379:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42376:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42377:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42374:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42375:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42372:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42373:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42370:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42371:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42368:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42369:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42366:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42367:
	nop
	nop
	nop
	j	bgti_cont.42365

bgti_else.42364:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.42365:
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

bgt_cont.42363:
bgt_cont.42333:
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

bgt_cont.42119:
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
	blti	%v0, 5, bgti_else.42386

	nop
	nop
	addi	%a0, %v0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.42387

bgti_else.42386:
	nop
	nop
	add	%a0, %zero, %v0
	nop

bgti_cont.42387:
	lw	%v0, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%v1, %v0, bgt_else.42388

	nop
	nop
	nop
	jr	%ra

bgt_else.42388:
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
	blt	%v1, %v0, bgt_else.42390

	nop
	nop
	nop
	j	bgt_cont.42391

bgt_else.42390:
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

bgt_cont.42391:
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
	blti	%v1, 5, bgti_else.42392

	nop
	nop
	addi	%a2, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.42393

bgti_else.42392:
	nop
	nop
	add	%a2, %zero, %v1
	nop

bgti_cont.42393:
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
	blti	%v1, 0, bgti_else.42699

	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.42700

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
	blti	%v0, 0, bgti_else.42701

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
	blti	%v0, 0, bgti_else.42702

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

bgti_else.42702:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.42701:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.42700:
	nop
	nop
	add	%v0, %zero, %a0
	nop

	nop
	nop
	nop
	jr	%ra

bgti_else.42699:
	nop
	nop
	nop
	jr	%ra

calc_dirvec.3071:
	nop
	nop
	nop
	blti	%v0, 5, bgti_else.43949

	lw	%v0, 179(%v1)
	nop
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1

	flw	%f3, 474(%zero)
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

bgti_else.43949:
	flw	%f1, 441(%zero)
	flw	%f4, 474(%zero)
	fmul	%f0, %f1, %f1
	nop

	flw	%f6, 470(%zero)
	nop
	fadd	%f0, %f0, %f1
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
	nop
	fblt	%f5, %f6, fbgt_else.43951

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43952

fbgt_else.43951:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.43952:
	flw	%f8, 462(%zero)
	nop
	fabs	%f7, %f5
	nop

	nop
	nop
	nop
	fblt	%f7, %f8, fbgt_else.43953

	flw	%f5, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f5, fbgt_else.43955

	flw	%f5, 479(%zero)
	flw	%f12, 461(%zero)
	fdiv	%f7, %f4, %f7
	nop

	flw	%f13, 460(%zero)
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
	fmul	%f13, %f13, %f7
	nop

	nop
	nop
	fmul	%f13, %f13, %f10
	nop

	flw	%f13, 459(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f13, 458(%zero)
	nop
	fsub	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f7
	nop

	nop
	nop
	fmul	%f13, %f13, %f11
	nop

	flw	%f13, 457(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f12, 456(%zero)
	nop
	fsub	%f9, %f12, %f9
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
	nop
	j	fbgt_cont.43956

fbgt_else.43955:
	flw	%f5, 478(%zero)
	flw	%f12, 461(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4

	flw	%f13, 460(%zero)
	nop
	fdiv	%f7, %f9, %f7
	nop

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
	fmul	%f13, %f13, %f7
	nop

	nop
	nop
	fmul	%f13, %f13, %f10
	nop

	flw	%f13, 459(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f13, 458(%zero)
	nop
	fsub	%f12, %f12, %f13
	nop

	nop
	nop
	fmul	%f13, %f13, %f7
	nop

	nop
	nop
	fmul	%f13, %f13, %f11
	nop

	flw	%f13, 457(%zero)
	nop
	fadd	%f12, %f12, %f13
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

	flw	%f12, 456(%zero)
	nop
	fsub	%f9, %f12, %f9
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
	nop

fbgt_cont.43956:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.43957

	nop
	nop
	nop
	j	fbgt_cont.43954

bnei_else.43957:
	nop
	nop
	fneg	%f5, %f5
	nop

bnei_cont.43958:
	nop
	nop
	nop
	j	fbgt_cont.43954

fbgt_else.43953:
	flw	%f11, 461(%zero)
	flw	%f12, 460(%zero)
	fmul	%f7, %f5, %f5
	nop

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
	fmul	%f12, %f12, %f9
	nop

	flw	%f12, 459(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f12, 458(%zero)
	nop
	fsub	%f11, %f11, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f5
	nop

	nop
	nop
	fmul	%f12, %f12, %f10
	nop

	flw	%f12, 457(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f11, 456(%zero)
	nop
	fsub	%f7, %f11, %f7
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
	nop

fbgt_cont.43954:
	flw	%f7, 494(%zero)
	nop
	fmul	%f5, %f5, %f2
	nop

	nop
	nop
	nop
	fblt	%f5, %f6, fbgt_else.43959

	nop
	nop
	addi	%a1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.43960

fbgt_else.43959:
	nop
	nop
	addi	%a1, %zero, 0
	nop

fbgt_cont.43960:
	flw	%f10, 493(%zero)
	fsw	%f2, 0(%sp)
	fabs	%f9, %f5
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

	nop
	nop
	nop
	fblt	%f9, %f10, fbgt_else.43961

	flw	%f11, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43963

	flw	%f11, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43965

	flw	%f11, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43967

	flw	%f11, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43969

	flw	%f11, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43971

	flw	%f11, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43973

	flw	%f11, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43975

	flw	%f11, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43977

	flw	%f11, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43979

	flw	%f11, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f9, %f11, fbgt_else.43981

	flw	%f11, 482(%zero)
	sw	%ra, 15(%sp)
	fmov	%f0, %f9
	nop

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
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43981:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43982:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43979:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43980:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43977:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43978:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43975:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43976:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43973:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43974:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43971:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43972:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43969:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43970:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43967:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43968:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43965:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43966:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43963:
	nop
	nop
	fmov	%f0, %f11
	nop

fbgt_cont.43964:
	nop
	nop
	nop
	j	fbgt_cont.43962

fbgt_else.43961:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.43962:
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43983

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43985

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
	fblt	%f1, %f2, fbgt_else.43987

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43989

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43991

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43993

	sw	%ra, 15(%sp)
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
	addi	%sp, %sp, 16

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
	j	fbgt_cont.43984

fbgt_else.43993:
	sw	%ra, 15(%sp)
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

fbgt_cont.43994:
	nop
	nop
	nop
	j	fbgt_cont.43984

fbgt_else.43991:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43992:
	nop
	nop
	nop
	j	fbgt_cont.43984

fbgt_else.43989:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.43995

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.43997

	sw	%ra, 15(%sp)
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
	addi	%sp, %sp, 16

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
	j	fbgt_cont.43996

fbgt_else.43997:
	sw	%ra, 15(%sp)
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

fbgt_cont.43998:
	nop
	nop
	nop
	j	fbgt_cont.43996

fbgt_else.43995:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43996:
fbgt_cont.43990:
	nop
	nop
	nop
	j	fbgt_cont.43984

fbgt_else.43987:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43988:
	nop
	nop
	nop
	j	fbgt_cont.43984

fbgt_else.43985:
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
	fblt	%f1, %f2, fbgt_else.43999

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44001

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44003

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44005

	sw	%ra, 15(%sp)
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
	addi	%sp, %sp, 16

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
	j	fbgt_cont.44000

fbgt_else.44005:
	sw	%ra, 15(%sp)
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

fbgt_cont.44006:
	nop
	nop
	nop
	j	fbgt_cont.44000

fbgt_else.44003:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44004:
	nop
	nop
	nop
	j	fbgt_cont.44000

fbgt_else.44001:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44007

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44009

	sw	%ra, 15(%sp)
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
	addi	%sp, %sp, 16

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
	j	fbgt_cont.44008

fbgt_else.44009:
	sw	%ra, 15(%sp)
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

fbgt_cont.44010:
	nop
	nop
	nop
	j	fbgt_cont.44008

fbgt_else.44007:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44008:
fbgt_cont.44002:
	nop
	nop
	nop
	j	fbgt_cont.44000

fbgt_else.43999:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44000:
fbgt_cont.43986:
	nop
	nop
	nop
	j	fbgt_cont.43984

fbgt_else.43983:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.43984:
	flw	%f1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44011

	lw	%v0, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44013

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44012

bnei_else.44013:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.44014:
	nop
	nop
	nop
	j	fbgt_cont.44012

fbgt_else.44011:
	lw	%v0, 11(%sp)
	nop
	nop
	nop

fbgt_cont.44012:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44015

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44016

fbgt_else.44015:
fbgt_cont.44016:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44017

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44018

fbgt_else.44017:
fbgt_cont.44018:
	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44019

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.44020

fbgt_else.44019:
	flw	%f5, 473(%zero)
	flw	%f6, 10(%sp)
	fsub	%f0, %f2, %f0
	nop

	flw	%f7, 472(%zero)
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

	flw	%f7, 471(%zero)
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

fbgt_cont.44020:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44021

	nop
	nop
	nop
	j	bnei_cont.44022

bnei_else.44021:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.44022:
	flw	%f4, 9(%sp)
	flw	%f5, 14(%sp)
	nop
	nop

	fsw	%f0, 15(%sp)
	nop
	fabs	%f4, %f4
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

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44023

	flw	%f6, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44025

	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44027

	flw	%f6, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44029

	flw	%f6, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44031

	flw	%f6, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44033

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44035

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44037

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44039

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44041

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44043

	flw	%f6, 482(%zero)
	sw	%ra, 19(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44043:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44044:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44041:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44042:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44039:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44040:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44037:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44038:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44035:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44036:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44033:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44034:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44031:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44032:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44029:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44030:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44027:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44028:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44025:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44026:
	nop
	nop
	nop
	j	fbgt_cont.44024

fbgt_else.44023:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.44024:
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44045

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44047

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
	fblt	%f1, %f2, fbgt_else.44049

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44051

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44053

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44055

	sw	%ra, 19(%sp)
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
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44046

fbgt_else.44055:
	sw	%ra, 19(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

fbgt_cont.44056:
	nop
	nop
	nop
	j	fbgt_cont.44046

fbgt_else.44053:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44054:
	nop
	nop
	nop
	j	fbgt_cont.44046

fbgt_else.44051:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44057

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44059

	sw	%ra, 19(%sp)
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
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44058

fbgt_else.44059:
	sw	%ra, 19(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

fbgt_cont.44060:
	nop
	nop
	nop
	j	fbgt_cont.44058

fbgt_else.44057:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44058:
fbgt_cont.44052:
	nop
	nop
	nop
	j	fbgt_cont.44046

fbgt_else.44049:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44050:
	nop
	nop
	nop
	j	fbgt_cont.44046

fbgt_else.44047:
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
	fblt	%f1, %f2, fbgt_else.44061

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44063

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44065

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44067

	sw	%ra, 19(%sp)
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
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44062

fbgt_else.44067:
	sw	%ra, 19(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

fbgt_cont.44068:
	nop
	nop
	nop
	j	fbgt_cont.44062

fbgt_else.44065:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44066:
	nop
	nop
	nop
	j	fbgt_cont.44062

fbgt_else.44063:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44069

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44071

	sw	%ra, 19(%sp)
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
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44070

fbgt_else.44071:
	sw	%ra, 19(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 20
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

fbgt_cont.44072:
	nop
	nop
	nop
	j	fbgt_cont.44070

fbgt_else.44069:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44070:
fbgt_cont.44064:
	nop
	nop
	nop
	j	fbgt_cont.44062

fbgt_else.44061:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44062:
fbgt_cont.44048:
	nop
	nop
	nop
	j	fbgt_cont.44046

fbgt_else.44045:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44046:
	flw	%f1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44073

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44074

fbgt_else.44073:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.44074:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44075

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44076

fbgt_else.44075:
fbgt_cont.44076:
	flw	%f2, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44077

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44079

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44078

bnei_else.44079:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.44080:
	nop
	nop
	nop
	j	fbgt_cont.44078

fbgt_else.44077:
fbgt_cont.44078:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44081

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44082

fbgt_else.44081:
fbgt_cont.44082:
	flw	%f3, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44083

	flw	%f5, 473(%zero)
	flw	%f6, 10(%sp)
	fmul	%f0, %f0, %f0
	nop

	flw	%f7, 472(%zero)
	nop
	fmul	%f4, %f0, %f0
	fmul	%f5, %f5, %f0

	nop
	nop
	fsub	%f5, %f6, %f5
	fmul	%f7, %f7, %f4

	flw	%f7, 471(%zero)
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
	j	fbgt_cont.44084

fbgt_else.44083:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.44084:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44085

	nop
	nop
	nop
	j	bnei_cont.44086

bnei_else.44085:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.44086:
	flw	%f4, 15(%sp)
	lw	%v0, 7(%sp)
	nop
	nop

	flw	%f4, 8(%sp)
	flw	%f5, 6(%sp)
	fdiv	%f0, %f4, %f0
	addi	%v0, %v0, 1

	flw	%f7, 5(%sp)
	nop
	fmul	%f0, %f0, %f4
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	nop

	flw	%f5, 10(%sp)
	nop
	fadd	%f4, %f4, %f5
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
	nop
	fblt	%f6, %f7, fbgt_else.44087

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44088

fbgt_else.44087:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.44088:
	flw	%f9, 4(%sp)
	nop
	fabs	%f8, %f6
	nop

	nop
	nop
	nop
	fblt	%f8, %f9, fbgt_else.44089

	flw	%f6, 455(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f8, %f6, fbgt_else.44091

	flw	%f11, 461(%zero)
	flw	%f12, 460(%zero)
	fdiv	%f6, %f5, %f8
	nop

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
	fmul	%f12, %f12, %f6
	nop

	nop
	nop
	fmul	%f12, %f12, %f9
	nop

	flw	%f12, 459(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f12, 458(%zero)
	nop
	fsub	%f11, %f11, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f6
	nop

	nop
	nop
	fmul	%f12, %f12, %f10
	nop

	flw	%f12, 457(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f11, 456(%zero)
	nop
	fsub	%f8, %f11, %f8
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
	nop
	j	fbgt_cont.44092

fbgt_else.44091:
	flw	%f11, 461(%zero)
	flw	%f12, 460(%zero)
	fsub	%f6, %f8, %f5
	fadd	%f8, %f8, %f5

	nop
	nop
	fdiv	%f6, %f6, %f8
	nop

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
	fmul	%f12, %f12, %f6
	nop

	nop
	nop
	fmul	%f12, %f12, %f9
	nop

	flw	%f12, 459(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f12, 458(%zero)
	nop
	fsub	%f11, %f11, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f6
	nop

	nop
	nop
	fmul	%f12, %f12, %f10
	nop

	flw	%f12, 457(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f11, 456(%zero)
	nop
	fsub	%f8, %f11, %f8
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
	nop

fbgt_cont.44092:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44093

	nop
	nop
	nop
	j	fbgt_cont.44090

bnei_else.44093:
	nop
	nop
	fneg	%f6, %f6
	nop

bnei_cont.44094:
	nop
	nop
	nop
	j	fbgt_cont.44090

fbgt_else.44089:
	flw	%f11, 461(%zero)
	flw	%f12, 460(%zero)
	fmul	%f8, %f6, %f6
	nop

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
	fmul	%f12, %f12, %f9
	nop

	flw	%f12, 459(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f12, 458(%zero)
	nop
	fsub	%f11, %f11, %f12
	nop

	nop
	nop
	fmul	%f12, %f12, %f6
	nop

	nop
	nop
	fmul	%f12, %f12, %f10
	nop

	flw	%f12, 457(%zero)
	nop
	fadd	%f11, %f11, %f12
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

	flw	%f11, 456(%zero)
	nop
	fsub	%f8, %f11, %f8
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

fbgt_cont.44090:
	flw	%f8, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	fmul	%f6, %f6, %f8
	nop

	nop
	nop
	nop
	fblt	%f6, %f7, fbgt_else.44095

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44096

fbgt_else.44095:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbgt_cont.44096:
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)
	fabs	%f7, %f6
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

	nop
	nop
	nop
	fblt	%f7, %f9, fbgt_else.44097

	flw	%f10, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44099

	flw	%f10, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44101

	flw	%f10, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44103

	flw	%f10, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44105

	flw	%f10, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44107

	flw	%f10, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44109

	flw	%f10, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44111

	flw	%f10, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44113

	flw	%f10, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44115

	flw	%f10, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f7, %f10, fbgt_else.44117

	flw	%f10, 482(%zero)
	sw	%ra, 25(%sp)
	fmov	%f0, %f7
	nop

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
	addi	%sp, %sp, -26
	nop

	lw	%ra, 25(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44117:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44118:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44115:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44116:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44113:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44114:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44111:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44112:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44109:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44110:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44107:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44108:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44105:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44106:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44103:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44104:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44101:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44102:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44099:
	nop
	nop
	fmov	%f0, %f10
	nop

fbgt_cont.44100:
	nop
	nop
	nop
	j	fbgt_cont.44098

fbgt_else.44097:
	nop
	nop
	fmov	%f0, %f9
	nop

fbgt_cont.44098:
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44119

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44121

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
	fblt	%f1, %f2, fbgt_else.44123

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44125

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44127

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44129

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
	j	fbgt_cont.44120

fbgt_else.44129:
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

fbgt_cont.44130:
	nop
	nop
	nop
	j	fbgt_cont.44120

fbgt_else.44127:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44128:
	nop
	nop
	nop
	j	fbgt_cont.44120

fbgt_else.44125:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44131

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44133

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
	j	fbgt_cont.44132

fbgt_else.44133:
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

fbgt_cont.44134:
	nop
	nop
	nop
	j	fbgt_cont.44132

fbgt_else.44131:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44132:
fbgt_cont.44126:
	nop
	nop
	nop
	j	fbgt_cont.44120

fbgt_else.44123:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44124:
	nop
	nop
	nop
	j	fbgt_cont.44120

fbgt_else.44121:
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
	fblt	%f1, %f2, fbgt_else.44135

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44137

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44139

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44141

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
	j	fbgt_cont.44136

fbgt_else.44141:
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

fbgt_cont.44142:
	nop
	nop
	nop
	j	fbgt_cont.44136

fbgt_else.44139:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44140:
	nop
	nop
	nop
	j	fbgt_cont.44136

fbgt_else.44137:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44143

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44145

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
	j	fbgt_cont.44144

fbgt_else.44145:
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

fbgt_cont.44146:
	nop
	nop
	nop
	j	fbgt_cont.44144

fbgt_else.44143:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44144:
fbgt_cont.44138:
	nop
	nop
	nop
	j	fbgt_cont.44136

fbgt_else.44135:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44136:
fbgt_cont.44122:
	nop
	nop
	nop
	j	fbgt_cont.44120

fbgt_else.44119:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44120:
	flw	%f1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44147

	lw	%v0, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44149

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44148

bnei_else.44149:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.44150:
	nop
	nop
	nop
	j	fbgt_cont.44148

fbgt_else.44147:
	lw	%v0, 23(%sp)
	nop
	nop
	nop

fbgt_cont.44148:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44151

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44152

fbgt_else.44151:
fbgt_cont.44152:
	flw	%f2, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44153

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44154

fbgt_else.44153:
fbgt_cont.44154:
	flw	%f3, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.44155

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.44156

fbgt_else.44155:
	flw	%f5, 473(%zero)
	flw	%f6, 10(%sp)
	fsub	%f0, %f2, %f0
	nop

	flw	%f7, 472(%zero)
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

	flw	%f7, 471(%zero)
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

fbgt_cont.44156:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44157

	nop
	nop
	nop
	j	bnei_cont.44158

bnei_else.44157:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.44158:
	flw	%f4, 22(%sp)
	flw	%f5, 14(%sp)
	nop
	nop

	fsw	%f0, 25(%sp)
	nop
	fabs	%f4, %f4
	nop

	fsw	%f4, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.44159

	flw	%f6, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44161

	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44163

	flw	%f6, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44165

	flw	%f6, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44167

	flw	%f6, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44169

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44171

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44173

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44175

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44177

	flw	%f6, 483(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f6, fbgt_else.44179

	flw	%f6, 482(%zero)
	sw	%ra, 27(%sp)
	fmov	%f0, %f4
	nop

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
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44179:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44180:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44177:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44178:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44175:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44176:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44173:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44174:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44171:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44172:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44169:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44170:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44167:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44168:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44165:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44166:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44163:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44164:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44161:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.44162:
	nop
	nop
	nop
	j	fbgt_cont.44160

fbgt_else.44159:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.44160:
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44181

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44183

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
	fblt	%f1, %f2, fbgt_else.44185

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44187

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44189

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44191

	sw	%ra, 27(%sp)
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
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44182

fbgt_else.44191:
	sw	%ra, 27(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

fbgt_cont.44192:
	nop
	nop
	nop
	j	fbgt_cont.44182

fbgt_else.44189:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44190:
	nop
	nop
	nop
	j	fbgt_cont.44182

fbgt_else.44187:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44193

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44195

	sw	%ra, 27(%sp)
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
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44194

fbgt_else.44195:
	sw	%ra, 27(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

fbgt_cont.44196:
	nop
	nop
	nop
	j	fbgt_cont.44194

fbgt_else.44193:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44194:
fbgt_cont.44188:
	nop
	nop
	nop
	j	fbgt_cont.44182

fbgt_else.44185:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44186:
	nop
	nop
	nop
	j	fbgt_cont.44182

fbgt_else.44183:
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
	fblt	%f1, %f2, fbgt_else.44197

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44199

	nop
	nop
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44201

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44203

	sw	%ra, 27(%sp)
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
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44198

fbgt_else.44203:
	sw	%ra, 27(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

fbgt_cont.44204:
	nop
	nop
	nop
	j	fbgt_cont.44198

fbgt_else.44201:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44202:
	nop
	nop
	nop
	j	fbgt_cont.44198

fbgt_else.44199:
	nop
	nop
	fdiv	%f0, %f0, %f3
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.44205

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44207

	sw	%ra, 27(%sp)
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
	addi	%sp, %sp, 28

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

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
	j	fbgt_cont.44206

fbgt_else.44207:
	sw	%ra, 27(%sp)
	nop
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1

	nop
	nop
	fmov	%f1, %f0
	fmov	%f0, %f29

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	reduction_2pi_sub2.2617

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

fbgt_cont.44208:
	nop
	nop
	nop
	j	fbgt_cont.44206

fbgt_else.44205:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44206:
fbgt_cont.44200:
	nop
	nop
	nop
	j	fbgt_cont.44198

fbgt_else.44197:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44198:
fbgt_cont.44184:
	nop
	nop
	nop
	j	fbgt_cont.44182

fbgt_else.44181:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.44182:
	flw	%f1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44209

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44210

fbgt_else.44209:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.44210:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.44211

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.44212

fbgt_else.44211:
fbgt_cont.44212:
	flw	%f2, 17(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44213

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44215

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44214

bnei_else.44215:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.44216:
	nop
	nop
	nop
	j	fbgt_cont.44214

fbgt_else.44213:
fbgt_cont.44214:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.44217

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44218

fbgt_else.44217:
fbgt_cont.44218:
	flw	%f1, 16(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.44219

	flw	%f2, 473(%zero)
	flw	%f3, 10(%sp)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f2, %f2, %f0

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f3, %f2
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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
	j	fbgt_cont.44220

fbgt_else.44219:
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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

fbgt_cont.44220:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.44221

	nop
	nop
	nop
	j	bnei_cont.44222

bnei_else.44221:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.44222:
	flw	%f1, 25(%sp)
	flw	%f2, 0(%sp)
	nop
	nop

	flw	%f1, 21(%sp)
	flw	%f3, 3(%sp)
	fdiv	%f0, %f1, %f0
	nop

	flw	%f0, 19(%sp)
	lw	%v0, 20(%sp)
	fmul	%f1, %f0, %f1
	nop

	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
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
	blti	%v0, 0, bgti_else.44251

	flw	%f2, 460(%zero)
	flw	%f3, 438(%zero)
	itof	%f1, %v0
	nop

	flw	%f4, 470(%zero)
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
	blti	%v1, 5, bgti_else.44252

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.44253

bgti_else.44252:
bgti_cont.44253:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.44254

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
	blti	%v1, 5, bgti_else.44255

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.44256

bgti_else.44255:
bgti_cont.44256:
	flw	%f0, 1(%sp)
	lw	%a0, 5(%sp)
	nop
	nop

	nop
	nop
	nop
	j	calc_dirvecs.3079

bgti_else.44254:
	nop
	nop
	nop
	jr	%ra

bgti_else.44251:
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
	blti	%v0, 0, bgti_else.44279

	flw	%f1, 460(%zero)
	flw	%f2, 438(%zero)
	itof	%f0, %v0
	addi	%a2, %zero, 4

	flw	%f4, 470(%zero)
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
	blti	%a0, 5, bgti_else.44280

	nop
	nop
	addi	%a0, %a0, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.44281

bgti_else.44280:
bgti_cont.44281:
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
	blti	%v1, 5, bgti_else.44282

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.44283

bgti_else.44282:
bgti_cont.44283:
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
	blti	%v0, 0, bgti_else.44284

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
	blti	%v1, 5, bgti_else.44285

	nop
	nop
	addi	%v1, %v1, -5
	nop

	nop
	nop
	nop
	j	bgti_cont.44286

bgti_else.44285:
bgti_cont.44286:
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

bgti_else.44284:
	nop
	nop
	nop
	jr	%ra

bgti_else.44279:
	nop
	nop
	nop
	jr	%ra

create_dirvec_elements.3090:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.44311

	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.44312

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
	blti	%v0, 0, bgti_else.44313

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
	blti	%v0, 0, bgti_else.44314

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

bgti_else.44314:
	nop
	nop
	nop
	jr	%ra

bgti_else.44313:
	nop
	nop
	nop
	jr	%ra

bgti_else.44312:
	nop
	nop
	nop
	jr	%ra

bgti_else.44311:
	nop
	nop
	nop
	jr	%ra

create_dirvecs.3093:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.44357

	flw	%f0, 470(%zero)
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
	blti	%v0, 0, bgti_else.44358

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

bgti_else.44358:
	nop
	nop
	nop
	jr	%ra

bgti_else.44357:
	nop
	nop
	nop
	jr	%ra

init_dirvec_constants.3095:
	nop
	nop
	nop
	blti	%v1, 0, bgti_else.44434

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
	blti	%v0, 0, bgti_else.44435

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
	blti	%a1, 0, bgti_else.44436

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
	beqi	%t1, 1, bnei_else.44438

	nop
	nop
	nop
	beqi	%t1, 2, bnei_else.44440

	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.44442

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
	j	bnei_cont.44443

bnei_else.44442:
bnei_cont.44443:
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
	beqi	%a0, 0, bnei_else.44444

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

	flw	%f8, 473(%zero)
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
	j	bnei_cont.44445

bnei_else.44444:
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

bnei_cont.44445:
	flw	%f0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.44446

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44447

fbeq_else.44446:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44447:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44448

	nop
	nop
	nop
	j	bnei_cont.44449

bnei_else.44448:
	flw	%f0, 474(%zero)
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

bnei_cont.44449:
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
	j	bnei_cont.44439

bnei_else.44440:
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.44450

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44451

fbgt_else.44450:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.44451:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44452

	flw	%f1, 468(%zero)
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
	j	bnei_cont.44453

bnei_else.44452:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.44453:
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

bnei_cont.44441:
	nop
	nop
	nop
	j	bnei_cont.44439

bnei_else.44438:
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.44454

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44455

fbeq_else.44454:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.44455:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44456

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44457

bnei_else.44456:
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
	fblt	%f0, %f1, fbgt_else.44458

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44459

fbgt_else.44458:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.44459:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44460

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44462

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44461

bnei_else.44462:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.44463:
	nop
	nop
	nop
	j	bnei_cont.44461

bnei_else.44460:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.44461:
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
	beqi	%a1, 0, bnei_else.44464

	nop
	nop
	nop
	j	bnei_cont.44465

bnei_else.44464:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44465:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.44457:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44466

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44467

fbeq_else.44466:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.44467:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44468

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44469

bnei_else.44468:
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
	fblt	%f0, %f1, fbgt_else.44470

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44471

fbgt_else.44470:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.44471:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44472

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44474

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44473

bnei_else.44474:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.44475:
	nop
	nop
	nop
	j	bnei_cont.44473

bnei_else.44472:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.44473:
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
	beqi	%a1, 0, bnei_else.44476

	nop
	nop
	nop
	j	bnei_cont.44477

bnei_else.44476:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44477:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.44469:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44478

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44479

fbeq_else.44478:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44479:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44480

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44481

bnei_else.44480:
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
	fblt	%f0, %f1, fbgt_else.44482

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44483

fbgt_else.44482:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.44483:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44484

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44486

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44485

bnei_else.44486:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.44487:
	nop
	nop
	nop
	j	bnei_cont.44485

bnei_else.44484:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.44485:
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
	beqi	%a0, 0, bnei_else.44488

	nop
	nop
	nop
	j	bnei_cont.44489

bnei_else.44488:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.44489:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
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

bnei_cont.44481:
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

bnei_cont.44439:
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
	j	bgti_cont.44437

bgti_else.44436:
bgti_cont.44437:
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
	blti	%v0, 0, bgti_else.44490

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
	blti	%v0, 0, bgti_else.44491

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

bgti_else.44491:
	nop
	nop
	nop
	jr	%ra

bgti_else.44490:
	nop
	nop
	nop
	jr	%ra

bgti_else.44435:
	nop
	nop
	nop
	jr	%ra

bgti_else.44434:
	nop
	nop
	nop
	jr	%ra

init_vecset_constants.3098:
	nop
	nop
	nop
	blti	%v0, 0, bgti_else.44548

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
	blti	%a2, 0, bgti_else.44549

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
	beqi	%t2, 1, bnei_else.44551

	nop
	nop
	nop
	beqi	%t2, 2, bnei_else.44553

	flw	%f0, 470(%zero)
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
	beqi	%a0, 0, bnei_else.44555

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
	j	bnei_cont.44556

bnei_else.44555:
bnei_cont.44556:
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
	beqi	%a0, 0, bnei_else.44557

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

	flw	%f8, 473(%zero)
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
	j	bnei_cont.44558

bnei_else.44557:
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

bnei_cont.44558:
	flw	%f0, 6(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.44559

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44560

fbeq_else.44559:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44560:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44561

	nop
	nop
	nop
	j	bnei_cont.44562

bnei_else.44561:
	flw	%f0, 474(%zero)
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

bnei_cont.44562:
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
	j	bnei_cont.44552

bnei_else.44553:
	flw	%f0, 470(%zero)
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
	fblt	%f1, %f0, fbgt_else.44563

	nop
	nop
	addi	%v1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44564

fbgt_else.44563:
	nop
	nop
	addi	%v1, %zero, 1
	nop

fbgt_cont.44564:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44565

	flw	%f1, 468(%zero)
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
	j	bnei_cont.44566

bnei_else.44565:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.44566:
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

bnei_cont.44554:
	nop
	nop
	nop
	j	bnei_cont.44552

bnei_else.44551:
	flw	%f0, 470(%zero)
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
	fbne	%f0, %f1, fbeq_else.44567

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44568

fbeq_else.44567:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.44568:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44569

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44570

bnei_else.44569:
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
	fblt	%f0, %f1, fbgt_else.44571

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44572

fbgt_else.44571:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.44572:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44573

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44575

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44574

bnei_else.44575:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.44576:
	nop
	nop
	nop
	j	bnei_cont.44574

bnei_else.44573:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.44574:
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
	beqi	%a1, 0, bnei_else.44577

	nop
	nop
	nop
	j	bnei_cont.44578

bnei_else.44577:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44578:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.44570:
	flw	%f0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44579

	nop
	nop
	addi	%a0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44580

fbeq_else.44579:
	nop
	nop
	addi	%a0, %zero, 0
	nop

fbeq_cont.44580:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44581

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44582

bnei_else.44581:
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
	fblt	%f0, %f1, fbgt_else.44583

	nop
	nop
	addi	%a2, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44584

fbgt_else.44583:
	nop
	nop
	addi	%a2, %zero, 1
	nop

fbgt_cont.44584:
	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44585

	nop
	nop
	nop
	beqi	%a2, 0, bnei_else.44587

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44586

bnei_else.44587:
	nop
	nop
	addi	%a1, %zero, 1
	nop

bnei_cont.44588:
	nop
	nop
	nop
	j	bnei_cont.44586

bnei_else.44585:
	nop
	nop
	add	%a1, %zero, %a2
	nop

bnei_cont.44586:
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
	beqi	%a1, 0, bnei_else.44589

	nop
	nop
	nop
	j	bnei_cont.44590

bnei_else.44589:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.44590:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.44582:
	flw	%f0, 2(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.44591

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.44592

fbeq_else.44591:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.44592:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.44593

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.44594

bnei_else.44593:
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
	fblt	%f0, %f1, fbgt_else.44595

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.44596

fbgt_else.44595:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.44596:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.44597

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.44599

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.44598

bnei_else.44599:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.44600:
	nop
	nop
	nop
	j	bnei_cont.44598

bnei_else.44597:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.44598:
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
	beqi	%a0, 0, bnei_else.44601

	nop
	nop
	nop
	j	bnei_cont.44602

bnei_else.44601:
	nop
	nop
	fneg	%f1, %f1
	nop

bnei_cont.44602:
	fsw	%f1, 4(%v0)
	flw	%f1, 474(%zero)
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

bnei_cont.44594:
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

bnei_cont.44552:
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
	j	bgti_cont.44550

bgti_else.44549:
bgti_cont.44550:
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
	blti	%v0, 0, bgti_else.44603

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
	blti	%v0, 0, bgti_else.44604

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
	blti	%v0, 0, bgti_else.44605

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

bgti_else.44605:
	nop
	nop
	nop
	jr	%ra

bgti_else.44604:
	nop
	nop
	nop
	jr	%ra

bgti_else.44603:
	nop
	nop
	nop
	jr	%ra

bgti_else.44548:
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

	flw	%f0, 470(%zero)
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
	addi	%v0, %zero, 128

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
	addi	%v1, %zero, 64
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
	blti	%a0, 0, bgti_else.47291

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
	j	bgti_cont.47292

bgti_else.47291:
bgti_cont.47292:
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
	blti	%v1, 0, bgti_else.47293

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
	j	bgti_cont.47294

bgti_else.47293:
bgti_cont.47294:
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
	blti	%v1, 0, bgti_else.47295

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
	j	bgti_cont.47296

bgti_else.47295:
bgti_cont.47296:
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

	flw	%f1, 469(%zero)
	flw	%f2, 494(%zero)
	addi	%sp, %sp, -69
	nop

	lw	%ra, 68(%sp)
	flw	%f4, 493(%zero)
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
	fblt	%f3, %f4, fbgt_else.47297

	flw	%f5, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47299

	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47301

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47303

	flw	%f5, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47305

	flw	%f5, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47307

	flw	%f5, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47309

	flw	%f5, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47311

	flw	%f5, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47313

	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47315

	flw	%f5, 483(%zero)
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
	j	fbgt_cont.47298

fbgt_else.47315:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47316:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47313:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47314:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47311:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47312:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47309:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47310:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47307:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47308:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47305:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47306:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47303:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47304:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47301:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47302:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47299:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47300:
	nop
	nop
	nop
	j	fbgt_cont.47298

fbgt_else.47297:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47298:
	flw	%f1, 71(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47317

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47319

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
	fblt	%f1, %f2, fbgt_else.47321

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47323

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
	j	fbgt_cont.47318

fbgt_else.47323:
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

fbgt_cont.47324:
	nop
	nop
	nop
	j	fbgt_cont.47318

fbgt_else.47321:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47322:
	nop
	nop
	nop
	j	fbgt_cont.47318

fbgt_else.47319:
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
	fblt	%f1, %f2, fbgt_else.47325

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47327

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
	j	fbgt_cont.47326

fbgt_else.47327:
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

fbgt_cont.47328:
	nop
	nop
	nop
	j	fbgt_cont.47326

fbgt_else.47325:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47326:
fbgt_cont.47320:
	nop
	nop
	nop
	j	fbgt_cont.47318

fbgt_else.47317:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47318:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47329

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47330

fbgt_else.47329:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.47330:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47331

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47332

fbgt_else.47331:
fbgt_cont.47332:
	flw	%f2, 479(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47333

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47335

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47334

bnei_else.47335:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47336:
	nop
	nop
	nop
	j	fbgt_cont.47334

fbgt_else.47333:
fbgt_cont.47334:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47337

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47338

fbgt_else.47337:
fbgt_cont.47338:
	flw	%f3, 478(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47339

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.47340

fbgt_else.47339:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.47340:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47341

	nop
	nop
	nop
	j	bnei_cont.47342

bnei_else.47341:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47342:
	flw	%f4, 69(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.47343

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47344

fbgt_else.47343:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.47344:
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
	fblt	%f4, %f6, fbgt_else.47345

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47347

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47349

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47351

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47353

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47355

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47357

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47359

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47361

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47363

	flw	%f7, 483(%zero)
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
	j	fbgt_cont.47346

fbgt_else.47363:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47364:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47361:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47362:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47359:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47360:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47357:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47358:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47355:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47356:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47353:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47354:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47351:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47352:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47349:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47350:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47347:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47348:
	nop
	nop
	nop
	j	fbgt_cont.47346

fbgt_else.47345:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47346:
	flw	%f1, 77(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47365

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47367

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
	fblt	%f1, %f2, fbgt_else.47369

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47371

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
	j	fbgt_cont.47366

fbgt_else.47371:
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

fbgt_cont.47372:
	nop
	nop
	nop
	j	fbgt_cont.47366

fbgt_else.47369:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47370:
	nop
	nop
	nop
	j	fbgt_cont.47366

fbgt_else.47367:
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
	fblt	%f1, %f2, fbgt_else.47373

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47375

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
	j	fbgt_cont.47374

fbgt_else.47375:
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

fbgt_cont.47376:
	nop
	nop
	nop
	j	fbgt_cont.47374

fbgt_else.47373:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47374:
fbgt_cont.47368:
	nop
	nop
	nop
	j	fbgt_cont.47366

fbgt_else.47365:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47366:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47377

	lw	%v0, 76(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47379

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47378

bnei_else.47379:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47380:
	nop
	nop
	nop
	j	fbgt_cont.47378

fbgt_else.47377:
	lw	%v0, 76(%sp)
	nop
	nop
	nop

fbgt_cont.47378:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47381

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47382

fbgt_else.47381:
fbgt_cont.47382:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47383

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47384

fbgt_else.47383:
fbgt_cont.47384:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47385

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.47386

fbgt_else.47385:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.47386:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47387

	nop
	nop
	nop
	j	bnei_cont.47388

bnei_else.47387:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47388:
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
	fblt	%f2, %f3, fbgt_else.47389

	flw	%f4, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47391

	flw	%f4, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47393

	flw	%f4, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47395

	flw	%f4, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47397

	flw	%f4, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47399

	flw	%f4, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47401

	flw	%f4, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47403

	flw	%f4, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47405

	flw	%f4, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f4, fbgt_else.47407

	flw	%f4, 483(%zero)
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
	j	fbgt_cont.47390

fbgt_else.47407:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47408:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47405:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47406:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47403:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47404:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47401:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47402:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47399:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47400:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47397:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47398:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47395:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47396:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47393:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47394:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47391:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47392:
	nop
	nop
	nop
	j	fbgt_cont.47390

fbgt_else.47389:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47390:
	flw	%f1, 80(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47409

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47411

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
	fblt	%f1, %f2, fbgt_else.47413

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47415

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
	j	fbgt_cont.47410

fbgt_else.47415:
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

fbgt_cont.47416:
	nop
	nop
	nop
	j	fbgt_cont.47410

fbgt_else.47413:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47414:
	nop
	nop
	nop
	j	fbgt_cont.47410

fbgt_else.47411:
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
	fblt	%f1, %f2, fbgt_else.47417

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47419

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
	j	fbgt_cont.47418

fbgt_else.47419:
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

fbgt_cont.47420:
	nop
	nop
	nop
	j	fbgt_cont.47418

fbgt_else.47417:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47418:
fbgt_cont.47412:
	nop
	nop
	nop
	j	fbgt_cont.47410

fbgt_else.47409:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47410:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47421

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47422

fbgt_else.47421:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.47422:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47423

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47424

fbgt_else.47423:
fbgt_cont.47424:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47425

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47427

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47426

bnei_else.47427:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47428:
	nop
	nop
	nop
	j	fbgt_cont.47426

fbgt_else.47425:
fbgt_cont.47426:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47429

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47430

fbgt_else.47429:
fbgt_cont.47430:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47431

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.47432

fbgt_else.47431:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.47432:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47433

	nop
	nop
	nop
	j	bnei_cont.47434

bnei_else.47433:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47434:
	flw	%f4, 79(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.47435

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47436

fbgt_else.47435:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.47436:
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
	fblt	%f4, %f6, fbgt_else.47437

	flw	%f7, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47439

	flw	%f7, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47441

	flw	%f7, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47443

	flw	%f7, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47445

	flw	%f7, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47447

	flw	%f7, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47449

	flw	%f7, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47451

	flw	%f7, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47453

	flw	%f7, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f7, fbgt_else.47455

	flw	%f7, 483(%zero)
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
	j	fbgt_cont.47438

fbgt_else.47455:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47456:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47453:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47454:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47451:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47452:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47449:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47450:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47447:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47448:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47445:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47446:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47443:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47444:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47441:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47442:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47439:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47440:
	nop
	nop
	nop
	j	fbgt_cont.47438

fbgt_else.47437:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47438:
	flw	%f1, 83(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47457

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47459

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
	fblt	%f1, %f2, fbgt_else.47461

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47463

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
	j	fbgt_cont.47458

fbgt_else.47463:
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

fbgt_cont.47464:
	nop
	nop
	nop
	j	fbgt_cont.47458

fbgt_else.47461:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47462:
	nop
	nop
	nop
	j	fbgt_cont.47458

fbgt_else.47459:
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
	fblt	%f1, %f2, fbgt_else.47465

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47467

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
	j	fbgt_cont.47466

fbgt_else.47467:
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

fbgt_cont.47468:
	nop
	nop
	nop
	j	fbgt_cont.47466

fbgt_else.47465:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47466:
fbgt_cont.47460:
	nop
	nop
	nop
	j	fbgt_cont.47458

fbgt_else.47457:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47458:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47469

	lw	%v0, 82(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47471

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47470

bnei_else.47471:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47472:
	nop
	nop
	nop
	j	fbgt_cont.47470

fbgt_else.47469:
	lw	%v0, 82(%sp)
	nop
	nop
	nop

fbgt_cont.47470:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47473

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47474

fbgt_else.47473:
fbgt_cont.47474:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47475

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47476

fbgt_else.47475:
fbgt_cont.47476:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47477

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.47478

fbgt_else.47477:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.47478:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47479

	nop
	nop
	nop
	j	bnei_cont.47480

bnei_else.47479:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47480:
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
	fblt	%f0, %f2, fbgt_else.47481

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47482

fbgt_else.47481:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.47482:
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
	fblt	%f3, %f4, fbgt_else.47483

	flw	%f5, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47485

	flw	%f5, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47487

	flw	%f5, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47489

	flw	%f5, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47491

	flw	%f5, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47493

	flw	%f5, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47495

	flw	%f5, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47497

	flw	%f5, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47499

	flw	%f5, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f5, fbgt_else.47501

	flw	%f5, 483(%zero)
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
	j	fbgt_cont.47484

fbgt_else.47501:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47502:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47499:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47500:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47497:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47498:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47495:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47496:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47493:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47494:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47491:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47492:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47489:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47490:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47487:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47488:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47485:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47486:
	nop
	nop
	nop
	j	fbgt_cont.47484

fbgt_else.47483:
	nop
	nop
	fmov	%f0, %f4
	nop

fbgt_cont.47484:
	flw	%f1, 89(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47503

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47505

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
	fblt	%f1, %f2, fbgt_else.47507

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47509

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
	j	fbgt_cont.47504

fbgt_else.47509:
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

fbgt_cont.47510:
	nop
	nop
	nop
	j	fbgt_cont.47504

fbgt_else.47507:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47508:
	nop
	nop
	nop
	j	fbgt_cont.47504

fbgt_else.47505:
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
	fblt	%f1, %f2, fbgt_else.47511

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47513

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
	j	fbgt_cont.47512

fbgt_else.47513:
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

fbgt_cont.47514:
	nop
	nop
	nop
	j	fbgt_cont.47512

fbgt_else.47511:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47512:
fbgt_cont.47506:
	nop
	nop
	nop
	j	fbgt_cont.47504

fbgt_else.47503:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47504:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47515

	lw	%v0, 88(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47517

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47516

bnei_else.47517:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47518:
	nop
	nop
	nop
	j	fbgt_cont.47516

fbgt_else.47515:
	lw	%v0, 88(%sp)
	nop
	nop
	nop

fbgt_cont.47516:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47519

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47520

fbgt_else.47519:
fbgt_cont.47520:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47521

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47522

fbgt_else.47521:
fbgt_cont.47522:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47523

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.47524

fbgt_else.47523:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.47524:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47525

	nop
	nop
	nop
	j	bnei_cont.47526

bnei_else.47525:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47526:
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
	fblt	%f1, %f2, fbgt_else.47527

	flw	%f3, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47529

	flw	%f3, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47531

	flw	%f3, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47533

	flw	%f3, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47535

	flw	%f3, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47537

	flw	%f3, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47539

	flw	%f3, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47541

	flw	%f3, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47543

	flw	%f3, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f3, fbgt_else.47545

	flw	%f3, 483(%zero)
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
	j	fbgt_cont.47528

fbgt_else.47545:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47546:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47543:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47544:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47541:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47542:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47539:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47540:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47537:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47538:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47535:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47536:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47533:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47534:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47531:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47532:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47529:
	nop
	nop
	fmov	%f0, %f3
	nop

fbgt_cont.47530:
	nop
	nop
	nop
	j	fbgt_cont.47528

fbgt_else.47527:
	nop
	nop
	fmov	%f0, %f2
	nop

fbgt_cont.47528:
	flw	%f1, 91(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47547

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47549

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
	fblt	%f1, %f2, fbgt_else.47551

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47553

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
	j	fbgt_cont.47548

fbgt_else.47553:
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

fbgt_cont.47554:
	nop
	nop
	nop
	j	fbgt_cont.47548

fbgt_else.47551:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47552:
	nop
	nop
	nop
	j	fbgt_cont.47548

fbgt_else.47549:
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
	fblt	%f1, %f2, fbgt_else.47555

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47557

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
	j	fbgt_cont.47556

fbgt_else.47557:
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

fbgt_cont.47558:
	nop
	nop
	nop
	j	fbgt_cont.47556

fbgt_else.47555:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47556:
fbgt_cont.47550:
	nop
	nop
	nop
	j	fbgt_cont.47548

fbgt_else.47547:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47548:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47559

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47560

fbgt_else.47559:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.47560:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47561

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47562

fbgt_else.47561:
fbgt_cont.47562:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47563

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47565

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47564

bnei_else.47565:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47566:
	nop
	nop
	nop
	j	fbgt_cont.47564

fbgt_else.47563:
fbgt_cont.47564:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47567

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47568

fbgt_else.47567:
fbgt_cont.47568:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47569

	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f4, %f0, %f0
	fmul	%f6, %f6, %f0

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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
	j	fbgt_cont.47570

fbgt_else.47569:
	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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

fbgt_cont.47570:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47571

	nop
	nop
	nop
	j	bnei_cont.47572

bnei_else.47571:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47572:
	flw	%f4, 90(%sp)
	flw	%f5, 2(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f4, %f5, fbgt_else.47573

	nop
	nop
	addi	%v0, %zero, 1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47574

fbgt_else.47573:
	nop
	nop
	addi	%v0, %zero, 0
	nop

fbgt_cont.47574:
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
	fblt	%f6, %f7, fbgt_else.47575

	flw	%f8, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47577

	flw	%f8, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47579

	flw	%f8, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47581

	flw	%f8, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47583

	flw	%f8, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47585

	flw	%f8, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47587

	flw	%f8, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47589

	flw	%f8, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47591

	flw	%f8, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f6, %f8, fbgt_else.47593

	flw	%f8, 483(%zero)
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
	j	fbgt_cont.47576

fbgt_else.47593:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47594:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47591:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47592:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47589:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47590:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47587:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47588:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47585:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47586:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47583:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47584:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47581:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47582:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47579:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47580:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47577:
	nop
	nop
	fmov	%f0, %f8
	nop

fbgt_cont.47578:
	nop
	nop
	nop
	j	fbgt_cont.47576

fbgt_else.47575:
	nop
	nop
	fmov	%f0, %f7
	nop

fbgt_cont.47576:
	flw	%f1, 94(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47595

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47597

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
	fblt	%f1, %f2, fbgt_else.47599

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47601

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
	j	fbgt_cont.47596

fbgt_else.47601:
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

fbgt_cont.47602:
	nop
	nop
	nop
	j	fbgt_cont.47596

fbgt_else.47599:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47600:
	nop
	nop
	nop
	j	fbgt_cont.47596

fbgt_else.47597:
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
	fblt	%f1, %f2, fbgt_else.47603

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47605

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
	j	fbgt_cont.47604

fbgt_else.47605:
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

fbgt_cont.47606:
	nop
	nop
	nop
	j	fbgt_cont.47604

fbgt_else.47603:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47604:
fbgt_cont.47598:
	nop
	nop
	nop
	j	fbgt_cont.47596

fbgt_else.47595:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47596:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47607

	lw	%v0, 93(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47609

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47608

bnei_else.47609:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47610:
	nop
	nop
	nop
	j	fbgt_cont.47608

fbgt_else.47607:
	lw	%v0, 93(%sp)
	nop
	nop
	nop

fbgt_cont.47608:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47611

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47612

fbgt_else.47611:
fbgt_cont.47612:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47613

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47614

fbgt_else.47613:
fbgt_cont.47614:
	flw	%f3, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f3, %f0, fbgt_else.47615

	flw	%f6, 477(%zero)
	flw	%f7, 476(%zero)
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

	flw	%f7, 475(%zero)
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
	j	fbgt_cont.47616

fbgt_else.47615:
	flw	%f5, 474(%zero)
	flw	%f6, 473(%zero)
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

	flw	%f6, 472(%zero)
	nop
	fsub	%f5, %f5, %f6
	nop

	nop
	nop
	fmul	%f6, %f6, %f4
	nop

	flw	%f6, 471(%zero)
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

fbgt_cont.47616:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47617

	nop
	nop
	nop
	j	bnei_cont.47618

bnei_else.47617:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47618:
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
	fblt	%f0, %f5, fbgt_else.47619

	flw	%f6, 492(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47621

	flw	%f6, 491(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47623

	flw	%f6, 490(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47625

	flw	%f6, 489(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47627

	flw	%f6, 488(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47629

	flw	%f6, 487(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47631

	flw	%f6, 486(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47633

	flw	%f6, 485(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47635

	flw	%f6, 484(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f6, fbgt_else.47637

	flw	%f6, 483(%zero)
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
	j	fbgt_cont.47620

fbgt_else.47637:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47638:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47635:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47636:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47633:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47634:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47631:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47632:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47629:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47630:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47627:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47628:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47625:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47626:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47623:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47624:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47621:
	nop
	nop
	fmov	%f0, %f6
	nop

fbgt_cont.47622:
	nop
	nop
	nop
	j	fbgt_cont.47620

fbgt_else.47619:
	nop
	nop
	fmov	%f0, %f5
	nop

fbgt_cont.47620:
	flw	%f1, 95(%sp)
	flw	%f2, 72(%sp)
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f2, fbgt_else.47639

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47641

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
	fblt	%f1, %f2, fbgt_else.47643

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47645

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
	j	fbgt_cont.47640

fbgt_else.47645:
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

fbgt_cont.47646:
	nop
	nop
	nop
	j	fbgt_cont.47640

fbgt_else.47643:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47644:
	nop
	nop
	nop
	j	fbgt_cont.47640

fbgt_else.47641:
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
	fblt	%f1, %f2, fbgt_else.47647

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47649

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
	j	fbgt_cont.47648

fbgt_else.47649:
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

fbgt_cont.47650:
	nop
	nop
	nop
	j	fbgt_cont.47648

fbgt_else.47647:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47648:
fbgt_cont.47642:
	nop
	nop
	nop
	j	fbgt_cont.47640

fbgt_else.47639:
	nop
	nop
	fmov	%f0, %f1
	nop

fbgt_cont.47640:
	flw	%f1, 70(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47651

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47652

fbgt_else.47651:
	nop
	nop
	addi	%v0, %zero, 1
	nop

fbgt_cont.47652:
	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47653

	nop
	nop
	fsub	%f0, %f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.47654

fbgt_else.47653:
fbgt_cont.47654:
	flw	%f2, 75(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47655

	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47657

	nop
	nop
	addi	%v0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47656

bnei_else.47657:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bnei_cont.47658:
	nop
	nop
	nop
	j	fbgt_cont.47656

fbgt_else.47655:
fbgt_cont.47656:
	nop
	nop
	nop
	fblt	%f0, %f2, fbgt_else.47659

	nop
	nop
	fsub	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47660

fbgt_else.47659:
fbgt_cont.47660:
	flw	%f1, 74(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.47661

	flw	%f2, 474(%zero)
	flw	%f3, 473(%zero)
	fmul	%f0, %f0, %f0
	nop

	nop
	nop
	fmul	%f1, %f0, %f0
	fmul	%f3, %f3, %f0

	flw	%f3, 472(%zero)
	nop
	fsub	%f2, %f2, %f3
	nop

	nop
	nop
	fmul	%f3, %f3, %f1
	nop

	flw	%f3, 471(%zero)
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
	j	fbgt_cont.47662

fbgt_else.47661:
	flw	%f3, 477(%zero)
	flw	%f4, 476(%zero)
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

	flw	%f4, 475(%zero)
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

fbgt_cont.47662:
	nop
	nop
	nop
	beqi	%v0, 0, bnei_else.47663

	nop
	nop
	nop
	j	bnei_cont.47664

bnei_else.47663:
	nop
	nop
	fneg	%f0, %f0
	nop

bnei_cont.47664:
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
	jal	read_object.2772

	nop
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
	beqi	%v1, -1, bnei_else.47665

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
	j	bnei_cont.47666

bnei_else.47665:
bnei_cont.47666:
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
	beqi	%v0, -1, bnei_else.47667

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
	j	bnei_cont.47668

bnei_else.47667:
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

bnei_cont.47668:
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
	blti	%v0, 10, bgti_else.47669

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47671

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47673

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47675

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
	j	bgti_cont.47670

bgti_else.47675:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.47676:
	nop
	nop
	nop
	j	bgti_cont.47670

bgti_else.47673:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.47674:
	nop
	nop
	nop
	j	bgti_cont.47670

bgti_else.47671:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.47672:
	nop
	nop
	nop
	j	bgti_cont.47670

bgti_else.47669:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.47670:
	lw	%v1, 11(%sp)
	sw	%v0, 98(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47677

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47679

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47681

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47683

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47685

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47687

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47689

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47691

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47693

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47695

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47697

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47699

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
	j	bgti_cont.47678

bgti_else.47699:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47700:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47697:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47698:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47695:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47696:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47693:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47694:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47691:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47692:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47689:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47690:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47687:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47688:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47685:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47686:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47683:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47684:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47681:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47682:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47679:
	nop
	nop
	add	%v0, %zero, %a0
	nop

bgti_cont.47680:
	nop
	nop
	nop
	j	bgti_cont.47678

bgti_else.47677:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47678:
	lw	%v1, 98(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.47701

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
	j	bgt_cont.47702

bgt_else.47701:
	sw	%v0, 99(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47703

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47705

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47707

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47709

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
	j	bgti_cont.47704

bgti_else.47709:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.47710:
	nop
	nop
	nop
	j	bgti_cont.47704

bgti_else.47707:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.47708:
	nop
	nop
	nop
	j	bgti_cont.47704

bgti_else.47705:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.47706:
	nop
	nop
	nop
	j	bgti_cont.47704

bgti_else.47703:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.47704:
	lw	%v1, 98(%sp)
	sw	%v0, 100(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47711

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47713

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47715

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47717

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47719

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47721

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47723

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47725

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47727

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47729

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47731

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47733

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
	j	bgti_cont.47712

bgti_else.47733:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47734:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47731:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47732:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47729:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47730:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47727:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47728:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47725:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47726:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47723:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47724:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47721:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47722:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47719:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47720:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47717:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47718:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47715:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47716:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47713:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47714:
	nop
	nop
	nop
	j	bgti_cont.47712

bgti_else.47711:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47712:
	lw	%v1, 100(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.47735

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
	j	bgt_cont.47736

bgt_else.47735:
	sw	%v0, 101(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47737

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47739

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47741

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47743

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47745

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47747

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47749

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47751

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47753

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47755

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47757

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47759

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
	j	bgti_cont.47738

bgti_else.47759:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47760:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47757:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47758:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47755:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47756:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47753:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47754:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47751:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47752:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47749:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47750:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47747:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47748:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47745:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47746:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47743:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47744:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47741:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47742:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47739:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47740:
	nop
	nop
	nop
	j	bgti_cont.47738

bgti_else.47737:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47738:
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

bgt_cont.47736:
bgt_cont.47702:
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
	blti	%v0, 10, bgti_else.47761

	nop
	nop
	addi	%v1, %v0, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47763

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47765

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47767

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
	j	bgti_cont.47762

bgti_else.47767:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.47768:
	nop
	nop
	nop
	j	bgti_cont.47762

bgti_else.47765:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.47766:
	nop
	nop
	nop
	j	bgti_cont.47762

bgti_else.47763:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.47764:
	nop
	nop
	nop
	j	bgti_cont.47762

bgti_else.47761:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.47762:
	lw	%v1, 103(%sp)
	sw	%v0, 104(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47769

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47771

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47773

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47775

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47777

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47779

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47781

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47783

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47785

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47787

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47789

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47791

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
	j	bgti_cont.47770

bgti_else.47791:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47792:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47789:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47790:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47787:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47788:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47785:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47786:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47783:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47784:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47781:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47782:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47779:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47780:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47777:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47778:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47775:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47776:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47773:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47774:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47771:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47772:
	nop
	nop
	nop
	j	bgti_cont.47770

bgti_else.47769:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47770:
	lw	%v1, 104(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.47793

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
	j	bgt_cont.47794

bgt_else.47793:
	sw	%v0, 105(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47795

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47797

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47799

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47801

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
	j	bgti_cont.47796

bgti_else.47801:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.47802:
	nop
	nop
	nop
	j	bgti_cont.47796

bgti_else.47799:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.47800:
	nop
	nop
	nop
	j	bgti_cont.47796

bgti_else.47797:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.47798:
	nop
	nop
	nop
	j	bgti_cont.47796

bgti_else.47795:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.47796:
	lw	%v1, 104(%sp)
	sw	%v0, 106(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47803

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47805

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47807

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47809

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47811

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47813

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47815

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47817

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47819

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47821

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47823

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47825

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
	j	bgti_cont.47804

bgti_else.47825:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47826:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47823:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47824:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47821:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47822:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47819:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47820:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47817:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47818:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47815:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47816:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47813:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47814:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47811:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47812:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47809:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47810:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47807:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47808:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47805:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47806:
	nop
	nop
	nop
	j	bgti_cont.47804

bgti_else.47803:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47804:
	lw	%v1, 106(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.47827

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
	j	bgt_cont.47828

bgt_else.47827:
	sw	%v0, 107(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47829

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47831

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47833

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47835

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47837

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47839

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47841

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47843

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47845

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47847

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47849

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47851

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
	j	bgti_cont.47830

bgti_else.47851:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47852:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47849:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47850:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47847:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47848:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47845:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47846:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47843:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47844:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47841:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47842:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47839:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47840:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47837:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47838:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47835:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47836:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47833:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47834:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47831:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47832:
	nop
	nop
	nop
	j	bgti_cont.47830

bgti_else.47829:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47830:
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

bgt_cont.47828:
bgt_cont.47794:
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
	blt	%zero, %v1, bgt_else.47853

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
	j	bgt_cont.47854

bgt_else.47853:
	sw	%v0, 109(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47855

	nop
	nop
	addi	%a0, %v1, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47857

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47859

	nop
	nop
	addi	%a0, %a0, -10
	nop

	nop
	nop
	nop
	blti	%a0, 10, bgti_else.47861

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
	j	bgti_cont.47856

bgti_else.47861:
	nop
	nop
	addi	%v0, %zero, 3
	nop

bgti_cont.47862:
	nop
	nop
	nop
	j	bgti_cont.47856

bgti_else.47859:
	nop
	nop
	addi	%v0, %zero, 2
	nop

bgti_cont.47860:
	nop
	nop
	nop
	j	bgti_cont.47856

bgti_else.47857:
	nop
	nop
	addi	%v0, %zero, 1
	nop

bgti_cont.47858:
	nop
	nop
	nop
	j	bgti_cont.47856

bgti_else.47855:
	nop
	nop
	addi	%v0, %zero, 0
	nop

bgti_cont.47856:
	lw	%v1, 108(%sp)
	sw	%v0, 110(%sp)
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47863

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47865

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47867

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47869

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47871

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47873

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47875

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47877

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47879

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47881

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47883

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47885

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
	j	bgti_cont.47864

bgti_else.47885:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47886:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47883:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47884:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47881:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47882:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47879:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47880:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47877:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47878:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47875:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47876:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47873:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47874:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47871:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47872:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47869:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47870:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47867:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47868:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47865:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47866:
	nop
	nop
	nop
	j	bgti_cont.47864

bgti_else.47863:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47864:
	lw	%v1, 110(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blt	%zero, %v1, bgt_else.47887

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
	j	bgt_cont.47888

bgt_else.47887:
	sw	%v0, 111(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47889

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47891

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47893

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47895

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47897

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47899

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47901

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47903

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47905

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47907

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47909

	nop
	nop
	addi	%v1, %v1, -10
	nop

	nop
	nop
	nop
	blti	%v1, 10, bgti_else.47911

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
	j	bgti_cont.47890

bgti_else.47911:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47912:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47909:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47910:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47907:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47908:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47905:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47906:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47903:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47904:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47901:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47902:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47899:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47900:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47897:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47898:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47895:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47896:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47893:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47894:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47891:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47892:
	nop
	nop
	nop
	j	bgti_cont.47890

bgti_else.47889:
	nop
	nop
	add	%v0, %zero, %v1
	nop

bgti_cont.47890:
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

bgt_cont.47888:
bgt_cont.47854:
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

	flw	%f1, 460(%zero)
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
	blti	%v1, 0, bgti_else.47913

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
	beqi	%a1, 1, bnei_else.47915

	nop
	nop
	nop
	beqi	%a1, 2, bnei_else.47917

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
	beqi	%a0, 0, bnei_else.47919

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
	j	bnei_cont.47920

bnei_else.47919:
bnei_cont.47920:
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
	beqi	%a0, 0, bnei_else.47921

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

	flw	%f8, 473(%zero)
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
	j	bnei_cont.47922

bnei_else.47921:
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

bnei_cont.47922:
	flw	%f0, 2(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f3, %f0, fbeq_else.47923

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.47924

fbeq_else.47923:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.47924:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47925

	nop
	nop
	nop
	j	bnei_cont.47926

bnei_else.47925:
	flw	%f1, 474(%zero)
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

bnei_cont.47926:
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
	j	bnei_cont.47916

bnei_else.47917:
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
	fblt	%f1, %f0, fbgt_else.47927

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47928

fbgt_else.47927:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.47928:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47929

	flw	%f2, 468(%zero)
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
	j	bnei_cont.47930

bnei_else.47929:
	fsw	%f1, 0(%v0)
	nop
	nop
	nop

bnei_cont.47930:
	lw	%v1, 119(%sp)
	nop
	nop
	nop

	sw	%v0, 187(%v1)
	nop
	nop
	nop

bnei_cont.47918:
	nop
	nop
	nop
	j	bnei_cont.47916

bnei_else.47915:
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
	fbne	%f0, %f1, fbeq_else.47931

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.47932

fbeq_else.47931:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.47932:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47933

	fsw	%f1, 1(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.47934

bnei_else.47933:
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
	fblt	%f0, %f1, fbgt_else.47935

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47936

fbgt_else.47935:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.47936:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47937

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47939

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.47938

bnei_else.47939:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.47940:
	nop
	nop
	nop
	j	bnei_cont.47938

bnei_else.47937:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.47938:
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
	beqi	%a0, 0, bnei_else.47941

	nop
	nop
	nop
	j	bnei_cont.47942

bnei_else.47941:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.47942:
	fsw	%f2, 0(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.47934:
	flw	%f0, 185(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.47943

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.47944

fbeq_else.47943:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.47944:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47945

	fsw	%f1, 3(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.47946

bnei_else.47945:
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
	fblt	%f0, %f1, fbgt_else.47947

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47948

fbgt_else.47947:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.47948:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47949

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47951

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.47950

bnei_else.47951:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.47952:
	nop
	nop
	nop
	j	bnei_cont.47950

bnei_else.47949:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.47950:
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
	beqi	%a0, 0, bnei_else.47953

	nop
	nop
	nop
	j	bnei_cont.47954

bnei_else.47953:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.47954:
	fsw	%f2, 2(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.47946:
	flw	%f0, 186(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fbne	%f0, %f1, fbeq_else.47955

	nop
	nop
	addi	%v1, %zero, 1
	nop

	nop
	nop
	nop
	j	fbeq_cont.47956

fbeq_else.47955:
	nop
	nop
	addi	%v1, %zero, 0
	nop

fbeq_cont.47956:
	nop
	nop
	nop
	beqi	%v1, 0, bnei_else.47957

	fsw	%f1, 5(%v0)
	nop
	nop
	nop

	nop
	nop
	nop
	j	bnei_cont.47958

bnei_else.47957:
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
	fblt	%f0, %f1, fbgt_else.47959

	nop
	nop
	addi	%a1, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47960

fbgt_else.47959:
	nop
	nop
	addi	%a1, %zero, 1
	nop

fbgt_cont.47960:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47961

	nop
	nop
	nop
	beqi	%a1, 0, bnei_else.47963

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	bnei_cont.47962

bnei_else.47963:
	nop
	nop
	addi	%a0, %zero, 1
	nop

bnei_cont.47964:
	nop
	nop
	nop
	j	bnei_cont.47962

bnei_else.47961:
	nop
	nop
	add	%a0, %zero, %a1
	nop

bnei_cont.47962:
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
	beqi	%a0, 0, bnei_else.47965

	nop
	nop
	nop
	j	bnei_cont.47966

bnei_else.47965:
	nop
	nop
	fneg	%f2, %f2
	nop

bnei_cont.47966:
	fsw	%f2, 4(%v0)
	flw	%f2, 474(%zero)
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

bnei_cont.47958:
	lw	%v1, 119(%sp)
	nop
	nop
	nop

	sw	%v0, 187(%v1)
	nop
	nop
	nop

bnei_cont.47916:
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
	j	bgti_cont.47914

bgti_else.47913:
bgti_cont.47914:
	lw	%v0, 119(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	blti	%v0, 0, bgti_else.47967

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
	beqi	%a0, 2, bnei_else.47969

	nop
	nop
	nop
	j	bgti_cont.47968

bnei_else.47969:
	lw	%a0, 7(%v1)
	flw	%f1, 474(%zero)
	nop
	nop

	flw	%f0, 0(%a0)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f0, %f1, fbgt_else.47971

	nop
	nop
	addi	%a0, %zero, 0
	nop

	nop
	nop
	nop
	j	fbgt_cont.47972

fbgt_else.47971:
	nop
	nop
	addi	%a0, %zero, 1
	nop

fbgt_cont.47972:
	nop
	nop
	nop
	beqi	%a0, 0, bnei_else.47973

	lw	%a0, 1(%v1)
	nop
	nop
	nop

	nop
	nop
	nop
	beqi	%a0, 1, bnei_else.47975

	nop
	nop
	nop
	beqi	%a0, 2, bnei_else.47977

	nop
	nop
	nop
	j	bnei_cont.47974

bnei_else.47977:
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

bnei_cont.47978:
	nop
	nop
	nop
	j	bnei_cont.47974

bnei_else.47975:
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

bnei_cont.47976:
	nop
	nop
	nop
	j	bnei_cont.47974

bnei_else.47973:
bnei_cont.47974:
bnei_cont.47970:
	nop
	nop
	nop
	j	bgti_cont.47968

bgti_else.47967:
bgti_cont.47968:
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

