.intel_syntax noprefix
.section .rodata
    # Constantes
    END_SEQUENCE = 100
    N = 3

.section .data
    # Variables
    # Fila con texto a imprimir alineada a 14 caracteres
    row: .ascii "  \n"
    # Largo de la fila
    row_len = . - row
    bout_len = row_len * END_SEQUENCE
    # Puntero al inicio de bout
    bout_ptr: .quad bout

.section .bss
    # Buffer para almacenar output completo
    bout: .skip bout_len

.section .text
# ----------------------------------------------------------
# Descripción:
# 
# Imprime los múltiplos de 3 desde 0 hasta END_SEQUENCEs
# ----------------------------------------------------------
.global _start
.type _start, @function
_start:
    # Sección de inicialización de la función
    # ------------------------------------------------------
    xor r12, r12 # inicializa contador
    # ------------------------------------------------------

    _s_loop:
        # Repite mientras r12 <= END_SEQUENCE
        cmp r12, END_SEQUENCE
        ja _s_end_loop

        # Convierte R12 a string y lo copia row
        # --------------------------------------------------
        mov rdi, r12
        lea rsi, [row + 1]
        call cp_ui8_as_ascii_into_strb
        # --------------------------------------------------

        # Copia row en bout
        # --------------------------------------------------
        # Calcula offset de bout
        # (usa imul en su forma con 3 operandos)
        imul rax, r12, row_len
        lea rsi, [row]
        lea rdi, [bout + rax]
        mov rcx, row_len
        cld
        rep movsb
        # --------------------------------------------------

        # Limpieza del buffer temporal
        # --------------------------------------------------
        lea rax, row
        mov byte ptr [rax], ' '
        mov byte ptr [rax + 1], ' '
        # --------------------------------------------------

        # Avanza al siguiente múltiplo de N
        add r12, N
        jmp _s_loop
    
    _s_end_loop:
    
    # Imprime bout
    # ------------------------------------------------------
    mov rax, 1
    mov rdi, 1
    lea rsi, [bout]
    mov rdx, bout_len
    syscall
    # ------------------------------------------------------

    # Termina el programa
    # ------------------------------------------------------
    mov rax, 60  # sys_exit (64 bits)
    xor rdi, rdi # Exit code 0
    syscall
    # ------------------------------------------------------
.size _start, . - _start

# ----------------------------------------------------------
# Descripción
#
# Convierte un entero unsigend de 8 bits a ascii y lo
# escribe en un buffer apuntado por RSI.
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
