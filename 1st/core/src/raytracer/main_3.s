.section	".rodata"
.align	8
	lui	%sp, 15
	ori	%sp, %sp, 16960
	lui	%hp, 0
	ori	%hp, %hp, 20000
	lui	%at, 20078
	ori	%at, %at, 27432
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17279
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17152
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16230
	ori	%at, %at, 26214
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15820
	ori	%at, %at, 52429
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 49992
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 17224
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15502
	ori	%at, %at, 64053
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 49024
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16412
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16096
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16201
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16329
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16457
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16585
	ori	%at, %at, 4059
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15733
	ori	%at, %at, 59333
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15799
	ori	%at, %at, 54894
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15843
	ori	%at, %at, 36408
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15890
	ori	%at, %at, 18725
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15948
	ori	%at, %at, 52429
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16042
	ori	%at, %at, 43690
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15027
	ori	%at, %at, 33030
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15658
	ori	%at, %at, 42889
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 14669
	ori	%at, %at, 25782
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15368
	ori	%at, %at, 34406
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 15914
	ori	%at, %at, 43692
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 19200
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 16128
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
	lui	%at, 0
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 4
.section	".text"
	j	min_caml_start
min_caml_print_char:
	out	%v0
	jr	%ra
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
fispos.2650:
	flw	%f1, 20120(%zero)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.7279
	addi	%v0, %zero, 0
	jr	%ra
beq_else.7279:
	addi	%v0, %zero, 1
	jr	%ra
fisneg.2652:
	flw	%f1, 20120(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7280
	addi	%v0, %zero, 0
	jr	%ra
beq_else.7280:
	addi	%v0, %zero, 1
	jr	%ra
fiszero.2654:
	flw	%f1, 20120(%zero)
	fbne	%f0, %f1, fbeq_else.7281
	addi	%v0, %zero, 1
	jr	%ra
fbeq_else.7281:
	addi	%v0, %zero, 0
	jr	%ra
xor.2656:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7282
	add	%v0, %zero, %v1
	jr	%ra
beq_else.7282:
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.7283
	addi	%v0, %zero, 1
	jr	%ra
beq_else.7283:
	addi	%v0, %zero, 0
	jr	%ra
fhalf.2659:
	flw	%f1, 20116(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
fsqr.2661:
	fmul	%f0, %f0, %f0
	jr	%ra
float_of_int_sub1.2673:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.7284
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sub	%v0, %v0, %a0
	addi	%v1, %v1, 1
	j	float_of_int_sub1.2673
beq_else.7284:
	add	%v0, %zero, %v1
	jr	%ra
float_of_int_sub2.2676:
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	slt	%at, %v0, %v1
	bne	%at, %zero, beq_else.7285
	lui	%at, 128
	ori	%at, %at, 0
	add	%v1, %zero, %at
	sub	%v0, %v0, %v1
	j	float_of_int_sub2.2676
beq_else.7285:
	jr	%ra
float_of_int_sub3.2678:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7286
	jr	%ra
beq_else.7286:
	addi	%v0, %v0, -1
	flw	%f1, 20112(%zero)
	fadd	%f0, %f1, %f0
	j	float_of_int_sub3.2678
float_of_int.2681:
	addi	%at, %zero, 0
	slt	%at, %at, %v0
	bne	%at, %zero, beq_else.7287
	addi	%v1, %zero, 0
	j	beq_cont.7288
beq_else.7287:
	addi	%v1, %zero, 1
beq_cont.7288:
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.7289
	j	beq_cont.7290
beq_else.7289:
	sub	%v0, %zero, %v0
beq_cont.7290:
	lui	%at, 128
	ori	%at, %at, 0
	add	%a0, %zero, %at
	sw	%v1, 0(%sp)
	slt	%at, %v0, %a0
	bne	%at, %zero, beq_else.7291
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub2.2676
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lui	%at, 19200
	ori	%at, %at, 0
	add	%v1, %zero, %at
	add	%v0, %v0, %v1
	itof	%f0, %v0
	flw	%f1, 20112(%zero)
	fsub	%f0, %f0, %f1
	addi	%v1, %zero, 0
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub1.2673
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f0, 20120(%zero)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	float_of_int_sub3.2678
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	j	beq_cont.7292
beq_else.7291:
	lui	%at, 19200
	ori	%at, %at, 0
	add	%a0, %zero, %at
	add	%v0, %v0, %a0
	itof	%f0, %v0
	flw	%f1, 20112(%zero)
	fsub	%f0, %f0, %f1
beq_cont.7292:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7293
	fneg	%f0, %f0
	jr	%ra
beq_else.7293:
	jr	%ra
kernel_sin.2685:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 20108(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 20104(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 20100(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
	jr	%ra
kernel_cos.2687:
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 20096(%zero)
	flw	%f3, 20116(%zero)
	fmul	%f3, %f3, %f0
	fsub	%f2, %f2, %f3
	flw	%f3, 20092(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 20088(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	jr	%ra
kernel_atan.2689:
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	fmul	%f3, %f2, %f2
	flw	%f4, 20084(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f1
	fsub	%f4, %f0, %f4
	flw	%f5, 20080(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f2
	fadd	%f4, %f4, %f5
	flw	%f5, 20076(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f1
	fmul	%f5, %f5, %f2
	fsub	%f4, %f4, %f5
	flw	%f5, 20072(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f5, %f5, %f3
	fadd	%f4, %f4, %f5
	flw	%f5, 20068(%zero)
	fmul	%f5, %f5, %f0
	fmul	%f1, %f5, %f1
	fmul	%f1, %f1, %f3
	fsub	%f1, %f4, %f1
	flw	%f4, 20064(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f2
	fmul	%f0, %f0, %f3
	fadd	%f0, %f1, %f0
	jr	%ra
f.6221:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7294
	flw	%f2, 20060(%zero)
	fmul	%f1, %f2, %f1
	j	f.6221
beq_else.7294:
	fadd	%f0, %fzero, %f1
	jr	%ra
g.6225:
	flw	%f2, 4(%k1)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.7295
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7296
	fsub	%f0, %f0, %f1
	flw	%f2, 20060(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.7296:
	flw	%f2, 20060(%zero)
	fdiv	%f1, %f1, %f2
	lw	%at, 0(%k1)
	jr	%at
beq_else.7295:
	jr	%ra
reduction_2pi.2691:
	flw	%f1, 20056(%zero)
	fsw	%f0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	f.6221
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fadd	%f1, %f0, %fzero
	add	%k1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%v0, %zero, g.6225
	sw	%v0, 0(%k1)
	flw	%f0, 4(%sp)
	fsw	%f0, 4(%k1)
	flw	%f0, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
cos.2693:
	flw	%f1, 20052(%zero)
	fabs	%f0, %f0
	fsw	%f1, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	reduction_2pi.2691
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7297
	addi	%v0, %zero, 0
	j	beq_cont.7298
beq_else.7297:
	addi	%v0, %zero, 1
beq_cont.7298:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7299
	fsub	%f0, %f0, %f1
	j	beq_cont.7300
beq_else.7299:
beq_cont.7300:
	flw	%f2, 20048(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.7301
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7303
	addi	%v0, %zero, 1
	j	beq_cont.7304
beq_else.7303:
	addi	%v0, %zero, 0
beq_cont.7304:
	j	beq_cont.7302
beq_else.7301:
beq_cont.7302:
	flw	%f2, 20048(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.7305
	fsub	%f0, %f1, %f0
	j	beq_cont.7306
beq_else.7305:
beq_cont.7306:
	flw	%f1, 20044(%zero)
	sw	%v0, 4(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.7307
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_cos.2687
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	j	beq_cont.7308
beq_else.7307:
	flw	%f1, 20048(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_sin.2685
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
beq_cont.7308:
	lw	%v0, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7309
	fneg	%f0, %f0
	jr	%ra
beq_else.7309:
	jr	%ra
sin.2695:
	flw	%f1, 20052(%zero)
	flw	%f2, 20120(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.7310
	addi	%v0, %zero, 1
	j	beq_cont.7311
beq_else.7310:
	addi	%v0, %zero, 0
beq_cont.7311:
	fabs	%f0, %f0
	sw	%v0, 0(%sp)
	fsw	%f1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi.2691
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7312
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7314
	addi	%v0, %zero, 1
	j	beq_cont.7315
beq_else.7314:
	addi	%v0, %zero, 0
beq_cont.7315:
	j	beq_cont.7313
beq_else.7312:
	lw	%v0, 0(%sp)
beq_cont.7313:
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7316
	fsub	%f0, %f0, %f1
	j	beq_cont.7317
beq_else.7316:
beq_cont.7317:
	flw	%f2, 20048(%zero)
	fslt	%at, %f0, %f2
	bne	%at, %zero, beq_else.7318
	fsub	%f0, %f1, %f0
	j	beq_cont.7319
beq_else.7318:
beq_cont.7319:
	flw	%f1, 20044(%zero)
	sw	%v0, 8(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.7320
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_sin.2685
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	j	beq_cont.7321
beq_else.7320:
	flw	%f1, 20048(%zero)
	fsub	%f0, %f1, %f0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_cos.2687
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
beq_cont.7321:
	lw	%v0, 8(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7322
	fneg	%f0, %f0
	jr	%ra
beq_else.7322:
	jr	%ra
atan.2697:
	flw	%f1, 20120(%zero)
	fslt	%at, %f0, %f1
	bne	%at, %zero, beq_else.7323
	addi	%v0, %zero, 1
	j	beq_cont.7324
beq_else.7323:
	addi	%v0, %zero, 0
beq_cont.7324:
	fabs	%f1, %f0
	flw	%f2, 20040(%zero)
	fslt	%at, %f1, %f2
	bne	%at, %zero, beq_else.7325
	flw	%f0, 20036(%zero)
	sw	%v0, 0(%sp)
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.7326
	flw	%f0, 20048(%zero)
	flw	%f2, 20096(%zero)
	fdiv	%f1, %f2, %f1
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_atan.2689
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fsub	%f0, %f1, %f0
	j	beq_cont.7327
beq_else.7326:
	flw	%f0, 20044(%zero)
	flw	%f2, 20096(%zero)
	fsub	%f2, %f1, %f2
	flw	%f3, 20096(%zero)
	fadd	%f1, %f1, %f3
	fdiv	%f1, %f2, %f1
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	kernel_atan.2689
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
beq_cont.7327:
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7328
	fneg	%f0, %f0
	jr	%ra
beq_else.7328:
	jr	%ra
beq_else.7325:
	j	kernel_atan.2689
print_int_sub1.2699:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.7329
	addi	%v0, %v0, -10
	addi	%v1, %v1, 1
	j	print_int_sub1.2699
beq_else.7329:
	add	%v0, %zero, %v1
	jr	%ra
print_int_sub2.2702:
	slti	%at, %v0, 10
	bne	%at, %zero, beq_else.7330
	addi	%v0, %v0, -10
	j	print_int_sub2.2702
beq_else.7330:
	jr	%ra
print_int.2704:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int_sub1.2699
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub2.2702
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.7331
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.7331:
	addi	%a0, %zero, 0
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	print_int_sub1.2699
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub2.2702
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 12(%sp)
	addi	%at, %zero, 0
	slt	%at, %at, %v1
	bne	%at, %zero, beq_else.7332
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
beq_else.7332:
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	print_int_sub2.2702
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	addi	%v0, %v0, 48
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_print_char
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 48
	j	min_caml_print_char
sgn.2706:
	fsw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fiszero.2654
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7333
	flw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	fispos.2650
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7334
	flw	%f0, 20032(%zero)
	jr	%ra
beq_else.7334:
	flw	%f0, 20096(%zero)
	jr	%ra
beq_else.7333:
	flw	%f0, 20120(%zero)
	jr	%ra
fneg_cond.2708:
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7335
	fneg	%f0, %f0
	jr	%ra
beq_else.7335:
	jr	%ra
add_mod5.2711:
	add	%v0, %v0, %v1
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.7336
	addi	%v0, %v0, -5
	jr	%ra
beq_else.7336:
	jr	%ra
vecset.2714:
	fsw	%f0, 0(%v0)
	fsw	%f1, 4(%v0)
	fsw	%f2, 8(%v0)
	jr	%ra
veccpy.2724:
	flw	%f0, 0(%v1)
	fsw	%f0, 0(%v0)
	flw	%f0, 4(%v1)
	fsw	%f0, 4(%v0)
	flw	%f0, 8(%v1)
	fsw	%f0, 8(%v0)
	jr	%ra
vecunit_sgn.2732:
	flw	%f0, 0(%v0)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2661
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fsqr.2661
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2661
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 12(%sp)
	fadd	%f0, %f1, %f0
	fsqrt	%f0, %f0
	fsw	%f0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fiszero.2654
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7339
	lw	%v0, 0(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7341
	flw	%f0, 20096(%zero)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f0, %f1
	j	beq_cont.7342
beq_else.7341:
	flw	%f0, 20032(%zero)
	flw	%f1, 16(%sp)
	fdiv	%f0, %f0, %f1
beq_cont.7342:
	j	beq_cont.7340
beq_else.7339:
	flw	%f0, 20096(%zero)
beq_cont.7340:
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 0(%v0)
	flw	%f1, 4(%v0)
	fmul	%f1, %f1, %f0
	fsw	%f1, 4(%v0)
	flw	%f1, 8(%v0)
	fmul	%f0, %f1, %f0
	fsw	%f0, 8(%v0)
	jr	%ra
o_form.2762:
	lw	%v0, 4(%v0)
	jr	%ra
o_isinvert.2766:
	lw	%v0, 24(%v0)
	jr	%ra
o_isrot.2768:
	lw	%v0, 12(%v0)
	jr	%ra
o_param_a.2770:
	lw	%v0, 16(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_b.2772:
	lw	%v0, 16(%v0)
	flw	%f0, 4(%v0)
	jr	%ra
o_param_c.2774:
	lw	%v0, 16(%v0)
	flw	%f0, 8(%v0)
	jr	%ra
o_param_r1.2794:
	lw	%v0, 36(%v0)
	flw	%f0, 0(%v0)
	jr	%ra
o_param_r2.2796:
	lw	%v0, 36(%v0)
	flw	%f0, 4(%v0)
	jr	%ra
o_param_r3.2798:
	lw	%v0, 36(%v0)
	flw	%f0, 8(%v0)
	jr	%ra
d_vec.2821:
	lw	%v0, 0(%v0)
	jr	%ra
d_const.2823:
	lw	%v0, 4(%v0)
	jr	%ra
rad.2831:
	flw	%f1, 20028(%zero)
	fmul	%f0, %f0, %f1
	jr	%ra
read_screen_settings.2833:
	lw	%v0, 20(%k1)
	lw	%v1, 16(%k1)
	lw	%a0, 12(%k1)
	lw	%a1, 8(%k1)
	lw	%a2, 4(%k1)
	sw	%v0, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 8(%sp)
	sw	%v1, 12(%sp)
	sw	%a2, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	rad.2831
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	fsw	%f0, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	cos.2693
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20(%sp)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	sin.2695
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	fsw	%f0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	rad.2831
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	fsw	%f0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	cos.2693
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fsw	%f0, 36(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	sin.2695
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f1, 24(%sp)
	fmul	%f2, %f1, %f0
	flw	%f3, 20024(%zero)
	fmul	%f2, %f2, %f3
	lw	%v0, 12(%sp)
	fsw	%f2, 0(%v0)
	flw	%f2, 20020(%zero)
	flw	%f3, 28(%sp)
	fmul	%f2, %f3, %f2
	fsw	%f2, 4(%v0)
	flw	%f2, 36(%sp)
	fmul	%f4, %f1, %f2
	flw	%f5, 20024(%zero)
	fmul	%f4, %f4, %f5
	fsw	%f4, 8(%v0)
	lw	%v1, 8(%sp)
	fsw	%f2, 0(%v1)
	flw	%f4, 20120(%zero)
	fsw	%f4, 4(%v1)
	fneg	%f4, %f0
	fsw	%f4, 8(%v1)
	fneg	%f4, %f3
	fmul	%f0, %f4, %f0
	lw	%v1, 4(%sp)
	fsw	%f0, 0(%v1)
	fneg	%f0, %f1
	fsw	%f0, 4(%v1)
	fneg	%f0, %f3
	fmul	%f0, %f0, %f2
	fsw	%f0, 8(%v1)
	lw	%v1, 16(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 0(%v0)
	fsub	%f0, %f0, %f1
	lw	%a0, 0(%sp)
	fsw	%f0, 0(%a0)
	flw	%f0, 4(%v1)
	flw	%f1, 4(%v0)
	fsub	%f0, %f0, %f1
	fsw	%f0, 4(%a0)
	flw	%f0, 8(%v1)
	flw	%f1, 8(%v0)
	fsub	%f0, %f0, %f1
	fsw	%f0, 8(%a0)
	jr	%ra
read_light.2835:
	lw	%v0, 8(%k1)
	lw	%v1, 4(%k1)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	rad.2831
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fsw	%f0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	sin.2695
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	fneg	%f0, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_float
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	rad.2831
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 8(%sp)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2693
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 12(%sp)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	sin.2695
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2693
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_float
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	jr	%ra
rotate_quadratic_matrix.2837:
	flw	%f0, 0(%v1)
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	cos.2693
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	fsw	%f0, 8(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	sin.2695
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 12(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	cos.2693
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	fsw	%f0, 16(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	sin.2695
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	cos.2693
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	fsw	%f0, 24(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	sin.2695
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 24(%sp)
	flw	%f2, 16(%sp)
	fmul	%f3, %f2, %f1
	flw	%f4, 20(%sp)
	flw	%f5, 12(%sp)
	fmul	%f6, %f5, %f4
	fmul	%f6, %f6, %f1
	flw	%f7, 8(%sp)
	fmul	%f8, %f7, %f0
	fsub	%f6, %f6, %f8
	fmul	%f8, %f7, %f4
	fmul	%f8, %f8, %f1
	fmul	%f9, %f5, %f0
	fadd	%f8, %f8, %f9
	fmul	%f9, %f2, %f0
	fmul	%f10, %f5, %f4
	fmul	%f10, %f10, %f0
	fmul	%f11, %f7, %f1
	fadd	%f10, %f10, %f11
	fmul	%f11, %f7, %f4
	fmul	%f0, %f11, %f0
	fmul	%f1, %f5, %f1
	fsub	%f0, %f0, %f1
	fneg	%f1, %f4
	fmul	%f4, %f5, %f2
	fmul	%f2, %f7, %f2
	lw	%v0, 0(%sp)
	flw	%f5, 0(%v0)
	flw	%f7, 4(%v0)
	flw	%f11, 8(%v0)
	fsw	%f3, 28(%sp)
	fsw	%f2, 32(%sp)
	fsw	%f0, 36(%sp)
	fsw	%f8, 40(%sp)
	fsw	%f4, 44(%sp)
	fsw	%f10, 48(%sp)
	fsw	%f6, 52(%sp)
	fsw	%f11, 56(%sp)
	fsw	%f1, 60(%sp)
	fsw	%f7, 64(%sp)
	fsw	%f9, 68(%sp)
	fsw	%f5, 72(%sp)
	fadd	%f0, %f3, %fzero
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fsqr.2661
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 68(%sp)
	fsw	%f0, 76(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2661
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 76(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 60(%sp)
	fsw	%f0, 80(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2661
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 80(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 52(%sp)
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	fsqr.2661
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 48(%sp)
	fsw	%f0, 84(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2661
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 84(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 44(%sp)
	fsw	%f0, 88(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2661
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 88(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 40(%sp)
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	fsqr.2661
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 36(%sp)
	fsw	%f0, 92(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 104
	jal	fsqr.2661
	addi	%sp, %sp, -104
	lw	%ra, 100(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 92(%sp)
	fadd	%f0, %f2, %f0
	flw	%f2, 32(%sp)
	fsw	%f0, 96(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 100(%sp)
	addi	%sp, %sp, 104
	jal	fsqr.2661
	addi	%sp, %sp, -104
	lw	%ra, 100(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f2, 96(%sp)
	fadd	%f0, %f2, %f0
	lw	%v0, 0(%sp)
	fsw	%f0, 8(%v0)
	flw	%f0, 20060(%zero)
	flw	%f2, 52(%sp)
	flw	%f3, 72(%sp)
	fmul	%f4, %f3, %f2
	flw	%f5, 40(%sp)
	fmul	%f4, %f4, %f5
	flw	%f6, 48(%sp)
	flw	%f7, 64(%sp)
	fmul	%f8, %f7, %f6
	flw	%f9, 36(%sp)
	fmul	%f8, %f8, %f9
	fadd	%f4, %f4, %f8
	flw	%f8, 44(%sp)
	fmul	%f10, %f1, %f8
	flw	%f11, 32(%sp)
	fmul	%f10, %f10, %f11
	fadd	%f4, %f4, %f10
	fmul	%f0, %f0, %f4
	lw	%v0, 4(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 20060(%zero)
	flw	%f4, 28(%sp)
	fmul	%f10, %f3, %f4
	fmul	%f5, %f10, %f5
	flw	%f10, 68(%sp)
	fmul	%f12, %f7, %f10
	fmul	%f9, %f12, %f9
	fadd	%f5, %f5, %f9
	flw	%f9, 60(%sp)
	fmul	%f12, %f1, %f9
	fmul	%f11, %f12, %f11
	fadd	%f5, %f5, %f11
	fmul	%f0, %f0, %f5
	fsw	%f0, 4(%v0)
	flw	%f0, 20060(%zero)
	fmul	%f3, %f3, %f4
	fmul	%f2, %f3, %f2
	fmul	%f3, %f7, %f10
	fmul	%f3, %f3, %f6
	fadd	%f2, %f2, %f3
	fmul	%f1, %f1, %f9
	fmul	%f1, %f1, %f8
	fadd	%f1, %f2, %f1
	fmul	%f0, %f0, %f1
	fsw	%f0, 8(%v0)
	jr	%ra
read_nth_object.2840:
	lw	%v1, 4(%k1)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.7347
	addi	%v0, %zero, 0
	jr	%ra
beq_else.7347:
	sw	%v0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_read_int
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_int
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_read_int
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_read_float
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	fsw	%f0, 8(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_float_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 28(%sp)
	fsw	%f0, 8(%v0)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_read_float
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fisneg.2652
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %zero, 2
	flw	%f0, 20120(%zero)
	sw	%v0, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_float_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	sw	%v0, 36(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 36(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 36(%sp)
	fsw	%f0, 4(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	sw	%v0, 40(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_read_float
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 40(%sp)
	fsw	%f0, 8(%v0)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v1, 20(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.7348
	j	beq_cont.7349
beq_else.7348:
	sw	%v0, 44(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2831
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 0(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2831
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 4(%v0)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_read_float
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	rad.2831
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	lw	%v0, 44(%sp)
	fsw	%f0, 8(%v0)
beq_cont.7349:
	lw	%v1, 12(%sp)
	addi	%at, %zero, 2
	bne	%v1, %at, beq_else.7350
	addi	%a0, %zero, 1
	j	beq_cont.7351
beq_else.7350:
	lw	%a0, 32(%sp)
beq_cont.7351:
	addi	%a1, %zero, 4
	flw	%f0, 20120(%zero)
	sw	%a0, 48(%sp)
	sw	%v0, 44(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 48
	sw	%v0, 40(%v1)
	lw	%v0, 44(%sp)
	sw	%v0, 36(%v1)
	lw	%a0, 40(%sp)
	sw	%a0, 32(%v1)
	lw	%a0, 36(%sp)
	sw	%a0, 28(%v1)
	lw	%a0, 48(%sp)
	sw	%a0, 24(%v1)
	lw	%a0, 28(%sp)
	sw	%a0, 20(%v1)
	lw	%a0, 24(%sp)
	sw	%a0, 16(%v1)
	lw	%a1, 20(%sp)
	sw	%a1, 12(%v1)
	lw	%a2, 16(%sp)
	sw	%a2, 8(%v1)
	lw	%a2, 12(%sp)
	sw	%a2, 4(%v1)
	lw	%a3, 8(%sp)
	sw	%a3, 0(%v1)
	lw	%a3, 4(%sp)
	sll	%a3, %a3, 2
	lw	%t0, 0(%sp)
	add	%at, %t0, %a3
	sw	%v1, 0(%at)
	addi	%at, %zero, 3
	bne	%a2, %at, beq_else.7352
	flw	%f0, 0(%a0)
	fsw	%f0, 52(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	fiszero.2654
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7354
	flw	%f0, 52(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	sgn.2706
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 52(%sp)
	fsw	%f0, 56(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	fsqr.2661
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 56(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.7355
beq_else.7354:
	flw	%f0, 20120(%zero)
beq_cont.7355:
	lw	%v0, 24(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 4(%v0)
	fsw	%f0, 60(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	fiszero.2654
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7356
	flw	%f0, 60(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	sgn.2706
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 60(%sp)
	fsw	%f0, 64(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	fsqr.2661
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 64(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.7357
beq_else.7356:
	flw	%f0, 20120(%zero)
beq_cont.7357:
	lw	%v0, 24(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 8(%v0)
	fsw	%f0, 68(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fiszero.2654
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7358
	flw	%f0, 68(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	sgn.2706
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 68(%sp)
	fsw	%f0, 72(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fsqr.2661
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 72(%sp)
	fdiv	%f0, %f1, %f0
	j	beq_cont.7359
beq_else.7358:
	flw	%f0, 20120(%zero)
beq_cont.7359:
	lw	%v0, 24(%sp)
	fsw	%f0, 8(%v0)
	j	beq_cont.7353
beq_else.7352:
	addi	%at, %zero, 2
	bne	%a2, %at, beq_else.7360
	lw	%v1, 32(%sp)
	addi	%at, %zero, 0
	bne	%v1, %at, beq_else.7362
	addi	%v1, %zero, 1
	j	beq_cont.7363
beq_else.7362:
	addi	%v1, %zero, 0
beq_cont.7363:
	addi	%v0, %a0, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	vecunit_sgn.2732
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	j	beq_cont.7361
beq_else.7360:
beq_cont.7361:
beq_cont.7353:
	lw	%v0, 20(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7364
	j	beq_cont.7365
beq_else.7364:
	lw	%v0, 24(%sp)
	lw	%v1, 44(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	rotate_quadratic_matrix.2837
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
beq_cont.7365:
	addi	%v0, %zero, 1
	jr	%ra
read_object.2842:
	lw	%v1, 8(%k1)
	lw	%a0, 4(%k1)
	slti	%at, %v0, 60
	bne	%at, %zero, beq_else.7366
	jr	%ra
beq_else.7366:
	sw	%k1, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%k1, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7368
	lw	%v0, 4(%sp)
	lw	%v1, 8(%sp)
	sw	%v1, 0(%v0)
	jr	%ra
beq_else.7368:
	lw	%v0, 8(%sp)
	addi	%v0, %v0, 1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
read_all_object.2844:
	lw	%k1, 4(%k1)
	addi	%v0, %zero, 0
	lw	%at, 0(%k1)
	jr	%at
read_net_item.2846:
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_read_int
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.7370
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	addi	%v1, %zero, -1
	j	min_caml_create_array
beq_else.7370:
	lw	%v1, 0(%sp)
	addi	%a0, %v1, 1
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_net_item.2846
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	sll	%v1, %v1, 2
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_or_network.2848:
	addi	%v1, %zero, 0
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	read_net_item.2846
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%v1)
	addi	%at, %zero, -1
	bne	%v0, %at, beq_else.7371
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 1
	j	min_caml_create_array
beq_else.7371:
	lw	%v0, 0(%sp)
	addi	%a0, %v0, 1
	sw	%v1, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_or_network.2848
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	sll	%v1, %v1, 2
	lw	%a0, 4(%sp)
	add	%at, %v0, %v1
	sw	%a0, 0(%at)
	jr	%ra
read_and_network.2850:
	lw	%v1, 4(%k1)
	addi	%a0, %zero, 0
	sw	%k1, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	read_net_item.2846
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%v0)
	addi	%at, %zero, -1
	bne	%v1, %at, beq_else.7372
	jr	%ra
beq_else.7372:
	lw	%v1, 8(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v0, %v1, 1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
read_parameter.2852:
	lw	%v0, 20(%k1)
	lw	%v1, 16(%k1)
	lw	%a0, 12(%k1)
	lw	%a1, 8(%k1)
	lw	%a2, 4(%k1)
	sw	%a2, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%a1, 8(%sp)
	sw	%v1, 12(%sp)
	addi	%k1, %v0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%k1, 8(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v0, %zero, 0
	lw	%k1, 4(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v0, %zero, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	read_or_network.2848
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 0(%v1)
	jr	%ra
quadratic.2875:
	fsw	%f0, 0(%sp)
	fsw	%f2, 4(%sp)
	fsw	%f1, 8(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2661
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	o_param_a.2770
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 8(%sp)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	fsqr.2661
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_param_b.2772
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 24(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 4(%sp)
	fsw	%f0, 28(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fsqr.2661
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 12(%sp)
	fsw	%f0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_c.2774
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 28(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 12(%sp)
	fsw	%f0, 36(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	o_isrot.2768
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7375
	flw	%f0, 36(%sp)
	jr	%ra
beq_else.7375:
	flw	%f0, 4(%sp)
	flw	%f1, 8(%sp)
	fmul	%f2, %f1, %f0
	lw	%v0, 12(%sp)
	fsw	%f2, 40(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	o_param_r1.2794
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f1, 40(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 36(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 0(%sp)
	flw	%f2, 4(%sp)
	fmul	%f2, %f2, %f1
	lw	%v0, 12(%sp)
	fsw	%f0, 44(%sp)
	fsw	%f2, 48(%sp)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	o_param_r2.2796
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	flw	%f1, 48(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 44(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 8(%sp)
	flw	%f2, 0(%sp)
	fmul	%f1, %f2, %f1
	lw	%v0, 12(%sp)
	fsw	%f0, 52(%sp)
	fsw	%f1, 56(%sp)
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	o_param_r3.2798
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 56(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 52(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
setup_rect_table.2938:
	addi	%a0, %zero, 6
	flw	%f0, 20120(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	sw	%v0, 8(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	fiszero.2654
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7376
	lw	%v0, 0(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	o_isinvert.2766
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fisneg.2652
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	xor.2656
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	o_param_a.2770
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fneg_cond.2708
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 0(%v0)
	flw	%f0, 20096(%zero)
	lw	%v1, 4(%sp)
	flw	%f1, 0(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 4(%v0)
	j	beq_cont.7377
beq_else.7376:
	flw	%f0, 20120(%zero)
	lw	%v0, 8(%sp)
	fsw	%f0, 4(%v0)
beq_cont.7377:
	lw	%v1, 4(%sp)
	flw	%f0, 4(%v1)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fiszero.2654
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7378
	lw	%v0, 0(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	o_isinvert.2766
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 4(%v1)
	sw	%v0, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	fisneg.2652
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	xor.2656
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_param_b.2772
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	fneg_cond.2708
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 8(%v0)
	flw	%f0, 20096(%zero)
	lw	%v1, 4(%sp)
	flw	%f1, 4(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 12(%v0)
	j	beq_cont.7379
beq_else.7378:
	flw	%f0, 20120(%zero)
	lw	%v0, 8(%sp)
	fsw	%f0, 12(%v0)
beq_cont.7379:
	lw	%v1, 4(%sp)
	flw	%f0, 8(%v1)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	fiszero.2654
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7380
	lw	%v0, 0(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_isinvert.2766
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 8(%v1)
	sw	%v0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fisneg.2652
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	xor.2656
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_c.2774
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fneg_cond.2708
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 8(%sp)
	fsw	%f0, 16(%v0)
	flw	%f0, 20096(%zero)
	lw	%v1, 4(%sp)
	flw	%f1, 8(%v1)
	fdiv	%f0, %f0, %f1
	fsw	%f0, 20(%v0)
	j	beq_cont.7381
beq_else.7380:
	flw	%f0, 20120(%zero)
	lw	%v0, 8(%sp)
	fsw	%f0, 20(%v0)
beq_cont.7381:
	jr	%ra
setup_surface_table.2941:
	addi	%a0, %zero, 4
	flw	%f0, 20120(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	lw	%a0, 0(%sp)
	sw	%v0, 8(%sp)
	fsw	%f0, 12(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	o_param_a.2770
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 12(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 16(%sp)
	fsw	%f1, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_param_b.2772
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 16(%sp)
	fadd	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 24(%sp)
	fsw	%f1, 28(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_c.2774
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 28(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 24(%sp)
	fadd	%f0, %f1, %f0
	fsw	%f0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	fispos.2650
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7382
	flw	%f0, 20120(%zero)
	lw	%v0, 8(%sp)
	fsw	%f0, 0(%v0)
	j	beq_cont.7383
beq_else.7382:
	flw	%f0, 20032(%zero)
	flw	%f1, 32(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 8(%sp)
	fsw	%f0, 0(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_a.2770
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 4(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_b.2772
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 8(%v0)
	lw	%v1, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_c.2774
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fdiv	%f0, %f0, %f1
	fneg	%f0, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 12(%v0)
beq_cont.7383:
	jr	%ra
setup_second_table.2944:
	addi	%a0, %zero, 5
	flw	%f0, 20120(%zero)
	sw	%v1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	flw	%f0, 0(%v1)
	flw	%f1, 4(%v1)
	flw	%f2, 8(%v1)
	lw	%a0, 0(%sp)
	sw	%v0, 8(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	quadratic.2875
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	o_param_a.2770
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 20(%sp)
	fsw	%f1, 24(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_param_b.2772
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 24(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 8(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 28(%sp)
	fsw	%f1, 32(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	o_param_c.2774
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fmul	%f0, %f1, %f0
	fneg	%f0, %f0
	lw	%v0, 8(%sp)
	flw	%f1, 12(%sp)
	fsw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 36(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	o_isrot.2768
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7384
	lw	%v0, 8(%sp)
	flw	%f0, 20(%sp)
	fsw	%f0, 4(%v0)
	flw	%f0, 28(%sp)
	fsw	%f0, 8(%v0)
	flw	%f0, 36(%sp)
	fsw	%f0, 12(%v0)
	j	beq_cont.7385
beq_else.7384:
	lw	%v0, 4(%sp)
	flw	%f0, 8(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 40(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	o_param_r2.2796
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f1, 40(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 4(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 44(%sp)
	fsw	%f1, 48(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	o_param_r3.2798
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	flw	%f1, 48(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 44(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	fhalf.2659
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	flw	%f1, 20(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 4(%v0)
	lw	%v1, 4(%sp)
	flw	%f0, 8(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 52(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	o_param_r1.2794
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	flw	%f1, 52(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	lw	%v1, 0(%sp)
	fsw	%f0, 56(%sp)
	fsw	%f1, 60(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	o_param_r3.2798
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 60(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 56(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	fhalf.2659
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 28(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 8(%v0)
	lw	%v1, 4(%sp)
	flw	%f0, 4(%v1)
	lw	%a0, 0(%sp)
	fsw	%f0, 64(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	o_param_r1.2794
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	flw	%f1, 64(%sp)
	fmul	%f0, %f1, %f0
	lw	%v0, 4(%sp)
	flw	%f1, 0(%v0)
	lw	%v0, 0(%sp)
	fsw	%f0, 68(%sp)
	fsw	%f1, 72(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	o_param_r2.2796
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 72(%sp)
	fmul	%f0, %f1, %f0
	flw	%f1, 68(%sp)
	fadd	%f0, %f1, %f0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fhalf.2659
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	flw	%f1, 36(%sp)
	fsub	%f0, %f1, %f0
	lw	%v0, 8(%sp)
	fsw	%f0, 12(%v0)
beq_cont.7385:
	flw	%f0, 12(%sp)
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	fiszero.2654
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%at, %zero, 0
	bne	%v0, %at, beq_else.7386
	flw	%f0, 20096(%zero)
	flw	%f1, 12(%sp)
	fdiv	%f0, %f0, %f1
	lw	%v0, 8(%sp)
	fsw	%f0, 16(%v0)
	j	beq_cont.7387
beq_else.7386:
beq_cont.7387:
	lw	%v0, 8(%sp)
	jr	%ra
iter_setup_dirvec_constants.2947:
	lw	%a0, 4(%k1)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.7388
	sll	%a1, %v1, 2
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	sw	%k1, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%a0, 8(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	d_const.2823
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 12(%sp)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	d_vec.2821
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 8(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	o_form.2762
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%at, %zero, 1
	bne	%v0, %at, beq_else.7389
	lw	%v0, 20(%sp)
	lw	%v1, 8(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	setup_rect_table.2938
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v1, 4(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 16(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	j	beq_cont.7390
beq_else.7389:
	addi	%at, %zero, 2
	bne	%v0, %at, beq_else.7391
	lw	%v0, 20(%sp)
	lw	%v1, 8(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	setup_surface_table.2941
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v1, 4(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 16(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	j	beq_cont.7392
beq_else.7391:
	lw	%v0, 20(%sp)
	lw	%v1, 8(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	setup_second_table.2944
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v1, 4(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 16(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
beq_cont.7392:
beq_cont.7390:
	addi	%v1, %v1, -1
	lw	%v0, 12(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7388:
	jr	%ra
setup_dirvec_constants.2950:
	lw	%v1, 8(%k1)
	lw	%k1, 4(%k1)
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -1
	lw	%at, 0(%k1)
	jr	%at
write_ppm_header.3095:
	lw	%v0, 4(%k1)
	addi	%v1, %zero, 80
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 51
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 10
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v1, 0(%v0)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2704
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v0, 0(%sp)
	lw	%v0, 4(%v0)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2704
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 32
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_print_char
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 255
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	print_int.2704
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v0, %zero, 10
	j	min_caml_print_char
create_float5x3array.3127:
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 4(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 8(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 12(%v1)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	lw	%v1, 0(%sp)
	sw	%v0, 16(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_pixel.3129:
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	sw	%v0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	create_float5x3array.3127
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 5
	addi	%a0, %zero, 0
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	sw	%v0, 12(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	create_float5x3array.3127
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	sw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	create_float5x3array.3127
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 0
	sw	%v0, 20(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	sw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	create_float5x3array.3127
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 32
	sw	%v0, 28(%v1)
	lw	%v0, 24(%sp)
	sw	%v0, 24(%v1)
	lw	%v0, 20(%sp)
	sw	%v0, 20(%v1)
	lw	%v0, 16(%sp)
	sw	%v0, 16(%v1)
	lw	%v0, 12(%sp)
	sw	%v0, 12(%v1)
	lw	%v0, 8(%sp)
	sw	%v0, 8(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 4(%v1)
	lw	%v0, 0(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
init_line_elements.3131:
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.7394
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	create_pixel.3129
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 4(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 0(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	addi	%v0, %a1, 0
	j	init_line_elements.3131
beq_else.7394:
	jr	%ra
create_pixelline.3134:
	lw	%v0, 4(%k1)
	lw	%v1, 0(%v0)
	sw	%v0, 0(%sp)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	create_pixel.3129
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 0(%sp)
	lw	%v1, 0(%v1)
	addi	%v1, %v1, -2
	j	init_line_elements.3131
tan.3136:
	fsw	%f0, 0(%sp)
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	sin.2695
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	flw	%f1, 0(%sp)
	fsw	%f0, 4(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	cos.2693
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fdiv	%f0, %f1, %f0
	jr	%ra
adjust_position.3138:
	fmul	%f0, %f0, %f0
	flw	%f2, 20016(%zero)
	fadd	%f0, %f0, %f2
	fsqrt	%f0, %f0
	flw	%f2, 20096(%zero)
	fdiv	%f2, %f2, %f0
	fsw	%f0, 0(%sp)
	fsw	%f1, 4(%sp)
	fadd	%f0, %f2, %fzero
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	atan.2697
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 4(%sp)
	fmul	%f0, %f0, %f1
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	tan.3136
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	flw	%f1, 0(%sp)
	fmul	%f0, %f0, %f1
	jr	%ra
calc_dirvec.3141:
	lw	%a1, 4(%k1)
	slti	%at, %v0, 5
	bne	%at, %zero, beq_else.7395
	sw	%a0, 0(%sp)
	sw	%a1, 4(%sp)
	sw	%v1, 8(%sp)
	fsw	%f0, 12(%sp)
	fsw	%f1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	fsqr.2661
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 16(%sp)
	fsw	%f0, 20(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	fsqr.2661
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20(%sp)
	fadd	%f0, %f1, %f0
	flw	%f1, 20096(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f1, 12(%sp)
	fdiv	%f1, %f1, %f0
	flw	%f2, 16(%sp)
	fdiv	%f2, %f2, %f0
	flw	%f3, 20096(%zero)
	fdiv	%f0, %f3, %f0
	lw	%v0, 8(%sp)
	sll	%v0, %v0, 2
	lw	%v1, 4(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	lw	%v1, 0(%sp)
	sll	%a0, %v1, 2
	add	%at, %v0, %a0
	lw	%a0, 0(%at)
	sw	%v0, 24(%sp)
	fsw	%f0, 28(%sp)
	fsw	%f2, 32(%sp)
	fsw	%f1, 36(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 36(%sp)
	flw	%f1, 32(%sp)
	flw	%f2, 28(%sp)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	vecset.2714
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 40
	sll	%v1, %v1, 2
	lw	%a0, 24(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 32(%sp)
	fneg	%f2, %f0
	flw	%f1, 36(%sp)
	flw	%f3, 28(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	vecset.2714
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 80
	sll	%v1, %v1, 2
	lw	%a0, 24(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 36(%sp)
	fneg	%f1, %f0
	flw	%f2, 32(%sp)
	fneg	%f3, %f2
	flw	%f4, 28(%sp)
	fadd	%f2, %f3, %fzero
	fadd	%f0, %f4, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	vecset.2714
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 1
	sll	%v1, %v1, 2
	lw	%a0, 24(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 36(%sp)
	fneg	%f1, %f0
	flw	%f2, 32(%sp)
	fneg	%f3, %f2
	flw	%f4, 28(%sp)
	fneg	%f5, %f4
	fadd	%f2, %f5, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	vecset.2714
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 0(%sp)
	addi	%v1, %v0, 41
	sll	%v1, %v1, 2
	lw	%a0, 24(%sp)
	add	%at, %a0, %v1
	lw	%v1, 0(%at)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 36(%sp)
	fneg	%f1, %f0
	flw	%f2, 28(%sp)
	fneg	%f3, %f2
	flw	%f4, 32(%sp)
	fadd	%f2, %f4, %fzero
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f3, %fzero
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	vecset.2714
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	lw	%v0, 0(%sp)
	addi	%v0, %v0, 81
	sll	%v0, %v0, 2
	lw	%v1, 24(%sp)
	add	%at, %v1, %v0
	lw	%v0, 0(%at)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	d_vec.2821
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	flw	%f0, 28(%sp)
	fneg	%f0, %f0
	flw	%f1, 36(%sp)
	flw	%f2, 32(%sp)
	j	vecset.2714
beq_else.7395:
	fsw	%f2, 40(%sp)
	sw	%a0, 0(%sp)
	sw	%v1, 8(%sp)
	sw	%k1, 44(%sp)
	fsw	%f3, 48(%sp)
	sw	%v0, 52(%sp)
	fadd	%f0, %f1, %fzero
	fadd	%f1, %f2, %fzero
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	adjust_position.3138
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	lw	%v0, 52(%sp)
	addi	%v0, %v0, 1
	flw	%f1, 48(%sp)
	fsw	%f0, 56(%sp)
	sw	%v0, 60(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	adjust_position.3138
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	fadd	%f1, %f0, %fzero
	flw	%f0, 56(%sp)
	flw	%f2, 40(%sp)
	flw	%f3, 48(%sp)
	lw	%v0, 60(%sp)
	lw	%v1, 8(%sp)
	lw	%a0, 0(%sp)
	lw	%k1, 44(%sp)
	lw	%at, 0(%k1)
	jr	%at
calc_dirvecs.3149:
	lw	%a1, 4(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.7396
	sw	%k1, 0(%sp)
	sw	%v0, 4(%sp)
	fsw	%f0, 8(%sp)
	sw	%a0, 12(%sp)
	sw	%v1, 16(%sp)
	sw	%a1, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	float_of_int.2681
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20080(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 20012(%zero)
	fsub	%f2, %f0, %f1
	addi	%v0, %zero, 0
	flw	%f0, 20120(%zero)
	flw	%f1, 20120(%zero)
	flw	%f3, 8(%sp)
	lw	%v1, 16(%sp)
	lw	%a0, 12(%sp)
	lw	%k1, 20(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 4(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	float_of_int.2681
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	flw	%f1, 20080(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 20016(%zero)
	fadd	%f2, %f0, %f1
	addi	%v0, %zero, 0
	flw	%f0, 20120(%zero)
	flw	%f1, 20120(%zero)
	lw	%v1, 12(%sp)
	addi	%a0, %v1, 2
	flw	%f3, 8(%sp)
	lw	%a1, 16(%sp)
	lw	%k1, 20(%sp)
	addi	%v1, %a1, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 1
	lw	%a0, 16(%sp)
	sw	%v0, 24(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	add_mod5.2711
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	flw	%f0, 8(%sp)
	lw	%v0, 24(%sp)
	lw	%a0, 12(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7396:
	jr	%ra
calc_dirvec_rows.3154:
	lw	%a1, 4(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.7398
	sw	%k1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%a0, 8(%sp)
	sw	%v1, 12(%sp)
	sw	%a1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	float_of_int.2681
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	flw	%f1, 20080(%zero)
	fmul	%f0, %f0, %f1
	flw	%f1, 20012(%zero)
	fsub	%f0, %f0, %f1
	addi	%v0, %zero, 4
	lw	%v1, 12(%sp)
	lw	%a0, 8(%sp)
	lw	%k1, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, -1
	addi	%v1, %zero, 2
	lw	%a0, 12(%sp)
	sw	%v0, 20(%sp)
	addi	%v0, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	add_mod5.2711
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 8(%sp)
	addi	%a0, %v0, 4
	lw	%v0, 20(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7398:
	jr	%ra
create_dirvec.3158:
	lw	%v0, 4(%k1)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 0(%sp)
	lw	%v0, 0(%v0)
	sw	%v1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%v1)
	lw	%v0, 4(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	jr	%ra
create_dirvec_elements.3160:
	lw	%a0, 4(%k1)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.7400
	sw	%k1, 0(%sp)
	sw	%v0, 4(%sp)
	sw	%v1, 8(%sp)
	addi	%k1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v1, 8(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 4(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	addi	%v1, %v1, -1
	lw	%k1, 0(%sp)
	addi	%v0, %a1, 0
	lw	%at, 0(%k1)
	jr	%at
beq_else.7400:
	jr	%ra
create_dirvecs.3163:
	lw	%v1, 12(%k1)
	lw	%a0, 8(%k1)
	lw	%a1, 4(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.7402
	addi	%a2, %zero, 120
	sw	%k1, 0(%sp)
	sw	%a0, 4(%sp)
	sw	%v1, 8(%sp)
	sw	%v0, 12(%sp)
	sw	%a2, 16(%sp)
	addi	%k1, %a1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 16(%sp)
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_array
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v1, 12(%sp)
	sll	%a0, %v1, 2
	lw	%a1, 8(%sp)
	add	%at, %a1, %a0
	sw	%v0, 0(%at)
	sll	%v0, %v1, 2
	add	%at, %a1, %v0
	lw	%v0, 0(%at)
	addi	%a0, %zero, 118
	lw	%k1, 4(%sp)
	addi	%v1, %a0, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	lw	%v0, 12(%sp)
	addi	%v0, %v0, -1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7402:
	jr	%ra
init_dirvec_constants.3165:
	lw	%a0, 4(%k1)
	slti	%at, %v1, 0
	bne	%at, %zero, beq_else.7404
	sll	%a1, %v1, 2
	add	%at, %v0, %a1
	lw	%a1, 0(%at)
	sw	%v0, 0(%sp)
	sw	%k1, 4(%sp)
	sw	%v1, 8(%sp)
	addi	%v0, %a1, 0
	addi	%k1, %a0, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 8(%sp)
	addi	%v1, %v0, -1
	lw	%v0, 0(%sp)
	lw	%k1, 4(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7404:
	jr	%ra
init_vecset_constants.3168:
	lw	%v1, 8(%k1)
	lw	%a0, 4(%k1)
	slti	%at, %v0, 0
	bne	%at, %zero, beq_else.7406
	sll	%a1, %v0, 2
	add	%at, %a0, %a1
	lw	%a0, 0(%at)
	addi	%a1, %zero, 119
	sw	%k1, 0(%sp)
	sw	%v0, 4(%sp)
	addi	%v0, %a0, 0
	addi	%k1, %v1, 0
	addi	%v1, %a1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	lw	%v0, 4(%sp)
	addi	%v0, %v0, -1
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
beq_else.7406:
	jr	%ra
init_dirvecs.3170:
	lw	%v0, 12(%k1)
	lw	%v1, 8(%k1)
	lw	%a0, 4(%k1)
	addi	%a1, %zero, 4
	sw	%v0, 0(%sp)
	sw	%a0, 4(%sp)
	addi	%v0, %a1, 0
	addi	%k1, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 9
	addi	%v1, %zero, 0
	addi	%a0, %zero, 0
	lw	%k1, 4(%sp)
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v0, %zero, 4
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
rt.3187:
	lw	%a0, 40(%k1)
	lw	%a1, 36(%k1)
	lw	%a2, 32(%k1)
	lw	%a3, 28(%k1)
	lw	%t0, 24(%k1)
	lw	%t1, 20(%k1)
	lw	%t2, 16(%k1)
	lw	%t3, 12(%k1)
	lw	%t4, 8(%k1)
	lw	%t5, 4(%k1)
	sw	%v0, 0(%t3)
	sw	%v1, 4(%t3)
	srl	%t3, %v0, 1
	sw	%t3, 0(%t4)
	srl	%v1, %v1, 1
	sw	%v1, 4(%t4)
	flw	%f0, 20008(%zero)
	sw	%a0, 0(%sp)
	sw	%a1, 4(%sp)
	sw	%t1, 8(%sp)
	sw	%t0, 12(%sp)
	sw	%t2, 16(%sp)
	sw	%a3, 20(%sp)
	sw	%t5, 24(%sp)
	sw	%a2, 28(%sp)
	fsw	%f0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	float_of_int.2681
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	flw	%f1, 32(%sp)
	fdiv	%f0, %f1, %f0
	lw	%v0, 28(%sp)
	fsw	%f0, 0(%v0)
	lw	%k1, 24(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%k1, 24(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%k1, 24(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%k1, 20(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%k1, 16(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 12(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	d_vec.2821
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v1, 8(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	veccpy.2724
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%v0, 12(%sp)
	lw	%k1, 4(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	lw	%k1, 0(%sp)
	lw	%at, 0(%k1)
	jr	%at
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 0
	flw	%f0, 20120(%zero)
	sw	%v0, 0(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_float_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 60
	addi	%a0, %zero, 0
	addi	%a1, %zero, 0
	addi	%a2, %zero, 0
	addi	%a3, %zero, 0
	addi	%t0, %zero, 0
	add	%t1, %zero, %hp
	addi	%hp, %hp, 48
	sw	%v0, 40(%t1)
	sw	%v0, 36(%t1)
	sw	%v0, 32(%t1)
	sw	%v0, 28(%t1)
	sw	%t0, 24(%t1)
	sw	%v0, 20(%t1)
	sw	%v0, 16(%t1)
	sw	%a3, 12(%t1)
	sw	%a2, 8(%t1)
	sw	%a1, 4(%t1)
	sw	%a0, 0(%t1)
	add	%v0, %zero, %t1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 4(%sp)
	addi	%sp, %sp, 8
	jal	min_caml_create_array
	addi	%sp, %sp, -8
	lw	%ra, 4(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 4(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 8(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 12(%sp)
	addi	%sp, %sp, 16
	jal	min_caml_create_float_array
	addi	%sp, %sp, -16
	lw	%ra, 12(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 12(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 20004(%zero)
	sw	%v0, 16(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 20(%sp)
	addi	%sp, %sp, 24
	jal	min_caml_create_float_array
	addi	%sp, %sp, -24
	lw	%ra, 20(%sp)
	addi	%v1, %zero, 50
	addi	%a0, %zero, 1
	addi	%a1, %zero, -1
	sw	%v0, 20(%sp)
	sw	%v1, 24(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 24(%sp)
	sw	%ra, 28(%sp)
	addi	%sp, %sp, 32
	jal	min_caml_create_array
	addi	%sp, %sp, -32
	lw	%ra, 28(%sp)
	addi	%v1, %zero, 1
	addi	%a0, %zero, 1
	lw	%a1, 0(%v0)
	sw	%v0, 28(%sp)
	sw	%v1, 32(%sp)
	addi	%v1, %a1, 0
	addi	%v0, %a0, 0
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %v0, 0
	lw	%v0, 32(%sp)
	sw	%ra, 36(%sp)
	addi	%sp, %sp, 40
	jal	min_caml_create_array
	addi	%sp, %sp, -40
	lw	%ra, 36(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 20120(%zero)
	sw	%v0, 36(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	flw	%f0, 20000(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_float_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v1, %zero, 2
	addi	%a0, %zero, 0
	sw	%v0, 40(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 44(%sp)
	addi	%sp, %sp, 48
	jal	min_caml_create_array
	addi	%sp, %sp, -48
	lw	%ra, 44(%sp)
	addi	%v1, %zero, 1
	flw	%f0, 20120(%zero)
	sw	%v0, 44(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 48(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v0, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%ra, 52(%sp)
	addi	%sp, %sp, 56
	jal	min_caml_create_float_array
	addi	%sp, %sp, -56
	lw	%ra, 52(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 52(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_float_array
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 56(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 60(%sp)
	addi	%sp, %sp, 64
	jal	min_caml_create_float_array
	addi	%sp, %sp, -64
	lw	%ra, 60(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 60(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_float_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v0, %zero, 0
	flw	%f0, 20120(%zero)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_float_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	sw	%v1, 64(%sp)
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %zero, 0
	add	%a0, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%a0)
	lw	%v0, 64(%sp)
	sw	%v0, 0(%a0)
	add	%v0, %zero, %a0
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 5
	sw	%ra, 68(%sp)
	addi	%sp, %sp, 72
	jal	min_caml_create_array
	addi	%sp, %sp, -72
	lw	%ra, 68(%sp)
	addi	%v1, %zero, 0
	flw	%f0, 20120(%zero)
	sw	%v0, 68(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_float_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v1, %zero, 3
	flw	%f0, 20120(%zero)
	sw	%v0, 72(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 76(%sp)
	addi	%sp, %sp, 80
	jal	min_caml_create_float_array
	addi	%sp, %sp, -80
	lw	%ra, 76(%sp)
	addi	%v1, %zero, 60
	lw	%a0, 72(%sp)
	sw	%v0, 76(%sp)
	addi	%v0, %v1, 0
	addi	%v1, %a0, 0
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	min_caml_create_array
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%v1)
	lw	%v0, 76(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 0
	flw	%f0, 20120(%zero)
	sw	%v0, 80(%sp)
	addi	%v0, %v1, 0
	sw	%ra, 84(%sp)
	addi	%sp, %sp, 88
	jal	min_caml_create_float_array
	addi	%sp, %sp, -88
	lw	%ra, 84(%sp)
	addi	%v1, %v0, 0
	addi	%v0, %zero, 0
	sw	%v1, 84(%sp)
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	min_caml_create_array
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 8
	sw	%v0, 4(%v1)
	lw	%v0, 84(%sp)
	sw	%v0, 0(%v1)
	add	%v0, %zero, %v1
	addi	%v1, %zero, 180
	addi	%a0, %zero, 0
	flw	%f0, 20120(%zero)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 16
	fsw	%f0, 8(%a1)
	sw	%v0, 4(%a1)
	sw	%a0, 0(%a1)
	add	%v0, %zero, %a1
	addi	%k0, %v1, 0
	addi	%v1, %v0, 0
	addi	%v0, %k0, 0
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	min_caml_create_array
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	addi	%v0, %zero, 1
	addi	%v1, %zero, 0
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	jal	min_caml_create_array
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 24
	addi	%v1, %zero, read_screen_settings.2833
	sw	%v1, 0(%v0)
	lw	%v1, 12(%sp)
	sw	%v1, 20(%v0)
	lw	%v1, 60(%sp)
	sw	%v1, 16(%v0)
	lw	%v1, 56(%sp)
	sw	%v1, 12(%v0)
	lw	%v1, 52(%sp)
	sw	%v1, 8(%v0)
	lw	%v1, 8(%sp)
	sw	%v1, 4(%v0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 16
	addi	%a0, %zero, read_light.2835
	sw	%a0, 0(%v1)
	lw	%a0, 16(%sp)
	sw	%a0, 8(%v1)
	lw	%a1, 20(%sp)
	sw	%a1, 4(%v1)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a2, %zero, read_nth_object.2840
	sw	%a2, 0(%a1)
	lw	%a2, 4(%sp)
	sw	%a2, 4(%a1)
	add	%a3, %zero, %hp
	addi	%hp, %hp, 16
	addi	%t0, %zero, read_object.2842
	sw	%t0, 0(%a3)
	sw	%a1, 8(%a3)
	lw	%a1, 0(%sp)
	sw	%a1, 4(%a3)
	add	%t0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t1, %zero, read_all_object.2844
	sw	%t1, 0(%t0)
	sw	%a3, 4(%t0)
	add	%a3, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t1, %zero, read_and_network.2850
	sw	%t1, 0(%a3)
	lw	%t1, 28(%sp)
	sw	%t1, 4(%a3)
	add	%t1, %zero, %hp
	addi	%hp, %hp, 24
	addi	%t2, %zero, read_parameter.2852
	sw	%t2, 0(%t1)
	sw	%v0, 20(%t1)
	sw	%v1, 16(%t1)
	sw	%a3, 12(%t1)
	sw	%t0, 8(%t1)
	lw	%v0, 36(%sp)
	sw	%v0, 4(%t1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%v1, %zero, iter_setup_dirvec_constants.2947
	sw	%v1, 0(%v0)
	sw	%a2, 4(%v0)
	add	%v1, %zero, %hp
	addi	%hp, %hp, 16
	addi	%a2, %zero, setup_dirvec_constants.2950
	sw	%a2, 0(%v1)
	sw	%a1, 8(%v1)
	sw	%v0, 4(%v1)
	add	%v0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%a2, %zero, write_ppm_header.3095
	sw	%a2, 0(%v0)
	lw	%a2, 40(%sp)
	sw	%a2, 4(%v0)
	add	%a3, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t0, %zero, create_pixelline.3134
	sw	%t0, 0(%a3)
	sw	%a2, 4(%a3)
	add	%t0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t2, %zero, calc_dirvec.3141
	sw	%t2, 0(%t0)
	lw	%t2, 68(%sp)
	sw	%t2, 4(%t0)
	add	%t3, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t4, %zero, calc_dirvecs.3149
	sw	%t4, 0(%t3)
	sw	%t0, 4(%t3)
	add	%t0, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t4, %zero, calc_dirvec_rows.3154
	sw	%t4, 0(%t0)
	sw	%t3, 4(%t0)
	add	%t3, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t4, %zero, create_dirvec.3158
	sw	%t4, 0(%t3)
	sw	%a1, 4(%t3)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t4, %zero, create_dirvec_elements.3160
	sw	%t4, 0(%a1)
	sw	%t3, 4(%a1)
	add	%t4, %zero, %hp
	addi	%hp, %hp, 16
	addi	%t5, %zero, create_dirvecs.3163
	sw	%t5, 0(%t4)
	sw	%t2, 12(%t4)
	sw	%a1, 8(%t4)
	sw	%t3, 4(%t4)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 8
	addi	%t3, %zero, init_dirvec_constants.3165
	sw	%t3, 0(%a1)
	sw	%v1, 4(%a1)
	add	%t3, %zero, %hp
	addi	%hp, %hp, 16
	addi	%t5, %zero, init_vecset_constants.3168
	sw	%t5, 0(%t3)
	sw	%a1, 8(%t3)
	sw	%t2, 4(%t3)
	add	%a1, %zero, %hp
	addi	%hp, %hp, 16
	addi	%t2, %zero, init_dirvecs.3170
	sw	%t2, 0(%a1)
	sw	%t3, 12(%a1)
	sw	%t4, 8(%a1)
	sw	%t0, 4(%a1)
	add	%k1, %zero, %hp
	addi	%hp, %hp, 48
	addi	%t0, %zero, rt.3187
	sw	%t0, 0(%k1)
	sw	%v0, 40(%k1)
	sw	%v1, 36(%k1)
	lw	%v0, 48(%sp)
	sw	%v0, 32(%k1)
	sw	%t1, 28(%k1)
	lw	%v0, 80(%sp)
	sw	%v0, 24(%k1)
	sw	%a0, 20(%k1)
	sw	%a1, 16(%k1)
	sw	%a2, 12(%k1)
	lw	%v0, 44(%sp)
	sw	%v0, 8(%k1)
	sw	%a3, 4(%k1)
	addi	%v0, %zero, 2
	addi	%v1, %zero, 2
	sw	%ra, 92(%sp)
	addi	%sp, %sp, 96
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -96
	lw	%ra, 92(%sp)
	addi	%g0, %zero, 0
	ret