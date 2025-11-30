#include <stdio.h>
#include <stdlib.h>  // для atoi()

// Функция f(x) = 7 + 2x
int f(int x) {
    return 7 + 2 * x;
}

int main(int argc, char *argv[]) {
    printf("Функция: f(x) = 7 + 2x\n");
    printf("Результат:\n");

    // Проходим по всем аргументам (начиная с argv[1], т.к. argv[0] — имя программы)
    for (int i = 1; i < argc; i++) {
        int x = atoi(argv[i]);  // преобразуем строку в число
        int result = f(x);      // вычисляем f(x)
        printf("f(%d) = %d\n", x, result);
    }

    return 0;
}
