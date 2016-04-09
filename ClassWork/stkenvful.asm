section .bss
section .data
	msg : db "Error"
	ml equ $-msg
section .text
	global _start

%macro print 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

_start:
	mov ebp,esp

	xor edx,edx
	mov ebx,[ebp]
	add ebx,1
Scan:
	mov ecx, 0000ffffh
	mov edi,dword [ebp + 4 + ebx*4]
	mov edx,edi
	cmp edx,00000000h
	jz Done
	cld
	repne scasb
	jnz Error
	mov byte [edi-1],10
	sub edi,edx
	push eax
	push ebx
	push ecx
	push edx
	print edx,edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	inc ebx
	jmp Scan

Error:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,ml
	int 80h
		

Done:	mov eax,1
	mov ebx,0
	int 80h
