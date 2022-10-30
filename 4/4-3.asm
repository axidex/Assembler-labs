include \masm32\include\masm32rt.inc

.data
a db ?
b db ?
d db ?
va db "Enter a variable a: ", 0
vb db "Enter a variable b: ", 0
vd db "Enter a variable d: ", 0

s1 db "max = %d", 0

tpi db "%d", 0
tps db "%s", 0

.code

    max proc
            
        cmp eax, ebx

            jl FirstLesser
            jmp FirstBigger

            FirstLesser:
            mov eax, ebx

            FirstBigger:
            cmp eax, ecx

            jl ThirdBigger
            jmp Return

            ThirdBigger:
            mov eax, ecx

            Return:
            ret

        max endp

    start:
        invoke crt_printf, addr tps, addr va
        invoke crt_scanf, addr tpi, addr a
        
        invoke crt_printf, addr tps, addr vb
        invoke crt_scanf, addr tpi, addr b

        invoke crt_printf, addr tps, addr vd
        invoke crt_scanf, addr tpi, addr d

        movsx eax, a 
        movsx ebx, b
        movsx ecx, d

        call max

        invoke crt_printf, addr s1, eax
        invoke crt__getch
        invoke crt_exit, 0
    end start