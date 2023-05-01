Task : PicoCTF asm2
Description
What does asm2(0x4,0x2d) return?

ebp-0x4 = 4
ebp-x8 = 2d = 2

asm2:
	<+0>:	push   ebp
	<+1>:	mov    ebp,esp
	<+3>:	sub    esp,0x10
	<+6>:	mov    eax,DWORD PTR [ebp+0xc]
	<+9>:	mov    DWORD PTR [ebp-0x4],eax 
	<+12>:	mov    eax,DWORD PTR [ebp+0x8]
	<+15>:	mov    DWORD PTR [ebp-0x8],eax
	<+18>:	jmp    0x50c <asm2+31>
	<+20>:	add    DWORD PTR [ebp-0x4],0x1
	<+24>:	add    DWORD PTR [ebp-0x8],0xd1
	<+31>:	cmp    DWORD PTR [ebp-0x8],0x5fa1
	<+38>:	jle    0x501 <asm2+20>
	<+40>:	mov    eax,DWORD PTR [ebp-0x4]
	<+43>:	leave  
	<+44>:	ret    

The same logic in python, what you should be aware of is last on the stack is the first off the stack, meaing 0x2d get loaded first then 0x4
Or the number with the highest stack is the last argument

# 0x4,0x2d

var1 = 0x2d
var2 = 0x4
check = 0x5fa1

while var2 < check:
    var2 +=0xd1
    var1 +=0x1


print(hex(var1))
    