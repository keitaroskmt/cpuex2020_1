.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 6
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
	addi	%a0, %v0, 0
	addi	%v0, %hp, 0
create_float_array_loop:
	bne	%a0, %zero, create_float_array_cont
	jr	%ra
create_float_array_cont:
	fsw	%f0, 0(%hp)
	addi	%a0, %a0, -1
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
float_fib.10:
	flw	%f1, 5(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.234
	jr	%ra
beq_else.234:
	flw	%f1, 5(%zero)
	fsub	%f1, %f0, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 0(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.235
	fadd	%f0, %fzero, %f1
	j	beq_cont.236
beq_else.235:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 1(%sp)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.237
	fadd	%f0, %fzero, %f2
	j	beq_cont.238
beq_else.237:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 5(%zero)
	fsw	%f2, 2(%sp)
	fslt	%at, %f4, %f3
	bne	%at, %zero, beq_else.239
	fadd	%f0, %fzero, %f3
	j	beq_cont.240
beq_else.239:
	flw	%f4, 5(%zero)
	fsub	%f4, %f3, %f4
	fsw	%f3, 3(%sp)
	fadd	%f0, %f4, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_fib.10
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 3(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.10
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
beq_cont.240:
	flw	%f1, 4(%zero)
	flw	%f2, 2(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 5(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.241
	fadd	%f0, %fzero, %f1
	j	beq_cont.242
beq_else.241:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 6(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.10
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 6(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 7(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 8(%sp)
	addi	%sp, %sp, 9
	jal	float_fib.10
	addi	%sp, %sp, -9
	lw	%ra, 8(%sp)
	flw	%f1, 7(%sp)
	fadd	%f0, %f1, %f0
beq_cont.242:
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
beq_cont.238:
	flw	%f1, 4(%zero)
	flw	%f2, 1(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 8(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.243
	fadd	%f0, %fzero, %f1
	j	beq_cont.244
beq_else.243:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 9(%sp)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.245
	fadd	%f0, %fzero, %f2
	j	beq_cont.246
beq_else.245:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	fsw	%f2, 10(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 11(%sp)
	addi	%sp, %sp, 12
	jal	float_fib.10
	addi	%sp, %sp, -12
	lw	%ra, 11(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 10(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 11(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 13
	jal	float_fib.10
	addi	%sp, %sp, -13
	lw	%ra, 12(%sp)
	flw	%f1, 11(%sp)
	fadd	%f0, %f1, %f0
beq_cont.246:
	flw	%f1, 4(%zero)
	flw	%f2, 9(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 12(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.247
	fadd	%f0, %fzero, %f1
	j	beq_cont.248
beq_else.247:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 13(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 14(%sp)
	addi	%sp, %sp, 15
	jal	float_fib.10
	addi	%sp, %sp, -15
	lw	%ra, 14(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 13(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 14(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	float_fib.10
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	flw	%f1, 14(%sp)
	fadd	%f0, %f1, %f0
beq_cont.248:
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
beq_cont.244:
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
beq_cont.236:
	flw	%f1, 4(%zero)
	flw	%f2, 0(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 15(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.249
	fadd	%f0, %fzero, %f1
	j	beq_cont.250
beq_else.249:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 16(%sp)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.251
	fadd	%f0, %fzero, %f2
	j	beq_cont.252
beq_else.251:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	flw	%f4, 5(%zero)
	fsw	%f2, 17(%sp)
	fslt	%at, %f4, %f3
	bne	%at, %zero, beq_else.253
	fadd	%f0, %fzero, %f3
	j	beq_cont.254
beq_else.253:
	flw	%f4, 5(%zero)
	fsub	%f4, %f3, %f4
	fsw	%f3, 18(%sp)
	fadd	%f0, %f4, %fzero
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	float_fib.10
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 18(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 19(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 21
	jal	float_fib.10
	addi	%sp, %sp, -21
	lw	%ra, 20(%sp)
	flw	%f1, 19(%sp)
	fadd	%f0, %f1, %f0
beq_cont.254:
	flw	%f1, 4(%zero)
	flw	%f2, 17(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 20(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.255
	fadd	%f0, %fzero, %f1
	j	beq_cont.256
beq_else.255:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 21(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 22(%sp)
	addi	%sp, %sp, 23
	jal	float_fib.10
	addi	%sp, %sp, -23
	lw	%ra, 22(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 21(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 22(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 23(%sp)
	addi	%sp, %sp, 24
	jal	float_fib.10
	addi	%sp, %sp, -24
	lw	%ra, 23(%sp)
	flw	%f1, 22(%sp)
	fadd	%f0, %f1, %f0
beq_cont.256:
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
beq_cont.252:
	flw	%f1, 4(%zero)
	flw	%f2, 16(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 23(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.257
	fadd	%f0, %fzero, %f1
	j	beq_cont.258
beq_else.257:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 5(%zero)
	fsw	%f1, 24(%sp)
	fslt	%at, %f3, %f2
	bne	%at, %zero, beq_else.259
	fadd	%f0, %fzero, %f2
	j	beq_cont.260
beq_else.259:
	flw	%f3, 5(%zero)
	fsub	%f3, %f2, %f3
	fsw	%f2, 25(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 26(%sp)
	addi	%sp, %sp, 27
	jal	float_fib.10
	addi	%sp, %sp, -27
	lw	%ra, 26(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 25(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 26(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	float_fib.10
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	flw	%f1, 26(%sp)
	fadd	%f0, %f1, %f0
beq_cont.260:
	flw	%f1, 4(%zero)
	flw	%f2, 24(%sp)
	fsub	%f1, %f2, %f1
	flw	%f2, 5(%zero)
	fsw	%f0, 27(%sp)
	fslt	%at, %f2, %f1
	bne	%at, %zero, beq_else.261
	fadd	%f0, %fzero, %f1
	j	beq_cont.262
beq_else.261:
	flw	%f2, 5(%zero)
	fsub	%f2, %f1, %f2
	fsw	%f1, 28(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 29(%sp)
	addi	%sp, %sp, 30
	jal	float_fib.10
	addi	%sp, %sp, -30
	lw	%ra, 29(%sp)
	flw	%f1, 4(%zero)
	flw	%f2, 28(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 29(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 30(%sp)
	addi	%sp, %sp, 31
	jal	float_fib.10
	addi	%sp, %sp, -31
	lw	%ra, 30(%sp)
	flw	%f1, 29(%sp)
	fadd	%f0, %f1, %f0
beq_cont.262:
	flw	%f1, 27(%sp)
	fadd	%f0, %f1, %f0
beq_cont.258:
	flw	%f1, 23(%sp)
	fadd	%f0, %f1, %f0
beq_cont.250:
	flw	%f1, 15(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	flw	%f0, 3(%zero)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	float_fib.10
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	flw	%f1, 2(%zero)
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	float_fib.10
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	flw	%f1, 0(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%zero)
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_fib.10
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%zero)
	fsw	%f0, 2(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	float_fib.10
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f1, 2(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 2(%zero)
	fsw	%f0, 3(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 5
	jal	float_fib.10
	addi	%sp, %sp, -5
	lw	%ra, 4(%sp)
	flw	%f1, 1(%zero)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 5(%sp)
	addi	%sp, %sp, 6
	jal	float_fib.10
	addi	%sp, %sp, -6
	lw	%ra, 5(%sp)
	flw	%f1, 4(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 1(%zero)
	fsw	%f0, 5(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 6(%sp)
	addi	%sp, %sp, 7
	jal	float_fib.10
	addi	%sp, %sp, -7
	lw	%ra, 6(%sp)
	flw	%f1, 0(%zero)
	fsw	%f0, 6(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	float_fib.10
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	flw	%f1, 6(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 5(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 3(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 7(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_float
	addi	%sp, %sp, -8
	lw	%ra, 7(%sp)
	ret
