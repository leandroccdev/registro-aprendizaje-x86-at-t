.section .data
    a: .long 10 # variable a
    b: .long 20 # variable 20
    array: # arreglo de elementos de 32 bits (4 bytas c/u)
        .long 11 # offset 0
        .long 22 # offset 4
        .long 33 # offset 8
        .long 44 # offset 12
    # se han reservado 12 bytes en la estructura array

.section .text
    .globl _start # Punto de entrada

_start:
    # Cargar variables en registros
    movl a, %eax # carga var a en eax
    movl b, %ebx # carga var b en ebx

    # Direccionamientos de memoria

    # Inmediato
    movl $20, %ecx # carga el inmediato 20 en ecx

    # Registro
    movl %ecx, %edx # carga el contenido de %ecx en edx

    # Directo
    movl array, %eax # carga el contenido de array

    # crea un puntero a la var a para el redireccionamiento indirecto
    movl $a, %ebx # carga la dirección de la var a en ebx
    # Indirecto
    movl (%ebx), %ecx # cara el valor apuntado por ebx en ecx

    # Con desplazamiento
    movl $array, %eax # carga la dirección de array en eax
    movl 0(%eax), %ebx # carga array[0] en ebx
    movl 4(%eax), %ebx # carga array[1] en ebx
    movl 8(%eax), %ebx # carga array[2] en ebx
    movl 12(%eax), %ebx # carga array[3] en ebx

    # Modo indexado con escala y desplazamiento
    movl $0, %ecx # carga el índice para el acceso a array[0]
    movl 0(%eax, %ecx, 4), %ebx # carga array[%ecx] en ebx
    movl $1, %ecx # i = 1 para array[1]
    movl 0(%eax, %ecx, 4), %ebx # carga array[%ecx] en ebx
    movl $2, %ecx # i = 2 para array[2]
    movl 0(%eax, %ecx, 4), %ebx # carga array[%ecx] en ebx
    movl $3, %ecx # i = 3 para array[3]
    movl 0(%eax, %ecx, 4), %ebx # carga array[%ecx] en ebx
    # Error, se leería mas allá de la estructura
    # Mientras la región de memoria no esté protegida, no saldría un
    # error de violación de segmento de memoria.
    # movl $4, %ecx # i = 3 para array[4]
    # movl 0(%eax, %ecx, 4), %ebx # carga array[%ecx] en ebx

    # Direccionamiento segmentado
    # en linux no es necesario configurar %fs, el SO lo configura
    # directo al LTS/GDT
    # en distros modernas apunta directamente a un segmento TLS
    # (Thread Local Storage)
    #movl %gs:0x0, %edx # copia 4 bytes desde %fs:0x0 en edx
    # el kernel deja a %fs apuntando a una región segura

    # salida
    movl $1, %eax   # syscal 1 (sys_exit)
    # Se espera un registro de 32 bits como EAX
    xorl %ebx, %ebx # Arg 1: exit code = 0
    int $0x80
