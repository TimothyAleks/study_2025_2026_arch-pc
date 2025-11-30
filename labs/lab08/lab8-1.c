#include <stdio.h>

int main() {
    int N;

    printf("Введите N: ");
    scanf("%d", &N);

    // Выводим числа от N-1 до 0
    for (int i = N - 1; i >= 0; i--) {
        printf("%d\n", i);
    }

    return 0;
}
