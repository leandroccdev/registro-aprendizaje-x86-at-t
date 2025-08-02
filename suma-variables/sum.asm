.section .data
    a: .int 10         # variable a
    b: .int 5          # Variable b
    c: .int 0          # Variable c: almacena el resultado

    buffer: .space 12
    newline: .asciz "\n"

.section .text
    .globl _start      # Punto de entrada

_start:
    movl a, %eax       # Carga var a en eax
    movl b, %ebx       # Carga var b en ebx
    addl %eax, %ecx    # Suma registro eax en ecx
    addl %ebx, %ecx    # Suma registro ebx en ecx
    movl %ecx, c       # Asigna valor del registro ecx en var c
    movl %ecx, c

    # Terminar programa
    # Para ver mas syscalls: https://syscalls.w3challs.com/
    # Linux x86: https://syscalls.w3challs.com/?arch=x86
    movl $1, %eax      # syscall para 32 bits; 1: exit
    xorl %ebx, %ebx    # Código de salida: 0
    int $0x80          # Llamada al sistema
