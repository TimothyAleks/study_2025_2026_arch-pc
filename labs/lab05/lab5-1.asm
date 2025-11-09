section .data
    prompt db 'Введите строку: Алексеев Тимофей ', 0xA
    prompt_len equ $ - prompt

section .bss
    input resb 256                     ; Буфер для ввода
    space_pos resb 4                   ; Позиция пробела (будет вычисляться)

section .text
    global _start

_start:
    ; Шаг 1: Выводим строку-приглашение
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Шаг 2: Читаем строку с клавиатуры
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Шаг 3: Находим первый пробел в строке (разделитель)
    mov ecx, input           ; Указатель на начало строки
    mov edx, 0              ; Счётчик позиции
find_space:
    cmp byte [ecx], ' '      ; Сравниваем символ с пробелом
    je found_space          ; Если пробел — переходим к выводу
    inc ecx                 ; Иначе двигаем указатель вперёд
    inc edx                 ; Увеличиваем счётчик позиции
    cmp byte [ecx], 0       ; Проверяем конец строки (нулевой символ)
    jne find_space          ; Если не конец — продолжаем поиск
    jmp no_space            ; Если пробел не найден

found_space:
    mov [space_pos], edx    ; Сохраняем позицию пробела

    ; Шаг 4: Выводим фамилию (до пробела)
    mov eax, 4
    mov ebx, 1
    mov ecx, input          ; Указатель на начало строки
    mov edx, [space_pos]   ; Длина фамилии (до пробела)
    int 0x80

    ; Шаг 5: Выводим имя (после пробела)
    mov eax, 4
    mov ebx, 1
    mov ecx, input          ; Сдвигаем указатель на позицию после пробела
    add ecx, [space_pos]
    mov edx, 256           ; Максимальная длина имени (можно уточнить)
    int 0x80

no_space:
    ; Если пробел не найден — выводим всю строку
    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 256
    int 0x80

    ; Шаг 6: Завершаем программу
    mov eax, 1
    xor ebx, ebx
    int 0x80

    int     80h


