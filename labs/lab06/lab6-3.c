#include <stdio.h>

int main() {
    int dividend = 9;    // Делимое (число, которое делим)
    int divisor = 5;     // Делитель (число, на которое делим)
    int result;          // Переменная для хранения результата деления
    int remainder;       // Переменная для хранения остатка от деления

    // Вычисляем результат целочисленного деления (частное)
    result = dividend / divisor;

    // Вычисляем остаток от деления
    remainder = dividend % divisor;

    // Выводим результаты
    printf("Результат: %d\n", result);
    printf("Остаток от деления: %d\n", remainder);

    return 0;
}
