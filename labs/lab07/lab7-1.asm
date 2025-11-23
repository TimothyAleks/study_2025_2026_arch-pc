%include 'in_out.asm'

SECTION .data
msg1: DB 'Сообщение №', 0
msg2: DB 'Сообщение №2',0
msg3: DB 'Сообщение №', 0

SECTION .text
GLOBAL _start
_start:

jmp_label3

_label1:
mov eax, msg1
call sprintLF
jmp _end

_label2:
mov eax, msg2
call sprintLF
jmp_label1

_label3:
mov eax, msg3
call sprintLF
jmp _label2

_end:
call quit 
