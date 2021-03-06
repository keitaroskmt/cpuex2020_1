.section	".rodata"
.align	8
# ------------ Initialize register ------------
	lui	%sp, 9
	ori	%sp, %sp, 10176
	lui	%hp, 0
	ori	%hp, %hp, 60000
# ------------ Initialize float table ---------
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
adder.11:
	lw	%v1, 1(%k1)
	add	%v0, %v1, %v0
	jr	%ra
make_adder.5:
	add	%v1, %zero, %hp
	addi	%hp, %hp, 2
	addi	%a0, %zero, adder.11
	sw	%a0, 0(%v1)
	sw	%v0, 1(%v1)
	add	%v0, %zero, %v1
	jr	%ra
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 3
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	make_adder.5
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	addi	%k1, %v0, 0
	addi	%v0, %zero, 7
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	lw	%at, 0(%k1)
	jalr	%at
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	sw	%ra, 0(%sp)
	addi	%sp, %sp, 1
	jal	min_caml_print_int
	addi	%sp, %sp, -1
	lw	%ra, 0(%sp)
	ret
