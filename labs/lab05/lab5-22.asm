section .data
    prompt db "Введите строку: ", 0
    prompt_len equ $ - prompt

    newline db 10  ; символ перевода строки

section .bss
    buffer resb 256  ; буфер для ввода (256 байт)

section .text
    default rel
    global _main
    _main:
        ; Выводим приглашение
        mov rax, 0x2000004  ; sys_write
        mov rdi, 1            ; stdout
        mov rsi, prompt      ; адрес строки
        mov rdx, prompt_len  ; длина строки
        syscall

        ; Читаем ввод
        mov rax, 0x2000003  ; sys_read
        mov rdi, 0            ; stdin
        mov rsi, buffer       ; буфер для данных
        mov rdx, 255         ; макс. длина (оставляем 1 байт для 0)
        syscall
        
        ; Сохраняем длину введённой строки
        mov r8, rax           ; r8 = длина ввода

        ; Добавляем перевод строки к выводу
        mov byte [buffer + r8], 10
        inc r8

        ; Выводим введённую строку
        mov rax, 0x2000004  ; sys_write
        mov rdi, 1
        mov rsi, buffer
        mov rdx, r8
        syscall

        ; Завершаем программу
        mov rax, 0x2000001  ; sys_exit
        xor rdi, rdi         ; код возврата 0
        syscall

