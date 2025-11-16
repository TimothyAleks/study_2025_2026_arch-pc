; in_out_mac.asm — утилиты для macOS (64-bit)
SECTION .text

; --- sprintLF: вывод строки с переводом строки ---
; Аргумент: rdi = адрес строки (с нулевым завершением)
sprintLF:
    push rdi
    call strlen
    mov rdx, rax        ; длина строки
    mov rax, 0x2000004  ; syscall write (macOS)
    mov rdi, 1          ; stdout
    syscall
    mov rax, 0x2000004  ; write снова для \n
    mov rsi, 0xa        ; символ \n
    mov rdx, 1
    syscall
    pop rdi
    ret

; --- iprintLF: вывод числа с переводом строки ---
; Аргумент: rdi = число
iprintLF:
    push rdi
    call iprint
    mov rax, 0x2000004
    mov rdi, 1
    mov rsi, 0xa
    mov rdx, 1
    syscall
    pop rdi
    ret

; --- iprint: вывод числа (десятичного) ---
iprint:
    push rbx
    push rcx
    push rdx
    push rax
    mov rbx, 10
    xor rcx, rcx

    ; Разделение числа на цифры
    .loop:
        xor rdx, rdx
        div rbx
        add rdx, '0'
        push rdx
        inc rcx
        test rax, rax
        jnz .loop

    ; Вывод цифр в обратном порядке
    .print:
        pop rdx
        mov rax, 0x2000004
        mov rdi, 1
        mov rsi, rdx
        mov rdx, 1
        syscall
        loop .print

    pop rax
    pop rdx
    pop rcx
    pop rbx
    ret

; --- strlen: вычисление длины строки ---
; Аргумент: rdi = адрес строки
; Результат: rax = длина
strlen:
    xor rax, rax
    .loop:
        cmp byte [rdi + rax], 0
        je .done
        inc rax
        jmp .loop
    .done:
        ret

; --- quit: завершение программы ---
quit:
    mov rax, 0x2000001  ; syscall exit
    mov rdi, 0
    syscall
