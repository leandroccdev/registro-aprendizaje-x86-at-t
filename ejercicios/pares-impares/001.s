.intel_syntax noprefix
.section .data
    txt_par:   .asciz "    es par\n"
    txt_par_len = . - txt_par
    txt_impar: .asciz "    es impar\n"
    txt_impar_len = . - txt_impar

.section .text

# ----------------------------------------------------------
# Descripción:
#
# Imprime una secuencia de 101 elementos (0 a 100),
# indicando que número es par/impar.
#
# Entrada
# - Ninguna (usa registros internos)
#
# Registros modificados
# - R12: contador de 0 a 100
#
# Flags modificados:
# - Todos
#
# ----------------------------------------------------------
.global _start
.type _start, @function
_start:
    # Sección de inicialización de la función
    # ------------------------------------------------------
    mov r12, 0
    # ------------------------------------------------------

    # ------------------------------------------------------
    _s_print_loop:
        # Verifica si el número es par
        # Par: LSB(r12) = 0
        # Impar: LSB(r12) = 1
        test r12, 1
        jz _s_print_even_number
        jmp _s_print_odd_number

        # Retorno desde las etiquetas anteriores
        _s_continue:

        inc r12 # i++
        # Repite secuencia si i <= 100 (unsigned)
        cmp r12, 100
        jbe _s_print_loop
    # ------------------------------------------------------

    # Termina el programa
    # ------------------------------------------------------
    mov rax, 60  # sys_exit (64 bits)
    xor rdi, rdi # Exit code 0
    syscall
    # ------------------------------------------------------

    # Imprime un número par y vuelve _ps_continue
    # ------------------------------------------------------
    _s_print_even_number:
        mov rdi, r12           # Primer parámetro
        lea rsi, [txt_par + 2] # Segundo parámetro
        call cp_ui8_as_ascii_into_strb

        # Envía txt_par a stdout
        lea rsi, [txt_par]   # Inicio del buffer
        mov rdx, txt_par_len # Largo del buffer
        jmp _s_to_stdout

    # Imprime un número impar y vuelve a _ps_continue
    # ------------------------------------------------------
    _s_print_odd_number:
        mov rdi, r12             # Primer parámetro
        lea rsi, [txt_impar + 2] # Segundo parámetro
        call cp_ui8_as_ascii_into_strb

        # Envía txt_impar a stdout
        lea rsi, [txt_impar]   # Inicio del buffer
        mov rdx, txt_impar_len # Largo del buffer
        jmp _s_to_stdout

    
    # Llamada a sys_write para salida por stdout
    # ------------------------------------------------------
    _s_to_stdout:
        mov rax, 1 # sys_write
        mov rdi, 1 # stdout
        # rsi debe estar precargado
        # rdx debe estar precargado
        syscall

        # Vuelve al punto de retorno
        jmp _s_continue
.size _start, .-_start

# ----------------------------------------------------------
# Descripción
#
# Convierte un entero unsigend de 8 bits a ascii
#
# Entrada
# - RDI: Entero a convertir
# - RSI: Dirección de inicio del string en donde se debería
#   empezar a escribir.
#   RSI se va decrementando porque RDI se convierte de 
#   derecha a izquierda como decimal.
# ----------------------------------------------------------
.global cp_ui8_as_ascii_into_strb
.type cp_ui8_as_ascii_into_strb, @function
cp_ui8_as_ascii_into_strb:
    # Prólogo de la función
    # ------------------------------------------------------
    push rbp
    mov rbp, rsp
    # ------------------------------------------------------

    # Limpia porción de memoria en donde se escribe el uint8
    # ------------------------------------------------------
    # buffer: [0:' ', 1:' ', 2:' ', 3:' ', 4:'e', 5:'s'...]
    # RSI viene en el índice 2
    mov byte ptr [rsi], ' '     # Limpia pos 2 
    mov byte ptr [rsi - 1], ' ' # Limpia pos 1
    mov byte ptr [rsi - 2], ' ' # Limpia pos 0
    # ------------------------------------------------------

    # Mientras rdi > 0 (do-while)
    # El entero se escribe de derecha a izquierda, es decir
    # de unidades a centenas.
    # ------------------------------------------------------
    _cuaais_loop:
        # RDX:RAX
        xor rdx, rdx # Limpia RDX (parte alta del dividendo)
        mov rax, rdi # Carga el dividendo (en la parte baja)
        mov r8, 10  # Carga el divisor

        # Usa R8 para evitar cumplir con calle-saved
        div r8 # rdi / 10
        # RAX: cociente
        # RDX: resto (dígito a convertir)

        add rdx, '0' # Convierte rax en ascii
        # Copia el digito en el buffer escribiendo 8 bits
        mov [rsi], dl

        # Mueve el puntero al byte anterior del buffer
        dec rsi

        # Actualiza rdi con el cociente
        mov rdi, rax
        # Continua la iteración mientras rdi > 0
        cmp rdi, 0
        ja _cuaais_loop
    # ------------------------------------------------------

    # Epílogo de la función
    # ------------------------------------------------------
    mov rsp, rbp
    pop rbp
    # ------------------------------------------------------
    ret
.size cp_ui8_as_ascii_into_strb, .-cp_ui8_as_ascii_into_strb
