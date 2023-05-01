.global _start //Code section

.equ endlist, 0xaaaaaaaa
.equ led,0xff200000
.equ switch,0xff200040

_start:

	LDR r0,=list
	LDR r1,[r0]    
	LDR r2,[r0,#4]
	LDR r3,[r0],#4
	LDR r4,[r0],#4
	ldr r5,[r0]!
	add r6,r1,r2 // r1+r2
	sub r7,r2,#1 // r2-1
	subs r8,r1,r2 // sub r1-r2 set carry
	mul r9,r2,r5 // mul r2*r5
	mov r1,#0xFFFFFFFF
	ADC r2,r1,r0 //r1 + r0 + carry
	
	mov r0,#0xFF
	mov r1,#22
	and r2,r0,r1 //and logical gate
	orr r2,r0,r1 //or logical gate
	eor r2,r0,r1 //exclusive or
	
	//clear first 6 in register using and
	mov r0,#0xFFFFFFFF
	and r0,r0,#0x000000FF
	
	
	//Logical shift to the left and right and rotational shift
	mov r0,#10
	lsl r0,#1 //10*2=20
	lsr r0,#2 //10/4=5
	mov r1,r0,lsl #2 //mov and shift 5*4=20
	
	mov r0,#15
	ror r0,#1 //any overflow bits get rotated to the end of the byte 
	
	mov r0,#1
	mov r1,#2
	cmp r0,r1 //r0-r1 
	
	bgt greater //is r0 greather then r1, if yes jump to greater
	mov r0,#3

	cmp r0,r1
	mov lr,pc
	bgt greater
	mov r2,#2
	
//looping
	ldr r0,=l2
	ldr r3,=endlist
	eor r2,r2 //clear r2
	ldr r1,[r0]
	add r2,r2,r1
	bl loop
	
	
	//Conditional instruction
	mov r0,#2
	mov r1,#3
	
	cmp r0,r1
	movge r2,#5 //move 5 into r2 if r0 is geather then r1
	
//function calls that returns where it stared using bl to branch link and "bx lr" to return back 
	bl exit
	

//Working with the stack using push and pop remember the stack follows the rule:
//last on the stack first off the stack like drawing from a deck of cards

	mov r0,#1
	mov r1,#2
	push {r0,r1}
	bl test
	pop {r0,r1,r2} //notices that the last thing we push is now in r0
	//For some reason when compiled the smallest r number must be first and then ascending
	

//Working with hardware
	ldr r0,=switch
	ldr r1,[r0]
	
	ldr r0,=led
	//  r1->[r0]
	str r1,[r0] //The value stored inside r1 get pushed to memory address in r0

greater:
	mov r2,#0xA
	bx lr
	
//notices how it jump down to lesser that because everything happens sequencial	
lesser:
	mov r2,#0xB
	

	
	
loop:
	ldr r1,[r0,#4]!
	cmp r3,r1
	beq exit
	add r2,r2,r1
	b loop

test:
	mov r1,#10
	lsl r1,#1 //10*2
	push {r1}
	bx lr

exit:
	bx lr
	



.data //Set gobal variables
list:
	.word 1,2,3,4,9,-1,-2,-3
	
l2:
	.word 1,2,3,4,5,6,7,8,9,10
