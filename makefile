sample:sample.o
	ld -o sample sample.o

%o:%asm
	nasm -f elf64 -g -F stabs sample.asm