%include 'in_out_mac.asm'

SECTION .bss
buf1: RESB 80

SECTION .text
GLOBAL _main
_main:
    ; Записываем символы '6' и '4' в регистры
    mov rax, '6'
    mov rbx, '4'
    
    ; Складываем коды символов (54 + 52 = 106 → символ 'j')
    add rax, rbx
    
    ; Сохраняем результат в buf1 (используем 64-битную адресацию)
    mov qword [buf1], rax   ; qword = 64 бита
    
    ; Загружаем адрес buf1 в rdi (64-битный регистр)
    lea rdi, [buf1]
    
    ; Выводим строку с переводом строки
    call sprintLF
    
    ; Завершаем программу
    call quit


