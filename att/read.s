.global _start

# presumably getting info about file i want
.data
	name: .string "nothing.txt"
	fd: .int 0
	buf: .string "0" # not sure what this is for
	filelength: .long 512
.text

test_text:
	.ascii "this is test\n"
	length = . - test_text

_start:
	# test text
#	mov $1, %rax
#	mov $2, %rdi
#	mov $test_text, %rsi
#	mov $length, %rdx
#	syscall
	
	# sys_open
	mov $2, %rax
	mov $name, %rdi
	mov $0, %rsi
	mov $0777, %rdx
	syscall

	mov %rax, %rdi # sys_open puts returns fd via rax if successful -> sys_read wants this in %rdi 
	# sys_read
	mov $0, %rax
	mov $buf, %rsi
	mov $filelength, %rdx
	syscall

	# close file
	mov $3, %rax
	pop %rdi # popping file descriptor
	syscall

	# trying to print out file
	mov $1, %rax
	mov $2, %rdi
	mov $buf, %rsi
	mov $19, %rdx
	syscall

	# exit
	mov $60, %rax
	xor %rdi, %rdi
	syscall 

