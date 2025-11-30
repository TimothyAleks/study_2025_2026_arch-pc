%include 'in_out.asm'
SECTION .data
msg1 db 'Введите N: ', 0h
SECTION .bss
N: resb 10
SECTION .text
GLOBAL _start
_start:
mov eax, msg1
call sprint
mov ecx, N
mov edx, 10
call spread
mov eax, N
call atoi
mov [N], eax
mov ecx, [N]
label:
push ecx
sub ecx, 1
mov [N], ecx
mov eax, [N]
call iprintLF
pop ecx
loop label
call quit
