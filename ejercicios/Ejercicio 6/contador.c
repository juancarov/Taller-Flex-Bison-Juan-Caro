#include <stdio.h>
#include <ctype.h>

int main(void) {
    int c;
    long nl = 0, nw = 0, nc = 0;
    int inword = 0;

    while ((c = getchar()) != EOF) {
        nc++;                        // cuenta caracteres
        if (c == '\n')
            nl++;                    // cuenta líneas
        if (isspace(c)) {
            inword = 0;              // ya no estamos en una palabra
        } else if (!inword) {
            inword = 1;
            nw++;                    // inicia nueva palabra
        }
    }

    printf("%ld %ld %ld\n", nl, nw, nc);
    return 0;
}
