# assembly-play
Small explorations in assembly code

-----
### Folders

Different folders are just for different syntax or extensions of assembly. I expect to only be working with 64-bit, but I started with AT&T syntax for historical and comfort reasons (I kind of agree that `<cmd> <source>, <dest>` is a little more intuitive than the other way around like in nasm and whatnot).

If I'm going to do any actually interesting operations then I'll probably move to nasm or something in keeping with the times.

### Running

For att/ files, you just need gcc. I have been running `gcc -c <file>.s && ld <file>.o && ./a.out` on each file.

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
