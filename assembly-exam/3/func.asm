;                                 y(x) = (x^2 + sqrt(x))         0.5
.586
.model flat, stdcall
option casemap :none
include \masm32\include\windows.inc
include \masm32\macros\macros.asm
uselib kernel32,user32,fpu,masm32
.data
x real10 0.0
incr real10 0.5
szfmt db "y = ",0
result db 260 dup(?)
buf db 100 dup(?)
titl db "           ",0
count dd 1
expr db "y(x) = (x+2*(sin(x))^2)",0
buf2 db 100 dup(?)
newLine db 0ah, 0
avt db "expr",0
dva real10 2.0
.code
start:
mov edi, 4 ;                    
invoke szCatStr,addr result,addr avt
invoke szCatStr,addr result,addr newLine
invoke szCatStr,addr result,addr expr
invoke szCatStr,addr result,addr newLine
invoke szCatStr,addr result,addr newLine
finit 
@L:
fld x
fsin
fld x
fsin
fmul
fld dva
fmul
fld x
fadd
invoke wsprintf,addr buf2,addr szfmt,count
invoke FpuFLtoA,0,3,addr buf,SRC1_FPU or SRC2_DIMM
invoke szCatStr,addr result,addr buf2
invoke szCatStr,addr result,addr buf
invoke szCatStr,addr result,addr newLine
invoke FpuAdd,addr x,addr incr,addr x,SRC1_REAL or SRC2_REAL or DEST_MEM
inc count
dec edi
jnz @L
invoke szCatStr,addr result,addr newLine
invoke MessageBox,0,addr result,addr titl,MB_ICONINFORMATION
invoke ExitProcess, 0
end start