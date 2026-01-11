#! /usr/bin/bash

# Ensamblar sum.asm a código objeto 32 bits
as --32 --gstabs comparaciones.asm -o comparaciones.o

# Linkear a ejecutable de 32 bits
ld -m elf_i386 comparaciones.o -o comparaciones

# Ejecutar
./comparaciones