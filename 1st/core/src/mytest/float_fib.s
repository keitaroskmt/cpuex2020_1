.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 9
	ori	%sp, %sp, 10176
	lui	%hp, 0
	ori	%hp, %hp, 60000
# ------------ Initialize float table ---------
	lui	%at, 16672
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16384
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
	lui	%at, 16256
	ori	%at, %at, 0
	sw	%at, 0(%hp)
	addi	%hp, %hp, 1
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
# ------------ body ---------------------------
float_fib.10:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f1, 0(%at)# 1.000000
	fslt	%at, %f1, %f0
	bne	%at, %zero, beq_else.27
	jr	%ra
beq_else.27:
	lui	%at, 0
	ori	%at, %at, 60002
	flw	%f1, 0(%at)# 1.000000
	fsub	%f1, %f0, %f1
	fsw	%f0, 0(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 1(%sp)
	addi	%sp, %sp, 2
	jal	float_fib.10
	addi	%sp, %sp, -2
	lw	%ra, 1(%sp)
	lui	%at, 0
	ori	%at, %at, 60001
	flw	%f1, 0(%at)# 2.000000
	flw	%f2, 0(%sp)
	fsub	%f1, %f2, %f1
	fsw	%f0, 1(%sp)
	fadd	%f0, %f1, %fzero
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	float_fib.10
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	flw	%f1, 1(%sp)
	fadd	%f0, %f1, %f0
	jr	%ra
.global	min_caml_start
min_caml_start:
	lui	%at, 0
	ori	%at, %at, 60000
	flw	%f0, 0(%at)# 10.000000
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	float_fib.10
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_float
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
