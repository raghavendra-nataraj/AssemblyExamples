section .bss
section .data
	for : db "%d",10,0
	for1 : db "%s",10,0
section .text
extern printf
	global main
main:
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi

	push dword [esp+20]
	;push dword [ebp+8]
	push for
	call printf
	add esp,8
	
	xor esi,esi
lop:
	mov ebx, dword [esp+24]
	;mov ebx, dword [ebp+12]
	push dword [ebx + esi*4]
	push for1
	call printf
	add esp,8
	inc esi
	cmp [esp+20],esi
	;cmp [ebp+8],esi
	jnz lop

	xor esi,esi
lop1:
	mov ebx, dword [esp+28]
	;mov ebx, dword [ebp+12]
	mov edi,[ebx + esi*4]
	cmp edi,00000000h
	jz Exit
	push edi
	push for1
	call printf
	add esp,8
	inc esi
	jmp lop1

Exit:
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	ret
	
