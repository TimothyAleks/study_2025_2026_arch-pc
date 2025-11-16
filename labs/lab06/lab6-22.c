#include <stdio.h>

int main() {
    int eax = 6;
    int ebx = 4;
    int result = eax + ebx;

    printf("%d", result);  // Выводим только число, без \n
    fflush(stdout);        // Очищаем буфер, чтобы вывод появился сразу
    return 0;
}
