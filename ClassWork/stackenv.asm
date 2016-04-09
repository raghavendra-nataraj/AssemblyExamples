section .bss
	MAX equ 10
	stsz resd 1
	Args resd MAX
	Argl resd MAX
section .data
	msg : db "Error"
	ml equ $-msg
section .text
	global _start

_start:
	mov ebp,esp

	xor edx,edx
	mov ebx,[ebp]
	add ebx,1
Scan:
	mov ecx, 0000ffffh
	mov edi,dword [ebp + 4 + ebx*4]
	mov edx,edi
	cld
	repne scasb
	jnz Error
	mov byte [edi-1],10
	sub edi,edx
	mov dword [Argl + ebx*4],edi
	inc ebx
	cmp ebx,11
	jb Scan

	xor esi,esi
	mov esi,[ebp]
	add esi,1
Print:
	mov eax,4
	mov ebx,1
	mov ecx,[ebp + 4  + esi*4]
	mov edx,[Argl + esi*4]
	int 80h
	inc esi
	cmp esi,11
	jb Print
	jmp Done

Error:
	mov eax,4
	mov ebx,1
	mov ecx,msg
	mov edx,ml
	int 80h
		

Done:	mov eax,1
	mov ebx,0
	int 80h
