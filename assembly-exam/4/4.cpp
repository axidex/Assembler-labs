#include <iostream>
#include <fstream>

int main()
{
    const int kLength = 15;
    char txt[kLength] = "My Dear Friend";
    char txt_reversed[kLength];

    __asm {
        mov ecx, kLength
        dec ecx
        mov esi, kLength
        dec esi
        mov txt_reversed[esi], 0
        dec esi
        Loop1:
            mov eax, kLength
            dec eax
            sub eax, ecx
            mov bl, txt[esi]
            mov txt_reversed[eax], bl
            dec esi
            dec ecx
            jecxz exit_2
            jmp Loop1
        exit_2 :
            mov esi, kLength
    }

    std::ofstream myfile;
    myfile.open("123.txt");
    myfile << txt_reversed;
    myfile.close();
    std::cout << txt_reversed << std::endl;

    return 0;
}