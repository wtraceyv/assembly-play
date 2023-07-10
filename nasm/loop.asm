; Initialized data
section .data
	startMessage: 	db 'Start...', 0
	startLen:		equ $-startMessage
	endMessage: 	db '...Done.', 0
	endLen:			equ $-endMessage
	testMessage:	db 'Printed!', 0
	testLen:		equ $-testMessage

	loopCount:		dd 10 ; how many loops to do

	; https://gist.github.com/Gydo194/730c1775f1e05fdca6e9b0c175636f5b
	; ASCII 10, linebreak
	linebreak	db 0x0A

; Uninitialized data
section .bss

; Main code
section .text
global _start
_start:
	; say hi
	mov eax, 4
	mov ebx, 1
	mov ecx, startMessage
	mov edx, startLen
	int 0x80

	call print_break

	; run loop
	call main_loop

	; say bye
	mov eax, 4
	mov ebx, 1
	mov ecx, endMessage
	mov edx, endLen
	int 0x80

	call print_break

	call exit

main_loop:
	mov eax, 4
	mov ebx, 1
	mov ecx, testMessage
	mov edx, testLen
	int 0x80

	call print_break

	mov esi, [loopCount]
	dec esi
	mov [loopCount], esi
	jnz main_loop

	ret

; helper for line breaks
print_break:
	mov eax, 4
	mov ebx, 1
	mov ecx, linebreak
	mov edx, 1
	int 0x80
	ret

; helper to exit
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80

