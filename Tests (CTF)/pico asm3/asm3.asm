.intel_syntax noprefix
.text
    .global _start

_start:
    mov eax, 0xd3c8b139
    push eax
    mov eax, 0xd48672ae
    push eax
    mov eax, 0xd73346ed
    push eax
    call asm3

    # Exit system call
    mov eax, 60
    xor rdi, rdi
    syscall

asm3:
    push   ebp
    mov    ebp,esp
    xor    eax,eax
    mov    ah,BYTE PTR [ebp+0xa]
    shl    ax,0x10
    sub    al,BYTE PTR [ebp+0xc]
    add    ah,BYTE PTR [ebp+0xd]
    xor    ax,WORD PTR [ebp+0x10]
    nop
    pop    ebp
    ret
