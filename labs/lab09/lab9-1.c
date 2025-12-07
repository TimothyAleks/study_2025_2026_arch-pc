#include <stdio.h>

int main() {
    int x;

    // Запрашиваем ввод значения x
    printf("Введите x: ");
    scanf("%d", &x);

    // Вычисляем выражение 2*(3*x - 1) + 7
    int result = 2 * (3 * x - 1) + 7;

    // Выводим результат в формате "2(3x-1)+7=..."
    printf("2(3x-1)+7=%d\n", result);

    return 0;
}
