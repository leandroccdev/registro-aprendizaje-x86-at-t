#! /usr/bin/bash

# Ensamblar sum.asm a código objeto 32 bits
as --32 --gstabs direccionamientos.asm -o direccionamientos.o

# Linkear a ejecutable de 32 bits
ld -m elf_i386 direccionamientos.o -o direccionamientos.bin

# Ejecutar
./direccionamientos.bin