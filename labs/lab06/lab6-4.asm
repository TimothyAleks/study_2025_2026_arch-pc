%include 'in_out.asm'
section .data
    prompt db "Введите значение переменной x: ", 0
    result_msg db "Результат: ", 0
    newline db 10  ; символ перевода строки
section .bss
    x resq 1      ; переменная x (64 бита)
    result resq 1   ; результат вычисления
section .text
    global _main
    extern _printf, _scanf, _exit
_main:
    ; Вывод приглашения для ввода
    mov rdi, prompt
    call _printf
    ; Считывание значения x
    mov rdi, qword format_int
    mov rsi, x
    call _scanf
    ; Вычисление f(x) = (11 + x) * 2 - 6
    mov rax, [x]
    add rax, 11          ; 11 + x
    shl rax, 1          ; умножение на 2 (сдвиг влево)
    sub rax, 6          ; вычитание 6
    mov [result], rax
    ; Вывод сообщения "Результат: "
    mov rdi, result_msg
    call _printf
    ; Вывод численного результата
    mov rdi, qword format_int
    mov rsi, [result]
    call _printf
    ; Перевод строки
    mov rdi, newline
    call _putchar
    ; Завершение программы
    mov rdi, 0
    call _exit
