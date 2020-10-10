Main:
	jal	Fibonacci
	j	Exit

Fibonacci:
	addi	$sp, $sp, -8
	sw	$a0, 4($sp)
	sw	$ra, 0($sp)

	addi	$t0, $zero, 1
	bgt	$a0, $t0, True

	move	$v0, $a0
	j	Return

True:
	addi	$a0, $a0, -1
	jal	Fibonacci
	addi	$sp, $sp, -4
	sw	$v0, 0($sp)
	addi	$a0, $a0, -1
	jal	Fibonacci
	lw	$s0, 0($sp)
	addi	$sp, $sp, 4
	add	$v0, $v0, $s0
	j	Return

Return:
	lw	$ra, 0($sp)
	lw	$a0, 4($sp)
	addi	$sp, $sp, 8
	jr	$ra

Exit: