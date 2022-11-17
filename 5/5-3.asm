include \masm32\include\masm32rt.inc

.data

a dd ? 

shr1 db "shr = %d ", 0
shl1 db "shl = %d ", 0
sar1 db "sar = %d ", 0
sal1 db "sal = %d ", 0
ror1 db "ror = %d ", 0
rol1 db "rol = %d ", 0

va db "Enter a variable a: ", 0
tpi db "%d",0
tps db "%s",0

.code
main:

 invoke crt_printf, addr tps, addr va ; c-style 
 invoke crt_scanf, addr tpi, addr a 
 
 mov eax, a
 shr eax, 3
 invoke crt_printf, addr shr1, eax
 mov eax, a
 shl eax, 3
 invoke crt_printf, addr shl1, eax
 
 mov eax, a
 sar eax, 3
 invoke crt_printf, addr sar1, eax
 mov eax, a
 sal eax, 3
 invoke crt_printf, addr sal1, eax
 
 mov eax, a
 ror eax, 3
 invoke crt_printf, addr ror1, eax
 mov eax, a
 rol eax, 3
 invoke crt_printf, addr rol1, eax
 
 invoke Sleep, INFINITE
 invoke ExitProcess, 0
end main

; shr shl sar sal rol ror
