section .bss
	msg resd 1	 
	msgstr resd 1
	timetm resd 9	 
section .data
	for1 : db "num = %s",10,0
	for2 : db "time = %d %d",10,0
section .text
extern time
extern ctime
extern localtime
extern printf
	global main
main:
	push dword 0
	call time
	add esp,4
	mov [msg],eax

	push msg
	call ctime
	add esp,4
	mov [msgstr],eax

	push msg
	call localtime
	add esp,4
	mov esi,eax
	mov edi,timetm
	mov ecx,9
	cld
	rep movsd


	push dword [msgstr]
	push for1
	call printf
	add esp,8

	mov edx, dword [timetm +20]
	add edx ,1900
	push edx
	push dword [timetm +12]
	push for2
	call printf
	add esp,12

	ret
