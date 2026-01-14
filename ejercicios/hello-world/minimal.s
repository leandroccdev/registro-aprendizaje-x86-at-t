.intel_syntax noprefix
.section .data
    buffer: .asciz "Hola Mundo\n"
    buffer_len = . - buffer
.section .text
.global _start
_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, buffer
    mov rdx, buffer_len
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
    