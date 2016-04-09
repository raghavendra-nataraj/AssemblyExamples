section .bss
section .data
	msg : db "Ragha",10
	msglen equ $-msg
%include "macro.mac"
section .text
	global _start
_start:
	printr 4,1,msg,msglen

	mov eax,1
	mov ebx,0
	int 80h
