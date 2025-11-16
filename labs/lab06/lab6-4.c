#include <stdio.h>

int main() {
    int x;
    int result;

    // Запрос ввода значения x
    printf("Введите значение переменной x: ");
    scanf("%d", &x);

    // Вычисление функции f(x) = (11 + x) * 2 - 6
    result = (11 + x) * 2 - 6;

    // Вывод результата
    printf("Результат: %d\n", result);

    return 0;
}
