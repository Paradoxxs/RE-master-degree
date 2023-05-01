//What does asm3(0xd73346ed,0xd48672ae,0xd3c8b139) return?

//byte = 2 hex = 8 bits

0x0 = base pointer
0x4 = return
0x8 = |33|46|ed
0xc = d4|86|72|ae
0x10 = d3|c8|b1|39

maybe it little endian


asm3:
	<+0>:	push   ebp
	<+1>:	mov    ebp,esp
	<+3>:	xor    eax,eax //zero out eax
	<+5>:	mov    ah,BYTE PTR [ebp+0xa] //move 0x46 to ah
	<+8>:	shl    ax,0x10 //zero out ax as it move the bytes 16 to the left out of ax into eax higher 16 bytes
	<+12>:	sub    al,BYTE PTR [ebp+0xc] //subtract 0-0xd4 = 2C 
	<+15>:	add    ah,BYTE PTR [ebp+0xd] //0+0x86
	<+18>:	xor    ax,WORD PTR [ebp+0x10] //xor ax 0x862c with 0xd3c8 = 55E4 wrong!
	<+22>:	nop
	<+23>:	pop    ebp
	<+24>:	ret    

0x460055E4 also wrong

def shl(dest, count):
	return hex(dest << count)

//maybe it little endian ? it should because itlook like x86

0x0 = base pointer
0x4 = return
0x8 = ed|46|33|d7
0xc = ae|72|86|d4
0x10 = 39|b1|c8|d3

asm3:
	<+0>:	push   ebp
	<+1>:	mov    ebp,esp
	<+3>:	xor    eax,eax //zero out eax
	<+5>:	mov    ah,BYTE PTR [ebp+0xa] //move 0x33 to ah
	<+8>:	shl    ax,0x10 //zero out ax as it move the bits 16 to the left out of ax into eax higher 16 bytes
	<+12>:	sub    al,BYTE PTR [ebp+0xc] //subtract 0-0xae = 52
	<+15>:	add    ah,BYTE PTR [ebp+0xd] //0+0x72
	<+18>:	xor    ax,WORD PTR [ebp+0x10] //xor ax 0x7252 with 0x39b1 = 4BE3 wrong!
	<+22>:	nop
	<+23>:	pop    ebp
	<+24>:	ret    


remeber that is return the full eax register not just ax


asm3:
	<+0>:	push   ebp
	<+1>:	mov    ebp,esp
	<+3>:	xor    eax,eax //zero out eax
	<+5>:	mov    ah,BYTE PTR [ebp+0xa] //move 0x33 to ah eax = Ox3300
	<+8>:	shl    ax,0x10 //zero out ax as it move the bits 16 to the left out of ax into eax higher 16 bytes eax = 0x0000
	<+12>:	sub    al,BYTE PTR [ebp+0xc] //subtract 0x00-0xAE = 52, eax = 0x52
	<+15>:	add    ah,BYTE PTR [ebp+0xd] //0+0x72 0x7252
	<+18>:	xor    ax,WORD PTR [ebp+0x10] //xor ax 0x7252 with 0xb139 = c36b  
	<+22>:	nop
	<+23>:	pop    ebp
	<+24>:	ret    

The final value is eax = 0xc36b.
Remember that x86 is little endian so the least significate bits first or it can be thought as going in the reverse order so 0x12345678 because 0x78563412

Solution:
	0xc36b