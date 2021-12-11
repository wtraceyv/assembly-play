# syscalls: https://hackeradam.com/x86-64-linux-syscalls/
# at&t syntax: https://csiflabs.cs.ucdavis.edu/~ssdavis/50/att-syntax.htm

# gcc -c file.s && ld file.o && ./a.out

.global _start

.text

_start:
	mov $1, %rax            # system call 1 is write
	mov $2, %rdi            # file handler 2 is stderr 
	mov $message, %rsi      # address of string to output
	mov $length, %rdx           # number of bytes
	syscall

	# exit(0)
	mov $60, %rax           # system call 60 is exit
	xor %rdi, %rdi          # we want to return code 0
	syscall

message:
	.ascii "how doth it fare\n"
	length = . - message

