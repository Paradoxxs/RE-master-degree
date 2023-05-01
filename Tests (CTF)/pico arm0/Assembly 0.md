
What integer does this program print with arguments 266134863 and 1592237099?

````assembly
	.arch armv8-a
	.file	"chall.c"
	.text
	.align	2
	.global	func1
	.type	func1, %function


func1:
	sub	sp, sp, #16  
	str	w0, [sp, 12] #stores 1592237099 on the memory stack
	str	w1, [sp, 8]  #stores 266134863 on the memory stack
	ldr	w1, [sp, 12] #1592237099 
	ldr	w0, [sp, 8]  #266134863
	cmp	w1, w0 # subtracts the value of w0 from the value in w1
	bls	.L2 #Jump to L2 if w0 is less then w1
	ldr	w0, [sp, 12] #1592237099 
	b	.L3

.L2:
	ldr	w0, [sp, 8] #load 266134863 into w0
	
.L3:
	add	sp, sp, 16
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
	stp	x29, x30, [sp, -48]! #prepares the frame pointer
	add	x29, sp, 0
	str	x19, [sp, 16]
	str	w0, [x29, 44]
	str	x1, [x29, 32]
	ldr	x0, [x29, 32]
	add	x0, x0, 8
	ldr	x0, [x0]
	bl	atoi #Convert 266134863 into integer
	mov	w19, w0
	ldr	x0, [x29, 32]
	add	x0, x0, 16
	ldr	x0, [x0]
	bl	atoi    #Convert 1592237099 into integer
	mov	w1, w0  #1592237099
	mov	w0, w19 #266134863 
	bl	func1 #branch to func1
	mov	w1, w0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf #print the value in w1
	mov	w0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

````

picoCTF{5EE79C2B}