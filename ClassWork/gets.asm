section .bss
		msg resb 10 
section .data

section .text
extern fgets
extern stdin
extern puts
	global main
main:
	push dword [stdin]
	push 10
	push msg
	call fgets
	add esp,12

	push msg
	call puts
	add esp,12
	ret
