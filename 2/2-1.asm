.586p 
.model flat, stdcall  
option casemap:none

include /masm32/include/windows.inc
include /masm32/include/user32.inc
include /masm32/include/kernel32.inc
;             include
include /masm32/include/masm32.inc
include /masm32/include/msvcrt.inc
include /masm32/macros/macros.asm

includelib /masm32/lib/masm32.lib
includelib /masm32/lib/msvcrt.lib
includelib /masm32/lib/user32.lib
includelib /masm32/lib/kernel32.lib

.data
a dd 3
b dd 4

Format db '(2*a*a*b+a*b), a=%d b=%d res=%d',0

.code
    start:
        mov eax, 2
        mov ebx, a
        mul ebx ; eax = 2a
        ;mov ebx, a
        mul ebx ; eax = 2a^2
        mov ebx, b
        mul ebx ; eax = 2a^2*b
        push eax

        mov eax, a
        mov ebx, b
        mul ebx ; eax = a*b
        push eax

        pop ebx 
        pop eax
        add eax, ebx

        invoke crt_printf, addr Format, a, b, eax
        invoke crt__getch
        invoke crt_exit, 0 ; ExitProcessss
    end start