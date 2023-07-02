
## Handling function parameters

**x86 assembly**

+---------------------+---------------+-------------+-------------+
|     Parameter       |     AMD       |    Intel    |    Notes    |
+---------------------+---------------+-------------+-------------+
|   First parameter   |     EAX       |     EAX     |             |
|   Second parameter  |     EDX       |     ECX     |             |
|   Third parameter   |     ECX       |     EDX     |             |
|   Fourth parameter  |     EBX       |     EBX     |             |
|   Fifth parameter   |     ESI       |     ESI     |             |
|   Sixth parameter   |     EDI       |     EDI     |             |
|   Stack parameters  |  Pushed on    | Pushed on   | In reverse  |
|                     |    the stack  | the stack   |  order      |
+---------------------+---------------+-------------+-------------+


**x64 assembly**

+---------------------+---------------+-------------+-------------+
|     Parameter       |     AMD       |    Intel    |    Notes    |
+---------------------+---------------+-------------+-------------+
|   First parameter   |     RDI       |     RCX     |             |
|   Second parameter  |     RSI       |     RDX     |             |
|   Third parameter   |     RDX       |     R8      |             |
|   Fourth parameter  |     RCX       |     R9      |             |
|   Fifth parameter   |     R8        |     Stack   |             |
|   Sixth parameter   |     R9        |     Stack   |             |
|   Stack parameters  |  Pushed on    | Pushed on   | In reverse  |
|                     |    the stack  | the stack   |  order      |
+---------------------+---------------+-------------+-------------+
