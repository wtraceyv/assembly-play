global _start

; Initialized data !
; Not intended to change at runtime.
section .data
	toread: db 'toread.txt',0
	len equ 1024

; Declaring variables - uninitialized
section .bss
	descriptor resb 4
	content: resb 1024

; Actual code
section .text
	_start:

	; open
	mov eax, 5
	mov ebx, toread
	mov ecx, 0
	mov edx, 0777
	int 0x80

	; read?
	mov eax, 3
	mov ebx, eax 
	mov ecx, content
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, content
	mov edx, len
	int 0x80

	mov eax, 6
	mov ebx, [descriptor]
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80

