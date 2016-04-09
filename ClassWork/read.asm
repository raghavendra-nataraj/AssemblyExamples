section .bss
	datas resb 20
section .data
	filename : db "test.txt",0
	filename1 : db "test1.txt",0
	for : db "%d,%s",0
	errormsg : db "Error",0
	reads : db "r",0
	writes : db "w",0
section .text
extern fopen
extern fgets
extern fprintf	
extern puts
global main

main:
	push ebp
	mov ebp,esp
	push ebx
	push esi
	push edi
	
	push reads
	push filename
	call fopen
	add esp,8
	cmp eax,0
	jz error 
	
	mov ebx,eax

	push writes
	push filename1
	call fopen
	add esp,8
	cmp eax,0
	jz error 
	
	mov esi,eax
	mov edi,1
red:
	push ebx
	push 20
	push datas
	call fgets
	add esp,12
	cmp eax,0
	jbe done
	push datas
	push edi
	push for
	push esi
	call fprintf
	inc edi
	add esp,16
	jmp red
		
		
error:
	push errormsg
	call puts
	add esp,4

done:
	pop edi
	pop esi
	pop ebx
	mov esp,ebp
	pop ebp
	ret
