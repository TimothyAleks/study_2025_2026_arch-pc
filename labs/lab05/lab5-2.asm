%include 'in_out.asm'  ;

SECTION .data
    msg: DB 'Введите строку: Тимофей Алексеев', 0h
    msgLen: EQU $-msg

SECTION .bss
    buf1: RESB 80

SECTION .text
    global _start
    _start:
        mov rax, msg
        call io_print_string  ; вместо sprintLF

        mov rcx, buf1
        mov rdx, 80

        call io_get_string    ; вместо sread

        call quit
