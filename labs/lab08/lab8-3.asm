%include 'in_out.asm'
SECTION .data
msg db "Результат: ", 0
SECTION .text
GLOBAL _start
_start:
pop ecx
pop edx
sub ecx, 1
mov esi, 1
next:
cmp ecx, 0h
jz _end
pop eax
call atoi
mul esi
mov esi, eax
loop next
_end:
mov eax, msg 
call sprint
mov eax, esi
call sprintLF
call quit
