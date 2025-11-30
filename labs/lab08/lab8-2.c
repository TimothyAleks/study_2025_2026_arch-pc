#include <stdio.h>

int main(int argc, char *argv[]) {
    for (int i = 1; i < argc; i++) {  // пропускаем argv[0] (имя программы)
        printf("%s\n", argv[i]);
    }
    return 0;
}
