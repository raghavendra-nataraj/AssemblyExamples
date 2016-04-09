section .bss
	buflen equ 1000
	buff resb 1000
section .text
	global _start

_start:
	
read : 
	mov eax,3
	mov ebx,0
	mov ecx,buff
	mov edx,buflen
	int 80h
	mov esi,eax
	cmp eax,0
	je exit
	
	mov ebp,buff
	mov ecx,esi

scan:
	cmp byte [ebp+ecx-1],61h
	jb next
	cmp byte [ebp+ecx-1],7Ah
	ja next
	sub byte [ebp+ecx-1], 20h
	
next:
	dec ecx
	jnz scan

write:
	mov eax,4
	mov ebx,1
	mov ecx,buff
	mov edx,esi
	int 80h
	jmp read

exit:
	mov eax,1
	mov ebx,0
	int 80h

	
