.intel_syntax noprefix
.section .data
    # Variables de 16 bits
    a: .short 10 # var a
    b: .short 5  # var b
    c: .short 0  # var c

    buffer: .asciz "Resultado: XX\n" # XX será reemplazado por el resultado 
    # Resta la dirección actual representada por . respecto de buffer para
    # obtener su largo
    buffer_len = . - buffer

.section .text
.global _start
.type _start, @function # declara que _start es una función
.global _start # Exporta el símbolo

_start:
    # Usa registros de 16 bits por el tamaño de los nros
    mov ax, [a]  # Carga a en AX
    mov bx, [b]  # Carga b en BX
    add ax, bx   # Realiza la suma de a y b
    mov [c], ax  # Guarda el resultado en c (15)

    # Limpieza
    xor ax, ax # Limpia AX antes de realizar la división
    # El resultado se guardará en AH y AL 
    xor bx, bx

    # Convierte la decena a ascii dividiéndolo por 10
    mov al, [c]
    mov bl, 10
    div bl      # AX / 10
                # AL = cociente (decena); AH = resto (unidad)
    # La conversión ascii se realiza sumando '0'
    add al, '0'
    add ah, '0'

    # Escribe el resultado en la var buffer
    lea rdi, [buffer + 11] # Puntero al primer espacio X
    mov [rdi], al    # Escribe la decena
    mov [rdi+1], ah  # Escribe la unidad

    # Limpieza
    xor eax,eax # Limpia al, ah eax, y rax
    xor rdi, rdi

    # Escribir stdout
    mov rax, 1          # syscall: sys_write (64 bits)
    mov rdi, 1          # stdout
    lea rsi, buffer     # Carga dirección del buffer
    mov rdx, buffer_len # Setea el largo
    syscall             # Llamada al sistema

    # Limpieza
    xor rax, rax
    xor rdi, rdi
    xor rsi, rsi
    xor rdx, rdx

    # Terminar programa
    mov rax, 60  # syscall: sys_exit (64 bits)
    xor rdi, rdi # Inicializa rdi a 0 (lo usa como exit code)
    syscall      # Llamada al sistema

    # Limpieza
    xor rax, rax
    xor rdi, rdi
