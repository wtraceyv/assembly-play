; https://www.youtube.com/watch?v=oeo-hKxsAMo&list=PL2EF13wm-hWCoj6tUBGUmrkJmH1972dBB&index=21

; include std c funcs you want
extern printf
extern exit

section .data
	msg dd "Hi from C.",0
	fmt db "C says: %s",10,0 ;10 is a new line (same as 0x0A)

section .text
global main ; of course gcc/C likes a main func
main:
	; C func accesses args only from the stack.
	; Since stack is LIFO, we have to PUSH to stack 
	; in reverse order that func wants.
	; So in printf(fmt, msg), push last arg first.
	push msg
	push fmt
	call printf

	push 1
	call exit

	; note that if the function returns something,
	; it will save the value at eax usually.

	; To use your own c function, the assembly is the same.
	; In the C, forward declare the function as extern also.
	; Then add your myfile.c to the link/gcc command when you compile.