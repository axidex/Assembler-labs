#include <iostream>

int main()
{
    const int kLength = 6;
    char to_encrypt[kLength] = "hello";

    __asm {
        prepare:
            mov ecx, kLength
            dec ecx
            mov esi, 0
        encrypt :
            inc to_encrypt[esi]
            inc esi
            dec ecx
            jecxz exit_
            jmp encrypt
        exit_ :
    }
    std::cout << to_encrypt << std::endl;
    __asm {
        mov ecx, kLength
        dec ecx
        mov esi, 0
        decrypt :
            dec to_encrypt[esi]
            inc esi
            dec ecx
            jecxz exit_2
            jmp decrypt
        exit_2:
    }
    std::cout << to_encrypt << std::endl;
    return 0;
}