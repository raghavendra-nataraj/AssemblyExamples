section .bss
section .data
	EatMsg : db "Today i has %d of %d %s",10,0
	Food : db "Chapathi",0
section .text

extern printf

global main
	
main:
	push ebp
	push ebx
	push esi
	push edi
	mov ebp,esp
	mov ecx,3
	push Food
	push 2
	push ecx
	push EatMsg
	call printf
	add esp,12
	
	mov esp,ebp
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
