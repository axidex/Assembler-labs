#include <iostream>

int main()
{
    const int kLength = 28;
    char txt[kLength] = "hello,321.0  9-3,2!1?,9;394";

    __asm {
        mov ecx, kLength
        dec ecx
        mov esi, 0
        encrypt :
            mov al, 44;
            mov bl, to_encrypt[esi]
            cmp al, bl
            jne ElsePart1
            mov to_encrypt[esi], 42
            jmp ElsePart1

                ElsePart1:
                    mov al, 46;
                    cmp al, bl
                    jne ElsePart2
                    mov to_encrypt[esi], 42
                    jmp ElsePart2

                    ElsePart2:
                        mov al, 59;
                        cmp al, bl
                        jne ElsePart3
                        mov to_encrypt[esi], 42
                        jmp ElsePart3

                        ElsePart3:
                            mov al, 45;
                            cmp al, bl
                            jne ElsePart4
                            mov to_encrypt[esi], 42
                            jmp ElsePart4

                            ElsePart4:
                                mov al, 33;
                                cmp al, bl
                                jne ElsePart5
                                mov to_encrypt[esi], 42
                                jmp ElsePart5

                                ElsePart5:
                                    mov al, 33;
                                    cmp al, bl
                                    jne ElsePart6
                                    mov to_encrypt[esi], 42
                                    jmp ElsePart6

                                    ElsePart6:
                                        mov al, 63;
                                        cmp al, bl
                                        jne ElsePart7
                                        mov to_encrypt[esi], 42
                                        jmp ElsePart7

                                        ElsePart7:
                                            inc esi
                                            dec ecx
                                            jecxz exit_
                                            jmp encrypt
        exit_ :
    }
    std::cout << to_encrypt << std::endl;

    return 0;
}