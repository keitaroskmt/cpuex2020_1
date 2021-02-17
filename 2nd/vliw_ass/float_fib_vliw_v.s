	nop
	nop
	lui	%sp, 1
	lui	%hp, 0

	nop
	nop
	ori	%sp, %sp, 64464
	ori	%hp, %hp, 6

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

float_fib.9:
	flw	%f1, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f1, %f0, fbgt_else.232

	nop
	nop
	nop
	jr	%ra

fbgt_else.232:
	flw	%f1, 5(%zero)
	fsw	%f0, 0(%sp)
	nop
	nop

	flw	%f2, 5(%zero)
	nop
	fsub	%f1, %f0, %f1
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.233

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.234

fbgt_else.233:
	flw	%f2, 5(%zero)
	fsw	%f1, 1(%sp)
	nop
	nop

	flw	%f3, 5(%zero)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.235

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	j	fbgt_cont.236

fbgt_else.235:
	flw	%f3, 5(%zero)
	fsw	%f2, 2(%sp)
	nop
	nop

	flw	%f4, 5(%zero)
	nop
	fsub	%f3, %f2, %f3
	nop

	nop
	nop
	nop
	fblt	%f4, %f3, fbgt_else.237

	nop
	nop
	fmov	%f0, %f3
	nop

	nop
	nop
	nop
	j	fbgt_cont.238

fbgt_else.237:
	flw	%f4, 5(%zero)
	fsw	%f3, 3(%sp)
	nop
	nop

	sw	%ra, 4(%sp)
	nop
	fsub	%f4, %f3, %f4
	nop

	nop
	nop
	fmov	%f0, %f4
	addi	%sp, %sp, 5

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
	nop
	nop
	nop

	flw	%f2, 3(%sp)
	nop
	nop
	nop

	fsw	%f0, 4(%sp)
	nop
	fsub	%f1, %f2, %f1
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
	jal	float_fib.9

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
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.238:
	flw	%f1, 4(%zero)
	flw	%f2, 2(%sp)
	nop
	nop

	fsw	%f0, 5(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.239

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.240

fbgt_else.239:
	flw	%f2, 5(%zero)
	fsw	%f1, 6(%sp)
	nop
	nop

	sw	%ra, 7(%sp)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	addi	%sp, %sp, 8

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -8
	nop

	lw	%ra, 7(%sp)
	nop
	nop
	nop

	flw	%f2, 6(%sp)
	nop
	nop
	nop

	fsw	%f0, 7(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 8(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 9
	nop

	nop
	nop
	nop
	jal	float_fib.9

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
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.240:
	flw	%f1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.236:
	flw	%f1, 4(%zero)
	flw	%f2, 1(%sp)
	nop
	nop

	fsw	%f0, 8(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.241

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.242

fbgt_else.241:
	flw	%f2, 5(%zero)
	fsw	%f1, 9(%sp)
	nop
	nop

	flw	%f3, 5(%zero)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.243

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	j	fbgt_cont.244

fbgt_else.243:
	flw	%f3, 5(%zero)
	fsw	%f2, 10(%sp)
	nop
	nop

	sw	%ra, 11(%sp)
	nop
	fsub	%f3, %f2, %f3
	nop

	nop
	nop
	fmov	%f0, %f3
	addi	%sp, %sp, 12

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -12
	nop

	lw	%ra, 11(%sp)
	nop
	nop
	nop

	flw	%f2, 10(%sp)
	nop
	nop
	nop

	fsw	%f0, 11(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 12(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 13
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -13
	nop

	lw	%ra, 12(%sp)
	nop
	nop
	nop

	flw	%f1, 11(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.244:
	flw	%f1, 4(%zero)
	flw	%f2, 9(%sp)
	nop
	nop

	fsw	%f0, 12(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.245

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.246

fbgt_else.245:
	flw	%f2, 5(%zero)
	fsw	%f1, 13(%sp)
	nop
	nop

	sw	%ra, 14(%sp)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	addi	%sp, %sp, 15

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -15
	nop

	lw	%ra, 14(%sp)
	nop
	nop
	nop

	flw	%f2, 13(%sp)
	nop
	nop
	nop

	fsw	%f0, 14(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 15(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 16
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -16
	nop

	lw	%ra, 15(%sp)
	nop
	nop
	nop

	flw	%f1, 14(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.246:
	flw	%f1, 12(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.242:
	flw	%f1, 8(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.234:
	flw	%f1, 4(%zero)
	flw	%f2, 0(%sp)
	nop
	nop

	fsw	%f0, 15(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.247

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.248

fbgt_else.247:
	flw	%f2, 5(%zero)
	fsw	%f1, 16(%sp)
	nop
	nop

	flw	%f3, 5(%zero)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.249

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	j	fbgt_cont.250

fbgt_else.249:
	flw	%f3, 5(%zero)
	fsw	%f2, 17(%sp)
	nop
	nop

	flw	%f4, 5(%zero)
	nop
	fsub	%f3, %f2, %f3
	nop

	nop
	nop
	nop
	fblt	%f4, %f3, fbgt_else.251

	nop
	nop
	fmov	%f0, %f3
	nop

	nop
	nop
	nop
	j	fbgt_cont.252

fbgt_else.251:
	flw	%f4, 5(%zero)
	fsw	%f3, 18(%sp)
	nop
	nop

	sw	%ra, 19(%sp)
	nop
	fsub	%f4, %f3, %f4
	nop

	nop
	nop
	fmov	%f0, %f4
	addi	%sp, %sp, 20

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -20
	nop

	lw	%ra, 19(%sp)
	nop
	nop
	nop

	flw	%f2, 18(%sp)
	nop
	nop
	nop

	fsw	%f0, 19(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 20(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 21
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -21
	nop

	lw	%ra, 20(%sp)
	nop
	nop
	nop

	flw	%f1, 19(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.252:
	flw	%f1, 4(%zero)
	flw	%f2, 17(%sp)
	nop
	nop

	fsw	%f0, 20(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.253

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.254

fbgt_else.253:
	flw	%f2, 5(%zero)
	fsw	%f1, 21(%sp)
	nop
	nop

	sw	%ra, 22(%sp)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	addi	%sp, %sp, 23

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -23
	nop

	lw	%ra, 22(%sp)
	nop
	nop
	nop

	flw	%f2, 21(%sp)
	nop
	nop
	nop

	fsw	%f0, 22(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 23(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 24
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -24
	nop

	lw	%ra, 23(%sp)
	nop
	nop
	nop

	flw	%f1, 22(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.254:
	flw	%f1, 20(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.250:
	flw	%f1, 4(%zero)
	flw	%f2, 16(%sp)
	nop
	nop

	fsw	%f0, 23(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.255

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.256

fbgt_else.255:
	flw	%f2, 5(%zero)
	fsw	%f1, 24(%sp)
	nop
	nop

	flw	%f3, 5(%zero)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	nop
	fblt	%f3, %f2, fbgt_else.257

	nop
	nop
	fmov	%f0, %f2
	nop

	nop
	nop
	nop
	j	fbgt_cont.258

fbgt_else.257:
	flw	%f3, 5(%zero)
	fsw	%f2, 25(%sp)
	nop
	nop

	sw	%ra, 26(%sp)
	nop
	fsub	%f3, %f2, %f3
	nop

	nop
	nop
	fmov	%f0, %f3
	addi	%sp, %sp, 27

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -27
	nop

	lw	%ra, 26(%sp)
	nop
	nop
	nop

	flw	%f2, 25(%sp)
	nop
	nop
	nop

	fsw	%f0, 26(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 27(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 28
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -28
	nop

	lw	%ra, 27(%sp)
	nop
	nop
	nop

	flw	%f1, 26(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.258:
	flw	%f1, 4(%zero)
	flw	%f2, 24(%sp)
	nop
	nop

	fsw	%f0, 27(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	flw	%f2, 5(%zero)
	nop
	nop
	nop

	nop
	nop
	nop
	fblt	%f2, %f1, fbgt_else.259

	nop
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	nop
	j	fbgt_cont.260

fbgt_else.259:
	flw	%f2, 5(%zero)
	fsw	%f1, 28(%sp)
	nop
	nop

	sw	%ra, 29(%sp)
	nop
	fsub	%f2, %f1, %f2
	nop

	nop
	nop
	fmov	%f0, %f2
	addi	%sp, %sp, 30

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 4(%zero)
	nop
	addi	%sp, %sp, -30
	nop

	lw	%ra, 29(%sp)
	nop
	nop
	nop

	flw	%f2, 28(%sp)
	nop
	nop
	nop

	fsw	%f0, 29(%sp)
	nop
	fsub	%f1, %f2, %f1
	nop

	sw	%ra, 30(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 31
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -31
	nop

	lw	%ra, 30(%sp)
	nop
	nop
	nop

	flw	%f1, 29(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.260:
	flw	%f1, 27(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.256:
	flw	%f1, 23(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

fbgt_cont.248:
	flw	%f1, 15(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	nop
	nop
	nop
	jr	%ra

min_caml_start:
	flw	%f0, 3(%zero)
	sw	%ra, 0(%sp)
	nop
	nop

	nop
	nop
	addi	%sp, %sp, 1
	nop

	nop
	nop
	nop
	jal	float_fib.9

	flw	%f1, 2(%zero)
	nop
	addi	%sp, %sp, -1
	nop

	lw	%ra, 0(%sp)
	nop
	nop
	nop

	fsw	%f0, 0(%sp)
	nop
	nop
	nop

	sw	%ra, 1(%sp)
	nop
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 2
	nop

	nop
	nop
	nop
	jal	float_fib.9

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

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 2(%zero)
	fsw	%f0, 1(%sp)
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
	jal	float_fib.9

	flw	%f1, 1(%zero)
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
	fmov	%f0, %f1
	nop

	nop
	nop
	addi	%sp, %sp, 4
	nop

	nop
	nop
	nop
	jal	float_fib.9

	nop
	nop
	addi	%sp, %sp, -4
	nop

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
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 1(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 2(%zero)
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
	jal	float_fib.9

	flw	%f1, 1(%zero)
	nop
	addi	%sp, %sp, -5
	nop

	lw	%ra, 4(%sp)
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
	jal	float_fib.9

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
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 1(%zero)
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
	jal	float_fib.9

	flw	%f1, 0(%zero)
	nop
	addi	%sp, %sp, -7
	nop

	lw	%ra, 6(%sp)
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
	addi	%sp, %sp, 8
	nop

	nop
	nop
	nop
	jal	float_fib.9

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

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 5(%sp)
	nop
	nop
	nop

	nop
	nop
	fadd	%f0, %f1, %f0
	nop

	flw	%f1, 3(%sp)
	nop
	nop
	nop

	nop
	nop
	nop
	ret

