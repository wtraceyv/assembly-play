#!/bin/bash

if [[ $# -lt 1 ]]
then
	echo "Supply a file of assembly."
	exit
fi

# notice unlike my gnasm function in zshrc,
# we compile with gcc which will link std for us I guess.
nasm -f elf -g $1 -o inter.o
gcc -no-pie -m32 inter.o -o a.out
rm inter.o
./a.out