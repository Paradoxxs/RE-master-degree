# Description

Surely this is what people mean when they say "horizontal scaling," right?
TOP SECRET INFO:
Our operatives managed to exfiltrate an in-development version of this challenge, where the function with the real flag had a mistake in it. Can you help us get the flag?

Compare the two binaries 

cmp -bl breadth.v1 breadth.v2

``````
   725 315 M-M  103 C
   726 120 P    122 R
   727 141 a    345 M-e
   728  57 /    327 M-W
   729  61 1    117 O
   730 350 M-h  165 u
   731 223 M-^S 237 M-^_
   732 150 h    371 M-y
   733  31 ^Y   234 M-^\
   734 163 s    127 W
   735 271 M-9    6 ^F
   736 220 M-^P  14 ^L
   737 377 M-^?  53 +
   738 313 M-K  302 M-B
   739 307 M-G  337 M-_
   740 327 M-W   47 '
   741 270 M-8  121 Q
   742 250 M-(  247 M-'
   743 361 M-q  335 M-]
   744 264 M-4  251 M-)
610380 124 T    104 D
610383 270 M-8  110 H
610384  72 :     75 =
610385 200 M-^@  76 >
610386  67 7    307 M-G
610387 320 M-P   33 ^[
610388 110 H      4 ^D
610389  71 9    164 t
610390 302 M-B   12 ^J
610391 164 t    303 M-C
610392  10 ^H   146 f
610393 303 M-C   17 ^O
610394  17 ^O    37 ^_
610395  37 ^_   204 M-^D
610396 200 M-^@   0 ^@
2438996  61 1     62 2
``````

convert offset to hex 

```
printf "%x\n" 610380
```

Giving us the output *9504c*


Open the v1 sample within Ghidra and jump to base+offset by pressing *g*, in my case the base was *100000*

```
                             **************************************************************
                             *                          FUNCTION                          *
                             **************************************************************
                             undefined fcnkKTQpF()
             undefined         AL:1           <RETURN>
             undefined8        Stack[-0x10]:8 local_10                                XREF[2]:     00195040(W), 
                                                                                                   00195049(R)  
                             fcnkKTQpF                                       XREF[3]:     Entry Point(*), 0029aac0, 
                                                                                          002dfafc(*)  
        00195040 48 c7 44        MOV        qword ptr [RSP + local_10],0x41bc73e
                 24 f0 3e 
                 c7 1b 04
        00195049 48 8b 54        MOV        RDX,qword ptr [RSP + local_10]
                 24 f0
        0019504e b8 3a 80        MOV        EAX,0xd037803a
                 37 d0
        00195053 48 39 c2        CMP        RDX,RAX
        00195056 74 08           JZ         LAB_00195060
        00195058 c3              RET
        00195059 0f              ??         0Fh
        0019505a 1f              ??         1Fh
        0019505b 80              ??         80h
        0019505c 00              ??         00h
        0019505d 00              ??         00h
        0019505e 00              ??         00h
        0019505f 00              ??         00h
                             LAB_00195060                                    XREF[1]:     00195056(j)  
        00195060 48 8d 3d        LEA        RDI,[s_picoCTF{VnDB2LUf1VFJkdfDJtdYtFlM_00255e   = "picoCTF{VnDB2LUf1VFJkdfDJtdYt
                 91 0e 0c 00
```

There you have it the flag.