# Assembly
When reading assembly the last thing on the stack is the first thing off the stack again, which mean for programs that takes multiple arguments the variable with the highest stack reference is the last argument.


|unit|bit|hex|
-|-|-
byte|8|2
word|16|4
dword|32|8
qword|64|16




## Sections

In assembly programming, the .data, .text, and .bss sections are used to organize code and data into different areas of memory. These sections are defined in the program's source code.

- .data section is used for declaring initialized data or constants. This data does not change at runtime. You can declare various constant values, file names, or buffer size, etc., in this section.
- .text section is used to store the program's instructions, also known as the program's code or machine code. Define the operations that the program performs.
- .bss section is used for declaring variables

## The stack

The stack is a data structure that is used to store and manipulate data. The stack operates on a last-in, first-out (LIFO) basis, meaning that the last data value pushed onto the stack is the first one to be popped off of the stack. It is accessed using push and pop instructions. The push instruction is used to add a data value to the top of the stack, and the pop instruction is used to remove the top data value from the stack. The stack is used to store temporary data values, such as function arguments, return values, and local variables. It is also used to implement subroutines and other control flow mechanisms, such as function calls and returns.


Stack pointer (ESP) points to value at the top of the stack. and changes with instructions like _PUSH, POP, CALL, LEAVE and RET_

How it work is that in the function prologue, that the EBP register is saved onto the stack, which is done with _PUSH EBP_. This Allows it to be restored once the function have finished, The EBP that was _push_ on the stack is called the Saved Frame Pointer (SFP). Next is to copy the current value of the stack pointer (ESP) to the EBP register, with _mov EBP, ESP_.\
When EBP is set up in the function prologue, it means that when you reference local variable using EBP minus value (for example, \[EBP –8]). And function parameter using EBP plus value (for example, \[EBP + 8]).\\

EBP (Frame pointer) is an reference point for the system, to return to after the function call have finished.\
EBP - value = local variables created inside the function call(registers may also be used)\
EBP + value = parameters that was push onto the stack before the function was called.

During prologue the reverse needs to happen. First the local variable needs to be _pop_ off the stack. then the EBP is moved into the ESP, and pop the old frame pointer into EBP. finally it uses the RET operation to return to the called address.

**Stack example:**

| Value          | location |
| -------------- | -------- |
| ...            |          |
| var2           | ebp-c    |
| var1           | ebp-8    |
| var0           | ebp-4    |
| sfp            | ebp      |
| return address | ebp-4    |
| arg0           | ebp+8    |
| arg1           | ebp+c    |
| arg2           | ebp+10   |
| ...            |          |

**How opcode interact with the stack**

| opcode        | stack operation                         |
| ------------- | --------------------------------------- |
| **push eax**  |                                         |
|               | sub esp, 4                              |
|               | mov \[ESP], eax                         |
| **pop eax**   |                                         |
|               | mov eax, \[ESP]                         |
|               | add esp, 4                              |
| **call func** |                                         |
|               | sub esp, 4                              |
|               | mov \[esp], address of next instruction |
|               | mov eip, function address               |
| **ret**       |                                         |
|               | mov eip, \[esp]                         |
|               | add esp,4                               |







**Passing values in x86**

| arg   | register    |
| ----- | ----------- |
| arg 0 | \[EBP+0x8]  |
| arg 1 | \[EBP+0XC]  |
| arg 2 | \[EBP+0X10] |
| arg 3 | \[EBP+0X14] |

### Resorces

* https://en.wikibooks.org/wiki/X86\_Assembly/X86\_Architecture
* http://unixwiz.net/techtips/x86-jumps.html
* http://unixwiz.net/techtips/win32-callconv-asm.html

## Control flow

#### Switch case

Execute one code block out of many based on an control value The address for each code block is sotred in an array.\
What you most likely will see is jmp \[varible\*4]

C code:

```c
switch(varible) {
    case 0:
    code
    break;
    ...
    case n:
    code
    break;
    default:
    code
    break;
}
```

Assembly:

```
mov eax, var1
cmp eax,1
ja end
jmp code_block_address_table[eax*4]
case_0: (offset 0x1000)
code
jmp end
case:1 (offset 0x2000)
code
end:
```


#### Register

Registers are small high-speed memory. That is built into the processor of a computer. They are used to store data values that are currently being used or manipulated by the processor. Registers are often used to store temporary results, loop counters, and other values that are needed by the processor during the execution of a program. A CPU has a number of registers, some of these are general purpose while others have specific usage.

| Register | description                                                                                               |
| -------- | --------------------------------------------------------------------------------------------------------- |
| EAX      | Used for addition, multiplication and return value                                                        |
| ECX      | Used as counter and loops                                                                                 |
| EDX      |                                                                                                           |
| EBP      | Baseline pointer, frame pointer, used to reference arguments and local variables                          |
| ESP      | Point to the current top of the stack, changed via push, pop and others.                                  |
| EIP      | Instruction pointer, points to the next instruction to execute                                            |
| ESI/EDI  | Used by memory transfer instruction, EDI (Source index), EDI (Desitantion index)                          |
| df       | direction flag, indicate if it should increment (0) or decrement (1)                                      |
| EFlags   | Contains bit representing called flags that store the outcome of computation. (e.g. zero and carry flags) |
| FS       | F segment register; _FS\[0]_ points to SEG chain, _FS\[0x30]_ points to the PEB                           |

**Register size**

| register | Size in bits                          |
| -------- | ------------------------------------- |
| R\*X     | 64                                    |
| E\*X     | 32                                    |
| \*X      | 16                                    |
| \*H      | 8 of the 16 higher order bytes (8-16) |
| \*L      | 8 of the 16, lower order bytes (0-7)  |

#### Pointers

Pointers are a reference to a location within memory, that holds the data. They are used to indirectly access data values. Pointers are often used to implement data structures, such as linked lists and arrays, and to access data dynamically. If you see a number inside \[], e.g. \[0x1230230], IDA will display it as _dword\_1230230_. This tells you you are working with a pointer to an address, not the data itself.

Pointer size

| value  | size in bits |
| ------ | ------------ |
| Nibbel | 4            |
| byte   | 8            |
| WORD   | 16           |
| DWORD  | 32           |
| QWORD  | 64           |

#### Functions

Assembly language functions are typically defined using a label, which is a symbolic name for the function, to call a function in assembly language, the caller uses the _call_ instruction and specifies the label of the function.

e.g.

```
call function
```

This causes the processor to jump to the location of the function, execute the instructions within the function, and then return to the caller when the function is finished. It is also possible to pass parameters to the function. The way it did in x86 is by using the _push_ instruction.

```py
push 10 #Last parameter 
push eax #Second parameters
push esi #First parameter
call function
```

Once the function is over it calls and uses the _ret_ operation to return to the caller. in cases where the function needs to return a value. A pointer to the return value gets pushed into the _EAX_ register.

In assembly language, the prologue and epilogue of a function are the instructions that are executed at the beginning and end of the function, respectively.

The prologue and epilogue of a function are important because they ensure that functions execute correctly and do not interfere with the operation of other code. The prologue prepares the environment for the execution of the function, and the epilogue restores the environment after the function is finished.

Prologue occurs at the start of a function to sets up the environment, it allocates space for variables by allocating memory, saving register values, and setting up the stack frame.

prologue example:

```
PUSH EBP
MOV EBP, ESP
SUB ESP,0X105
```

Epilogue occurs at the end of the function and restores the environment back to before the function was called. This is done by cleaning up the stack by calling _pop_ operation to restore allocated variables and registers, finally returning control to the caller.

Epilogue example:

```
mov ESP, EBP
pop EBP
Ret
```



#### Operator

Operation or op-code tells the system what action should be performed. List of the most common operations:

| Operator          | descriptor                                                         |
| ----------------- | ------------------------------------------------------------------ |
| **Data transfer** |                                                                    |
| PUSH              | Push value onto the stack, used to push function parameters in x86 |
| POP               | Retrieve the top value from the stack                              |
| LEA               | Save memory pointer into register                                  |
| **Calls**         |                                                                    |
| JMP               | jump to location                                                   |
| CALL              | Calls function                                                     |
| RET               | returns to caller                                                  |
| **Condition**     |                                                                    |
| A                 | Above                                                              |
| B                 | Below                                                              |
| C                 | Carry, same and below                                              |
| E                 | Equal                                                              |
| N                 | Not                                                                |
| G                 | Greater then                                                       |
| L                 | Less then                                                          |
| Z                 | zero                                                               |
| JNE               | Jump not equal                                                     |
| JZ                | Jump if zero                                                       |
| JNZ               | jump if not zero                                                   |
| JA                | jump if above                                                      |
| JNGE              | jump if not greater than or equal                                  |

**Control flow code**

Some common examples of conditional control flow.

#### X64

Some of the major changes with x64 are that the register was increased from 32-bit to 64 bit, the way one can distinguish between the two is the E is changed to R e.g. EAX -> RAX. Eight new general-purpose registers are added: R8 to R15. And RSP is often used to access arguments and local variables, instead of EBP. A new calling convention, which resembles fastcall, where parameters are passed via registers.

The new register are following a new naming convention

| Register | bit size |
| -------- | -------- |
| R8       | 64       |
| R8D      | 32       |
| R8W      | 15       |
| R9B      | 7        |

One of the biggest changes from X86 to X64 it no longer uses the _PUSH_ instruction to move parameters into the register. Instead, _lea_ and _mov_ are used.

The way to analyze what parameters get passed into a function. Is to go back and see what values get passed into the different registers, right before the _call_.\\

Function argument register:

| Argument   | Register |
| ---------- | -------- |
| 1st arg    | rdi      |
| 2nd arg    | rsi      |
| 3rd arg    | rdx      |
| 4th arg    | rcx      |
| 5th arg    | r8       |
| 6th arg    | r9       |
| ...        | ...      |
| 12th arg   | r15      |
| return val | rax      |