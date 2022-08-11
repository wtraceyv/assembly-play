# assembly-play
Small explorations in assembly code (on linux)

-----

### Running

In my `.zshrc` I wrote a function to automate this:
```bash
function gasm {
    if [[ $# -lt 1 ]]
    then
        echo "Supply a file of assembly"
        return
    fi

    gcc -c $1 -o inter.o
    ld inter.o
    rm inter.o
    ./a.out
}
```

This way you can just run `gasm <file.s>`, and if it fails it won't leave anything behind, but you will still see the assembler errors to fix.

Plus the command is kind of funny.

For nasm/:

```bash
function gnasm {
    if [[ $# -lt 1 ]]
    then
        echo "Supply a file of assembly"
        return
    fi

    nasm -f elf32 -g $1 -o inter.o
    ld -m elf_i386 -s -g inter.o
    rm inter.o
    ./a.out
}
```
