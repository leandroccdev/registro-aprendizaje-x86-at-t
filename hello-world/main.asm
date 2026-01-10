.intel_syntax noprefix
.section .data
    buffer: .asciz "Hello World!\n"
    # Resta la dirección actual representada por . respecto de buffer para
    # obtener su largo
    buffer_len = . - buffer

.section .text
.type _start, @function # declara que _start es una función
.global _start # Exporta el símbolo

_start:
    # Escribir stdout
    mov rax, 1          # syscall: sys_write (64 bits)
    mov rdi, 1          # stdout
    lea rsi, buffer     # Carga dirección del buffer
    mov rdx, buffer_len # Setea el largo
    syscall             # Llamada al sistema

    # Terminar programa
    mov rax, 60  # syscall: sys_exit (64 bits)
    xor rdi, rdi # Inicializa rbx a 0 (lo usa como exit code)
    syscall      # Llamada al sistema
