#! /usr/bin/bash

# Ensamblar sum.asm a código objeto 32 bits
as --32 --gstabs sum.asm -o sum.o

# Linkear a ejecutable de 32 bits
ld -m elf_i386 sum.o -o sum.bin

# Ejecutar
./sum.bin