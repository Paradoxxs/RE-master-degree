input : 1048110976

	.arch armv8-a
	.file	"chall_3.c"
	.text
	.align	2
	.global	func1
	.type	func1, %function

func1:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	str	w0, [x29, 28] // store 1048110976
	str	wzr, [x29, 44] //store 0
	b	.L2

//every time L4 is called it sp+28/2
.L4:
	ldr	w0, [x29, 28] //load 1048110976
	and	w0, w0, 1 //perform AND on 1048110976 an 1 and stores the result in w0
	cmp	w0, 0
	beq	.L3 //jump if equal
	ldr	w0, [x29, 44] //load sp+44
	bl	func2 //adds 3 every to sp+44 every time it called
	str	w0, [x29, 44] 

.L3:
	ldr	w0, [x29, 28] //load 1048110976
	lsr	w0, w0, 1 // w0/2 
	str	w0, [x29, 28] //store the value in w0

.L2:
	ldr	w0, [x29, 28] //load  sp+28
	cmp	w0, 0 //compare w0 to 0
	bne	.L4 //if not equal to 0 jump to L4
	ldr	w0, [x29, 44]
	ldp	x29, x30, [sp], 48
	ret
	.size	func1, .-func1
	.align	2
	.global	func2
	.type	func2, %function

func2:
	sub	sp, sp, #16
	str	w0, [sp, 12] //store 0
	ldr	w0, [sp, 12] //load 0
	add	w0, w0, 3 //add 3 
	add	sp, sp, 16
	ret
	.size	func2, .-func2
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
	ldr	x0, [x0]
	bl	atoi //convert input to integer
	bl	func1
	str	w0, [x29, 44] 
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	ldr	w1, [x29, 44]
	bl	printf
	nop
	ldp	x29, x30, [sp], 48
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

create the same login in python


````py
w0 = 1048110976
result = 0

# 	and	w0, w0, 1 //perform AND on 1048110976 an 1 and stores the result in w0
#	cmp	w0, 0
#	beq	.L3 //jump if equal

while w0 != 0:
	if w0 & 1 != 0:
		result +=3
	# left shift by 1
	w0 >>=1
print(hex(result,16))
````