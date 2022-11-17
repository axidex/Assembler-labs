include \masm32\include\masm32rt.inc

.data

mas dd 2,-7,0,-5,-1,-9,3,6,0,8

format db '%d ', 0
s1 db "Sum = %d ", 0
s2 db "Number is = %d", 0
.code
main:

    xor eax,eax
    prepare:
        mov ecx, 10
        mov esi, 0
        mov ebx, 0
    compare:
        mov edx, mas[esi*4]
        cmp edx, 0
        ;invoke crt_printf, addr s2, edx
        ;invoke crt__getch
        je equal                    
        jg bigger
        jl lesser

    equal:
        inc esi
        dec ecx
        jecxz exit_
        jmp compare
    bigger:
        inc esi
        dec ecx
        jecxz exit_
        jmp compare
    lesser:
        add ebx, edx
        inc esi
        dec ecx
        jecxz exit_
        jmp compare
        
    exit_:
        invoke crt_printf, addr s1, ebx
        invoke Sleep, INFINITE
        invoke ExitProcess, 0
end main

; shr shl sar sal rol ror
