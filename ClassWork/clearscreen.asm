section .bss
section .data
	MSG : db "Ragha",10
	MSGLEN equ $-MSG
	CLEAR : db 27,"[2J"
	CLEARLEN equ $-CLEAR
	POS : db 27,"[01;01H"
	POSLEN equ $-POS
	DIGITS: db "0001020304050607080910111213141516171819"
		db "2021222324252627282930313233343536373839"
		db "4041424344454647484950515253545556575859"
		db "606162636465666768697071727374757677787980"

section .text
	global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,MSG
	mov edx,MSGLEN
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,CLEAR
	mov edx,CLEARLEN
	int 80h

	xor eax,eax
	mov al,20
	mov cx, word [DIGITS+eax*2]
	mov word [POS+2],cx
	
	xor eax,eax
	mov al,20
	mov cx, word [DIGITS+eax*2]
	mov word [POS+5],cx
	
	mov eax,4
	mov ebx,1
	mov ecx,POS
	mov edx,POSLEN
	int 80h
 
	mov eax,4
	mov ebx,1
	mov ecx,MSG
	mov edx,MSGLEN
	int 80h


	mov eax,1
	mov ebx,0
	int 80h



