#include <stdio.h>

int main() {
    long long studentId;  // Используем long long для больших чисел
    int variant;

    // Выводим приглашение и считываем номер студенческого билета
    printf("Введите № Студенческого билета: ");
    scanf("%lld", &studentId);  // %lld — для long long

    // Вычисляем вариант: остаток от деления на 10, затем +1
    variant = (studentId % 10) + 1;

    // Выводим результат
    printf("Ваш вариант: %d\n", variant);

    return 0;
}
