section .data
	msg : db "r"
	ml equ $-msg
section .bss
	res resb 1
section .text
	global _start
_start:


mov al,'1'
add al,'1'
aaa
add ax,3030h

mov [res], eax


mov ecx,res
mov eax , 4
mov ebx , 1
mov edx , 1
int 80h

mov eax , 1
mov ebx, 0
int 80h
