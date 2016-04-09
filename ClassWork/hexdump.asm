section .data
	HEXSTR: db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
	HEXLEN equ $ - HEXSTR
	NL: db"",10
	NLL EQU $ - NL
	digits: db "0123456789ABCDEF" 

section .bss
	BUFFLEN: equ 16
	BUFF : resb BUFFLEN 
section .text
	global _start

_start:

Read:
	mov eax, 3
	mov ebx, 0
	mov ecx, BUFF
	mov edx, BUFFLEN
	int 80h
	
	mov ebp	,eax
	cmp eax,0
	je Done

	mov esi, BUFF
	mov edi, HEXSTR
	xor ecx,ecx
	
Scan:
	xor eax,eax

	mov edx,ecx
	shl edx,1
	add edx,ecx

	mov al , byte [esi+ecx]
	mov ebx,eax
	
	and al,0Fh
	mov al,byte [digits + eax]
	mov byte [HEXSTR + edx + 2],al
	
	shr bl,4
	mov bl,byte [digits + ebx]
	mov byte [HEXSTR + edx + 1],bl

	inc ecx
	cmp ecx , ebp
	jna Scan

	mov edx,ebp
	shl edx,1
	add edx,ebp

	mov eax,4
	mov ebx,1
	mov ecx,HEXSTR
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,NL
	mov edx,NLL
	int 80h

	jmp Read
	
	
	

Done:	
	mov eax , 1
	mov ebx ,0
	int 80h
