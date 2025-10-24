section .data
    msg db "Hello World!", 0xa

section .text
    global _start

_start:
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, msg
    mov rdx, 14
    syscall

    mov rax, 0x2000001
    mov rdi, 0
    syscall



