

.586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

include \masm32\include\masm32rt.inc

.data

hFile dd ? ; file handle
txt db "My Dear Friend", 0 ; text handle
txt2 db "My Dear Friend" , 0
kLength dd 15
_size dd ?   

.code
main:
mov ecx, kLength
dec ecx
dec ecx
mov esi, kLength
dec esi
dec esi

Loop1:
            mov eax, kLength
            dec eax
            dec eax
            sub eax, ecx
            ;invoke crt_printf, addr s1, eax
            ;invoke crt_printf, addr s1, esi
            mov bl, txt[esi]
            mov txt2[eax], bl
            dec esi
            dec ecx
            jecxz exit_
            jmp Loop1 
            exit_:
mov esi, kLength
mov eax, 0
dec esi
dec esi
mov bl, txt[eax]
mov txt2[esi], bl

mov hFile, fcreate("123.txt"); create the file
invoke WriteFile, hFile, addr txt2 , 14, addr _size, 0
fclose  hFile; It is good programming style to close a file as soon as possible!
ret

end main
