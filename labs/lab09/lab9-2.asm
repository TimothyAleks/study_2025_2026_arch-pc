SECTION .data
    msg1: db "Hello, ", 0x0
    msg2: db "world!", 0xa

    ; Вычисляем длины строк
    msg1Len: equ $ - msg1 - 1  ; -1 для исключения нулевого байта
    msg2Len: equ $ - msg2

SECTION .text
global _start
_start:
    ; Вывод первой части сообщения
    mov rax, 0x2000004  ; sys_write для macOS
    mov rdi, 1          ; stdout
    mov rsi, msg1       ; указатель на сообщение
    mov rdx, msg1Len    ; длина сообщения
    syscall

    ; Вывод второй части сообщения
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg2
    mov rdx, msg2Len
    syscall

    ; Завершение программы
    mov rax, 0x2000001  ; sys_exit для macOS
    xor rdi, rdi        ; код возврата 0
    syscall

