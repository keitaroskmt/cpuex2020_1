.section	".rodata"
.align	8
# ------------ Initialize float table ---------
# ------------ Initialize register ------------
	lui	%sp, 1
	ori	%sp, %sp, 64464
	lui	%hp, 0
	ori	%hp, %hp, 41
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
reduction_2pi_sub1.204:
	fblt	%f0, %f1, fbgt_else.2722
	flw	%f2, 40(%zero)
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2723
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2724
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2725
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2726
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2727
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2728
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2729
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2730
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2731
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2732
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2733
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2734
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2735
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2736
	fmul	%f1, %f2, %f1
	fblt	%f0, %f1, fbgt_else.2737
	fmul	%f1, %f2, %f1
	j	reduction_2pi_sub1.204
fbgt_else.2737:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2736:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2735:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2734:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2733:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2732:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2731:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2730:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2729:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2728:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2727:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2726:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2725:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2724:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2723:
	fmov	%f0, %f1
	jr	%ra
fbgt_else.2722:
	fmov	%f0, %f1
	jr	%ra
reduction_2pi_sub2.207:
	fblt	%f0, %f2, fbgt_else.2738
	fblt	%f0, %f1, fbgt_else.2739
	fsub	%f0, %f0, %f1
	flw	%f3, 40(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2740
	fblt	%f0, %f1, fbgt_else.2741
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2742
	fblt	%f0, %f1, fbgt_else.2743
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2744
	fblt	%f0, %f1, fbgt_else.2745
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2745:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2744:
	jr	%ra
fbgt_else.2743:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2746
	fblt	%f0, %f1, fbgt_else.2747
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2747:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2746:
	jr	%ra
fbgt_else.2742:
	jr	%ra
fbgt_else.2741:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2748
	fblt	%f0, %f1, fbgt_else.2749
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2750
	fblt	%f0, %f1, fbgt_else.2751
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2751:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2750:
	jr	%ra
fbgt_else.2749:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2752
	fblt	%f0, %f1, fbgt_else.2753
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2753:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2752:
	jr	%ra
fbgt_else.2748:
	jr	%ra
fbgt_else.2740:
	jr	%ra
fbgt_else.2739:
	flw	%f3, 40(%zero)
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2754
	fblt	%f0, %f1, fbgt_else.2755
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2756
	fblt	%f0, %f1, fbgt_else.2757
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2758
	fblt	%f0, %f1, fbgt_else.2759
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2759:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2758:
	jr	%ra
fbgt_else.2757:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2760
	fblt	%f0, %f1, fbgt_else.2761
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2761:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2760:
	jr	%ra
fbgt_else.2756:
	jr	%ra
fbgt_else.2755:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2762
	fblt	%f0, %f1, fbgt_else.2763
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2764
	fblt	%f0, %f1, fbgt_else.2765
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2765:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2764:
	jr	%ra
fbgt_else.2763:
	fdiv	%f1, %f1, %f3
	fblt	%f0, %f2, fbgt_else.2766
	fblt	%f0, %f1, fbgt_else.2767
	fsub	%f0, %f0, %f1
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2767:
	fdiv	%f1, %f1, %f3
	j	reduction_2pi_sub2.207
fbgt_else.2766:
	jr	%ra
fbgt_else.2762:
	jr	%ra
fbgt_else.2754:
	jr	%ra
fbgt_else.2738:
	jr	%ra
calc_dirvec.231:
	blti	%v0, 5, bgti_else.2768
	fmul	%f2, %f0, %f0
	fmul	%f3, %f1, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 38(%zero)
	fadd	%f2, %f2, %f3
	fsqrt	%f2, %f2
	fdiv	%f0, %f0, %f2
	fdiv	%f1, %f1, %f2
	fdiv	%f2, %f3, %f2
	lw	%v0, 2(%v1)
	add	%at, %v0, %a0
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fsw	%f0, 0(%v1)
	fsw	%f1, 1(%v1)
	fsw	%f2, 2(%v1)
	addi	%v1, %a0, 40
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f1
	fsw	%f0, 0(%v1)
	fsw	%f2, 1(%v1)
	fsw	%f3, 2(%v1)
	addi	%v1, %a0, 80
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f1
	fsw	%f2, 0(%v1)
	fsw	%f3, 1(%v1)
	fsw	%f4, 2(%v1)
	addi	%v1, %a0, 1
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f1
	fneg	%f5, %f2
	fsw	%f3, 0(%v1)
	fsw	%f4, 1(%v1)
	fsw	%f5, 2(%v1)
	addi	%v1, %a0, 41
	add	%at, %v0, %v1
	lw	%v1, 0(%at)
	lw	%v1, 0(%v1)
	fneg	%f3, %f0
	fneg	%f4, %f2
	fsw	%f3, 0(%v1)
	fsw	%f4, 1(%v1)
	fsw	%f1, 2(%v1)
	addi	%v1, %a0, 81
	add	%at, %v0, %v1
	lw	%v0, 0(%at)
	lw	%v0, 0(%v0)
	fneg	%f2, %f2
	fsw	%f2, 0(%v0)
	fsw	%f0, 1(%v0)
	fsw	%f1, 2(%v0)
	jr	%ra
bgti_else.2768:
	fmul	%f0, %f1, %f1
	flw	%f1, 39(%zero)
	fadd	%f0, %f0, %f1
	fsqrt	%f0, %f0
	flw	%f4, 38(%zero)
	fdiv	%f5, %f4, %f0
	flw	%f6, 37(%zero)
	fblt	%f5, %f6, fbgt_else.2770
	addi	%a1, %zero, 1
	j	fbgt_cont.2771
fbgt_else.2770:
	addi	%a1, %zero, 0
fbgt_cont.2771:
	fabs	%f7, %f5
	flw	%f8, 36(%zero)
	fblt	%f7, %f8, fbgt_else.2772
	flw	%f5, 29(%zero)
	fblt	%f7, %f5, fbgt_else.2774
	flw	%f5, 27(%zero)
	fdiv	%f7, %f4, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 35(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 34(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 33(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 32(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 31(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 30(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fsub	%f5, %f5, %f7
	j	fbgt_cont.2775
fbgt_else.2774:
	flw	%f5, 28(%zero)
	fsub	%f9, %f7, %f4
	fadd	%f7, %f7, %f4
	fdiv	%f7, %f9, %f7
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	fmul	%f11, %f10, %f10
	flw	%f12, 35(%zero)
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f12, %f7, %f12
	flw	%f13, 34(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f10
	fadd	%f12, %f12, %f13
	flw	%f13, 33(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f9
	fmul	%f13, %f13, %f10
	fsub	%f12, %f12, %f13
	flw	%f13, 32(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f13, %f13, %f11
	fadd	%f12, %f12, %f13
	flw	%f13, 31(%zero)
	fmul	%f13, %f13, %f7
	fmul	%f9, %f13, %f9
	fmul	%f9, %f9, %f11
	fsub	%f9, %f12, %f9
	flw	%f12, 30(%zero)
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fmul	%f7, %f7, %f11
	fadd	%f7, %f9, %f7
	fadd	%f5, %f5, %f7
fbgt_cont.2775:
	beqi	%a1, 0, bnei_else.2776
	j	fbgt_cont.2773
bnei_else.2776:
	fneg	%f5, %f5
bnei_cont.2777:
	j	fbgt_cont.2773
fbgt_else.2772:
	fmul	%f7, %f5, %f5
	fmul	%f9, %f7, %f7
	fmul	%f10, %f9, %f9
	flw	%f11, 35(%zero)
	fmul	%f11, %f11, %f5
	fmul	%f11, %f11, %f7
	fsub	%f11, %f5, %f11
	flw	%f12, 34(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 33(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f7
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 32(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 31(%zero)
	fmul	%f12, %f12, %f5
	fmul	%f7, %f12, %f7
	fmul	%f7, %f7, %f10
	fsub	%f7, %f11, %f7
	flw	%f11, 30(%zero)
	fmul	%f5, %f11, %f5
	fmul	%f5, %f5, %f9
	fmul	%f5, %f5, %f10
	fadd	%f5, %f7, %f5
fbgt_cont.2773:
	fmul	%f5, %f5, %f2
	flw	%f7, 26(%zero)
	fblt	%f5, %f6, fbgt_else.2778
	addi	%a1, %zero, 1
	j	fbgt_cont.2779
fbgt_else.2778:
	addi	%a1, %zero, 0
fbgt_cont.2779:
	fabs	%f9, %f5
	flw	%f10, 25(%zero)
	fsw	%f2, 0(%sp)
	sw	%a0, 1(%sp)
	sw	%v1, 2(%sp)
	fsw	%f3, 3(%sp)
	fsw	%f8, 4(%sp)
	fsw	%f6, 5(%sp)
	fsw	%f1, 6(%sp)
	sw	%v0, 7(%sp)
	fsw	%f0, 8(%sp)
	fsw	%f5, 9(%sp)
	fsw	%f4, 10(%sp)
	sw	%a1, 11(%sp)
	fsw	%f7, 12(%sp)
	fsw	%f9, 13(%sp)
	fsw	%f10, 14(%sp)
	fblt	%f9, %f10, fbgt_else.2780
	flw	%f11, 24(%zero)
	fblt	%f9, %f11, fbgt_else.2782
	flw	%f11, 23(%zero)
	fblt	%f9, %f11, fbgt_else.2784
	flw	%f11, 22(%zero)
	fblt	%f9, %f11, fbgt_else.2786
	flw	%f11, 21(%zero)
	fblt	%f9, %f11, fbgt_else.2788
	flw	%f11, 20(%zero)
	fblt	%f9, %f11, fbgt_else.2790
	flw	%f11, 19(%zero)
	fblt	%f9, %f11, fbgt_else.2792
	flw	%f11, 18(%zero)
	fblt	%f9, %f11, fbgt_else.2794
	flw	%f11, 17(%zero)
	fblt	%f9, %f11, fbgt_else.2796
	flw	%f11, 16(%zero)
	fblt	%f9, %f11, fbgt_else.2798
	flw	%f11, 15(%zero)
	fblt	%f9, %f11, fbgt_else.2800
	flw	%f11, 14(%zero)
	fmov	%f1, %f11
	fmov	%f0, %f9
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub1.204
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.2781
fbgt_else.2800:
	fmov	%f0, %f11
fbgt_cont.2801:
	j	fbgt_cont.2781
fbgt_else.2798:
	fmov	%f0, %f11
fbgt_cont.2799:
	j	fbgt_cont.2781
fbgt_else.2796:
	fmov	%f0, %f11
fbgt_cont.2797:
	j	fbgt_cont.2781
fbgt_else.2794:
	fmov	%f0, %f11
fbgt_cont.2795:
	j	fbgt_cont.2781
fbgt_else.2792:
	fmov	%f0, %f11
fbgt_cont.2793:
	j	fbgt_cont.2781
fbgt_else.2790:
	fmov	%f0, %f11
fbgt_cont.2791:
	j	fbgt_cont.2781
fbgt_else.2788:
	fmov	%f0, %f11
fbgt_cont.2789:
	j	fbgt_cont.2781
fbgt_else.2786:
	fmov	%f0, %f11
fbgt_cont.2787:
	j	fbgt_cont.2781
fbgt_else.2784:
	fmov	%f0, %f11
fbgt_cont.2785:
	j	fbgt_cont.2781
fbgt_else.2782:
	fmov	%f0, %f11
fbgt_cont.2783:
	j	fbgt_cont.2781
fbgt_else.2780:
	fmov	%f0, %f10
fbgt_cont.2781:
	flw	%f1, 13(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.2802
	fblt	%f1, %f0, fbgt_else.2804
	fsub	%f1, %f1, %f0
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2806
	fblt	%f1, %f0, fbgt_else.2808
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2810
	fblt	%f1, %f0, fbgt_else.2812
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.2803
fbgt_else.2812:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.2813:
	j	fbgt_cont.2803
fbgt_else.2810:
	fmov	%f0, %f1
fbgt_cont.2811:
	j	fbgt_cont.2803
fbgt_else.2808:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2814
	fblt	%f1, %f0, fbgt_else.2816
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.2815
fbgt_else.2816:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.2817:
	j	fbgt_cont.2815
fbgt_else.2814:
	fmov	%f0, %f1
fbgt_cont.2815:
fbgt_cont.2809:
	j	fbgt_cont.2803
fbgt_else.2806:
	fmov	%f0, %f1
fbgt_cont.2807:
	j	fbgt_cont.2803
fbgt_else.2804:
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2818
	fblt	%f1, %f0, fbgt_else.2820
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2822
	fblt	%f1, %f0, fbgt_else.2824
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.2819
fbgt_else.2824:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.2825:
	j	fbgt_cont.2819
fbgt_else.2822:
	fmov	%f0, %f1
fbgt_cont.2823:
	j	fbgt_cont.2819
fbgt_else.2820:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2826
	fblt	%f1, %f0, fbgt_else.2828
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
	j	fbgt_cont.2827
fbgt_else.2828:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 15(%sp)
	addi	%sp, %sp, 16
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -16
	lw	%ra, 15(%sp)
fbgt_cont.2829:
	j	fbgt_cont.2827
fbgt_else.2826:
	fmov	%f0, %f1
fbgt_cont.2827:
fbgt_cont.2821:
	j	fbgt_cont.2819
fbgt_else.2818:
	fmov	%f0, %f1
fbgt_cont.2819:
fbgt_cont.2805:
	j	fbgt_cont.2803
fbgt_else.2802:
	fmov	%f0, %f1
fbgt_cont.2803:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.2830
	lw	%v0, 11(%sp)
	beqi	%v0, 0, bnei_else.2832
	addi	%v0, %zero, 0
	j	fbgt_cont.2831
bnei_else.2832:
	addi	%v0, %zero, 1
bnei_cont.2833:
	j	fbgt_cont.2831
fbgt_else.2830:
	lw	%v0, 11(%sp)
fbgt_cont.2831:
	fblt	%f0, %f1, fbgt_else.2834
	fsub	%f0, %f0, %f1
	j	fbgt_cont.2835
fbgt_else.2834:
fbgt_cont.2835:
	flw	%f2, 27(%zero)
	fblt	%f0, %f2, fbgt_else.2836
	fsub	%f0, %f1, %f0
	j	fbgt_cont.2837
fbgt_else.2836:
fbgt_cont.2837:
	flw	%f3, 28(%zero)
	fblt	%f3, %f0, fbgt_else.2838
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 10(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 9(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 8(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.2839
fbgt_else.2838:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 13(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 12(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 11(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.2839:
	beqi	%v0, 0, bnei_else.2840
	j	bnei_cont.2841
bnei_else.2840:
	fneg	%f0, %f0
bnei_cont.2841:
	flw	%f4, 9(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 15(%sp)
	fsw	%f3, 16(%sp)
	fsw	%f2, 17(%sp)
	fsw	%f4, 18(%sp)
	fblt	%f4, %f5, fbgt_else.2842
	flw	%f6, 24(%zero)
	fblt	%f4, %f6, fbgt_else.2844
	flw	%f6, 23(%zero)
	fblt	%f4, %f6, fbgt_else.2846
	flw	%f6, 22(%zero)
	fblt	%f4, %f6, fbgt_else.2848
	flw	%f6, 21(%zero)
	fblt	%f4, %f6, fbgt_else.2850
	flw	%f6, 20(%zero)
	fblt	%f4, %f6, fbgt_else.2852
	flw	%f6, 19(%zero)
	fblt	%f4, %f6, fbgt_else.2854
	flw	%f6, 18(%zero)
	fblt	%f4, %f6, fbgt_else.2856
	flw	%f6, 17(%zero)
	fblt	%f4, %f6, fbgt_else.2858
	flw	%f6, 16(%zero)
	fblt	%f4, %f6, fbgt_else.2860
	flw	%f6, 15(%zero)
	fblt	%f4, %f6, fbgt_else.2862
	flw	%f6, 14(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub1.204
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.2843
fbgt_else.2862:
	fmov	%f0, %f6
fbgt_cont.2863:
	j	fbgt_cont.2843
fbgt_else.2860:
	fmov	%f0, %f6
fbgt_cont.2861:
	j	fbgt_cont.2843
fbgt_else.2858:
	fmov	%f0, %f6
fbgt_cont.2859:
	j	fbgt_cont.2843
fbgt_else.2856:
	fmov	%f0, %f6
fbgt_cont.2857:
	j	fbgt_cont.2843
fbgt_else.2854:
	fmov	%f0, %f6
fbgt_cont.2855:
	j	fbgt_cont.2843
fbgt_else.2852:
	fmov	%f0, %f6
fbgt_cont.2853:
	j	fbgt_cont.2843
fbgt_else.2850:
	fmov	%f0, %f6
fbgt_cont.2851:
	j	fbgt_cont.2843
fbgt_else.2848:
	fmov	%f0, %f6
fbgt_cont.2849:
	j	fbgt_cont.2843
fbgt_else.2846:
	fmov	%f0, %f6
fbgt_cont.2847:
	j	fbgt_cont.2843
fbgt_else.2844:
	fmov	%f0, %f6
fbgt_cont.2845:
	j	fbgt_cont.2843
fbgt_else.2842:
	fmov	%f0, %f5
fbgt_cont.2843:
	flw	%f1, 18(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.2864
	fblt	%f1, %f0, fbgt_else.2866
	fsub	%f1, %f1, %f0
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2868
	fblt	%f1, %f0, fbgt_else.2870
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2872
	fblt	%f1, %f0, fbgt_else.2874
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.2865
fbgt_else.2874:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.2875:
	j	fbgt_cont.2865
fbgt_else.2872:
	fmov	%f0, %f1
fbgt_cont.2873:
	j	fbgt_cont.2865
fbgt_else.2870:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2876
	fblt	%f1, %f0, fbgt_else.2878
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.2877
fbgt_else.2878:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.2879:
	j	fbgt_cont.2877
fbgt_else.2876:
	fmov	%f0, %f1
fbgt_cont.2877:
fbgt_cont.2871:
	j	fbgt_cont.2865
fbgt_else.2868:
	fmov	%f0, %f1
fbgt_cont.2869:
	j	fbgt_cont.2865
fbgt_else.2866:
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2880
	fblt	%f1, %f0, fbgt_else.2882
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2884
	fblt	%f1, %f0, fbgt_else.2886
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.2881
fbgt_else.2886:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.2887:
	j	fbgt_cont.2881
fbgt_else.2884:
	fmov	%f0, %f1
fbgt_cont.2885:
	j	fbgt_cont.2881
fbgt_else.2882:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2888
	fblt	%f1, %f0, fbgt_else.2890
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
	j	fbgt_cont.2889
fbgt_else.2890:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 19(%sp)
	addi	%sp, %sp, 20
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -20
	lw	%ra, 19(%sp)
fbgt_cont.2891:
	j	fbgt_cont.2889
fbgt_else.2888:
	fmov	%f0, %f1
fbgt_cont.2889:
fbgt_cont.2883:
	j	fbgt_cont.2881
fbgt_else.2880:
	fmov	%f0, %f1
fbgt_cont.2881:
fbgt_cont.2867:
	j	fbgt_cont.2865
fbgt_else.2864:
	fmov	%f0, %f1
fbgt_cont.2865:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.2892
	addi	%v0, %zero, 0
	j	fbgt_cont.2893
fbgt_else.2892:
	addi	%v0, %zero, 1
fbgt_cont.2893:
	fblt	%f0, %f1, fbgt_else.2894
	fsub	%f0, %f0, %f1
	j	fbgt_cont.2895
fbgt_else.2894:
fbgt_cont.2895:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.2896
	beqi	%v0, 0, bnei_else.2898
	addi	%v0, %zero, 0
	j	fbgt_cont.2897
bnei_else.2898:
	addi	%v0, %zero, 1
bnei_cont.2899:
	j	fbgt_cont.2897
fbgt_else.2896:
fbgt_cont.2897:
	fblt	%f0, %f2, fbgt_else.2900
	fsub	%f0, %f1, %f0
	j	fbgt_cont.2901
fbgt_else.2900:
fbgt_cont.2901:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.2902
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 13(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 12(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 11(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
	j	fbgt_cont.2903
fbgt_else.2902:
	fsub	%f0, %f2, %f0
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 10(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 9(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 8(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
fbgt_cont.2903:
	beqi	%v0, 0, bnei_else.2904
	j	bnei_cont.2905
bnei_else.2904:
	fneg	%f0, %f0
bnei_cont.2905:
	flw	%f4, 15(%sp)
	fdiv	%f0, %f4, %f0
	flw	%f4, 8(%sp)
	fmul	%f0, %f0, %f4
	lw	%v0, 7(%sp)
	addi	%v0, %v0, 1
	fmul	%f4, %f0, %f0
	flw	%f5, 6(%sp)
	fadd	%f4, %f4, %f5
	fsqrt	%f4, %f4
	flw	%f5, 10(%sp)
	fdiv	%f6, %f5, %f4
	flw	%f7, 5(%sp)
	fblt	%f6, %f7, fbgt_else.2906
	addi	%v1, %zero, 1
	j	fbgt_cont.2907
fbgt_else.2906:
	addi	%v1, %zero, 0
fbgt_cont.2907:
	fabs	%f8, %f6
	flw	%f9, 4(%sp)
	fblt	%f8, %f9, fbgt_else.2908
	flw	%f6, 29(%zero)
	fblt	%f8, %f6, fbgt_else.2910
	fdiv	%f6, %f5, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 35(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 34(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 33(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 32(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 31(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 30(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fsub	%f6, %f2, %f6
	j	fbgt_cont.2911
fbgt_else.2910:
	fsub	%f6, %f8, %f5
	fadd	%f8, %f8, %f5
	fdiv	%f6, %f6, %f8
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 35(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 34(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 33(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 32(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 31(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 30(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
	fadd	%f6, %f3, %f6
fbgt_cont.2911:
	beqi	%v1, 0, bnei_else.2912
	j	fbgt_cont.2909
bnei_else.2912:
	fneg	%f6, %f6
bnei_cont.2913:
	j	fbgt_cont.2909
fbgt_else.2908:
	fmul	%f8, %f6, %f6
	fmul	%f9, %f8, %f8
	fmul	%f10, %f9, %f9
	flw	%f11, 35(%zero)
	fmul	%f11, %f11, %f6
	fmul	%f11, %f11, %f8
	fsub	%f11, %f6, %f11
	flw	%f12, 34(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f9
	fadd	%f11, %f11, %f12
	flw	%f12, 33(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f8
	fmul	%f12, %f12, %f9
	fsub	%f11, %f11, %f12
	flw	%f12, 32(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f12, %f12, %f10
	fadd	%f11, %f11, %f12
	flw	%f12, 31(%zero)
	fmul	%f12, %f12, %f6
	fmul	%f8, %f12, %f8
	fmul	%f8, %f8, %f10
	fsub	%f8, %f11, %f8
	flw	%f11, 30(%zero)
	fmul	%f6, %f11, %f6
	fmul	%f6, %f6, %f9
	fmul	%f6, %f6, %f10
	fadd	%f6, %f8, %f6
fbgt_cont.2909:
	flw	%f8, 3(%sp)
	fmul	%f6, %f6, %f8
	fblt	%f6, %f7, fbgt_else.2914
	addi	%v1, %zero, 1
	j	fbgt_cont.2915
fbgt_else.2914:
	addi	%v1, %zero, 0
fbgt_cont.2915:
	fabs	%f7, %f6
	flw	%f9, 14(%sp)
	fsw	%f0, 19(%sp)
	sw	%v0, 20(%sp)
	fsw	%f4, 21(%sp)
	fsw	%f6, 22(%sp)
	sw	%v1, 23(%sp)
	fsw	%f7, 24(%sp)
	fblt	%f7, %f9, fbgt_else.2916
	flw	%f10, 24(%zero)
	fblt	%f7, %f10, fbgt_else.2918
	flw	%f10, 23(%zero)
	fblt	%f7, %f10, fbgt_else.2920
	flw	%f10, 22(%zero)
	fblt	%f7, %f10, fbgt_else.2922
	flw	%f10, 21(%zero)
	fblt	%f7, %f10, fbgt_else.2924
	flw	%f10, 20(%zero)
	fblt	%f7, %f10, fbgt_else.2926
	flw	%f10, 19(%zero)
	fblt	%f7, %f10, fbgt_else.2928
	flw	%f10, 18(%zero)
	fblt	%f7, %f10, fbgt_else.2930
	flw	%f10, 17(%zero)
	fblt	%f7, %f10, fbgt_else.2932
	flw	%f10, 16(%zero)
	fblt	%f7, %f10, fbgt_else.2934
	flw	%f10, 15(%zero)
	fblt	%f7, %f10, fbgt_else.2936
	flw	%f10, 14(%zero)
	fmov	%f1, %f10
	fmov	%f0, %f7
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub1.204
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.2917
fbgt_else.2936:
	fmov	%f0, %f10
fbgt_cont.2937:
	j	fbgt_cont.2917
fbgt_else.2934:
	fmov	%f0, %f10
fbgt_cont.2935:
	j	fbgt_cont.2917
fbgt_else.2932:
	fmov	%f0, %f10
fbgt_cont.2933:
	j	fbgt_cont.2917
fbgt_else.2930:
	fmov	%f0, %f10
fbgt_cont.2931:
	j	fbgt_cont.2917
fbgt_else.2928:
	fmov	%f0, %f10
fbgt_cont.2929:
	j	fbgt_cont.2917
fbgt_else.2926:
	fmov	%f0, %f10
fbgt_cont.2927:
	j	fbgt_cont.2917
fbgt_else.2924:
	fmov	%f0, %f10
fbgt_cont.2925:
	j	fbgt_cont.2917
fbgt_else.2922:
	fmov	%f0, %f10
fbgt_cont.2923:
	j	fbgt_cont.2917
fbgt_else.2920:
	fmov	%f0, %f10
fbgt_cont.2921:
	j	fbgt_cont.2917
fbgt_else.2918:
	fmov	%f0, %f10
fbgt_cont.2919:
	j	fbgt_cont.2917
fbgt_else.2916:
	fmov	%f0, %f9
fbgt_cont.2917:
	flw	%f1, 24(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.2938
	fblt	%f1, %f0, fbgt_else.2940
	fsub	%f1, %f1, %f0
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2942
	fblt	%f1, %f0, fbgt_else.2944
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2946
	fblt	%f1, %f0, fbgt_else.2948
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.2939
fbgt_else.2948:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.2949:
	j	fbgt_cont.2939
fbgt_else.2946:
	fmov	%f0, %f1
fbgt_cont.2947:
	j	fbgt_cont.2939
fbgt_else.2944:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2950
	fblt	%f1, %f0, fbgt_else.2952
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.2951
fbgt_else.2952:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.2953:
	j	fbgt_cont.2951
fbgt_else.2950:
	fmov	%f0, %f1
fbgt_cont.2951:
fbgt_cont.2945:
	j	fbgt_cont.2939
fbgt_else.2942:
	fmov	%f0, %f1
fbgt_cont.2943:
	j	fbgt_cont.2939
fbgt_else.2940:
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2954
	fblt	%f1, %f0, fbgt_else.2956
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2958
	fblt	%f1, %f0, fbgt_else.2960
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.2955
fbgt_else.2960:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.2961:
	j	fbgt_cont.2955
fbgt_else.2958:
	fmov	%f0, %f1
fbgt_cont.2959:
	j	fbgt_cont.2955
fbgt_else.2956:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.2962
	fblt	%f1, %f0, fbgt_else.2964
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
	j	fbgt_cont.2963
fbgt_else.2964:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 25(%sp)
	addi	%sp, %sp, 26
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -26
	lw	%ra, 25(%sp)
fbgt_cont.2965:
	j	fbgt_cont.2963
fbgt_else.2962:
	fmov	%f0, %f1
fbgt_cont.2963:
fbgt_cont.2957:
	j	fbgt_cont.2955
fbgt_else.2954:
	fmov	%f0, %f1
fbgt_cont.2955:
fbgt_cont.2941:
	j	fbgt_cont.2939
fbgt_else.2938:
	fmov	%f0, %f1
fbgt_cont.2939:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.2966
	lw	%v0, 23(%sp)
	beqi	%v0, 0, bnei_else.2968
	addi	%v0, %zero, 0
	j	fbgt_cont.2967
bnei_else.2968:
	addi	%v0, %zero, 1
bnei_cont.2969:
	j	fbgt_cont.2967
fbgt_else.2966:
	lw	%v0, 23(%sp)
fbgt_cont.2967:
	fblt	%f0, %f1, fbgt_else.2970
	fsub	%f0, %f0, %f1
	j	fbgt_cont.2971
fbgt_else.2970:
fbgt_cont.2971:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.2972
	fsub	%f0, %f1, %f0
	j	fbgt_cont.2973
fbgt_else.2972:
fbgt_cont.2973:
	flw	%f3, 16(%sp)
	fblt	%f3, %f0, fbgt_else.2974
	fmul	%f4, %f0, %f0
	fmul	%f5, %f4, %f4
	flw	%f6, 10(%zero)
	fmul	%f6, %f6, %f0
	fmul	%f6, %f6, %f4
	fsub	%f6, %f0, %f6
	flw	%f7, 9(%zero)
	fmul	%f7, %f7, %f0
	fmul	%f7, %f7, %f5
	fadd	%f6, %f6, %f7
	flw	%f7, 8(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fmul	%f0, %f0, %f5
	fsub	%f0, %f6, %f0
	j	fbgt_cont.2975
fbgt_else.2974:
	fsub	%f0, %f2, %f0
	fmul	%f0, %f0, %f0
	fmul	%f4, %f0, %f0
	flw	%f5, 13(%zero)
	fmul	%f5, %f5, %f0
	flw	%f6, 10(%sp)
	fsub	%f5, %f6, %f5
	flw	%f7, 12(%zero)
	fmul	%f7, %f7, %f4
	fadd	%f5, %f5, %f7
	flw	%f7, 11(%zero)
	fmul	%f0, %f7, %f0
	fmul	%f0, %f0, %f4
	fsub	%f0, %f5, %f0
fbgt_cont.2975:
	beqi	%v0, 0, bnei_else.2976
	j	bnei_cont.2977
bnei_else.2976:
	fneg	%f0, %f0
bnei_cont.2977:
	flw	%f4, 22(%sp)
	fabs	%f4, %f4
	flw	%f5, 14(%sp)
	fsw	%f0, 25(%sp)
	fsw	%f4, 26(%sp)
	fblt	%f4, %f5, fbgt_else.2978
	flw	%f6, 24(%zero)
	fblt	%f4, %f6, fbgt_else.2980
	flw	%f6, 23(%zero)
	fblt	%f4, %f6, fbgt_else.2982
	flw	%f6, 22(%zero)
	fblt	%f4, %f6, fbgt_else.2984
	flw	%f6, 21(%zero)
	fblt	%f4, %f6, fbgt_else.2986
	flw	%f6, 20(%zero)
	fblt	%f4, %f6, fbgt_else.2988
	flw	%f6, 19(%zero)
	fblt	%f4, %f6, fbgt_else.2990
	flw	%f6, 18(%zero)
	fblt	%f4, %f6, fbgt_else.2992
	flw	%f6, 17(%zero)
	fblt	%f4, %f6, fbgt_else.2994
	flw	%f6, 16(%zero)
	fblt	%f4, %f6, fbgt_else.2996
	flw	%f6, 15(%zero)
	fblt	%f4, %f6, fbgt_else.2998
	flw	%f6, 14(%zero)
	fmov	%f1, %f6
	fmov	%f0, %f4
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub1.204
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.2979
fbgt_else.2998:
	fmov	%f0, %f6
fbgt_cont.2999:
	j	fbgt_cont.2979
fbgt_else.2996:
	fmov	%f0, %f6
fbgt_cont.2997:
	j	fbgt_cont.2979
fbgt_else.2994:
	fmov	%f0, %f6
fbgt_cont.2995:
	j	fbgt_cont.2979
fbgt_else.2992:
	fmov	%f0, %f6
fbgt_cont.2993:
	j	fbgt_cont.2979
fbgt_else.2990:
	fmov	%f0, %f6
fbgt_cont.2991:
	j	fbgt_cont.2979
fbgt_else.2988:
	fmov	%f0, %f6
fbgt_cont.2989:
	j	fbgt_cont.2979
fbgt_else.2986:
	fmov	%f0, %f6
fbgt_cont.2987:
	j	fbgt_cont.2979
fbgt_else.2984:
	fmov	%f0, %f6
fbgt_cont.2985:
	j	fbgt_cont.2979
fbgt_else.2982:
	fmov	%f0, %f6
fbgt_cont.2983:
	j	fbgt_cont.2979
fbgt_else.2980:
	fmov	%f0, %f6
fbgt_cont.2981:
	j	fbgt_cont.2979
fbgt_else.2978:
	fmov	%f0, %f5
fbgt_cont.2979:
	flw	%f1, 26(%sp)
	flw	%f2, 14(%sp)
	fblt	%f1, %f2, fbgt_else.3000
	fblt	%f1, %f0, fbgt_else.3002
	fsub	%f1, %f1, %f0
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3004
	fblt	%f1, %f0, fbgt_else.3006
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3008
	fblt	%f1, %f0, fbgt_else.3010
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.3001
fbgt_else.3010:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.3011:
	j	fbgt_cont.3001
fbgt_else.3008:
	fmov	%f0, %f1
fbgt_cont.3009:
	j	fbgt_cont.3001
fbgt_else.3006:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3012
	fblt	%f1, %f0, fbgt_else.3014
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.3013
fbgt_else.3014:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.3015:
	j	fbgt_cont.3013
fbgt_else.3012:
	fmov	%f0, %f1
fbgt_cont.3013:
fbgt_cont.3007:
	j	fbgt_cont.3001
fbgt_else.3004:
	fmov	%f0, %f1
fbgt_cont.3005:
	j	fbgt_cont.3001
fbgt_else.3002:
	flw	%f3, 40(%zero)
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3016
	fblt	%f1, %f0, fbgt_else.3018
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3020
	fblt	%f1, %f0, fbgt_else.3022
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.3017
fbgt_else.3022:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.3023:
	j	fbgt_cont.3017
fbgt_else.3020:
	fmov	%f0, %f1
fbgt_cont.3021:
	j	fbgt_cont.3017
fbgt_else.3018:
	fdiv	%f0, %f0, %f3
	fblt	%f1, %f2, fbgt_else.3024
	fblt	%f1, %f0, fbgt_else.3026
	fsub	%f1, %f1, %f0
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
	j	fbgt_cont.3025
fbgt_else.3026:
	fdiv	%f0, %f0, %f3
	fmov	%f29, %f1
	fmov	%f1, %f0
	fmov	%f0, %f29
	sw	%ra, 27(%sp)
	addi	%sp, %sp, 28
	jal	reduction_2pi_sub2.207
	addi	%sp, %sp, -28
	lw	%ra, 27(%sp)
fbgt_cont.3027:
	j	fbgt_cont.3025
fbgt_else.3024:
	fmov	%f0, %f1
fbgt_cont.3025:
fbgt_cont.3019:
	j	fbgt_cont.3017
fbgt_else.3016:
	fmov	%f0, %f1
fbgt_cont.3017:
fbgt_cont.3003:
	j	fbgt_cont.3001
fbgt_else.3000:
	fmov	%f0, %f1
fbgt_cont.3001:
	flw	%f1, 12(%sp)
	fblt	%f0, %f1, fbgt_else.3028
	addi	%v0, %zero, 0
	j	fbgt_cont.3029
fbgt_else.3028:
	addi	%v0, %zero, 1
fbgt_cont.3029:
	fblt	%f0, %f1, fbgt_else.3030
	fsub	%f0, %f0, %f1
	j	fbgt_cont.3031
fbgt_else.3030:
fbgt_cont.3031:
	flw	%f2, 17(%sp)
	fblt	%f0, %f2, fbgt_else.3032
	beqi	%v0, 0, bnei_else.3034
	addi	%v0, %zero, 0
	j	fbgt_cont.3033
bnei_else.3034:
	addi	%v0, %zero, 1
bnei_cont.3035:
	j	fbgt_cont.3033
fbgt_else.3032:
fbgt_cont.3033:
	fblt	%f0, %f2, fbgt_else.3036
	fsub	%f0, %f1, %f0
	j	fbgt_cont.3037
fbgt_else.3036:
fbgt_cont.3037:
	flw	%f1, 16(%sp)
	fblt	%f1, %f0, fbgt_else.3038
	fmul	%f0, %f0, %f0
	fmul	%f1, %f0, %f0
	flw	%f2, 13(%zero)
	fmul	%f2, %f2, %f0
	flw	%f3, 10(%sp)
	fsub	%f2, %f3, %f2
	flw	%f3, 12(%zero)
	fmul	%f3, %f3, %f1
	fadd	%f2, %f2, %f3
	flw	%f3, 11(%zero)
	fmul	%f0, %f3, %f0
	fmul	%f0, %f0, %f1
	fsub	%f0, %f2, %f0
	j	fbgt_cont.3039
fbgt_else.3038:
	fsub	%f0, %f2, %f0
	fmul	%f1, %f0, %f0
	fmul	%f2, %f1, %f1
	flw	%f3, 10(%zero)
	fmul	%f3, %f3, %f0
	fmul	%f3, %f3, %f1
	fsub	%f3, %f0, %f3
	flw	%f4, 9(%zero)
	fmul	%f4, %f4, %f0
	fmul	%f4, %f4, %f2
	fadd	%f3, %f3, %f4
	flw	%f4, 8(%zero)
	fmul	%f0, %f4, %f0
	fmul	%f0, %f0, %f1
	fmul	%f0, %f0, %f2
	fsub	%f0, %f3, %f0
fbgt_cont.3039:
	beqi	%v0, 0, bnei_else.3040
	j	bnei_cont.3041
bnei_else.3040:
	fneg	%f0, %f0
bnei_cont.3041:
	flw	%f1, 25(%sp)
	fdiv	%f0, %f1, %f0
	flw	%f1, 21(%sp)
	fmul	%f1, %f0, %f1
	flw	%f0, 19(%sp)
	flw	%f2, 0(%sp)
	flw	%f3, 3(%sp)
	lw	%v0, 20(%sp)
	lw	%v1, 2(%sp)
	lw	%a0, 1(%sp)
	j	calc_dirvec.231
.global	min_caml_start
min_caml_start:
	addi	%v0, %zero, 0
	flw	%f0, 37(%zero)
	addi	%v1, %zero, 0
	fsw	%f0, 0(%sp)
	sw	%v0, 1(%sp)
	sw	%ra, 2(%sp)
	addi	%sp, %sp, 3
	jal	min_caml_create_float_extarray
	addi	%sp, %sp, -3
	lw	%ra, 2(%sp)
	addi	%a0, %zero, 0
	addi	%v1, %zero, 0
	lw	%a1, 1(%sp)
	sw	%v0, 2(%sp)
	addi	%v0, %a1, 0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	sw	%v0, 1(%zero)
	lw	%v0, 2(%sp)
	sw	%v0, 0(%zero)
	addi	%a0, %zero, 2
	addi	%v1, %zero, 0
	lw	%v0, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 5
	addi	%a0, %zero, 2
	addi	%v1, %zero, 2
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	addi	%v0, %zero, 1
	addi	%a0, %zero, 7
	lw	%v1, 1(%sp)
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	min_caml_create_extarray
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	flw	%f0, 0(%sp)
	lw	%v0, 1(%sp)
	addi	%a0, %v0, 0
	addi	%v1, %v0, 0
	fmov	%f3, %f0
	fmov	%f2, %f0
	fmov	%f1, %f0
	sw	%ra, 3(%sp)
	addi	%sp, %sp, 4
	jal	calc_dirvec.231
	addi	%sp, %sp, -4
	lw	%ra, 3(%sp)
	ret
