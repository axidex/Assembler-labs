; (7a-3b-2)/(b-5)
.586p 
.model flat, stdcall  
option casemap:none

include /masm32/include/windows.inc
;             include
include /masm32/include/masm32.inc
include /masm32/include/msvcrt.inc
include /masm32/macros/macros.asm

includelib /masm32/lib/masm32.lib
includelib /masm32/lib/msvcrt.lib
; 1-2 libs and headers

.data
a dd ? 
b dd ?

va db "Enter a variable a: ", 0
vb db "Enter a variable b: ", 0
s1 db "chastnoe = %d ostatok = %d", 0
tpi db "%d",0
tps db "%s",0
;Format db '(2*a*a*b+a*b), a=%d b=%d res=%d',0




.code
    start:
        invoke crt_printf, addr tps, addr va ; c-style 
        invoke crt_scanf, addr tpi, addr a
        
        invoke crt_printf, addr tps, addr vb
        invoke crt_scanf, addr tpi, addr b

; (7a-3b-2)/(b-5)
        mov eax, 7
        mov ebx, a
        mul ebx ; eax = 7a

        mov ecx, eax ; ecx = 7a

        mov eax, 3
        mov ebx, b
        mul ebx ; eax = 3b

        sub ecx, eax ; 7a-3b

        mov eax, 2

        sub ecx, eax ; ecx = 7a-3b-2

        mov eax, b
        mov ebx, 5
        sub eax, ebx ; eax = b-5
        mov ebx, eax
        mov eax, ecx
        xor edx, edx
        idiv ebx

        invoke crt_printf, addr s1, eax, edx
        invoke crt__getch
        invoke crt_exit, 0 ; ExitProcessss
    end start