.section ".text"
.global min_caml_print_newline
min_caml_print_newline:
	set	10, %o0
	st	%o7, [%i0]
	call	putchar
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_print_int
min_caml_print_int:
	set	format_int, %o0
	mov	%i2, %o1
	st	%o7, [%i0]
	call	printf
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_print_byte
min_caml_print_byte:
	mov	%i2, %o0
	st	%o7, [%i0]
	call	putchar
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_prerr_int
min_caml_prerr_int:
	set	min_caml_stderr, %o0
	set	format_int, %o1
	mov	%i2, %o2
	st	%o7, [%i0]
	call	fprintf
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_prerr_byte
min_caml_prerr_byte:
	mov	%i2, %o0
	set	min_caml_stderr, %o1
	st	%o7, [%i0]
	call	fputc
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_prerr_float
min_caml_prerr_float:
	set	min_caml_stderr, %o0
	set	format_float, %o1
	std	%f0, [%i0]
	ldd	[%i0], %o2
	st	%o7, [%i0]
	call	fprintf
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_read_int
min_caml_read_int:
	set	format_int, %o0
	st	%o7, [%i0]
	call	scanf, 0
	add	%fp, -20, %o1	! delay slot
	ld	[%i0], %o7
	ld	[%fp-20], %i2
	retl
	nop
.global min_caml_read_float
min_caml_read_float:
	set	format_float, %o0
	st	%o7, [%i0]
	call	scanf, 0
	add	%fp, -24, %o1	! delay slot
	ld	[%i0], %o7
	ldd	[%fp-24], %f0
	retl
	nop

##################################################
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
	addi	%hp, %hp, 4
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
	addi	%hp, %hp, 4
	j	create_float_array_loop

##################################################

.global min_caml_abs_float
min_caml_abs_float:
	fabss	%f0, %f0
	retl
	nop
.global min_caml_sqrt
min_caml_sqrt:
	fsqrtd	%f0, %f0
	retl
	nop
.global min_caml_floor
min_caml_floor:
	std	%f0, [%i0]
	ldd	[%i0], %o0
	st	%o7, [%i0]
	call	floor
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_int_of_float
min_caml_int_of_float:
.global min_caml_truncate
min_caml_truncate:
	fdtoi	%f0, %f0
	st	%f0, [%i0]
	ld	[%i0], %i2
	retl
	nop
.global min_caml_float_of_int
min_caml_float_of_int:
	st	%i2, [%i0]
	ld	[%i0], %f0
	fitod	%f0, %f0
	retl
	nop
.global min_caml_cos
min_caml_cos:
	std	%f0, [%i0]
	ldd	[%i0], %o0
	st	%o7, [%i0]
	call	cos
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_sin
min_caml_sin:
	std	%f0, [%i0]
	ldd	[%i0], %o0
	st	%o7, [%i0]
	call	sin
	nop
	ld	[%i0], %o7
	retl
	nop
.global min_caml_atan
min_caml_atan:
	std	%f0, [%i0]
	ldd	[%i0], %o0
	st	%o7, [%i0]
	call	atan
	nop
	ld	[%i0], %o7
	retl
	nop
.section ".rodata"
format_int:
	.asciz	"%d"
format_float:
	.asciz	"%lf"
.align 8
float_0:
	.long	0x0
	.long	0x0
float_1:
	.long	0x3ff00000
	.long	0x0
