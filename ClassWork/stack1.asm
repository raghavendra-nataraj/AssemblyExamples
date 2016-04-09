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
	;mov ebp,esp
	mov esi,[esp]
	;add esi,1
	mov dword [stsz],esi	
	;mov edx,stsz
	;add edx, 2
	;mov [stsz],edx
	;cmp ecx,MAX
	;ja Error
	
	xor edx,edx
SaveArgs:
	mov esi,[esp+4 + edx *4]
	mov dword [Args + edx*4],esi
	inc edx
	cmp edx,[stsz]
	jb SaveArgs

	xor eax,eax
	xor ebx,ebx
Scan:
	mov ecx, 0000ffffh
	mov edi,dword [Args + ebx*4]
	mov edx,edi
	cld
	repne scasb
	jnz Error
	mov byte [edi-1],10
	sub edi,edx
	mov dword [Argl + ebx*4],edi
	inc ebx
	cmp ebx,[stsz]
	jb Scan

	xor esi,esi
Print:
	mov eax,4
	mov ebx,1
	mov ecx,[Args  + esi*4]
	mov edx,[Argl + esi*4]
	int 80h
	inc esi
	cmp esi,[stsz]
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
