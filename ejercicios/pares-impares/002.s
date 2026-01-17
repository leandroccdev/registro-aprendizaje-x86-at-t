.intel_syntax noprefix
.section .data
    END_SEQUENCE = 100
    # Alinea ambos buffers a 14 bytes para usar movsw cuando
    # son copiados a bout
    txt_par:   .ascii "    es par   \n"
    txt_impar: .ascii "    es impar \ns"
    # Como ambos buffers están alineados, se almacena el
    # largo de solo uno de ellos
    txt_len = . - txt_impar
    bout_len = txt_len * END_SEQUENCE
        # Puntero al inicio de bout
    bout_ptr: .quad bout

.section .bss
    # Buffer para almacenar output completo
    bout: .skip bout_len

.section .text

# ----------------------------------------------------------
# Descripción:
#
# Imprime una secuencia de 101 elementos (0 a 100),
# indicando que número es par/impar. Utilizando una única
# llamada a sys_write.
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
    xor r12, r12
    # ------------------------------------------------------

    # ------------------------------------------------------
    _s_print_loop:
        # Verifica si el número es par
        # Par: LSB(r12) = 0
        # Impar: LSB(r12) = 1
        test r12, 1
        # Salta al procesado del nro. impar
        jnz _s_cp_odd_number
        # Continua al procesado del nro. par

        # Copia un número par
        # --------------------------------------------------
        _s_cp_even_number:
            mov rdi, r12           # Primer parámetro
            lea rsi, [txt_par + 2] # Segundo parámetro
            call cp_ui8_as_ascii_into_strb

            # Copia txt_par en bout en pares de bytes
            lea rsi, [txt_par]
            mov rdi, [bout_ptr]
            # txt_len es constante, no se usa []
            mov rcx, txt_len / 2
            cld
            rep movsw
            # Reapunta bout_ptr al final de la concatenación
            mov [bout_ptr], rdi

            jmp _s_next_iteration

        # Imprime un número impar
        # --------------------------------------------------
        _s_cp_odd_number:
            mov rdi, r12             # Primer parámetro
            lea rsi, [txt_impar + 2] # Segundo parámetro
            call cp_ui8_as_ascii_into_strb

            # Copia txt_impar en bout en pares de bytes
            lea rsi, [txt_impar]
            # bout_ptr es un puntero, aplica []
            mov rdi, [bout_ptr]
            # txt_len es constante, no se usa []
            mov rcx, txt_len / 2
            cld
            rep movsw
            # Reapunta bout_ptr al final de la concatenación
            mov [bout_ptr], rdi

            jmp _s_next_iteration

    # Retorno desde las etiquetas anteriores
    _s_next_iteration:

    inc r12 # i++
    # Repite secuencia si i <= 100 (unsigned)
    cmp r12, END_SEQUENCE
    jbe _s_print_loop
    # ------------------------------------------------------

    # Llamada a sys_write para salida por stdout
    # ------------------------------------------------------
    mov rax, 1 # sys_write
    mov rdi, 1 # stdout
    lea rsi, [bout] # Puntero al buffer que se imprimirá
    # bout_len es una constante, no se usa []
    mov rdx, bout_len # Cantidad de bytes a imprimir
    syscall

    # Termina el programa
    # ------------------------------------------------------
    mov rax, 60  # sys_exit (64 bits)
    xor rdi, rdi # Exit code 0
    syscall
    # ------------------------------------------------------
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
    ret
.size cp_ui8_as_ascii_into_strb, .-cp_ui8_as_ascii_into_strb
