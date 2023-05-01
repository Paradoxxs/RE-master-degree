Convert decimal to hex using python

````py
result = int(hex(11208704838),16) & 0xffffffff
f'{result:08x}'
````

**Compiling arm on ubuntu**

install 
sudo apt install binutils-aarch64-linux-gnu


aarch64-linux-gnu-as -o a.o [the name of your source file]
aarch64-linux-gnu-gcc -static -o [the name of the executable] a.o



**Compiling intel assembly**

````bash
gcc -masm=intel -m32 -c test_modified.S -o test_modified.o
gcc -m32 -c solve.c -o solve.o
gcc -m32 test_modified.o solve.o -o solve
````


´´´´bash
as --32 -o asm_code.o asm_code.asm
ld -o asm_code asm_code.o
````
