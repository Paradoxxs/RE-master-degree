//input 3736234946


	.arch armv8-a
	.file	"chall_2.c"
	.text
	.align	2
	.global	func1
	.type	func1, %function
func1:
	sub	sp, sp, #32
	str	w0, [sp, 12]  //store 3736234946 inside sp+12
	str	wzr, [sp, 24]  //stored 0 inside sp+24
	str	wzr, [sp, 28] //stored 0 inside sp+28
	b	.L2 //jump to l2
.L3:
	ldr	w0, [sp, 24] // 0
	add	w0, w0, 3 //[sp+24]+3*n
	str	w0, [sp, 24] //store the new value
	ldr	w0, [sp, 28]
	add	w0, w0, 1 //[sp+28]+1*n
	str	w0, [sp, 28]
.L2:
	ldr	w1, [sp, 28] //load 0
	ldr	w0, [sp, 12] //load 3736234946
	cmp	w1, w0 //compare 3736234946 - 0
	bcc	.L3 //loops 3736234946 times
	ldr	w0, [sp, 24] //[sp+24]+3*3736234946 = 11208704838
	add	sp, sp, 32
	ret
	.size	func1, .-func1
	.section	.rodata
	.align	3
.LC0:
	.string	"Result: %ld\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	w0, [x29, 28]
	str	x1, [x29, 16]
	ldr	x0, [x29, 16]
	add	x0, x0, 8
	ldr	x0, [x0] //input   stored 24 off sp
	bl	atoi //convert into to integer
	bl	func1
	str	w0, [x29, 44] // 11208704838
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	w1, [x29, 44] //11208704838
	bl	printf
	nop
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
