#include <stdio.h>
#include <stdlib.h>  // для atoi()

int main(int argc, char *argv[]) {
    // Если аргументов нет (кроме имени программы), выводим сообщение
    if (argc < 2) {
        printf("Ошибка: укажите числа для умножения.\n");
        return 1;
    }

    int product = 1;  // Начальное значение произведения

    // Проходим по всем аргументам (начиная с argv[1])
    for (int i = 1; i < argc; i++) {
        product *= atoi(argv[i]);  // преобразуем строку в число и умножаем
    }

    // Выводим результат
    printf("Результат: %d\n", product);

    return 0;
}
