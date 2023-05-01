# Arm assembly


*declaring strings*

you have three options when wanting to declare a string in arm assembly

- ascii, the problem with using ascii is that it does not have a null byte terminator which can mess with some computers
- asciz, has null byte terminator
- string, a reference to asciz

When making syscalls or system calls where the OS takes and takes action it will look in the r7 register and depending upon the value here perform an action


lsl r0,#1 //10*2=20
lsr r0,#2 //10/4=5

*Hello world*

````asm
.global _start
_start:

    mov r0,#1 //std input
    ldr r1,=message
    ldr r2,=len
    mov r7,#4 //Write
    swi 0 //syscall

    mov r7,#1 //exit program
    swi 0 //syscall


.data
    message:
            .asciz, "Hello world \n"
    len = .-message
````

## gdb

Debugger in Linux

- start gdb, `gdb <program>`
- set break point on _start, `break_start`
- run the code and only stop if it hits a breakpoint, `run`
- Step into, `stepi`
- display assembly code, `layout asm`
- Display register, `layout regs`
- Examining the stack at r1 and 10 * 32 bits forward, `x/10x $r1`
    - display decimal, `x/10d $r1`
    - display character, `x/10c $r1`
    - display unsigned integer, `x/10u $r1`


## Virtual rasberry pi

will start a virtual rasbian image where you can compile arm code requires:
https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/
https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie


````
qemu-system-arm -kernel kernel-qemu-4.4.34-jessie -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootstype=ext4 rw" -hda 2017-04-10-raspbian-jessie.img  -nic user,hostfwd=tcp::5022-:22 -no-reboot
````

Once the virtual rasbian has started open terminal and start ssh
````
sudo service ssh start
````

you can now ssh
````
ssh pi@127.0.0.1 -p 5022
````

the password is raspberry