.intel_syntax noprefix
.global asm4

asm4:
    push   ebp
    mov    ebp,esp
    push   ebx
    sub    esp,0x10
    mov    DWORD PTR [ebp-0x10],0x246
    mov    DWORD PTR [ebp-0xc],0x0
    jmp    asm_27
asm_23:
    add    DWORD PTR [ebp-0xc],0x1
asm_27:
    mov    edx,DWORD PTR [ebp-0xc]
    mov    eax,DWORD PTR [ebp+0x8] 
    add    eax,edx   
    movzx  eax,BYTE PTR [eax]
    test   al,al
    jne    asm_23 
    mov    DWORD PTR [ebp-0x8],0x1
    jmp    asm_138
asm_51:
    mov    edx,DWORD PTR [ebp-0x8]
    mov    eax,DWORD PTR [ebp+0x8]
    add    eax,edx
    movzx  eax,BYTE PTR [eax]
    movsx  edx,al
    mov    eax,DWORD PTR [ebp-0x8]
    lea    ecx,[eax-0x1]
    mov    eax,DWORD PTR [ebp+0x8]
    add    eax,ecx
    movzx  eax,BYTE PTR [eax]
    movsx  eax,al
    sub    edx,eax
    mov    eax,edx
    mov    edx,eax
    mov    eax,DWORD PTR [ebp-0x10]
    lea    ebx,[edx+eax*1]
    mov    eax,DWORD PTR [ebp-0x8]
    lea    edx,[eax+0x1]
    mov    eax,DWORD PTR [ebp+0x8] 
    add    eax,edx
    movzx  eax,BYTE PTR [eax]
    movsx  edx,al
    mov    ecx,DWORD PTR [ebp-0x8]
    mov    eax,DWORD PTR [ebp+0x8] 
    add    eax,ecx
    movzx  eax,BYTE PTR [eax]
    movsx  eax,al
    sub    edx,eax
    mov    eax,edx
    add    eax,ebx
    mov    DWORD PTR [ebp-0x10],eax
    add    DWORD PTR [ebp-0x8],0x1
asm_138:
    mov    eax,DWORD PTR [ebp-0xc]
    sub    eax,0x1 
    cmp    DWORD PTR [ebp-0x8],eax 
    jl     asm_51
    mov    eax,DWORD PTR [ebp-0x10]
    add    esp,0x10
    pop    ebx
    pop    ebp
    ret    
