section .bss
section .data
	EatMsg : db "hello baby",0
section .text

extern puts

global main
	
main:
	push ebp
	push ebx
	push esi
	push edi
	mov ebp,esp


	push EatMsg
	call puts
	add esp,4
	
	mov esp,ebp
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
