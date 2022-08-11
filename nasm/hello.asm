; https://en.m.wikibooks.org/wiki/X86_Assembly/NASM_Syntax

global _start

section .data
	; not sure what this is about exactly
	align 2
	str:		db 'What the heck is up, my dude?',0xa
	strLen:	equ $-str

section .bss

section .text
	_start:

	mov edx, strLen
	mov ecx, str
	mov ebx, 1
	mov eax, 4
	int 0x80

	mov ebx, 0
	mov eax, 1
	int 0x80
