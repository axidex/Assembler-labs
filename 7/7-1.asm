.586
         .MODEL  flat, stdcall
         OPTION CASEMAP:NONE

include \masm32\include\masm32rt.inc

         .CONST
MsgExit  DB    "Press Enter to Exit",0AH,0DH,0
N        DD    6

         .DATA
; Матрица ?(6,6)
A dd    1,8,13,32,5,2,
        2,9,0,0,12,10,
        3,4,11,7,1,8,
        15,20,2,9,1,14,
        12,16,3,8,1,10,
        10,7,5,9,11,8 
Space    DB    " ",0
SlashN   DB    13,10,0
SEnd     DB    0AH,0DH,0


s1 db "max = %d, (%d, %d)", 0

         .DATA?
inbuf    DB    100 DUP (?)
SOut     DB    16  DUP (?)
max dd ?
maxI dd ?
maxJ dd ?

.code
main:
         call MatrixOut
        
         invoke crt_printf, addr s1, max, maxI, maxJ
         XOR    EAX,EAX
         Invoke StdOut,ADDR MsgExit
         Invoke StdIn,ADDR inbuf,LengthOf inbuf     
         Invoke ExitProcess,0
            
 MatrixOut proc near
             mov EBX,0
             mov ESI,0         ; смещение в строке
             mov ECX,N         ; кол-во строк
     icycle:                   ; цикл по строкам
             push ECX          ; ECX - в стек
             mov ECX,N         ; кол-во столбцов
     jcycle:                   ; цикл по столбцам
             push ECX          ; ECX - в стек, т. к. Invoke портит его           
             ; Преобразование и вывод на экран
             
             mov ebx, max

             .if A[ESI] > ebx
                mov ebx, A[ESI]
                mov max, ebx
                mov eax, esi
                XOR EDX, EDX
                mov ebx, 4
                idiv ebx
                mov ebx, 6
                idiv ebx
                mov maxI, eax
                mov maxJ, edx
             .endif

             Invoke dwtoa,A[ESI],ADDR SOut  
             Invoke StdOut,ADDR SOut   
             Invoke StdOut,ADDR Space
             add ESI, 4           ; к след. эл-ту строки
             pop ECX           ; вытащили из стека номер столбца
             loop jcycle
             Invoke StdOut,ADDR SlashN
             pop ECX           ; вытащили из стека номер строки
             loop icycle 
             Invoke StdOut,ADDR SEnd       
             ret
         MatrixOut endp
end main