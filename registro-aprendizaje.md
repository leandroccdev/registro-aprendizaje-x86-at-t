# ASM X86 - Registro de aprendizaje (con sintaxis AT&T e Intel)

**Nota**
La presente es una guía que voy elaborando en el tiempo. Me baso en todos los recursos disponibles que tengo a mano (internet, IA, libros, vídeos, etc). Por lo que (y dado que no soy experto en el área), podría ser inexacta y tener conceptos errados.
No pretende ser una guía manual para aprender x86, mas bien es una forma de documentación de mi aprendizaje.

**Propósito**
- Asimilar conocimientos durante la creación.
- Ser una ayuda de memoria a modo de torpedo de consula rápida.
- Organizar el conocimiento en de una menera en lo pueda entender mas fácilmente a como lo explican los expertos.

### Sintaxis

- **AT&T**: Usada en sistemas GNU/Linux y GDB.
- **Intel**: Usada en Windows (Masm/Nasm). (Es mas cercana a la documentación oficial).

### Software Ensamblador

#### NASM (Netwide Assembler)

**Web:** https://nasm.us
**Documentación:** https://nasm.us/doc
**Sintaxis:** Intel
**Arquitecturas:**

- x86 (IA-32, 32 bits)
- x86-64 (AMD64 / Intel 64, 64 bits)

**Plataformas:** Linux, Windows, DOS
**Formatos binarios:** ELF, COFF, PE, bin
**Licencia:** Open Source
**Instrucciones:** soportadas por CPU objetivo
**Modos de operación:**

- Modo binario plano (.bin) para bootloaders o BIOS
- Modo ELF, COFF, Mach-O y Win32/Win64 OBJ

#### MASM (Microsoft Macro Assember)

**Sintaxis:** Intel
**Arquitecturas:**
- x86 (16 y 32 bits)
- x86-64 (64 bits)

**Soporte para macro sintaxis enriquecida:** Sí
**Plataformas:** Windows
**Formatos binarios:** .EXE, .DLL, .SYS (drivers), .COM (modo real 16 bits y modo manual)
**Licencia:** Comercial de Microsoft, pero gratuito como parte de Windows SDK, Visual Studio y Drivers DDK/WDK
**Modos de operación:**
- Real Mode 16 bits
- Protected Mode 32 bits
- Long Mode 64 bits
- Virtual 8086 16 bits (indirectamente)

**Modos de memoria 16/32 bits:** .tiny, .small, .compact, .flat, .huge

#### GAS (GNU Assembler)

**Web:** https://sourceware.org/binutils/
**Documentación:** https://sourceware.org/binutils/docs/
**Paquete:** binutils
**Sintaxis:** AT&T e Intel
**Arquitecturas:**
- x86
- x86_64
- ARM
- RISC-V
- MISP

**Licencia:** GPL

**Plataformas:**
- Linux
- Windows
- Mac OS
- BSD
- Solaris
- AIX
- RTOS
- Otros

**Modos de operación:**
- Real Mode 16 bits
- Protected Mode 32 bits
- Long Mode 64 bits

**Modos de memoria:** determinado por la arquitectura

#### FASM (Flat Assembler)

**Web oficial:** https://flatassembler.net
**Documentación:** https://flatassembler.net/docs.php
**Sintaxis:** Intel-like (propia de FASM)
**Plataformas:**
- Linux
- Windows
- DOS (16 bits y DPMI)
- BSD
- Mac OS

**Arquitecturas:**
- x86 (IA-32, 16 y 32 bits)
- x86-64 (AMD64 / Intel 64, 64 bits)

**Licencia:**: Propietaria (distribuído con Turbo C++, Turbo Pascal y otros software de Borland)
**Licencia:** Libre Open Source
**Formatos binarios:**
- [mz](https://en.wikipedia.org/wiki/DOS_MZ_executable) (ejecutables DOS .COM, .EXEC)
- [PE](https://learn.microsoft.com/en-us/windows/win32/debug/pe-format) y PE64 (Win32/64)
- [ELF](https://en.wikipedia.org/wiki/Executable_and_Linkable_Format)
- [COFF](https://wiki.osdev.org/COFF)
- [MACH-O](https://en.wikipedia.org/wiki/Mach-O)

**Modos de operación:**
- Real mode 16 bits
- Protected mode 32 bits
- Long Mode 64 bits
- Flat binary mode (.bin files)


#### TASM (Turbo Assembler)

**Web:** https://sourceforge.net/projects/guitasm8086/
**Documentación (1990):** https://archive.org/details/bitsavers_borlandturemblerVersion2.0UsersGuide1990_17919335
**Sintaxis:** intel
**Arquitecturas:**
- x86 16/32 bits

**Plataformas:**
- DOS
- Windows hasta XP

**Formatos binarios:**
- .COM (DOS 16 bits)
- .EXEC
- OBJ

**Modos de operación:**
- Real Mode (DOS 16 bits)
- Protected mode (32 bits)
- Ideal mode (versión mas flexible que MSM)

### Extensiones para VSC

- ASM Code Lens
> ID: `tintinweb.vscode-inline-asm`
> Muestra documentación en línea para instrucciones x86 (hover + docs)

- x86 and x86_64 Assembly (sintaxis y resaltado)
> ID: `13xforever.language-x86-64-assembly`
> Soporta NASM, MASM y GAS (AT&T)
> Muy buen resaltado para Intel y AT&T
> Autoidentación básica

- Assembly (by zenk security)
> ID `zenk.security.assembly`
> Buen soporte para resaltar instrucciones en Intel syntax (MASM, FASM)

- NASM x86-64 Support
> Usa tareas de VSCode (tasks.json) para compilar automáticamente con nasm y ld

- Depuración con GDB (modo Linux)
> ID `ms-vscode.cpptools`
> Permite configurar launch.json para depurar binarios de ensamblador con GDB

### Modos de operación

Los modos de operación definen como el procesador accede a la memoria, los registros y cómo interpreta el código máquina.

Dependiendo del modo, el procesador cambia su forma de trabajar: cambia el tamaño de los registros, el tamaño de las direcciones, la forma en que se protegen las áreas de memoria, etc.

#### Real Mode (Modo Real)

Es el modo original del CPU intel [8086](https://en.wikipedia.org/wiki/Intel_8086) que funcionaba con 16 bits, está presente en todos los procesadores x86. Fué el primer modo diseñado que fue usado por muchos sistemas operativos antes del nacimiento del modo protegido (Protected Mode).

[Descripción del modo (en inglés)](http://wiki.osdev.org/Real_Mode)

#### Modo Protegido (Protected Mode)

Fué introducido en el intel [80286](https://es.wikipedia.org/wiki/Intel_80286)/[80386](https://es.wikipedia.org/wiki/Intel_80386). Éste modo permite multitarea, memoria protegida y segmentación avanzada. Funciona con 32 bits. Es el modo predominando en todos los procesadores de 32 bits (en la era de Windows XP). Permite un máximo de 4GB de memoria ram direccionable.

[Descripción del modo protegido (en inglés)](https://wiki.osdev.org/Protected_Mode)

#### Modo Largo (Long Mode)

Fué introducido con AMD64. Soporta registros de 64 bits, memoria plana y no usa segmentación (a diferencia de x86 en 16 bits, no necesita segmentar la memoria en bloques). Además soporta más de 4GB de memoria RAM.

[Descripción del modo largo (en inglés)](https://wiki.osdev.org/X86-64#Long_Mode)

#### Modo virtual 8086 (Virtual Mode 8086)

Emula el modo real dentro del modo protegido. Es usado para ejecutar programas DOS en Windows antiguos.

#### Modo compatibilidad (Compatibility Mode 16/32 bits)

Permite ejecutar código de 16/32 bits en un sistema de 64 bits.

### Compatibilidad de Sistemas Operativos con Modos de operación

- DOS: usa modo real con instrucciones de 16 bits
- Windows 9x/Me: usa modo protegido con herencia para instrucciones de 16 bits
- Windows NT/XP/7/10/11 y Linux modernos: usan modo protegido o long mode
- Sistemas de 64 bits modernos: usan modo long x86-64

## Tamaño de datos comunes en x86

| Nombre   | Tamaño (bits) | Tamaño (bytes) | Descripción                                        |
| --------- | ------------- | -------------- | -------------------------------------------------- |
| **byte**  | 8             | 1              | Unidad mínima de datos                             |
| **word**  | 16            | 2              | Palabra de 16 bits                                 |
| **dword** | 32            | 4              | Double word, 32 bits                               |
| **qword** | 64            | 8              | Quad word, 64 bits                                 |
| **oword** | 128           | 16             | Octa word, 128 bits (SSE)                          |
| **tword** | 80            | 10             | Ten bytes, usado en FPU (float extended precision) |

## Compilación

Para compilar en Linux se utiliza el siguiente proceso:

1. Ensamblar el programa
2. Enlazar el programa
3. Ejecutar el programa (opcional)

```bash
as -32 -o test.o test.asm # Ensambla el programa test.asm
ld -m elf_i386 -o hola hola.o # Enlaza el programa objeto en un ejecutable elf
./hola # Ejecuta el programa hola
```

### Ensamblado

Se produce un archivo objeto (con extensión `.o`) a partir del código fuente del programa. El archivo generado tiene las siguientes características:

- No es un ejecutable (aún).
- No tiene todas las direcciones resueltas.
- Contiene los OP codes (Códigos de operación).
- Contiene las tablas de símbolos.
- Contiene secciones como:
  - `.text`: Código.
  - `.data`: Datos inicializados.
  - `.bss`: Datos sin inicializar.
  - `.rodata`: Constantes.

El archivo en sí está en la mitad del proceso. Aún faltan vínculos externos tales como: funciones de C, syscalls wrappers, direcciones definitivas, etc.

### Enlazado

En este proceso se reciben uno o mas archivos objeto y se produce un archivo ejecutable. Se realizan las siguientes operaciones:

- Resolución de símbolos como labels internos en direcciones finales, llamadas externas resueltas desde libc o librerías dinámicas.
- Se aplican reubicaciones.  El proceso de ensamblado deja huecos en donde no se sabía aún la dirección final, el linker calcula la dirección real de cada símbolo y parcha los opcodes y punteros.
- Combina secciones. Si varios archivos objeto tenían secciones `.text`, el linker las combina generando un solo bloque de código ejecutable.
- Construcción de la estructura del ejecutable: se genera un archivo ELF final (en Linux) con:
  - Cabecera ELF
  - Tabla de secciones
  - Tabla de segmentos
  - Tabla dinámica (si corresponde)
  - Entrada `_start`
  - Reubicaciones para la carga dinámica (si aplica)
- Inserta el código de arranque. En un binario compilado desde C: agrega `_start`, prepara la pila, maneja argumentos, llama a main, etc. En ensamblador puro, `_start` lo provee el programador.
- Se produce el ejecutable final. Es decir, un archivo que se puede ejecutar en el SO donde fue enlazado.

### Instruir a `as` para generar sintaxis Intel

Por defecto AS (ensamblador del proyecto GNU), genera sintaxis AT&T, no obstante, puede generar sintaxis intel si se agrega una directiva al inicio del archivo que será enlazado.

```asm
.intel_syntax noprefix
```

## Memoria

En x86 existen distintas maneras de direccionar la memoria.

### ¿Cómo funciona la copia de memoria entre registros?

Existen instrucciones como `mov` que copian información desde una **fuente** a un **destino**. Entre registros del mismo tamaño, es posible realizar copias sin mayor problema especificando una instrucción `mov` para el tamaño dado agregando un sufijo.

#### Sintaxis AT&T

`mov{b|w|l|q} fuente, destino`

El sufijo indica el tipo de datos a copiar
- **b:** byte (8 bits)
- **w:** word (16 bits)
- **l:** long (32 bits)
- **q:** quad (64 bits)

**Ejemplos**

```asm
# 8 bits
movb %al, %bl   # copia 8 bits desde AL a BL
movb %ah, %hb   # copia 8 bits de AH a BH

# 16 bits
movl %ax, %bx   # copia 16 bits ed AX a BX

# 32 bits
movl %eax, %ebx # copia 32 bits de EAX a EBX
```

Para copias entre registros de distinto tamaño es necesario especificar:
- Porción de bits a copiar

### Sintaxis Intel

`mov destino, fuente`

A diferencia de la sintaxis AT&T, Intel no usa postfiojs en los OP codes.

**Ejemplos**

```asm
# Registro a registro
mov eax, ebx

# Inmediato a registro
mov eax, 123

# Memoria a registro
mov eax, DWORD PTR [variable]

# Registro a memoria
mov DWORD PTR [variable, eax]

# Inmediato a Memoria
mov BYTE PTR [buffer], 10
mov DWORD PTR [value], 1000
```

#### Algunas reglas para la sintaxis Intel

- Los inmediatos no llevan `$`: `mov eax, 5`.
- Los registros no levan `%`: `mov rax, rbx`.
- La memoria se escribe con `[]`: `mov eax, [var]` `mov rax, [rbp - 8]`.

#### Keyword `PTR`.

Como la sintaxis Intel no infiere el tamaño del operando desde el postfijo del OP code (`mv` es un OP code), se usa la palabra clave `PTR` (es una referencia a **pointer**) para decirle explícitamente al ensamblador el tamaño del operando cuando se accesa a memoria.

```asm
.section .data
	a: .int 1
_start:
	# Carga la dirección de a en eax
	mov eax, DWORD PTR a
	# Carga el valor de a en ebx
	mov ebx, DWORD PTR [a]
	
```

### Registros del CPU

##### De propósito general

**8 bits (bits bajos):** AL, BL, CL, DL
**8 bits (bits altos):** AH, BH, CH, DH
**16 bits:** AX, BX, CX, DX
**32 bits:** EAX, EBX, ECX, EDX
**64 bits:** RAX, RBX, RCX, RDX

##### Registros separados

- No comparten bits ni espacio con los otros registros (de arriba).
- No tienen partes altas ni bajas.
- No se subdividen con nombres como AL/AX/EAX/RAX.
- Son arquitecturas paralelas dentro del mismo procesador. (Pertenecen a un grupo independiente de registros).

**128 bits:** XMM0 al XMM31 (SSE / SSE2)
**256 bits:** YMM0 al YMM31
**512 bits:** ZMM0 al ZMM31 (AVX-512)

##### Registros de propósito general sin restricciones (64 bits)

R8 al R15

Como en x86-64 cada vez mas aplicaciones requieren un mayor número de registros de propósito general, estos registros adicionales permiten un mejor rendimiento en operaciones intensivas en CPU. Los compiladores modernos pueden utilizar estos registros para evitar el uso de la pila y reducir la necesidad de hacer push/pop en las funciones. Esto mejora la eficiencia en las funciones de llamada, especialmente con muchos parámetros.

Son registros de propósito general como RAX y RBX, pero sin restricciones. Pueden usarse en cualquier operación aritmética, lógica, direcciones o como parámetros en funciones.

| Registro 64-bit | 32-bit   | 16-bit   | 8-bit (bajo) |
| --------------- | -------- | -------- | ------------ |
| **R8**          | **R8D**  | **R8W**  | **R8B**      |
| **R9**          | **R9D**  | **R9W**  | **R9B**      |
| **R10**         | **R10D** | **R10W** | **R10B**     |
| **R11**         | **R11D** | **R11W** | **R11B**     |
| **R12**         | **R12D** | **R12W** | **R12B**     |
| **R13**         | **R13D** | **R13W** | **R13B**     |
| **R14**         | **R14D** | **R14W** | **R14B**     |
| **R15**         | **R15D** | **R15W** | **R15B**     |

###### Convenciones de llamadas en sistemas Linux x86-64

En la convención de llamadas System V AMD64 ABI, los registros R8 al R15 se usan para pasar argumentos a las funciones. Los primeros 6 parámetros de una función se pasan en los registros RDI, RSI, RDX, RCX, R8 y R9.

- R8 al R15 se usan cuando las funciones necesitan más de 6 parámetros.
- Si hay más de 6 parámetros, R8 al R15 sirven para pasar del septimo al quinceavo parámetro.

**Nótece** que las versiones de 8 bits no tienen parte alta. Solo existe la parte baja de los registros de 16 bits para R8 al R15. La razón es la misma que con los registros SIL, DIL, BPL y SPL, fueron diseñados para operaciones de 64 bits y uso general, no para compatibilidad histórica con las subdivisiones de 8 bits altas. Lo que dice que AH, BH, CH y DH son reliquias históricas.

#### División de registros AX, BX, CX y DX

Los registros mencionados son de 16 bits, gráficamente se ven de la siguiente manera agrupados en grupos de 4 bits:

```
AX: 1111 1111 1111 1111
BX: 1111 1111 1111 1111
CX: 1111 1111 1111 1111
DX: 1111 1111 1111 1111
```

Pueden ser usados para almacenar elementos de 8 bits apagando una de las mitades del registro de 16 bits.

Los registros -H encienden los bits del 8 al 15
```
AH: 1111 1111 0000 0000
BH: 1111 1111 0000 0000
CH: 1111 1111 0000 0000
DH: 1111 1111 0000 0000
```

Los registros -L encienden los bits del 0 al 
```
AL: 0000 0000 1111 1111
BL: 0000 0000 1111 1111
CL: 0000 0000 1111 1111
DL: 0000 0000 1111 1111
```

La misma metodología es realizable a nivel conceptual con los registros X-- (EAX, EBX, ECX, EDX).

Visualización de los registros de 32 bits en grupos de 8 bits
```
EAX: 11111111 11111111 11111111 11111111
EBX: 11111111 11111111 11111111 11111111
ECX: 11111111 11111111 11111111 11111111
EDX: 11111111 11111111 11111111 11111111
```

Visualización de los registros de 64 bits e ngrupos de 8 bits

```
RAX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
RBX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
RCX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
RDX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
```

Dentro de un registro X-- un registro -X se ubica en su parte baja. En el ejemplo siguiente podemos visualizarlo a mas detalle.

```
Grupos de 8 bits

RAX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
EAX: -------- -------- -------- -------- 11111111 11111111 11111111 11111111
 AX: -------- -------- -------- -------- -------- -------- 11111111 11111111
 AH: -------- -------- -------- -------- -------- -------- 11111111 --------
 AL: -------- -------- -------- -------- -------- -------- -------- 11111111

RBX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
EBX: -------- -------- -------- -------- 11111111 11111111 11111111 11111111
 BX: -------- -------- -------- -------- -------- -------- 11111111 11111111
 BH: -------- -------- -------- -------- -------- -------- 11111111 --------
 BL: -------- -------- -------- -------- -------- -------- -------- 11111111

RCX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
ECX: -------- -------- -------- -------- 11111111 11111111 11111111 11111111
 CX: -------- -------- -------- -------- -------- -------- 11111111 11111111
 CH: -------- -------- -------- -------- -------- -------- 11111111 --------
 CL: -------- -------- -------- -------- -------- -------- -------- 11111111

RDX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
EDX: -------- -------- -------- -------- 11111111 11111111 11111111 11111111
 DX: -------- -------- -------- -------- -------- -------- 11111111 11111111
 DH: -------- -------- -------- -------- -------- -------- 11111111 --------
 DL: -------- -------- -------- -------- -------- -------- -------- 11111111
```

Lo mismo aplicaría para registros de 64 y mas bits

#### Memoria compartida entre registros del mismo tipo

Como ya se vió, un registro grande puede ser subdividido en registros mas pequeños, esto se debe a que la memoria es compartida físicamente entre registros. Por lo tanto, el mismo registro A en sus diferentes versiones (respecto al tamaño), puede accesar a distintas regiones de la memoria compartida.

```
     (A)      (B)      (C)      (D)      (E)      (F)      (G)      (H)
RAX: 11111111 11111111 11111111 11111111 11111111 11111111 11111111 11111111
EAX: -------- -------- -------- -------- 11111111 11111111 11111111 11111111
 AX: -------- -------- -------- -------- -------- -------- 11111111 11111111
 AH: -------- -------- -------- -------- -------- -------- 11111111 --------
 AL: -------- -------- -------- -------- -------- -------- -------- 11111111
```

De acuerdo a esto, registros mas pequeños acceden a diferentes partes de la memoria respecto del registro mas grande.

Si por ejemplo se quisiera accesar a la porción G o H se haría lo siguiente:

```asm
# AT&T
movl $5, %eax  # Copia el valor inmediato $5 en el registro eax
movb %al, %bl # Copia la porción H de EAX accesando por medio de AL a BL

# Intel
# El postfijo l (long de 32 bits) desaparece en intel
mov eax, 5
mov bl, al
# Nótece que solo se usa [Palabra] PTR cuando hay memoria involucrada 
```

En cambio para copiar la sección G sería así:

```asm
# AT&T
movl $5, %eax # copia el valor inmediato $5 en el registro eax
mob %ah, %bl  # copia la porción G de EAX accesando por medio de ah a bl

# Intel
mov eax, 5
mov bl, ah
```

#### Valores inmediatos

Los valores inmediatos en sintaxis AT&T comienzan con $, en cambio, en la sintaxis Intel no tienen prefijo. Se insertan directamente en la instrucción como operandos fuente. Como no cambian se puede decir que son valores literales que se mantienen durante la ejecución.

En el siguiente ejemplo se ven algunos valores literales.

```asm
# AT&T
movb $10, %al     # Copia el inmediato $10 decimal en el registro al
movb $0xA, %al    # copia el inmediato $0xA hexadecimal en el registro al
movb $012, %al    # copia el inmediato $012 octal en el registro al
movb $0b1010, %al # copia el inmediato $0b1010 binario en el registro al

# Intel
mov al, 10
mov al, 0xA
mov al, 012o # A diferencia de AT&T, se requiere el postfijo 0. No asume que un número comenzado por 0 es octal.
mov al, 1010b # En Intel se usa el postfijo b, mientras que en AT&T el prefijo 0b.

```

##### 0b no soportado en GAS
Nótese que GAS no soporta el formato binario, en tal caso se debería usar un ensamblador como NASM (soporta prefijo 0b para inmediatos binarios).

#### Registros de propósito general con usos específicos

RSI/ESI: fuente en copias (string src)
RDI/EDI: destino en copias (string dst)
RBP/EBP: Puntero base (base pointer en stack frame)
RSP/ESP: Puntero de pila (stack pointer)

**Nota:** Se usa el prefijo R para denotar registros de 64 bits y el prefijo E para registros de 32 bits.

#### Registros de segmento

Son usados para direccionamiento segmentado de memoria. En x86-64 tienen poco uso (modo protegido).

CS: Código
DS: Datos
SS: Pila (Stack)
ES: Segmento Extra (Extra segment)
FS: General (propósito especial)
GS: General (usado por sistemas operativos)

En OS modernos como linux `fs` y `gs` se usan a menudo para Thread Local Storage (TLS) o estructuras internas del kernel por hilo. Se puede acceder con instrucciones como `%fs:0x10` sin que el sistema reclame, porque linux y otros sistemas modernos cargan selectores válidos en `fs`/`gs`.
Estos registros no se usan automáticamente, así que el programador tiene control.

Para los demas registros de segmento (`ds`, `es`, `ss`, etc), su uso explícito es innecesario o problemático porque:
- `ds`, `es` y `ss` se usan implícitamente para casi todas las instrucciones de acceso a datos o pila.
- Si tratas de escribir mov %ds:0x10, %al en modo protegido, puede fallar o comportarse de forma no esperada si el selector de %ds no es válido.
- En modo real (16 bits) sí se usan todos activamente, pero eso no aplica a Linux moderno ni a código 32/64 bits típico.

En el caso del registro `cs`, no se puede modificar directamente porque se cambia con `jmp` o `call` a otra sección de código.

Por lo tanto, los registros `ds`, `es` y `ss` deben ser evitados, ya que el sistema los maneja y su uso explícito no es común.

**Importante para 64 bits**

En 64 bits, estos registros prácticamente no se utilizan, ya que se trabaja con el modo de memoria lineal y el valor de estos registros se encuentra fijado en 0 (excepto en los registros `FS` y `GS`, que pueden ser utilizados como registros base en el cálculo de direcciones).

##### ¿Qué es un segmento?

En **ensamblador (ASM)**, un **segmento** es una **región lógica de memoria** que el programa utiliza para almacenar distintos tipos de datos o instrucciones. Se usan mucho en arquitecturas x86 clásicas (como 16 bits, modo real) y en programas que necesitan organizar la memoria de manera estructurada. La idea básica es separar las instrucciones, los datos y la pila en áreas distintas para evitar conflictos y facilitar la administración de la memoria.

| Segmento       | Qué contiene                                 | Registro asociado  |
| -------------- | -------------------------------------------- | ------------------ |
| **Code (CS)**  | Instrucciones del programa                   | CS (Code Segment)  |
| **Data (DS)**  | Variables estáticas, constantes              | DS (Data Segment)  |
| **Stack (SS)** | Pila (funciones, llamadas, return addresses) | SS (Stack Segment) |
| **Extra (ES)** | Segmento adicional para datos                | ES (Extra Segment) |

###### ¿Cómo se usan?

En ensamblador x86 de 16 bits, la memoria se direcciona mediante **segmento:offset**. Por ejemplo:

```asm
# Intel
MOV AX, DS    # Carga el registro de segmento de datos
MOV BX, 0x100 # Offset dentro del segmento
MOV AL, [BX]  # Accede a la dirección DS:0x100
```

Aquí, `DS` indica **el segmento donde está el dato**, y `0x100` es el **offset** dentro de ese segmento. La CPU combina ambos para obtener la dirección física real:

```asm
Dirección física = (segmento << 4) + offset
```

Por ejemplo, si `DS = 0x2000` y `offset = 0x100`, la dirección física sería:

```asm
0x20000 + 0x100 = 0x20100
```

###### ¿Por qué existen los segmentos?

1. **Organización:** separar código, datos y pila evita sobrescribir instrucciones con variables.
2. **Compatibilidad:** en modo real de x86 (16 bits) no hay suficiente espacio de direccionamiento lineal# los segmentos permiten acceder a más memoria (hasta 1 MB).
3. **Seguridad relativa:** aunque básica, permite que la pila no sobrescriba el código accidentalmente.

###### En modos modernos (32/64 bits)

En **modo protegido** y **modo largo (64 bits)**, la segmentación clásica es menos importante, y se usa **paginación y direcciones lineales**. Sin embargo, los registros de segmento todavía existen, aunque muchos apuntan todos al mismo segmento de datos para simplificar.

##### Global Descriptor Table (GDT)

La GDT es una estructura en memoria que contiene descriptores que definen los segmentos de memoria usados por el procesador en modo protegido (protected mode).
Características:
- Cada descriptor describe un segmento (código, datos, stack, etc.).
- La GDT permite al CPU conocer las propiedades y límites de cada segmento.
- Es global, lo que significa que es usada por todo el sistema (todos los procesos, en modo kernel).

**¿Por qué existe la GDT?**
En el modo protegido, el procesador x86 no trabaja con direcciones físicas directamente, sino con segmentos que facilitan:
- **Protección:** Controlar accesos y evitar que un proceso acceda a memoria ajena.
- **Organización:** Dividir memoria en segmentos lógicos (código, datos, stack).
- Compatibilidad con software antiguo que usaba segmentación.

**¿Qué contiene un descriptor en la GDT?**
Cada descriptor en la GDT tiene 8 bytes y contiene:
| Campo                   | Descripción                                                         |
| ----------------------- | ------------------------------------------------------------------- |
| Base Address (32 bits)  | Dirección base del segmento                                         |
| Segment Limit (20 bits) | Tamaño máximo del segmento                                          |
| Access Byte (8 bits)    | Permisos y tipo de segmento (ejecutar, leer, escribir, privilegios) |
| Flags (4 bits)          | Granularidad, tamaño, y otros atributos                             |

**¿Cómo funciona la segmentación con la GDT?**
Cuando un programa usa un segmento (por ejemplo, `cs`, `ds`), el registro de segmento no contiene la dirección base directa. Contiene un selector, que es un índice a un descriptor en la GDT. El procesador usa ese descriptor para calcular la dirección física real:

`Dirección física = Base Address + Offset dentro del segmento`

**Relación con registros de segmento**
Los registros `cs`, `ds`, `ss`, `es`, `fs`, `gs` contienen selectores que apuntan a entradas en la GDT (o LDT).

Un selector es un valor de 16 bits que indica índice y privilegio. Cuando se carga uno en un registro de segmento, el CPU busca la GDT para obtener base, límite y permisos.

**¿Donde está la GDT?**
La dirección y tamaño de la GDT están en un registro especial llamado `GDTR`. Dicho registro se carga con la instrucción `lgdt` (load gdt).

**¿Por qué importa la GDT hoy?
En sistemas modernos 32/64 bits con paging, la segmentación está muy simplificada, pero la GDT sigue existiendo para:
- Definir segmentos planos (base 0, limite 4GB).
- Definir segmentos especiales (`fs`, `gs`) usados para TLS o estructuras del kernel.
- Mantener compatibilidad y seguridad.

##### Local Descriptor Table (LDT)

La Local Descriptor Table (LDT) es una estructura similar a la GDT, pero con un alcance más limitado y específico para procesos individuales. Mientras la GDT es global y usada por todo el sistema, la LDT permite que cada proceso o tarea tenga su propia tabla privada de descriptores de segmentos.

**¿Para qué sirve la LDT?**
- Permite que diferentes procesos tengan definiciones de segmentos distintos sin interferir entre sí.
- Ayuda a implementar protección y aislamiento a nivel de segmentos.
- Es útil en sistemas que usan segmentación para administrar memoria y acceso.

**Diferencias clave entre GDT y LDT**
| Característica   | GDT                                                                     | LDT                                            |
| ---------------- | ----------------------------------------------------------------------- | ---------------------------------------------- |
| Alcance          | Global, para todo el sistema                                            | Local, para procesos específicos               |
| Ubicación        | En memoria accesible globalmente                                        | En memoria, pero específica para un proceso    |
| Uso              | Definir segmentos comunes (código, datos, stack) y privilegios globales | Definir segmentos personalizados para procesos |
| Número de tablas | Una por sistema                                                         | Puede haber varias (una por proceso)           |

**¿Cómo usa el CPU la LDT?**
- El CPU tiene un registro especial llamado `LDTR` (Local Descriptor Table Register), que apunta a la dirección de la LDT activa.
- Cuando un selector de segmento tiene el bit TI=1 (Table Indicator), indica que debe buscarse en la LDT en vez de la GDT.
- Esto permite que un proceso utilice descriptores que están en su LDT y no en la GDT.

**¿Qué contiene la LDT?**
- Igual que la GDT, contiene descriptores de segmentos.
- Se usa para definir segmentos especiales, no comunes a todo el sistema.
- En sistemas modernos, la LDT se usa menos porque la segmentación ha sido reemplazada en gran parte por paging.

**Uso práctico hoy en día**
- En sistemas modernos (Linux, Windows), la LDT se usa poco o nada, ya que:
  - La segmentación es simplificada (segmentos planos).
  - La paginación (paging) es la principal forma de protección y manejo de memoria.

- Sin embargo, sigue disponible para compatibilidad con software antiguo o características específicas (por ejemplo, algunas implementaciones de thread-local storage (TLS)).

**Resumen visual rápido**
```
Selector Segmento (16 bits):
  +-----------------+
  | Index (13 bits) | --> índice en GDT o LDT
  +-----------------+
  | TI (1 bit)      | --> 0 = GDT, 1 = LDT
  +-----------------+
  | RPL (2 bits)    | --> Privilegios
  +-----------------+
```
- Si `TI=0`, el índice apunta a la GDT.
- Si `TI=1`, el índice apunta a la LDT.

#### Registro RPL (Requestor Privilege Level)

Es un campo de 2 bits que forma parte del selector de segmento (como `cs`, `ds`, etc) en x86. Se usa para controlar y verificar el **nive lde privilegio** de quien está solicitando acceso a un segmento.

Representa el nivel de privilegio del código que está haciendo la solicitud de acceso al segmento. Es un valor entre `0` y `3` (2 bits) en donde:
- 0 es el nivel mas privilegiado (modo kernel).
- 3 es el nivel menos privilegiado (modo usuario).

**¿Dónde se encuentra el RPL?**
Se encuentra en los 2 bits menos significativos de un selector de segmento (registro `cs`, `ds`, etc.).

```
Selector de segmento (16 bits)
 15          3  2  1  0
 +--------------+--+--+
 |   Índice     |TI|RPL|
 +--------------+--+--+
```
- Bits 0-1: `RPL`
- Bit 2: TI (Table Indicator: 0 = GDT, 1 = LDT)
- Bits 3–15: Índice del descriptor

**¿Cómo se usa el RPL?**
Cuando el CPU accede a un segmento, compara tres niveles de privilegio:
1. **CPL:** Current Privilege Level (nivel de privilegio actual del código, viene de `cs`).
2. **DPL:** Descriptor Privilege Level (nivel requerido para acceder al segmento# está en el descriptor de la GDT/LDT).
3. **RPL:** Privilegio solicitado (de quien intenta acceder).

La fórmula para permitir acceso es:
> El acceso **solo se permite** sí:
> `max(CPL, RPL) <= DPL`
Esto significa que:
- Un proceso no puede acceder a un segmento más privilegiado.
- El **RPL puede usarse para forzar un privilegio más bajo temporalmente**, incluso si el código está corriendo en un nivel alto (por ejemplo, como medida de seguridad).

**¿Para qué sirve RPL realmente?**
- **Seguridad:** permite forzar una reducción temporal del privilegio, para ejecutar código menos privilegiado (como llamadas a bibliotecas del sistema).
- **Protección:** previene que procesos usuario accedan a memoria del kernel.
- **Validación por hardware:** el CPU hace esta verificación automáticamente.

**Ejemplo simple**
Supón:
- `cs` tiene RPL = 3 (modo usuario)
- Segmento al que se quiere acceder tiene DPL = 0 (modo kernel)
- Entonces, `max(CPL=3, RPL=3) = 3 > DPL=0` -> Acceso denegado

**Instrucción `max(CPL, RPL) <= DPL`**

Reside físicamente en el hardware. Está implementada dentro del CPU, fué introducida por intel como parte de la lógica interna de sus procesadores desde el modo protegido, el cual salió comercialmente a la luz con el 80286 y completamente con en el 80386.

Por lo tanto, el CPU internamente realiza esta verificación cada vez que se intenta ejecutar una instrucción que accede a un segmento de memoria. Y no es evitable por software.

Cuando la condición no se cumple, el CPU lanza una **excepción de protección general** (`#GP`, General Protection Fault).

**¿Por qué importa?**

- Permite que el sistema operativo confíe en el hardware para mantener la protección de memoria y privilegios.
- Si un proceso malicioso intenta hacer un jmp a código privilegiado del kernel, el CPU lo detiene automáticamente, sin intervención del kernel.

**Seguridad en capas**
- **Hardware (CPU):** se encarga de la verificación de privilegios (CPL, RPL, DPL).
- **Sistema operativo (Linux, Windows, etc.)**: define cómo se usan esos mecanismos (qué descriptores existen, cómo están configurados, qué tareas corren en cada modo).

#### Registros de propósito especial

EIP: Puntero de Instrucción (Instruction Pointer)
EFLAGS: Flags de estado, control, etc

#### Registros de control (modo protegido)

Se usan en modo protegido, para manejar memoria virtual, paginación, etc.

CR0 a CR4: Control de CPU y MMU
GDTR: Registro del descriptor global
IDTR: Registro del descriptor de interrupciones
LDTR: Descriptor de segmento local
TR: Registro de tarea (Task register)

#### Registro de punto flotante (FPU)

ST0 al ST7: Registro en pila para operaciones flotantes

#### Registros SIMD / MMX (para multimedia y vectorización)

MMX: MM0 al MM7 (64 bits)
> Introducidos en intel Pentium (1997), comparten espacio con FPU

XMM: XMM0 al XMM15 (128 bits, SSE)
> Introducido en SSE y SSE2, muy utilizados en criptografía y multimedia
> [Oracle: Instrucciones SSE](https://docs.oracle.com/cd/E37838_01/html/E61064/eojde.html)
> [Oracle: Instrucciones SSE2](https://docs.oracle.com/cd/E37838_01/html/E61064/epmpv.html#scrolltoc)

YMM: YMM0 al YMM15 (256 bits, AVX)
> Introducido en AVX y AVX2, usados en apps modernas

ZMM: ZMM0 al ZMM31 (512 bits, AVX-512)
> Introducidos en AVX512 en chips recientes (intel skylake-x, Xeon, etc)

Para mas registros visitar: [Oracle Assembly Language Reference Manual](https://docs.oracle.com/cd/E37838_01/html/E61064/enmzx.html)

#### Direccionamiento intermedio

Éste método no acede a la memoria, solo al valor.

```asm
#AT&T
movl $5, %eax # eax = 5 (valor inmediato)

#Intel
mov eax, 5
```

#### Direccionamiento por registro

En éste método ambos operandos son registros, por lo tanto, la operación se raliza desde el registro a al b.

```asm
# AT&T
movl %eax, %ebx

# Intel
mov ebx, eax
```

#### Direccionamiento directo

Éste método usa una dirección de memoria fija.

```asm
# AT&T
movl (0x12345678), %eax # Carga el contenido de la dirección 0x12345678 en el registro eax

# Intel
# Versión para 32 bits
mov eax, DWORD PTR [0x12345678]

# En 64 bits no existe el direccionamiento absolute directo
# Opciones
# a) Acceso relativo a RIP
mov eax, DWORD PTR [rip + 0x12345678]
# o usando rel
mov eax, DWORD PTR [rel 0x12345678]
# se traduce a
mov eax, DWORD PTR [rip + 0x12345678]
# y el desplazamiento lo calcula asm
# b) Cargar la dirección en un registro
mov rax, 0x12345678
mov eax, DWORD PTR [rax]
```

`rel` es un modificador del asm que significa "dirección relativa". Sirve para decirle a asm que se debe calcular la dirección relativa al punto actual, que normalmente es `rip`.

¿Qué es `RIP` relative addressing?

Es el instruction pointer de X86-64. **No es escribible**. Es un registro que indica qué instrucción se está ejecutando ahora y cuál viene después. Al terminar una instrucción, `rip` avanza en automático a la siguiente. En saltos y llamados, `rip` es modificado automáticamente.

| Modo       | Registro  |
| ---------- | --------- |
| x86 16-bit | `IP`      |
| x86 32-bit | `EIP`     |
| x86-64     | **`RIP`** |

Todos cumplen la misma función: ser un puntero de instrucción.

#### Direccionamiento indirecto por registro

Éste método usa un registro que contiene una dirección de memoria

```asm
# AT&T
movl %eax, (%ebx) # eax contiene la dirección de memoria

# Intel
mov DWORD PTR [ebx], eax # Escribe en el puntero [ebx]
```

**Equivalente en C**

```C
*(uint32_t *)ebx = eax;
```

`uint32_t`: Tipo de C que representa un entero sin signo de exactamente 32 bits.

El operador `[registro]` se usa para acceder al contenido de la dirección contenida en `registro`. Recordar que la keyword `PTR` se usa en sintaxis intel.

#### Direccionamiento con desplazamiento

Éste método usa un registro base y un desplazamiento constante.

```asm
# AT&T
movl 4(%eax), %ebx # se copia el valor de eax + 4 en el registro ebx

# Intel
mov ebx, DWORD PTR [eax + 4]
```

**Equivalente en C**

```C
ebx = *(uint32_t *)(eax + 4);
```

La operación `4(%eax)` indica la dirección de memoria desde donde comenzar a leer en sintaxis AT&T, en sintaxis Intel, simplemente se usa `PALABRA PTR [registro + offset]`. El registro `eax` contiene una dirección de memoria, luego se le suma 4 y de esa dirección resultante, se copia la información en el registro `ebx`.

#### Direccionamiento segmentado (modo real 16 bits)

En éste método no se usa una dirección de 32 bits lineal como en el modo protegido (32 bits) o modo largo (64 bits). En su lugar se combinan dos valores para formar una dirección física.
- Segmento (segment register de 16 bits)
- Desplazamiento (offset 16 bits)

La dirección es calculada entonces como:

`dirección = (segmento x 16) + offset`

```asm
# DS = 0x1000 (registro de segmento de datos) (base de memoria)(segmento)
# BX = 0x0020 (registro offset) (offset)

# Fórmula: dirección física = (DS << 4) + BX
# Dirección física = 0x10020
# DS:BX == base + desplazamiento
# valor << 4 = valor × 16

# AT&T
movw %ds:(%bx), %ax # suma bx en ds, lee la dirección resultante y la carga en el registro ax

# Intel
mov ax, WORD PTR ds:[bx]
# Alternativa (ds es implícito)
mov ax, WORD PTR [bx]
```

#### Direccionamiento indexado (Base + Index * Escala + Desplazamiento)

Éste modo se utiliza para accesar a estructura, arreglos o memoria compleja.

```asm
# AT&T
# movl despazamiento(dirección base, índice, escala o factor), destino 
movl 8(%ebx, %esi, 4), %eax

# Intel
mov eaxm DWORD PTR [ebx + esi*4 + 8]

# desplazamiento = offset
# [base + índice * escala + desplazamiento]
# base: ebx
# índice: esi
# escala: 4
# desplazamiento: 8
```

**Nótece:** que si `esi` permite el acceso a memoria que está mas allá de la estructura (lo que en lenguajes de alto nivel ocasionaría un error), ningún error será notificado al programador, salvo que la dirección a la que se intenta accesar fuera una región de memoria protegida (dando el error violación de segmento de memoria).

Es responsabilidad del programador asegurarse de que no ocurra un error de segmentación de memoria (segmentation fault).

##### Desplazamiento (displacement)

Es un número constante (inmediato) que se suma al resultado del calculo. Puede ser positivo o negativo y se usa típicamente para acceder a un campo específico dentro de una estructura, o como un offset inicial.

##### Base (registro base)

Es un registro que contiene la dirección base desde donde se empieza a contar(comienzo del arreglo o estructura). Es omitible dejando la dirección vacía.

```asm
# AT&T
desplazamiento(base, índice, escala o factor)

# Intel
[base + indice * escala + desplazamiento]
```
##### Índice (index, registro índice)

Es un registro que se multiplica por la escala o factor (scale) para calcular un desplazamiento adicional.
Se usa comúnmente para representar un índice de un array o una posición relativa. Tambien es opcional y se puede omitir.

```asm
desplazamiento(base)
```

Cuando es omitido, tambien el valor de escala o factor debe ser omitido.

**En sintaxis Intel, todas las partes son opcionales, pero alguna debe existir.**

##### Escala o factor (scale)

Es un número que multiplica al índice (1, 2, 4 u 8). Sirve para accesar a elementos del array cuando estos ocupan mas de un byte. Se usan:

- 1 para bytes (`char`)
- 2 para `short`
- 4 para `int` o `float`
- 8 para `double` o `long`

Éste valor es omitible si no se usa el índice puesto que no tiene sentido sin el.

##### Cálculo de la dirección por el CPU

Con ésta información el CPU puede calcular la posición de memoria para operar de la siguiente manera:

`dirección = desplazamiento + base + (índice * escala o factor)`

Nótece que se ha usado el término escala o factor para mejorar la explicación. En múltiples documentaciones aparece simplemente como **scale**.

## Anatomía de un programa

#### Estructura básica

La estructura básica de un programa en ensablador es como la siguiente:

```asm
# Comentario para sintaxis AT&T
# Comentario para sintaxis Intel
# AT&T
.section .data
     mensaje .asciz "hola mundo\n" # Cadena terminada en NULL

.section .bss
     buffer: .skip 64 # Reserva 64 bytes sin inicializar

.section .text
     .glob _start # Punto de entrada del programa

_start:
     # write(fd=1, buf=message, count=10)
     movl $4, %eax # syscall número 4 = sys_write
     movl $1, %ebx # fd = 1 (stdout)
     movl $mensaje, %ecx # puntero al mensaje
     movl $10, %edx # número de bytesa escribir
     int $0x80 # llamada al sistema

     # exit(status=0)
     movl $1, %eax # syscall número 1 = sys_exit
     xorl %ebx, $ebx # exit code = 0
     int $0x80 # llamada al sistema
```

#### Sección .data

En ésta sección se definen datos inicializados (cadenas, enteros, etc). Todo lo que se defina en ésta sección, ocupará espacio en el archivo binario final. Cuando el programa inicie su ejecución, dichos datos serán copiados en la memoria y se tienen permisos de lectura y escritura sobre la misma.

#### Sección .bss (block started by symbol)
> El término se originó en los 50-60s, al interior de ensambladores antiguos como UNIVAC Assembler.

En ésta sección se definen datos sin inicializar en tiempo de compilación. En tiempo de ejecución se tienen permisos de lectura y escritura sobre la presente. Estas variables:

- No tienen un valor inicial explícito
- Son rellenadas con ceros automáticamente cuando el programa se carga en memoria
- No ocupan espacio en el archivo binario, el espacio se reserva al comenzar la ejecución

#### Sección .text

Ésta es la sección de código ejecutable. Su acceso es de solo lectura y ejecución, por lo que no se puede escribir en ella. Ocupa espacio en disco y por lo tanto en el archivo binario resultante. Contiene todas las instrucciones compiladas o ensambladas a ejecutar

#### Sección .globl _start

Define el símbolo _start como entrada del programa. .globl es una directiva del ensablador que declara al símbolo que le sigue como global, es decir que puede ser referenciado desde otros archivos o el linker.

`.globl símbolo`

A diferencia de lenguajes como C en donde el linker busca la función main, en ensamblador se busca _start para utilizarlo como punto de entrada.

### Directivas de ensamblador especificas de GAS

#### Secciones y organización del código

| Directiva           | Función                        | Ejemplo                |
| ------------------- | ------------------------------ | ---------------------- |
| `.section name`     | Define o cambia de sección     | `.section .data`       |
| `.text`             | Sección de código              | `.text`                |
| `.data`             | Datos inicializados            | `.data`                |
| `.bss`              | Datos no inicializados         | `.bss`                 |
| `.rodata`           | Datos de solo lectura          | `.section .rodata`     |
| `.previous`         | Vuelve a la sección anterior   | `.previous`            |
| `.pushsection name` | Guarda sección actual y cambia | `.pushsection .rodata` |
| `.popsection`       | Restaura sección anterior      | `.popsection`          |

#### Definición de datos (variables y constantes)

| Directiva                | Tamaño  | Descripción         | Ejemplo            |
| ------------------------ | ------- | ------------------- | ------------------ |
| `.byte`                  | 8 bits  | Enteros de 1 byte   | `.byte 0x41`       |
| `.short` / `.hword`      | 16 bits | Enteros de 2 bytes  | `.short 100`       |
| `.int` / `.long`         | 32 bits | Enteros de 4 bytes  | `.int 1234`        |
| `.quad`                  | 64 bits | Enteros de 8 bytes  | `.quad 0x11223344` |
| `.float`                 | 32 bits | Punto flotante      | `.float 3.14`      |
| `.double`                | 64 bits | Doble precisión     | `.double 3.141592` |
| `.ascii`                 | n/a     | Cadena sin `\0`     | `.ascii "hola"`    |
| `.asciz` / `.string`     | n/a     | Cadena con `\0`     | `.asciz "hola"`    |
| `.space n`               | n bytes | Reserva espacio     | `.space 16`        |
| `.zero n`                | n bytes | Reserva con ceros   | `.zero 32`         |
| `.fill count,size,value` | n bytes | Rellenar con patrón | `.fill 4,1,0x90`   |

#### Alineación y organización en memoria

| Directiva    | Función                           | Ejemplo               |
| ------------ | --------------------------------- | --------------------- |
| `.align n`   | Alinea a 2ⁿ bytes                 | `.align 4` → 16 bytes |
| `.balign n`  | Alinea a n bytes                  | `.balign 16`          |
| `.p2align n` | Alinea a 2ⁿ bytes                 | `.p2align 4`          |
| `.org addr`  | Establece dirección de ensamblado | `.org 0x400000`       |

#### Símbolos, visibilidad y enlazado

| Directiva     | Función                             | Ejemplo          |
| ------------- | ----------------------------------- | ---------------- |
| `.global sym` | Hace símbolo visible al linker      | `.global main`   |
| `.globl sym`  | Alias de `.global`                  | `.globl _start`  |
| `.local sym`  | Símbolo solo local                  | `.local temp`    |
| `.extern sym` | Declara símbolo externo             | `.extern printf` |
| `.weak sym`   | Símbolo débil                       | `.weak handler`  |
| `.hidden sym` | Oculta símbolo                      | `.hidden secret` |
| `.set a,b`    | Define símbolo como expresión       | `.set SIZE, 64`  |
| `.equ a,b`    | Define constante                    | `.equ MAX, 100`  |
| `.equiv a,b`  | Como `.equ` pero error si ya existe | `.equiv X, 5`    |


#### Macros y repetición

| Directiva             | Función           | Ejemplo           |
| --------------------- | ----------------- | ----------------- |
| `.macro name args...` | Define macro      | `.macro PUSH reg` |
| `.endm`               | Fin de macro      | `.endm`           |
| `.irp var, list`      | Itera sobre lista | `.irp r, rax,rbx` |
| `.irpc var, string`   | Itera caracteres  | `.irpc c,"ABC"`   |
| `.rept n`             | Repite n veces    | `.rept 4`         |
| `.endr`               | Fin de repetición | `.endr`           |


#### Control de flujo en ensamblado (condicionales)

No genera saltos en CPU, mas bien decide qué cóðigo se ensambla o no.

**Condicionales**

| Directiva      | Función                     | Ejemplo           |
| -------------- | --------------------------- | ----------------- |
| `.if expr`     | Si la expresión ≠ 0         | `.if DEBUG`       |
| `.ifdef sym`   | Si símbolo está definido    | `.ifdef LINUX`    |
| `.ifndef sym`  | Si símbolo NO está definido | `.ifndef TEST`    |
| `.ifb arg`     | Si argumento está vacío     | `.ifb \arg`       |
| `.ifnb arg`    | Si argumento no está vacío  | `.ifnb \arg`      |
| `.ifeq expr`   | Si expr == 0                | `.ifeq SIZE-10`   |
| `.ifne expr`   | Si expr ≠ 0                 | `.ifne FLAG`      |
| `.ifgt expr`   | Si expr > 0                 | `.ifgt COUNT`     |
| `.iflt expr`   | Si expr < 0                 | `.iflt OFFSET`    |
| `.else`        | Rama alternativa            | `.else`           |
| `.elseif expr` | Condición intermedia        | `.elseif MODE==2` |
| `.endif`       | Fin del condicional         | `.endif`          |

**Ejemplo**

```asm
# Intel
.equ DEBUG, 1

.if DEBUG
    mov rax, 1      # código de depuración
.else
    mov rax, 0
.endif
```

#### Control de ensamblado y mensajes

| Directiva         | Función                      | Ejemplo                 |
| ----------------- | ---------------------------- | ----------------------- |
| `.error "msg"`    | Detiene ensamblado con error | `.error "Fallo"`        |
| `.warning "msg"`  | Muestra advertencia          | `.warning "Deprecated"` |
| `.abort`          | Aborta ensamblado            | `.abort`                |
| `.include "file"` | Incluye otro archivo         | `.include "defs.inc"`   |
| `.file "name"`    | Define nombre de archivo     | `.file "main.s"`        |
| `.line n`         | Cambia número de línea       | `.line 42`              |

#### Información de depuración

| Directiva             | Función                    | Ejemplo                |
| --------------------- | -------------------------- | ---------------------- |
| `.loc file line`      | Asocia código a línea      | `.loc 1 10`            |
| `.type sym,@function` | Marca símbolo como función | `.type main,@function` |
| `.size sym, expr`     | Define tamaño de símbolo   | `.size main, .-main`   |

#### Arquitectura, modo y opciones

| Directiva                | Función                | Ejemplo                  |
| ------------------------ | ---------------------- | ------------------------ |
| `.code16`                | Código 16 bits         | `.code16`                |
| `.code32`                | Código 32 bits         | `.code32`                |
| `.code64`                | Código 64 bits         | `.code64`                |
| `.intel_syntax noprefix` | Sintaxis Intel         | `.intel_syntax noprefix` |
| `.att_syntax`            | Vuelve a sintaxis AT&T | `.att_syntax`            |
| `.arch arch`             | Fija arquitectura      | `.arch x86_64`           |

#### Misceláneas útiles

| Directiva          | Función                  | Ejemplo           |
| ------------------ | ------------------------ | ----------------- |
| `.comm sym, size`  | Variable común           | `.comm buffer,64` |
| `.lcomm sym, size` | Común local              | `.lcomm temp,32`  |
| `.ident "text"`    | Cadena de identificación | `.ident "v1.0"`   |
| `.end`             | Marca fin del archivo    | `.end`            |

### Interrupciones

Una interrupción se define como un mecanismo que detiene temporalmente la ejecución normal del procesador, ya sea para atender un evento urgente/importante y luego retormar la ejecución en donde se quedó previo a la interrupción. Cuando el CPU recibe una interrupción ejecuta una rutina especial llamada **manejador de interrupción** (interrupt handler).
Las interrupciones son generadas por componentes del hardware (dispositivo, timer, teclado) o del software (llamadas al sistema, excepciones). Permiten al CPU reaccionar rápidamente a eventos externos sin necesidad de estar revisando constantemente (lo que se conoce como polling: consultar contínuamente el estado de un dispositivo o bandera en un bucle, hasta que cambia a un valor esperado). Un ejemplo de ésto es por ejemplo, cuando una tecla del teclado es presionada, una interrupción es generada, y al CPU se le indica que hay datos para leer.

En ensamblador x86 de 32 bits, para hacer una llamada al sistema (syscall) se usa la instrucción:

`int $0x80`

Esto genera la interrupción de software número 128 (0x80). El kernel la atiende para realizar la función solicitada (leer archivo, escribir, salir, etc).

#### Resumen visual del flujo

1. Ejecución normal
2. Ocurre una interrupción
3. CPU guarda el contexto actual
4. Ejecuta rutina de interrupción
5. Restaura contexto
6. Resume ejecución normal

#### Interrupciones prefedinidas

En x86 existen (entre muchas otras) las siguientes interrupciones predefinidas:

- 0: Error de división por 0 (divide error)
- 6: Instrucción no valida (invalid op code)
- 13: Violación de protección (general protection)
- 14: Acceso a página de memoria no valida (page fault)
- 0x80: Usado en linux para hacer una llamada al sistema (software interrupt)

Estas son reservadas y manejadas por el procesador o el sistema operativo.

#### Interrupciones definidas por el usuario

El programador tambien puede definir y manejar interrupciones personalizadas, tanto por hardware como por software.
Para definir una se utiliza la instrucción `int n` con un número que **no esté reservado** por el sistema. Luego debe verificarse que ese número esté correctamente apuntado en la tabla `IDT` (interrupt descriptor table) hacia su propia rutina de manejo.

```asm
# AT&T e Intel
int $0x21 # interrupción personalizada
```

Si se configuró correctamente la entrada `0x21` en la `IDT` con el manejador o gestor, el CPU realizará el salto allí.

#### Interrupciones personalizadas por hardware

En el modo protegido y en sistemas operativos modernos, la `IDT` no es modificable desde el espacio de usuario, solo el kernel tiene control total.

#### Consideraciones

Para crear una interrupción propia, se necesita cumplir algún punto de los siguientes:

- Usar modo real (bootloader por ejemplo)
- Tener acceso en modo kernel
- Trabajar en un OS propio o código que se ejecuta en hardware directamente

#### Intrucciones sti y cli en x86

Controlan el flag de interrupciones en el registro de estado `EFLAGS`.

`cli` desactiva las interrupciones externas de la CPU. Esto bloquea la atención a interrupciones de hardware.
Se usa para evitar que durante una sección crítica de código una interrupción interrumpa el flujo, evitando condiciones de carrera o corrupción de datos.

`sti` activa nuevamente las interrupciones, permitiendo que la CPU entienda las interrupciones externas.
Tiene un retraso de una instrucción antes de que realmente se activen las interrupciones, esto significa que la siguiente instrucción que viene después de `sti`, se ejecutar antes que las interrupciones sean atendidas.

**Importante**: solo afectan a las interrupciones externas, pero no a las excepciones internas. Además son instrucciones privilegiadas que solo son ejecutables en modo kernel (anillo 0).

#### Gestor o manejador de interrupciones pesonalizadas

En el siguiente ejemplo se escribirá la entrada 0x21 de la `IVT` (interrupt vector table) para que apunte a nuestro propio manejador. Luego desde el manejador se imprimirá una letra.

**Importante:** El ejercicio usa el modo real.

```asm
# AT&T
.code16 # Modo real 16 bits
.globl _start

.section .text

_start:
     cli # Desactiva interrupciones (clear interrupt flag)
     xor %ax, %ax # XOR en registro ax para setearlo en 0
     # se prefiere xor porque:
     # - Es mas rápido que mov $0, %ax
     # - Internamente xor es mas corto en muchas arquitecturas
     # - Mas rápido en ciertas micro arquitecturas
     # - No genera dependencias de datos (ayudando al paralelismo interno de la CPU)

     mov $ax, %ds # Seteo del egmento de datos a0x0000

     # Guarda el viejo handler de int 0x21 (buen hábito)
     mov $0x21, %ah
     int $0x21 # Llama al handler original (ahora no hace nada útil)

     # Instalar el manejador propio (handler)
     lea manejador, %bx # Dirección de nuestra rutina
     # lea: load effective address
     # no carga datos, mas bien calcula una direción efectiva y la guarda en un registro
     # lea fuente, destino
     # fuente es una expresión de direccionamiento, no se accede a memoria, por lo que se copia la dirección que se habría usado para acceder a memoria, mas no el contenido
     mov $0x21, %al     # Interrupción0x21
     shl $2, %ax        # AX = número de interrupción * 4
     # shl: shift logical left
     # Realiza un desplazamiento lógico a la izquierda
     # Sintaxis: shl n registro
     # El desplazamiento es realizado n veces dentro del registro
     # shl $2, %ax: desplaza el registro ax dos bits a la izquierda
     # shr $2, %ax: desplaza el registro ax dos bits a la derecha
     # shr: shift logical right
     mov $ax, %di       # DI: offset dentro de IVT (interrupt vector table)
     # di: destination index
     # di es parte de los registros para acceso a memoria con instrucciones como stos, movs, etc
     # En modo real o al trabajadr con estructuras coo la IVT, %di se usa como offset dentro de un segmento (como ES:DI o DS:DI)

     mov $0x0000, 2(%di) # Desplazamiento (offset) del manejador (handler)
     sti                 # Reactiva interrupciones (set interrupt flag)

     # Forzar una interrupcion 0x21 pra probar el manejador

     jmp $ # bucle infinito
     # jmp $: es un salto incondicional a la dirección actual
     # es decir que se genera un bucle infinito en esa instrucción
     # $ representa la dirección actual del instruction pointer (IP o EIP/RIP dependiendo de la arquitectura)

# -----------------------
# Manejador personalizado
# -----------------------
manejador:
     pusha # Tambien conocida como pushad
     # empuja todos los registros de propósito general de 16 bits al stack en un orden específico.
     # pusha pertenece al conjunto x86 real y protegido, pero
     # no esta disponible en x86-64 (modo 64 bits)

     # los registros son guardados en la pila en el siguiente órden:
     # AX, CX, DX, BX, original SP, BP, SI, DI
     # el valor de SP se guarda tal y como estaba antes de pusha

     # se usa generalmente para preservar el estado de los reistros antes de una rutina que pueda modificarlos

     mov $0x0E, %ah # Función BIOS: teletipo
     mov $'X', %al # Caracter a mostrar
     int $0x10 # Mostrar 'X'

     popa # pop all: restaura los siguientes registros desde la pila
     # %di, %si, %bp, ignora %sp, %bx, %dx, %cx, %ax
     # sp no es restaurado porque su modificación directa podría corromper el estado de la pila

     iret # retorna de la interrupción
     # iret permite retornar al punto de la ejecución anterior a la interrupción
```

#### ¿Qué es la IVT?

LA interrupt vector table es una tabla en modo real de 256 entradas, que vive al inicio de la memoria RAM.

**Características**:

- Dirección: 0x0000:0000
- Tamaño: 256 vectores x 4 bytes = 1024 bytes
- Cada vector ocupa 4 byes: 2 bytes para el offset y 2 bytes para el segmento

Por ejemplo, la interrupción de 0x13 (servicios de disco del BIOS) está en:

```asm
0x13 * 4 = 0x4C # offset dentro de la ITV
```

#### ¿Qué sucede cuando ocurre una interrupción?

Cuando la interrupción ocurre (ya sea por hardware o software), el procesador guarda automáticamente en la pila:

1. El valor del registro EFLAGS (o FLAGS en 16 bits)
2. El puntero de instrucción (IP o EIP) del programa interrumpido
3. El segmento de código (CS) asociado a esa dirección

Y si la instrucción causa un cambio de privilegio (por ej: de usuario a kernel), tambien se guardan:

4. El segmento de pila (SS)
5. El puntero de pila (ESP o SP)

La instrucción `iret` revierte dicho proceso:
- Saca de la pila esos valores: `EIP`, `CS`, `EFLAGS` y opcionalmente `SS` y `ESP`
- Los restaura volviendo al contexto original
- Reanuda la ejecución justo después del punto donde ocurrió la interrupción

En 32 bits se llama `iretl` y en 64 `iretq`, `iret` corresponde a 16 bits.

#### ¿Por qué no se debe usar `pop` al finalizar un manejador?

`pop` restaura la dirección de retorno desde la pila, pero **no restaura el context ocompleto como sí lo hace `ire`**.


#### interrupción 0x80

Ésta interrupción interrumple el flujo del programa, transfiere el control al kernel de linux y le pide que realiza una operación privilegiada como:
- Salir del programa (exit)
- Leer un archivo o stdin (read)
- Escribir en stdout (write)
- Abrir/Creaer archivos (open)

**Sintaxis**

```asm
# AT&T
movl $<número_syscall>, %eax    # número de la syscall
movl $<arg1>, %ebx              # primer argumento
movl $<arg2>, %ecx              # segundo argumento
movl $<arg3>, %edx              # tercer argumento
int $0x80                       # llamada al sistema
```

**Ejemplo: salir del programa**

```asm
# AT&T
.section .text
.globl _start

_start:
    movl $1, %eax    # syscall número 1: exit
    movl $0, %ebx    # código de salida = 0
    int $0x80        # interrupción al kernel
```

#### ¿Por qué una interrupción?

El modo usuario (userland) no puede hacer cosas como acceder directamente al disco, terminar procesos, etc.. Solo el kernel, que corre en modo privilegiado (ring 0), puede hacerlo. Entonces se necesita una puerta de entrada controlada, y esa puerta es int $0x80.

#### Tabla de registros (Linux x86 - 32 bits)

`%eax`: Número de syscall
`%ebx`: Primer argumento
`%ecx`: Segundo argumento
`%edx`: Tercer argumento
`%esi`: Cuarto argumento
`%edi`: Quinto argumento
`%ebp`: Sexto argumento

Luego el valor de retorno se entrega en el registro `%eax`

#### Tabla básica de syscalls en x86 (int $0x80)

Los números de syscall están definidos en el archivo de cabecera del kernel:

`/usr/include/asm/unistd_32.h`

O en versión web: https://filippo.io/linux-syscall-table/

Los argumentos siempre siguen la convención de registros:

`%eax` = número de syscall
`%ebx`, `%ecx`, `%edx`, `%esi`, `%edi`, `%ebp` = argumentos 1 a 6

| Nº syscall | Nombre   | Descripción                         | Argumentos principales                         |
| ---------- | -------- | ----------------------------------- | ---------------------------------------------- |
| `1`        | `exit`   | Finaliza el proceso                 | `int status`                                   |
| `2`        | `fork`   | Crea un nuevo proceso (hijo)        | *(sin argumentos)*                             |
| `3`        | `read`   | Lee de un descriptor de archivo     | `int fd, void *buf, size_t count`              |
| `4`        | `write`  | Escribe en un descriptor de archivo | `int fd, const void *buf, size_t count`        |
| `5`        | `open`   | Abre un archivo                     | `const char *filename, int flags, mode`        |
| `6`        | `close`  | Cierra un descriptor de archivo     | `int fd`                                       |
| `11`       | `execve` | Ejecuta un nuevo programa           | `char *filename, char *argv[], char *envp[]`   |
| `12`       | `chdir`  | Cambia el directorio actual         | `const char *path`                             |
| `20`       | `getpid` | Obtiene el PID del proceso          | *(sin argumentos)*                             |
| `37`       | `kill`   | Envía una señal a un proceso        | `int pid, int sig`                             |
| `45`       | `brk`    | Gestiona la memoria del heap        | `void *end_data_segment`                       |
| `54`       | `ioctl`  | Control de dispositivos             | `int fd, int request, ...`                     |
| `90`       | `mmap`   | Asigna memoria                      | (6 argumentos, requiere manipulación especial) |
| `91`       | `munmap` | Libera memoria asignada con mmap    | `void *addr, size_t length`                    |


## Flags del CPU

En la arquitectura x86, los flags del procesador (también llamados banderas o indicadores) son bits de estado ubicados en el registro `EFLAGS` (en 32 bits) o `RFLAGS` (en 64 bits). Estos flags reflejan el resultado de operaciones anteriores, controlan ciertas funciones del procesador y son esenciales para decisiones de flujo de control, como los saltos condicionales.

**Características**
- Tamaño: 32 bits en x86
- Muchos de sus bits están reservados o sin uso
- Solo unos pocos son modificados por instrucciones comunes (como `add`, `sub`, `cmp`, `and`, `or`, etc.)

**Flags importantes que debes conocer**

| Nombre (bit)             | Abrev. | Descripción                                                                                           |
| ------------------------ | ------ | ----------------------------------------------------------------------------------------------------- |
| **Carry Flag** (0)       | `CF`   | Se activa si hubo acarreo/sobrepaso en una operación (útil en aritmética sin signo).                  |
| **Parity Flag** (2)      | `PF`   | Se activa si el número de bits en 1 del resultado es par. Raro que lo uses directamente.              |
| **Auxiliary Carry** (4)  | `AF`   | Acarreo entre los nibbles (bits 3 y 4), útil en BCD, poco usado actualmente.                          |
| **Zero Flag** (6)        | `ZF`   | Se activa si el resultado es cero. Muy usado en saltos condicionales (`je`, `jz`, etc.).              |
| **Sign Flag** (7)        | `SF`   | Refleja el bit más significativo (el signo) del resultado (0 = positivo, 1 = negativo).               |
| **Trap Flag** (8)        | `TF`   | Si está activo, entra en *modo paso a paso* (debug).                                                  |
| **Interrupt Enable** (9) | `IF`   | Controla si las interrupciones están permitidas.                                                      |
| **Direction Flag** (10)  | `DF`   | Indica si las operaciones de cadena (`movs`, `stos`, etc.) van de menor a mayor dirección o al revés. |
| **Overflow Flag** (11)   | `OF`   | Se activa si hubo desbordamiento aritmético con signo. Muy importante.                                |

**Cómo leer los flags**
En sistemas Linux, puedes ver el valor de EFLAGS en un core dump, en un debugger como gdb, o accediendo directamente con instrucciones como pushf / popf o lahf (carga flags en AH, aunque limitado a 8 bits de los más bajos).

**Flags y saltos condicionales**
Las instrucciones de salto condicional usan estos flags:

| Instrucción   | Condición | Relación    |
| ------------- | --------- | ----------- |
| `je` / `jz`   | ZF = 1    | Igualdad    |
| `jne` / `jnz` | ZF = 0    | Desigual    |
| `js`          | SF = 1    | Negativo    |
| `jns`         | SF = 0    | No negativo |
| `jo`          | OF = 1    | Overflow    |
| `jc`          | CF = 1    | Carry       |
| `jnc`         | CF = 0    | No Carry    |

Además, están las comparaciones con signo (`jl`, `jg`, etc.) y sin signo (`jb`, `ja`, etc.) que usan combinaciones de `SF`, `ZF`, `CF`, y `OF`.

## Instrucción `lahf` (AT&T e Intel)

La instrucción `lahf` en x86 significa Load AH from Flags, y su función es: **Cargar en el registro AH (parte alta de AX) una copia de ciertos flags del procesador.** Su inversa es `sahf`.

**¿Qué flags copia exactamente lahf?**
`lahf` copia los bits de estado bajos del registro EFLAGS (bits 0–7) al registro AH:

| Bit en `AH` | Flag     | Significado           |
| ----------- | -------- | --------------------- |
| 0           | `CF`     | Carry Flag            |
| 1           | 1 fijo   | Reservado (siempre 1) |
| 2           | `PF`     | Parity Flag           |
| 3           | no usado | (indeterminado)       |
| 4           | `AF`     | Auxiliary Carry Flag  |
| 5           | no usado | (indeterminado)       |
| 6           | `ZF`     | Zero Flag             |
| 7           | `SF`     | Sign Flag             |

No copia el Overflow Flag (OF) — eso lo puedes recuperar con otras instrucciones como `SETO`.

**Ejemplo de uso práctico en AT&T**

```asm
# AT&T
.section .text
.globl _start

_start:
    movl $0, %eax         # eax = 0
    cmpl $0, %eax         # compara eax con 0 → afecta flags
    lahf                  # copia flags a AH (parte alta de AX → parte alta de EAX también)
    
    # Extrae AH a otra parte si quieres analizar
    movzbl %ah, %ebx      # copia AH (8 bits) a ebx con ceros en los otros bits

    # Puedes ahora inspeccionar EBX para ver flags

    # Terminar programa
    movl $1, %eax         # syscall número 1 (exit)
    xorl %ebx, %ebx       # código de salida 0
    int $0x80
```

**¿Cuándo se usa `lahf`?**
- En código de compatibilidad o emulación (por ejemplo, en DOS o BIOS).
- En funciones que necesitan preservar o leer flags manualmente.
- En lenguaje ensamblador de bajo nivel donde no hay acceso directo a `EFLAGS`.

**Importante**
Ten en cuenta que lahf funciona solo en modo real o modo protegido de 16/32 bits. En modo de 64 bits, está desactivada por defecto a menos que actives la compatibilidad explícitamente.

## Instrucción `mvzbl` (AT&T)

> En sintaxis intel no existe esta instrucción. Un equivalente sería `mov destino, fuente`. 

En x86 que significa **MOVe with Zero-extend Byte to Long**.

**¿Qué hace exactamente?**
- Copia un byte (8 bits) de una fuente a un registro destino de 32 bits (un "long" en lenguaje x86), rellenando con ceros los bits más altos.
- En otras palabras, extiende el byte sin signo a 32 bits.

**Sintaxis**
`movzbl fuente, destino`
- **fuente:** registro de 8 bits o una dirección de memoria que contiene 1 byte.
- **destino:** registro de 32 bits (como %eax, %ebx, %ecx, etc.).

**Ejemplo práctico**
```asm
# AT&T
movb $0xFF, %al  # AL = 0xFF (11111111 en binario, que es 255 decimal)
movzbl %al, %ebx # EBX = 0x000000FF, el byte 0xFF se extiende a 32 bits con ceros a la izquierda
```
**El resultado:**
- `%al` tiene 8 bits: 11111111 (255 decimal)
- `%ebx` tras `movzbl` será 000000FF (255 decimal), NO FFFFFFFF (que sería con signo)

**¿Cuál es la diferencia con movsbl?**
`movzbl` extiende con ceros (para valores sin signo).
`movsbl` extiende con signo (preserva el bit más alto, útil para números negativos en complemento a dos).

## Instrucción `movsbl` (AT&T)

> En sintaxis Intel no existe esta instrucción. Un equivalente sería: `mov ecx, byte ptr [eax]`.

Significa **Move with Sign-extend Byte to Long**
Copia un byte (8 bits) a un registro de 32 bits, pero a diferencia de `movzbl`, **extiende el signo** (bit más significativo del byte) para rellenar los bits más altos del destino.

**¿Qué significa extender el signo?**

Cuando el byte original representa un número con signo en complemento a dos:
- Si el byte es positivo (bit más alto 0), rellena con ceros a la izquierda (igual que movzbl).
- Si el byte es negativo (bit más alto 1), rellena con unos a la izquierda para mantener el valor negativo al expandir a 32 bits.

**Sintaxis**
`movsbl fuente, destino`
- `fuente` registro o dirección de 8 bits.
- `destino` registro de 32 bits.

**Ejemplo**
```asm
# AT&T
movb $0xFF, %al  # AL = 0xFF (11111111 en binario, que es -1 en signed byte)
movsbl %al, %ebx # EBX = 0xFFFFFFFF (extendido con signo, es -1 en 32 bits)
```
- El byte 0xFF representa -1 (en complemento a dos).
- Al hacer `movsbl`, el valor se extiende a 32 bits preservando el signo, por eso ebx termina con 0xFFFFFFFF (que es -1 en 32 bits).

**Uso típico**
- Se usa cuando quieres trabajar con valores signed (con signo), por ejemplo, cargar un byte a entero de 32 bits para hacer operaciones con signo.
- Muy común en procesamiento de caracteres, flags, o datos donde el signo importa.

## Instrucción `LEA` (load effective address)

Calcula una dirección efectiva y la guarda en un registro, sin acceder a memoria. (Solo realiza aritmética de direcciones). No modifica ningún flag del CPU.

**Sintaxis:** `LEA dest, [base + index * scale + displacement]` donde:

| Campo          | Descripción                     |
| -------------- | ------------------------------- |
| `base`         | Registro base (opcional)        |
| `index`        | Registro índice (opcional)      |
| `scale`        | 1, 2, 4 u 8                     |
| `displacement` | Constante inmediata (8/32 bits) |

**Ejemplo**

```asm
# Intel
lea rax, [rbx + 8] # rax = rbx + 8

# Ejemplo completo
lea rax, [rbx + rcx * 4 + 16] # rax = rbx + (rcx * 4) + 16
```

**Registros permitidos**

- Destino:

  Registros generales en 8 bits: No existe `lea` en 8 bits.

  Registros generales en 16 bits: `AX`, `BX`, `CX`, `DX`, `SI`, `DI`, `BP`.

  Registros generales en 32 bits: `EAX`, `EBX`, `ECX`, `EDX`, `ESI`, `EDI`, `EBP`, `ESP`.

  Registros generales en 64 bits: `RAX`, `RBX`, `RCX`, `RDX`, `RSI`, `RDI`, `RBP`, `RSP`, `R8` al `R15`.

- Memoria:

  - `base`: cualquier GPR (registro de propósito general).
  - `index`: cualquier GPR excepto `SP`, `ESP`, `RSP`.
  - `scale`: `1, 2, 4, 8`.

**Usos comunes**

- `LEA` como aritmética rápida.

  ```asm
  # Intel
  # Suma
  lea, rax, [rax + 1] # rax += 1
  # Equivalente a inc pero sin afectar los flags del CPU
  
  # Multiplicación
  lea rax, [rcx * 8] # rax *= 8
  lea rax, [rcx + rcx * 4] # rax = rcx * 5
  
  # Expresiones complejas
  lea rax, [rdi + rsi*2 + 32] # rax = rdi + 2*rsi + 32
  ```

  **¿Por qué se prefiere a `LEA` por sobre `IMUL`?**

  - Es mas rápida y con menos latencia
  - No toca flags
  - Se ejecuta en la unidad de direcciones
  - Ideal para multiplicaciones pequeñas constantes

  **En cambio `IMUL`**

  - Es mas lenta
  - Usa la unidad de multiplicación
  - A veces modifica flags

- `LEA` vs `MOVE`

  ```asm
  # Intel
  mov rax, [rbx] # mov accesa al contenido de [rbx]
  lea rax, [rbx] # solo copia la dirección apuntada por rbx en rax sin accesar a memoria
  ```

- Uso típico con punteros y arrays

  ```asm
  # Intel
  # rdi = &array[0]
  # rcx = i
  lea rax, [rdi + rcx*8]
  # Suponiendo que los elementos son de 8 bytes
  ```

- RIP-relative addressing

  ```asm
  # Intel
  # En modo de 64 bits
  lea rax, [rel label] # Sintaxis GAS
  # rel = dirección relativa calculada desde la siguiente instrucción
  # o
  lea rax, [rip + label] # Forma real
  ```

  Tipos de rel según el tamaño del desplazamiento:

  - `rel8`: desplazamiento con 7 bits con signo (rango de `-127` a `+127`).

  - `rel32`: desplazamiento con 32 bits con signo (rango ≈ ±2 GB)

    ```asm
    ;Intel
    jmp label # rel32 (lo normal)
    ```

  En x86-64 no existe `rel64` para saltos. los saltos siguen siendo `rel8` o `rel32`. 

## Instrucciones lógicas

También conocidas como instrucciones bit a bit u operaciones bitwise. Son operaciones que trabajan a nivel de bits entre registros, memoria o valores inmediatos. Se usan para manipular bits directamente y para operaciones lógicas básicas que son muy comunes en programación de bajo nivel.

**Principales instrucciones lógicas en x86**

| Instrucción | Descripción                                                  |
| ----------- | ------------------------------------------------------------ |
| `AND`       | Realiza una operación lógica **AND** bit a bit.              |
| `OR`        | Realiza una operación lógica **OR** bit a bit.               |
| `XOR`       | Realiza una operación lógica **XOR** (o exclusivo) bit a bit. |
| `NOT`       | Realiza una operación lógica **NOT** (complemento) bit a bit. |
| `SHL`       | Desplazamiento lógico a la izquierda.                        |
| `SAL`       | Desplazamiento lógico a la izquierda. Originalmente para operaciones aritméticas con números con signo, aunque en el X86 moderno son es idéntica a `SHL`. |
| `SHR`       | Desplazamiento lógico a la derecha.                          |
| `SAR`       | Desplazamiento lógico a la derecha preservando el signo.     |
| `ROL`       | Rotación a la izquierda (circular).                          |
| `ROR`       | Rotación a la derecha (circular).                            |
| `RCL`       | Rotación a la izquierda incluyendo acarreo.                  |
| `RCR`       | Rotación a la derecha incluyendo acarreo.                    |
| `BT`        | Prueba un bit específico.                                    |
| `BTS`       | Setea un bit específico.                                     |
| `BTR`       | Resetea un bit específico.                                   |
| `BTC`       | Complementa un bit específico.                               |
| `TEST`      | Realiza un `AND` entre dos operandos sin guardar el resultado, afectando solamente a los flags del CPU. |
| `CMP`       | Realiza una resta entre dos operandos sin guardar el resultado, afectando solamente a los flags del CPU. |

**¿Qué hacen?**

- `AND` Cada bit del resultado es 1 solo si ambos bits correspondientes de los operandos son 1# sino 0.
- `OR` Cada bit del resultado es 1 si al menos uno de los bits correspondientes es 1.
- `XOR` Cada bit del resultado es 1 solo si los bits correspondientes son diferentes.
- `NOT` Invierte todos los bits (0 → 1, 1 → 0) del operando.

**Ejemplo sencillo**
```asm
# 1100: 12
# 1010: 10

# AT&T
movl $0b1100, %eax   # eax = 1100 binario (decimal 12)
andl $0b1010, %eax   # eax = eax AND 1010 binario = 1000 binario (decimal 8)

# Intel
mov eax, 12 # Intel no tiene un literal binario, para este caso se uso el decimal
# Pero se pueden usar tambien octales y hexadecimales
and eax, 10
```
Aquí `eax` pasa de 1100 a 1000 porque solo el bit que está en ambas posiciones como 1 queda en 1.

**Instrucciones inválidas**

Dado que las instrucciones tienen una fuente y un destino es inválido lo siguiente:

```asm
# 1100: 12
# 1000: 8

# AT&T
andl $0b1100, $0b1000
andl 1100, 1000 

# Intel
and 12, 8
and dword ptr [1000], dword ptr [1100]
```

No se permiten:

- `OP inmediato, inmediato`
- `OP memoria, memoria`

**¿Para qué se usan?**

- Enmascarar bits (usar AND para “apagar” bits no deseados)
- Encender bits específicos (usar OR para “prender” bits)
- Invertir bits (NOT)
- Comprobar cambios o diferencias en bits (XOR)
- Control de flags y lógica en condiciones
- Cálculos rápidos a nivel binario

## Instrucción `AND`

Operación lógica bit a bit que se usa para enmascarar bits, limpiar valores y probar condiciones a nivel binario.

**Sintaxis:** `and destino, fuente`

**Ejemplo**

```asm
# AT&T
# Supongamos que queremos hacer AND entre dos registros
movl $0xF0F0F0F0, %eax   # Carga el valor 0xF0F0F0F0 en eax
movl $0x0FF00FF0, %ebx   # Carga el valor 0x0FF00FF0 en ebx
andl %ebx, %eax          # Realiza AND bit a bit entre eax y ebx, resultado queda en eax

# Intel
mov eax, 0xF0F0F0F0
mov eabx, 0x0FF00FF0
and eax, ebx
```
**Explicación**
- `andl %ebx, %eax` significa: `eax = eax & ebx` (bit a bit)
- El sufijo l indica operación de 32 bits (long).

**Valores en binario (32 bits)**
| Registro | Valor Hexadecimal | Valor binario (32 bits)             |
| -------- | ----------------- | ----------------------------------- |
| `%eax`   | 0xF0F0F0F0        | 11110000 11110000 11110000 11110000 |
| `%ebx`   | 0x0FF00FF0        | 00001111 11110000 00001111 11110000 |

**Operación AND bit a bit (byte por byte)**
| Byte         | `%eax`   | `%ebx`   | Resultado AND | Resultado AND (hex) |
| ------------ | -------- | -------- | ------------- | ------------------- |
| Byte 3 (MSB) | 11110000 | 00001111 | 00000000      | 0x00                |
| Byte 2       | 11110000 | 11110000 | 11110000      | 0xF0                |
| Byte 1       | 11110000 | 00001111 | 00000000      | 0x00                |
| Byte 0 (LSB) | 11110000 | 11110000 | 11110000      | 0xF0                |

**Resultado final**
Concatenando bytes (de MSB a LSB)

```
0x00 (Byte 3) | 0xF0 (Byte 2) | 0x00 (Byte 1) | 0xF0 (Byte 0)
```
O sea: `0x00F000F0`
Entonces, después del `andl %ebx, %eax`, `%eax` queda con el valor: `eax = 0x00F000F0`

#### Flags afectados por AND

- ZF (Zero Flag):
Se pone a 1 si el resultado es cero (todos los bits del resultado son 0).
Ejemplo: si `eax & 0xFF` da 0, entonces ZF = 1.
- SF (Sign Flag):
Indica el signo del resultado (bit más alto del resultado).
Si el bit más significativo es 1, SF = 1 (resultado negativo si es valor con signo).
- PF (Parity Flag):
Se activa si el número de bits a 1 en el resultado es par.
- CF (Carry Flag):
Siempre se limpia (CF = 0) después de un `and`. (Puesto que `and` no genera acarreos).
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `and`. (Puesto que `and` no genera overflow).

**Resumen**

| Flag | Efecto con `and`         |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

## Instrucción `OR`

Operación lógica bit a bit que se usa principalmente para activar bits, combinar flags y forzar estados sin perder los bits ya activos.

**Sintaxis:** `or destino, fuente`

**Ejemplo**

```asm
# AT&T
movl $0x0F0F0F0F, %eax   # Carga el valor 0x0F0F0F0F en eax
movl $0x00FF00FF, %ebx   # Carga el valor 0x00FF00FF en ebx
orl %ebx, %eax           # Realiza OR bit a bit entre eax y ebx, resultado queda en eax

# Intel
mov eax, 0x0F0F0F0F
mov ebx, 0x0F0F0F0F
or eax, ebx
```
Esto hace que en `%eax` queden los bits que estaban en `%eax` o en `%ebx` (operación OR bit a bit) (`eax = eax | ebx`).

**Valores en binario (32 bits)**
| Registro | Valor Hexadecimal | Valor binario (32 bits)             |
| -------- | ----------------- | ----------------------------------- |
| `%eax`   | 0x0F0F0F0F        | 00001111 00001111 00001111 00001111 |
| `%ebx`   | 0x00FF00FF        | 00000000 11111111 00000000 11111111 |

**Operación OR bit a bit (por cada byte)**
| Byte         | `%eax` (binario) | `%ebx` (binario) | Resultado OR (binario) | Resultado OR (hex) |
| ------------ | ---------------- | ---------------- | ---------------------- | ------------------ |
| Byte 3 (MSB) | 00001111         | 00000000         | 00001111               | 0x0F               |
| Byte 2       | 00001111         | 11111111         | 11111111               | 0xFF               |
| Byte 1       | 00001111         | 00000000         | 00001111               | 0x0F               |
| Byte 0 (LSB) | 00001111         | 11111111         | 11111111               | 0xFF               |

**Resultado final**
Concatenando los bytes:
```
0x0F (Byte 3) | 0xFF (Byte 2) | 0x0F (Byte 1) | 0xFF (Byte 0)
```
Esto es `0x0FFF0FFF`

Entonces, tras el `orl %ebx, %eax`: `eax = 0x0FFF0FFF`

#### Flags afectados por OR

- ZF (Zero Flag):
Se pone a 1 si el resultado es cero (todos los bits del resultado son 0).
- SF (Sign Flag):
Indica el signo del resultado (bit más alto del resultado).
- PF (Parity Flag):
Se activa si la cantidad de bits a 1 en el resultado es par.
- CF (Carry Flag):
Siempre se limpia (CF = 0) después de un `or`. (Puesto que `or` no genera acarreos).
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `or`. (Puesto que `or` no genera overflow).

**Resumen**

| Flag | Efecto con `or`          |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

## Instrucción `XOR`

Operación lógica bit a bit muy especial porque alterna bits y, además, tiene usos "hacky" clásicos en bajo nivel, reversing y optimización.

**Sintaxis:** `xor destino, fuente`

**Ejemplo**

```asm
# ATT&T
movl $0xFF00FF00, %eax    # Carga 0xFF00FF00 en eax
movl $0x0F0F0F0F, %ebx    # Carga 0x0F0F0F0F en ebx
xorl %ebx, %eax           # Hace XOR bit a bit entre eax y ebx, resultado en eax

# Intel
mov eax, 0xFF00FF00
mov ebx, 0x0F0F0F0F
xor eax, ebx
```
La instrucción `xorl %ebx, %eax` hace que `%eax` sea `%eax` XOR `%ebx`. (`eax = eax ^ ebx`).

**Valores en binario (32 bits)**
| Registro | Valor Hexadecimal | Valor binario (32 bits)             |
| -------- | ----------------- | ----------------------------------- |
| `%eax`   | 0xFF00FF00        | 11111111 00000000 11111111 00000000 |
| `%ebx`   | 0x0F0F0F0F        | 00001111 00001111 00001111 00001111 |

**Operación XOR bit a bit (byte por byte)**
| Byte         | `%eax` (binario) | `%ebx` (binario) | Resultado XOR (binario) | Resultado XOR (hex) |
| ------------ | ---------------- | ---------------- | ----------------------- | ------------------- |
| Byte 3 (MSB) | 11111111         | 00001111         | 11110000                | 0xF0                |
| Byte 2       | 00000000         | 00001111         | 00001111                | 0x0F                |
| Byte 1       | 11111111         | 00001111         | 11110000                | 0xF0                |
| Byte 0 (LSB) | 00000000         | 00001111         | 00001111                | 0x0F                |

**Resultado final**
Concatenando bytes (MSB a LSB):
```
0xF0 (Byte 3) | 0x0F (Byte 2) | 0xF0 (Byte 1) | 0x0F (Byte 0)
```
O sea: `0xF00FF00F`
Entonces, después de `xorl %ebx, %eax`: `eax = 0xF00FF00F`


#### Flags afectados por XOR

- ZF (Zero Flag):
Se pone a 1 si el resultado es cero (todos los bits son 0).
- SF (Sign Flag):
Indica el signo del resultado (bit más alto).
- PF (Parity Flag):
Se activa si el número de bits a 1 en el resultado es par.
- CF (Carry Flag):
Siempre se limpia (CF = 0) después de un `xor`. (Puesto que `xor` no genera acarreo).
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `xor`. (Puesto que `xor` no genera overflow).

**Resumen**

| Flag | Efecto con `xor`         |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

## Instrucción `NOT`

Operación lógica mas simple, invierte bits y no toca ningún flag.

**Sintaxis:** `not operando`

**Ejemplo**

```asm
# AT&T
movl $0x0F0F0F0F, %eax   # Carga un valor en eax
notl %eax                # Aplica la negación bit a bit (NOT) sobre eax

# Intel
mov eax, 0x0F0F0F0F
not eax
```
`notl %eax` hace un complemento a uno: cada bit de `%eax` se invierte (0 → 1, 1 → 0) (`eax = ~eax`).

**Valor inicial en binario (32 bits)**
| Registro | Valor Hexadecimal | Valor binario (32 bits)             |
| -------- | ----------------- | ----------------------------------- |
| `%eax`   | 0x0F0F0F0F        | 00001111 00001111 00001111 00001111 |

**Operación NOT (complemento bit a bit)**
NOT invierte cada bit, es decir:
- Los 0 pasan a 1
- Los 1 pasan a 0

| Bit original | 0 0 0 0 1 1 1 1 | Resultado NOT | 1 1 1 1 0 0 0 0 |
| ------------ | --------------- | ------------- | --------------- |
| Byte 3       | 00001111        | NOT           | 11110000        |
| Byte 2       | 00001111        | NOT           | 11110000        |
| Byte 1       | 00001111        | NOT           | 11110000        |
| Byte 0       | 00001111        | NOT           | 11110000        |

**Resultado final**
Concatenando bytes (MSB a LSB): ```11110000 11110000 11110000 11110000```
Que en hexadecimal es: `0xF0F0F0F0`
Entonces, después de ejecutar `notl %eax`, el valor de `%eax` será: `eax = 0xF0F0F0F0`

#### Flags afectados por NOT

- `not` es una operación de complemento bit a bit (bitwise NOT), que invierte todos los bits del operando.

**Importante:**
La instrucción `not` **no modifica** ningún flag en el procesador. Todos los flags permanecen igual después de ejecutar `not`. Tampoco genera acarreo u overflow. A pesar de que si involucra a la ALU (unidad )

**Resumen**
| Flag | Efecto con `not` |
| ---- | ---------------- |
| ZF   | No cambia        |
| SF   | No cambia        |
| PF   | No cambia        |
| CF   | No cambia        |
| OF   | No cambia        |

Por lo tanto si necesitas invertir bits pero conservar el estado de los flags para operaciones condicionales posteriores, not es adecuado porque no altera los flags.

## Instrucción `SHL` (shift logical left)

Desplaza todos los bits de un operando hacia la izquierda un número específico de posiciones. Los bits que salen por la izquierda se pierden. Los bits que ingresan por la derecha son rellenados con ceros.

**Sintaxis**

```asm
# Intel
shl destino, cantidad
# Cantidad empieza en 1

# Ejemplos
mov al, 0x03 # al = 0000 0011b
shl al, 1    # al = 0000 0110b (multiplicado por 2)
shl al, 2    # al = 0001 1000b (múltiplicado por 4)
```

**Efectos sobre los flags**

| Flag               | Descripción                                                  |
| ------------------ | ------------------------------------------------------------ |
| CF (Carry Flag)    | Se establece con el último bit desplazado hacia afuera (el que “se perdió” por la izquierda). |
| OF (Overflow Flag) | Solo se actualiza si el desplazamiento es **1 bit**# indica si el resultado cambió el signo. |
| SF (Sign Flag)     | Indica el bit más significativo del resultado (0=positivo, 1=negativo). |
| ZF (Zero Flag)     | 1 si el resultado es 0.                                      |
| PF (Parity Flag)   | 1 si el número de bits 1 en el resultado es par.             |

**Usos títpico**

1. Multiplicación rápida por 2

   ```asm
   shl eax, 1 # eax *= 2
   shl eax, 2 # eax *= 4
   ```

2. Manipulación de bits

   Encender o mover bits hacia la izquierda

   ```asm
   mov al, 0x01 # al = 0000 0001b
   shl al, 3    # al = 0000 1000b
   ```

3. Preparar máscaras o índices

   Desplazamientos para ajustar posiciones de bits en flags, máscaras o estructuras de datos.

   ```asm
   mov al, 0x01 # al = 0000 0001b
   shl al, 1    # al = 0000 0010b (0x02) se desplaza 1 bit a la izquierda
   ```

Casos especiales y advertencias

- Si cantidad = 0, el resultado no cambia y los flags CF y OF no se modifican.

  ```asm
  # Ejemplo
  mov al, 0x01 # al = 0000 0001b
  shl al, 0    # al = 0000 0001b CF y OF permanecen intactos.
  ```

  - `SHL` genera acarreo porque expulsa bits por la izquierda. El flag CF captura el último bit que sale por la izquierda.
  - También puede generar overflow pero solamente cuando la cantidad de bits desplazada es 1. Para `cantidad > 1` en x86 el flag OF no tiene un valor definido y no se puede confiar en el.
  - `SHL` genera overflow porque puede cambiar el signo del número (que originalmente tenía signo) cuando se desplaza 1 bit.

- Desplazar más bits que el tamaño del registro tiene un comportamiento indefinido.

- `SHL` solo modifica los bits del operando, no toca la memoria adyacente ni extiende más allá del tamaño del registro.

Paso a paso en un desplazamiento de 4 bits a la izquierda

```asm
# Intel
mov al, 0xDA # al = 1101 1010b
shl al, 4    # al = 1010 0000b

# inmediato original 1101 1010b 
# Salida de bits por la izquierda
Paso 1: [1] 1011 010- # Sale un bit 1# CF: 1
Paso 2: [1] 0110 10-- # Sale un bit 1# CF: 1# CF anterior: 1
Paso 3: [0] 1101 0--- # Sale un bit 0# CF: 0# CF anterior 1 
Paso 4: [1] 1010 ---- # Sale un bit 1# CF: 1# CF anterior 0

# Entrada de bits en 0 por la derecha
Paso 1: 1011 010[0] # Entra un 0 por la derecha
Paso 2: 0110 10[00] # Entra un 0 por la derecha
Paso 3: 1101 0[000] # Entra un 0 por la derecha
Paso 4: 1010 [0000] # Entra un 0 por la derecha

# CF: 1 (el último bit que salio por la izquierda)
# ZF: 0 (resultado distinto de 0)
# OF ignorado por ser un desplazamiento de > 1 bit
# MSB: [1]010 0000b (delimitado como [x])
```

Paso a paso en un desplazamiento de 1 bits a la izquierda

```asm
# Intel
mov al, 0xDA # al = 1101 1010b
shl al, 1    # al = 1011 01000b

# ZF: 0 (resultado distinto de 0)
# OF: 0 (ver fórmula mas abajo)
# CF: 1 (el último bit que salió por la izquierda)
# MSB: [1]011 01000b (delimitado como [x])
```

**Cálculo del flag OF en desplazamientos de 1 bit**

Formula: `OF = nuevo MSB ⊕ CF` (`XOR( nuevo MSB, CF )`)

El overflow flag (OF) se calcula con un xor del nuevo msb y el CF.

**Tabla de verdad para XOR**

| A    | B    | A XOR B |
| ---- | ---- | ------- |
| 0    | 0    | 0       |
| 0    | 1    | 1       |
| 1    | 0    | 1       |
| 1    | 1    | 0       |

## Instrucción `SAL` (shift arithmetic left)

Desplaza todos los bits de un operando hacia la izquierda, igual que SHL. En la práctica moderna de x86, `SAL` y `SHL` son exactamente iguales.

Históricamente  `SAL` existió para operaciones aritméticas con signo, pero actualmente el procesador trata ambas operaciones por igual, cambiando solo la semántica conceptual. Por lo que **solo usas `SAL` para enfatizar que estás operando sobre un signed integer**.

**Ejemplo**

Multiplicación rápida de enteros con signo.

```asm
sal eax, 1# eax *= 2
```

## Operación `SHR` (shift logical right)

Desplaza todos los bits del operando hacia la derecha. Los bits que ingresan por la izquierda se rellenan con ceros sin importar el signo, y los que salen por la derecha se pierden.
El desplazamiento a la derecha corresponde con una división por potencia de dos (para enteros sin signo).

**Sintaxis:** `shr destino, cantidad`

**Ejemplo**

```asm
# Intel
mov al, 0xDO # al = 1101 0000b
shr al, 1    # al = 0110 1000b (Se dividió al en 2)
shr al, 2    # al = 0011 0111b
```

**Efectos sobre los flags del CPU**

| Flag | Qué indica                                                   |
| ---- | ------------------------------------------------------------ |
| CF   | Último bit desplazado hacia afuera (bit menos significativo, LSB) |
| OF   | Solo se modifica si cantidad = 1: indica si el MSB cambió (para números signed, pero SHR = lógico) |
| SF   | Signo del resultado (MSB)                                    |
| ZF   | 1 si resultado = 0                                           |
| PF   | Paridad de bits 1 en resultado                               |

**Importante**

- `SHR` no preserva el signo. Para signed integers, se usaría `SAR` (shift arithmetic right).
- El flag CF captura el bit que se pierde por la derecha (LSB).

**Usos típicos de `SHR`**

1. División rápida por potencias de dos (para enteros sin signo).

   ```asm
   # Intel
   shr eax, 1 # eax /= 2
   shr eax, 3 # eax /= 8
   ```

2. Manipulación de bits:

   Se utiliza para extraer ciertos bits hacia la posición LSB.

   ```asm
   # Intel
   mov al, 0xAC # al = 1010 1100b
   shr al, 4    # al = 0000 1010b
   # Ingresaron 4 bits por la izquierda en cero, y se perdieron 4 bits por la derecha
   # CF: Contiene el último bit perdido por la derecha, un 1
   # ZF: 0# El resultado es distinto a 0
   # OF: Ignorado (solo se toma en cuenta para desplazamientos de 1 bit)
   # SF: 0 (MSB del resultado)
   ```
   
   Paso a paso en la salida de bits por la derecha
   
   ```asm
   # Inmediato original: 1010 1100
   Paso 1: -101 0110   # Bit que sale: 0# CF: 0
   Paso 2: --10 1011   # Bit que sale: 0# CF: 0# CF anterior: 0
   Paso 3: ---1 0101   # Bit que sale: 1# CF: 1# CF anterior: 0
   Paso 4: ---- 1010   # Bit que sale: 1# CF: 1# CF anterior: 1
   ```
   
   Paso a paso en la entrada de bits por la izquierda
   
   ```asm
   # Inmediato original: 1010 1100
   Paso 1: [0]101 0110 # Entra un bit puesto a 0 por la izquierda
   Paso 2: [00]10 1011 # Entra un bit puesto a 0 por la izquierda
   Paso 3: [000]1 0101 # Entra un bit puesto a 0 por la izquierda
   Paso 4: [0000] 1010 # Entra un bit puesto a 0 por la izquierda
   ```
   
   Desplazamientos de 1 bit
   
   Ahora se verá como opera el flag OF en desplazamientos de 1 bit a la derecha.
   
   ```asm
   # Intel
   mov al, 0x80 # al = 1000 0000b
   shr al, 1    # Desplaza 1 bit a la derecha
   # al = 0100 0000b
   # Bit que sale por la derecha: 0
   # Bit que entra por la izquierda# 0
   # CF: 0
   # SF: 0 (MSB del resultado despues de aplicar shr)
   # ZF: 0 (resultado distinto a 0)
   # OF: 1 (MSB original antes de aplicar shr)
   # MSB (resultado): [0]100 0000b (delimitado como [x])
   ```

## Instrucción `SAR` (shift arithmetic right)

Desplaza un operando a la derecha manteniendo el signo del número original (bit MSB), evitando así que se reemplace por cero (preservándolo en enteros con signo). Los bits que salen por la derecha se pierden. Y el último bit desplazado se almacena en el flag CF.

**Sintaxis:** `SAR destino, cantidad`

**Ejemplo**

```asm
# Intel
sar al, 1  # desplaza 1 bit a la derecha en registro al
sar eax, 3 # desplaza 3 bits a la derecha en registro eax

# Ejemplo con 8 bits (signed)
mov al, 0xF4 # al = 1111 0100b# -12 en signed 8-bit (complemento a dos)
sar al, 1

# al = 1111 0100b
# Corrimiento de 1 bit a la derecha
Paso 1: -111 1010 # Sale bit 0 por la derecha# CF: 0
Paso 2: [1]111 1010 # Se replica el bit MSB preservando el signo (8-bit signed)
# Paso 1 y 2 ocurren en la misma operación (tratándose de un corrimiento de solo 1 bit)
# CF: 0
# OF: Reseteado a cero (el desplazamiento aritmético no ocasiona overflow)
# ZF: 0 (resultado distinto a cero)
# SF: 1 (MSB dle resultado)
```

**Efecto sobre los flags del CPU**

| Flag | Comportamiento                                               |
| ---- | ------------------------------------------------------------ |
| CF   | Se pone con el último bit desplazado (bit que “sale” por la derecha). |
| OF   | Se **resetea** a 0 en SAR (porque el desplazamiento aritmético no puede causar overflow). |
| SF   | Se actualiza según el nuevo MSB (signo del resultado).       |
| ZF   | Se actualiza si el resultado es cero.                        |
| PF   | Se actualiza según la paridad del resultado (pares de 1’s).  |
| AF   | No afectado.                                                 |

## Instrucción `TEST`

Realiza una operación `AND` a nivel de bits, pero **no guarda el resultado**. Tiene por finalidad el consultar cosas al CPU como: ¿el valor es cero?, ¿está encendido cierto bit?, ¿el valor es negativo (signed)?, ¿un flag lógico se cumple sin destruir el registro?, etc. Es una instrucción de control, no de cálculo.

**Sintaxis:** `test op1, op2`

**Ejemplo**

```asm
# Intel
mov al, 0x1 # al = 0000 0001b
test al, 0x1 # No se almacena ningún resultado en al
# 0000 0001
# 0000 0001
# --------- (AND)
# 0000 0001 (resultado interno)
# ZF: 0 (resultado es distinto de 0)
# SF: 0 (MSB del resultado interno)
# PF: 0 (nro. de bits 1: 1 (impar))
```

**Flags del CPU afectados por `TEST`**

| Flag   | Estado                              |
| ------ | ----------------------------------- |
| **ZF** | Se activa si `(op1 & op2) == 0`     |
| **SF** | Copia el MSB del resultado          |
| **PF** | Paridad del byte bajo del resultado |

**Flags del CPU que siempre limpia**

| Flag   | Valor |
| ------ | ----- |
| **CF** | 0     |
| **OF** | 0     |

Flags del CPU indefinidos

| Flag   | Valor |
| ------ | ----- |
| **AF** | Indefinido (no usado)     |

`Test` nunca genera acarreo ni overflow, porque no hay suma ni resta, solo lógica. 

## Instrucción `CMP` (compare)

Realiza una comparación entre dos operando, restando internamente el segundo del primero sin almacenar el resultado. Se usa únicamente para actualizar los flags del CPU. Afecta principalmente a **ZF** (si el resultado es cero, los operandos son iguales), **CF** (si hubo acarreo, indicando comparación unsigned) y **OF** (si ocurrió overlow en una comparación signed)). De esta forma, `CMP` permite que las instrucciones de saldo condicional tomen decisiones basadas en comparaciones tanto con signo como sin signo, actuando conceptualmente como una resta fantasma orientada al control de flujo.

**Sintaxis:** `CMP op1, op2`

**Ejemplo**

```asm
# Intel

# Igualdad
mov al, 5 # al = 0000 0101b
cmp al, 5 # Se compara 5 - 5 (no se guarda el resultado)

# Resultado conceptual: 0
# ZF: 1 (resultado es cero)
# SF: 0
# CF: 0
# OF: 0

# Desigualdad
mov al, 3 # al = 0000 0011b
cmp al, 5 # Se compara 3 - 5

# Resultado conceptual: -2 (0000 0010b)
# ZF: 0 (resultado es distinto de cero)
# SF: 1 (resultado negativo)
# CF: 1 (borrow en 3 < 5 en unsigned)
# OF: 0
```

**Borrow (préstamo) en la resta binaria**

El acarreo o préstamo (en inglés ***borrow***) ocurre cuando no hay suficientes bits para restar, y por lo tanto se debe pedir prestado al bit mas significativo. En x86 dicho borrow se refleja en el flag CF (Carry Flag) cuanod se realiza una resta o un CMP.

Cuando `CF = 1`, el minuendo era menor que el sustraendo (en unsigned).

```asm
# Intel
mov al, 3 # 0000 0011b
cmp al, 5 # 0000 0101b

# Internamente se hace lo siguiente
# AL - 5 -> 3 - 5
```

**Resta binaria (8 bits)**

Es la operación de restar dos números representados en base 2, bit a bit, de derecha a izquierda, igual que en decimal.

**Reglas básicas:**

```
0 - 0 = 0
1 - 0 = 1
1 - 1 = 0
0 - 1 = ? (No se puede, entonces ocurre un préstamo o borrow)
```

Como el 0 no tiene, se transforma en 1 (borrow), lo que equivale a 2 en decimal (aludiéndo conceptualmente a 0b10 = 2). Por lo que la resta se transforma en:

```
10 - 1 = 1
```

Con lo que CF indica que hubo préstamo o borrow en la resta binaria.

**Paralelismo con la resta decimal**

```
  20
-  7
  --
```

Como no puedes restar 7 a 0, se transforma en 10 pidiéndole prestado un 1 al 2 de al lado. O mejor dicho, se transforma en 1, y decimos que es 1 equivale a 10. Lo que se conoce como préstamo. Por lo que la operación unaria queda como:

```
10 - 7 = 3

  20     11
-  7      7
  -- ->  --
   3     13
```

Otra vez, estableciendo un paralelismo con respecto a la suma binaria en x86, decimos que hubo préstamo o borrow y que por lo tanto el flag CF se establece en 1.

**Propagación del préstamo a la izquierda**

Nótece que el bit en la posición 3 (de derecha a izquierda)  del minuendo está en 0. Como el bit de la posición 4 también está en 0, al producirse el préstamo o borrow, éste se propaga hasta el bit en la posición 8, el préstamo sale afuera del registro y el CPU enciende el flag `CF = 1`.

```asm
  0000 0011 (3) (minuendo)
- 0000 0101 (5) (sustraendo)
  ---------
  1111 1110 (-2 en signed)

# ¿Cómo quedaría los flags del CPU?
# SF: 1 (MSB 1)
# ZF: 0 (resultado distinto de cero)
```

Para restar `1 - 1`, `0 - 0`, etc, el CPU debe pedir prestado desde un bit que no existe, esto es un préstamo y se le conoce como borrow.

**Nota:** En x86 `CF = 1` indica borrow en restas y carry en sumas.

**Flags del CPU que modifica `CMP**`

| Flag   | Qué indica tras `op1 - op2`    |
| ------ | ------------------------------ |
| **ZF** | Resultado = 0 (op1 == op2)     |
| **SF** | Bit de signo del resultado     |
| **CF** | Borrow (op1 < op2 en unsigned) |
| **OF** | Overflow signed                |
| **PF** | Paridad del byte bajo          |
| **AF** | Borrow entre bit 3 ↔ 4         |

**¿Como se calcula el flag `OF` del CPU para `CMP`?**

`OF` no depende del resultado final solamente, depende de los signos de los operandos y del resultado.
`OF` es 1 si:

- `op1` y `op2` tienen signos distintos.
- Y el signo del resultado es distinto al signo de `op1`.

**Fórmula:** `OF = (sign(op1) ≠ sign(op2)) AND (sign(resultado) ≠ sign(op1))`

**Paso a paso**

```asm
# Elementos
op1 = 0000 0011 (3)
op2 = 0000 0101 (5)
r   = 1111 1110 (-2 en signed)

# Signos de los elementos
sign(op1): 0
sign(op2): 0
sign(r):   1

# Cálculo del flag OF
OF = (0 ≠ 0) AND (1 ≠ 0)
# Interpretación
0 ≠ 0: false
1 ≠ 0: true
false AND true: false
OF = 0
```

## Instrucción `CLC` (clear carry flag)

Setea el flag `CF` (carry flag) en cero sin afectar otro flag del CPU. No usa operandos y usa 1 µop (una microoperación), por lo que es muy económica.

**Ejemplo**

```asm
# Intel
# Suma con overflow 
mov al, 0xFF # al = 255
add al, 1    # 255 + 1 = 256 → al = 0, CF = 1 (ocurrió overflow)
# Operación posterior a la suma
mov bl, 0
adc bl, 5    # bl = bl + 5 + CF
# Si no se limpia CF y CF = 1, bl quedará en 6 y no en 5
# Corrección
mov bl, 0
clc          # limpia CF dejándolo en 0
adc bl, 5    # bl = bl + 5 + 0 (CF = 0)
```

**Usos comunes para `CLC`**

- Inicializar operaciones aritméticas multiprecisión

  Cuando sumas números que ocupan más de un registro, `ADC` propaga el carry. Antes de la primera suma, se limpia CF.

  ```asm
  # Intel
  clc          # CF = 0
  add rax, rbx # suma la parte baja
  adc rdx, rcx # suma la parte alta + carry
  ```

- Garantizar resultados correctos en `ADC` o `SBB`

  Cualquier instrucción que use `CF` como entrada requiere de `CLC`.

  ```asm
  # Intel
  clc
  adc rax, rbx # asegura que no hay carry previo
  ```

- Preparar rotaciones a través del carry

  `RCL` Rotate through carry left

  `RCR` Rotate through carry right

  ```asm
  # Intel
  clc
  rcl al, 1 # rota AL un bit a la izquierda a través de CF
  ```

  Si `CF` no se limpia, entra un bit basura en la rotación.

- Preparación antes de multiplicaciones o divisiones que no usan `CF`

  Algunos algoritmos de software usan `CF` para flags temporales. `CLC` asegura un estado conocido antes de empezar.

- Optimización micro-arquitectural (menos común)

  En CPUs modernos, limpiar `CF` explícitamente puede romper dependencias falsas de `CF` de instrucciones anteriores, permitiendo que el pipeline se ejecute más rápido.

## Instrucción `STC` (set carry flag)

Setea el flag `CF` (carry falg) en uno. No afecta ningún otro flag del CPU, tampoco requiere operandos y es muy barata a nivel de ejecución.

**Ejemplo**

```asm
# Intel
mov al, 10 # al = 10 (0000 1010b)
mov bl, 5  # bl = 5 (0000 0101b)
stc        # Fuerza CF = 1
# Resta bl de al, considerando el borrow 
sbb al, bl # al = al - bl - CF
# Resultado
# al = 10 - 5 - 1 = 4
# stc inicializó CF y afectó la resta
```

**Usos de `STC`:**

- Preparar operaciones con `SBB`. A veces quieres empezar con CF = 1.

- Preparar rotaciones a través del carry.

  ```asm
  # Intel
  stc
  rcr al, 1 # rota al un bit a la derecha a través de CF = 1
  ```

- Inicializar CF para pruebas o flags

  A veces en algoritmos de bajo nivel quieres forzra `CF` a 1 para luego usar saltos condicionales (`JC/JNC`) o loops de bitmask.

- Comparaciones con `CF`

  Si usas `ADC` o `SBB` en cadenas de operaciones, `STC` te permite agregar un 1 inicial. Útil en sumas/restas con borrow/carry predefinido.

  ```asm
  # Intel
  stc
  adc rax, rbx # suma con CF = 1 inicial
  ```

## Instrucción `CMC` (complement carry flag)

Invierte el flag `CF` del CPU en el registro de estado (EFLAGS/RFLAGS). Si `CF` estaba en cero, después de ejecutar `CMC` queda en uno y viceversa. No afecta otros flags.

**Ejemplo**

```asm
# Intel
# CF = 0 inicialmente
cmc        # CF ahora es uno
adc al, bl # suma con acarreo, usando el nuevo valor de CF
# al = al + bl + CF
```

Invirtiendo `CF` con `CMC` podemos forzar que la suma incluya o ignore el carry anterior según convenga.

**Usos comunes de `CMC`**

- Ajuste rápido de `CF`.

  `CMC` se usa para invertir el carry antes de instrucciones como `ADC` o `SBB`.

- Aritmética de precisión múltiple.
  En operaciones de big integers (mas grandes que 64 bits) o en cripto, cada palabra (32/64 bits) se suma/resta con carry. `CMC` permite alternar el carry de manera rápida sin afectar a otros flags. 

- Optimización de código.

  Algunos compiladores y código crítico de rendimiento lo usan para manipular flags sin instrucciones condicionales (`JNC`, `JC`) que podrían introducir saltos. Evita instrucciones adicionales como `STC` o `CLC` cuando simplemente necesitas invertir `CF`.

- Implementación de operaciones de complemento.

  Al hacer operaciones de negación o complemento de números en ensamblador, `CMC` puede formar parte de la secuencia.

- Implementación de operaciones de complemento.

  Al ahcer operaciones de negación o complemento de números en ensamblador, `CMC` puede formar parte de la secuencia.

  ```asm
  # Intel
  # Negar un número (equivalente a -num)
  not al     # complementa todos los bits
  cmc        # complementa el carry para sbb
  sbb al, al # resultado final -al
  ```

  Este patrón se ve en rutinas de aritmética de bajo nivel o en rutinas de bootloader/firmware donde cada ciclo cuenta.

## Instrucción `SUB` (substract)

Realiza una resta aritmética binaria sobre dos operandos. (Internamente usa la ALU del CPU). Almacena el resultado en el operando destino. Y al igual que `CMP` actualiza los flags del CPU.

**Sintaxis:** `SUB destino, fuente`

**¿Cómo se hace la resta a nivel binario?**

En x86 y en casi todos los CPUs, la resta se implementa como:

`A - B ≡ A + (~B + 1)`

Es decir:

- Se usa complemento a dos
- Por eso aparecen los conceptos de borrow, carry, overflow, etc

**Ejemplo**

```asm
# Intel
mov al, 2 # al = 0000 0010b
sub al, 1 # 1  = 0000 0001b
# Resultado: 0000 0001b
# ZF: 0
# SF: 0 (MSB es 0)
# CF: 0 (queda en 1 solo si ocurre borrow cuando op1 < op2)
# OF: 0
```

Se pudiera pensar que algo está mal, porque efectivamente el bit de la posición 1 en el primer elemento requiere un préstamo para resolver `0 - 1`, pero y a pesar que sucede, la operación se resuelve de manera interna sin salir del registro porque el bit que realiza el préstamo (el de la posición 2) está en 1 y efectivamente, puede prestar y quedar en 0.

```asm
  0000 00[1] préstammo -> 0 
  0000 000                1
- -------------------------

# Resultado

  0000 000[10] 
  0000 000  1
- ------------
  0000 000  1
# Porque 0 - 1 -> 10 - 1 = 1
```

Por lo tanto, se aprecia como el préstamo no se propaga a la izquierda hasta salir del registro y del bits MSB.

**Flags afectados por `SUB`**

| Flag   | Significado                          |
| ------ | ------------------------------------ |
| **CF** | Borrow (resta unsigned)              |
| **OF** | Overflow (resta signed)              |
| **ZF** | Resultado = 0                        |
| **SF** | Sign bit del resultado               |
| **PF** | Paridad del byte menos significativo |
| **AF** | Borrow entre bit 1 y 2 (BCD)         |

**Cálculo del flag OF del CPU para la instrucción `SUB`**

Es la misma que la instrucción `CMP`.

**Fórmula:** `OF = (sign(op1) ≠ sign(op2)) AND (sign(resultado) ≠ sign(op1))`

**Cálculo del flag AF del CPU para la isntrucción `SUB`**

En una resta `AF = 1` si hay un préstamo entre el nibble alto y bajo, vale decir entre el bit 4 y el bit 3 (contando desde 0).

```asm
# byte: 0000 0001
# nibble: 4 bits
# nibble alto: 0000 (bits 4 al 7)
# nibble bajo: 0001 (bits 0 al 3)
  
  7654 3210 # <- (posiciones de bits)
A 0000 0001 
B 0000 1001
- ---------
```

Nótece que la resta del nibble bajo (bits 0–3) requiere un préstamo desde el bit 4 (nibble alto), configurando así el flag AF en 1. AF no observa un bit puntual, sino que indica que el préstamo no pudo resolverse dentro del nibble bajo y debió propagarse hasta el bit 4.

## Instrucción `SBB` (subtract with borrow)

Realiza una resta teniendo en cuenta el flag de acarreo `CF`. Su finalidad es dar soporte a las operaciones cuando se trabaja con registros mas grandes que los soportados. `SBB` permite encadenar restas usando a `CF` como estado intermedio.

**Sintaxis:** `SBB dest, src`
**Equivale a:** `dest = dest - src - CF`

**Ejemplo (sin borrow)**

```asm
# Intel
mov rax, 10  # rax = 0000 1010b
mov rbx, 3   # rbx = 0000 0011b
clc          # Pone a 0 el flag CF
sbb rax, rbx # rax = 10 - 3 - 0 = 7 (0000 0111b)

# Resultado
# rax = 7
# CF = 0
```

**Ejemplo (con borrow)**

```asm
# Intel
mov rax, 10  # rax = 0000 1010b
mov rbx, 3   # rbx = 0000 0011b
stc          # Pone el flag CF a 1
sbb rax, rbx # rax = 10 - 3 - 1 = 6 (0000 0110b)

# Resultado
# rax = 6
# CF = 0
```

**Uso real: resta de 128 bits con dos registros**

A continuación se realiza una resta con dos números de 128 bits, para los cuales se utilizan cuatro registros (dos por número).

```asm
# Intel
# A = 0x0000000000000001_FFFFFFFFFFFFFFFF
# B = 0x0000000000000000_0000000000000001
# RDX:RAX = A (Parte alta : Parte baja)
# RCX:RBX = B (Parte alta : Parte baja)
mov rdx, 0x0000000000000001
mov rax, 0xFFFFFFFFFFFFFFFF
mov rcx, 0x0000000000000000
mov rbx, 0x0000000000000001
sub rax, rbx # Resta ambas partes bajas de 64 bits
sbb rdx, rcx # Resta las partes altas de 64 bits usando el borrow
# rdx = rdx - rcx - CF
# 1 - 0 - 1 = 0
# Resultado final: RDX:RAX = 0x0000000000000000_FFFFFFFFFFFFFFFE
```

Sin `SBB` el borrow no se propagaría afectando la operación.

**Flags del CPU afectados por `SBB`**

| Flag | Significado             |
| ---- | ----------------------- |
| CF   | Borrow (muy importante) |
| ZF   | Resultado es cero       |
| SF   | Signo del resultado     |
| OF   | Overflow con signo      |
| AF   | Ajuste BCD (histórico)  |
| PF   | Paridad                 |

**Cálculo del flag `OF` del CPU para la instrucción `SBB`**

La única diferencia con `SUB` es que `SBB` resta un bit extra usando `CF`, y ese bit también participa en el cálculo del overflow. 

**Fórmula:** `sign(A) ≠ sign(B) AND sign(result) ≠ sign(A)`

**Usos comunes de `SBB`:**

- Implementaciones de AES, RSA, ECC

- Restas de buffers grandes

- Rutinas de comparación constante-time

- Patrón de comparación que ayuda a evitar saltos a branchless code

  ```asm
  # Intel
  cmp rax, rbx
  sbb rcx, rcx
  
  # Resultado
  # rax < rbx → CF = 1 → rcx = -1 (0xFFFFFFFFFFFFFFFF)
  # rax >= rbx → CF = 0 → rcx = 0 (0x0)
  ```

  **¿Qué es un branch (salto)?**
  
  Un branch (del inglés rama o ramificación) es cualquier instrucción que cambia el flujo normal del programa: `jmp`, `je/jne`, `jl/jp/jb/ja`, `call/ret`.
  
  ```asm
  # Intel
  cmp rax, rbx
  jl less # jump if less, realiza un salto si el resultado de una comparación es 'menor que' usando SF != OF, cuando son distintos salta al tag
  mov rcx, 0
  jmp end # salto incondicional al tag end
  less:
  mov rcx, -1
  end:
  ```
  
  En el ejemplo anterior la CPU no sabe que camino tomar hasta que se realiza la evaluación de la comparación (pero igual elige uno mediante el predictor de saltos). El problema ocurre cuando las CPUs modernas adivinan si el salto se tomará o no antes de saber el resultado, dado que tienen un ***branch predictor*** (predictor de saltos), pipeline y ejecución fuera de orden.
  
  Cuando la predicción es correcta, todo fluye normalmente y el pipeline sigue lleno, de lo contrario cuando ocurre una predicción incorrecta (branch misprediction), el pipeline se vacía, se descarta trabajo ya hecho y se pierden entre 10, 20 o mas ciclos (en CPUs modernas se pueden perder incluso 30 a 40 o mas ciclos dependiendo de la profundidad del pipeline). Por lo que un `jmp` mal predicho es carísimo.
  
  El **branchless code** es código que no usa saltos condicionales, usa aritmética, máscaras y flags, ejecuta siempre el mismo flujo. y tiene un tiempo de ejecución más predecible, ideal para hot paths y criptografía. 
  
  **Ejemplo con branch:**
  
  ```c
  if (a < b)
      x = y;
  else
      x = z;
  ```
  
  **Ejemplo con branchless:**
  
  ```C
  mask = (a < b) ? -1 : 0;
  x = (y & mask) | (z & ~mask);
  ```
  
  **En x86:**
  
  ```asm
  # Intel
  cmp rax, rbx
  sbb rcx, rcx
  ```
  
  **¿Por qué evitar saltos?**
  
  Por el rendimiento, un `cmp + sbb` cuesta entre 1 a 2 ciclos (siempre lo mismo), un `jmp` puede costar 1 ciclo, 10, 20, o mas si se falla en la predicción. En loops y/o código crítico el predictor de saltos mata el rendimiento.
  
  **¿Cuando se introdujo el predictor de saltos en Intel?**
  
  Aparece a madiados de los años 90, antes de 1995 con los 8086, 80286 y 80836 los saltos se resolvían cuando se evaluaba la condición y el pipeline se vaciaba. (El 80486 tenía pipeline, pero no un predictor dinámico real).
  
  En 1995 con el Pentium P5 incorpora un predictor estático muy básico, pero que evitaba muchos vaciados de pipeline. Se considera el primer branch predictor real en x86 Intel. En 1997 el Pentium Pro P6 introduce la predicción dinámica con branch history table (BHT) y branch target buffer (BTB). Tenía un historial de saltos anteriores de 1 a 2 bits y un pipeline mas profundo. Aquí es cuando nace el predictor moderno. De aquí en adelante Intel avanzó en el diseño haciéndolo mas complejo.
  
  **¿Qué es el pipeline?**
  
  El pipeline es una técnica para solapara la ejecución de instrucciones, de forma parecida a una línea de producción.
  
  En vez de ejecutar una instrucción completa a la vez, la CPU la divide en etapas, y cada ciclo de reloj trabaja en varias instrucciones simultáneamente, cada una en una etapa distinta.
  
  **Ejemplo**
  
  | Etapa | Acción             |
  | ----- | ------------------ |
  | 1     | Buscar instrucción |
  | 2     | Decodificar        |
  | 3     | Ejecutar           |
  | 4     | Escribir resultado |
  
  Mientras la instrucción A se ejecuta, la B se decodifica y la C se busca. Esto resulta en más instrucciones terminadas por segundo.
  
  **µops:** (micro-ops o micro operaciones) son operaciones internas más simples en las que el procesador traduce las instrucciones x86 antes de ejecutarlas realmente. Vale decir que el hardware descompone las instrucciones en varias µops que puede manejar mas fácilmente.
  
  **Etapas típicas de un pipeline en x86 (conceptualmente hablando):**
  
  1. **Fetch:** trae la instrucción desde memoria (I-cache).
  2. **Decode:** decodifica x86 a µops.
  3. **Rename:** renombra registros (para evitar dependencias falsas).
  4. **Dispatch / Issue:** enviar µops a unidades de ejecución.
  5. **Execute:** ALU, FPU, load/store.
  6. **Retire:** confirma resultados (en orden a pesar que la ejecución es fuera de orden).

  **Uso del pipeline**
  
  Se usa principalmente para completar mas instrucciones por ciclo (IPC o instructions per cycle), lo que aumenta el rendimiento general del CPU.
  
  El CPU especula trayendo y ejecutando instrucciones del destino (en relación a la rama que podría tomar el flujo de ejecución), aunque todavía no sabe si dicho destino será tomado o si es correcto. Si la predicción es incorrecta se descarta todo lo ejecutado especulativamente y el pipeline es vaciado. Luego se reanuda la ejecución en la dirección correcta. Lo que penaliza el rendimiento en ciclos perdidos por core. De aquí la importancia del branchless code en optimización.
  
- Para máscaras

  Muy usado en crypto y optimizaciones sin branch.
  
  ```asm
  xor rax, rax
  cmp rdi, rsi
  sbb rax, rax
  # Resultado
  # rax = 0xFFFFFFFFFFFFFFFF si rdi < rsi
  # rax = 0 si rdi <= rsi
  ```


## Instrucción `ADD`

Realiza una suma aritmética (internamente se lleva a cabo a nivel binario). Suma dos operandos y almacena el resultado en el primer operando.

**Sintaxis:** `add destino, origen`

**Ejemplo**

```asm
# Intel
mov al, 5 # al = 0000 0101b
add al, 3 # al = 8 (0000 1000b)

# ZF: 0 (resultado distinto de cero)
# CF: 0 (no hay acarreo)
# SF: 0 (bit MSB del resultado)
# AF: 0 (no hubo acarreo entre nibbles)
# OF: 0 (no hubo overflow)
```

**Flags del CPU afectados por `ADD`**

| Flag                    | Qué significa y cómo se calcula                              |
| ----------------------- | ------------------------------------------------------------ |
| **CF** (Carry Flag)     | 1 si hay acarreo fuera del bit más significativo (útil para sumas sin signo) |
| **OF** (Overflow Flag)  | 1 si la suma produce overflow en números con signo (signed)  |
| **SF** (Sign Flag)      | 1 si el resultado es negativo (MSB = 1)                      |
| **ZF** (Zero Flag)      | 1 si el resultado es cero                                    |
| **AF** (Auxiliary Flag) | 1 si hay acarreo entre los nibbles bajos y altos (bit 3 y 4) |

**Calculo del flag OF**

El flag OF se activa cuando sumas dos números con el mismo signo y el resultado tiene un signo distinto.

Fórmula: `OF=1 si y sólo si (signo(op1) == signo(op2)) AND (signo(resultado) ≠ signo(op1))`

- Signo operando 1: bit MSB
- Signo operando 2: bit MSB
- Signo resultado: bit MSB

**Ejemplo de suma con overflow**

```asm
mov al, 120 # al = 0111 1000b
add al, 10  # al = 1000 0010b (-126 signed)

# signo operando 1 = 0
# signo operando 2 = 0
# signo resultado = 1 (negativo)
# Mismo signo en operandos, pero en el resultado el signo es negativo. OF cambia a 1
```

**Suma binaria**

Se realiza de derecha a izquierda (desde el bit LSB al MSB). Lo que trae consigo ***carry in*** (acarreo de entrada) y ***carri out*** (acarreo de salida).

**Carry in (C_in)**

Es el acarreo que viene desde el bit anterior, es decir, cuando se sumó `1 + 1` y se generó un acarreo.

**Ejemplo**

```asm
  1011 (a)
  1101 (b)
+ ----
```

Los bits que se suman por la derecha para **a** y **b** son 1, por lo tanto `1 + 1 = 10`, el resultado es 0 y ***carry out*** es 1. Es decir que ocurre un acarreo hacia el bit de la izquierda. Luego tienes `1 + 0` y ***carry in*** igual 1.

**Carry out (C_out)**

Es el acarreo que se genera al sumar dos bits y el ***Carry in***.

**Fórmula**

`Cout=(A ∧ B) ∨ (Cin ∧ (A ⊕ B))`

O expresado mas legiblemente

`Cout=(A AND B) OR (Cin AND XOR(A, B))`

**Significado:** hay que llegar 1 al siguiente bit si hubo una suma que excede 1 en el bit actual.

**Ejemplo**

```asm
   1
   1
+ --
  10
```

Como al sumar `1 + 1` da `10` en binario, se genera un ***carry out*** en 1 y se le pasa a la siguiente columna de la izquierda, generando su ***carry in*** respectivo.

**Reglas**

En **binario** solo hay dos dígitos: 0 y 1. La suma se hace bit a bit:

| Bit A | Bit B | Resultado | Carry (acarreo) |
| ----- | ----- | --------- | --------------- |
| 0     | 0     | 0         | 0               |
| 0     | 1     | 1         | 0               |
| 1     | 0     | 1         | 0               |
| 1     | 1     | 0         | 1               |

Ahora las reglas extendidas para incluir un acarreo de entrada.

| A    | B    | Carry_in | Resultado (R) |
| ---- | ---- | -------- | ------------- |
| 0    | 0    | 0        | 0             |
| 0    | 0    | 1        | 1             |
| 0    | 1    | 0        | 1             |
| 0    | 1    | 1        | 0             |
| 1    | 0    | 0        | 1             |
| 1    | 0    | 1        | 0             |
| 1    | 1    | 0        | 0             |
| 1    | 1    | 1        | 1             |

**Ejemplo con paso a paso y acarreo**

```asm
   0101 (5) (op1)
+  0011 (3) (op2)
   -------
   1000 (8) (resultado)
```

**Paso a paso con acarreo:**

De derecha a izquierda en el ejemplo anterior

| Bit  | Op1  | Op2  | Carry_in | Suma | Resultado | Carry_out |
| ---- | ---- | ---- | -------- | ---- | --------- | --------- |
| 0    | 1    | 1    | 0        | 2    | 0         | 1         |
| 1    | 0    | 1    | 1        | 2    | 0         | 1         |
| 2    | 1    | 0    | 1        | 2    | 0         | 1         |
| 3    | 0    | 0    | 1        | 1    | 1         | 0         |

Es mejor **de derecha a izquierda** (LSB → MSB):

1. **Bit 0 (LSB)**: 1 + 1 = 0, acarreo 1

2. **Bit 1**: 0 + 1 + 1 (carry) = 0, acarreo 1

3. **Bit 2**: 1 + 0 + 1 (carry) = 0, acarreo 1

4. **Bit 3 (MSB)**: 0 + 0 + 1 (carry) = 1, acarreo 0

**Resultado final:** `1000` → 8 decimal.

## Instrucción `ADC` (add with carry)

Suma dos operandos y el valor del flag `CF` (carry flag). Su función principal es permitir la suma de enteros grandes que exceden el tamaño de registro, trabajando sobre múltiples registros consecutivos.

**Sintaxis:** `ADC destino, fuente`

En destino también se sumará el carry flag `CF`. Su equivalente conceptual es el siguiente:

```
resultado = destino + fuente + CF
```

**Ejemplo**

```asm
# Intel

# Suma dos números de 128 bits
# RDX:RAX + RBX:RCX (se usan dos registros de 64 bits para representar cada número)
# RAX y RCX son la parte baja de los números
# RDX y RBX son la parte alta de los números

mov rax, 0xFFFFFFFFFFFFFFFF # rax = 18_446_744_073_709_551_615
mov rdx, 0x0000000000000001 # rdx = 1
mov rcx, 0x2                # rcx = 2
mov rbx, 0x0                # rbx = 0

add rax, rcx # Suma la parte baja
# CF = 1 debido al overflow en 64 bits 
adc rdx, rbx # Suma la parte alta + carry
# RDX:RAX ahora = 0x0000000000000004 : 0x0000000000000001 + 0x2 con acarreo
```

`ADC` asegura que si el `ADD` de la parte baja genera un acarreo, se propague a la parte alta.

**Ejemplo (16 bits en dos registros)**

```asm
# Intel

# Representación de un número de 16 bits en dos registros de 8 bits
# bl:al
# bl es la parte alta del número de 16 bits
# al es la parte baja del número de 16 bits
# 0x0:0xff
mov al, 0xff # al = 255
mov bl, 0x00 # bl = 0
add al, 20   # al = 0x13 (19)
# CF: 1
# OF: 0 (no hubo overflow signed)
```

¿Qué sucedió, por qué `al` pasó de ser 255 a 13?

Lo que acabas de presenciar es un ***overflow unsigned***. `al` es un registro de 8 bits, no puede representar `255 + 20 (275)`, por lo que vuelve a iniciar desde 0 quedando en 19. 
Como 275 es un entero de 9 bits, la CPU simplemente activa el flag de acarreo `CF`  perdiendo el resto. Gráficamente es lo siguiente:

```asm
# 275 (0x113)
# 1 [0001 0011] -> 8 bits
# ↑ se pierde
# Se activan el flag CF
# Por eso 255 + 20 = 19
```

¿Cómo se soluciona?

Aquí es donde entra al juego la instrucción `ADC` sumando `CF` a la parte alta de nuestro número de 16 bits.

```asm
# al = 19 (0x13)
# bl = 0 (0x0)
adc bl, 0 # bl = bl + 0 + CF
# bl = 0 + 0 + 1 = 1
```

A simple vista no parece que hubiera algún sentido, hasta que consideras que el número de 16 bits se representa usando dos registros de 8 bits, de la siguiente manera:

```asm
# bl:al
# bl: 0x01
# al: 0x13
# bl:al = 0x01:0x13 = 0x113 (275)
# al: [0000 0001] al:[0001 0011]
```

En la práctica decimos que al es la parte baja del número de 16 bits, es decir que constituye los bits del 0 al 7, y que bl es la parte alta del número, es decir, constituye los bits del 8 al 15, conformando así los 16 bits.

**Flags del CPU afectados por `ADC`**

| Flag                      | Afectación                                                   | Descripción                                                  |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| CF (Carry Flag)           | Se establece si hay un **acarreo fuera del bit más significativo** (suma sin signo que excede el tamaño del registro). | Indica overflow en operaciones **unsigned**.                 |
| OF (Overflow Flag)        | Se establece si hay un **desbordamiento de signo** (suma con signo que excede el rango). | Indica overflow en operaciones **signed**.                   |
| ZF (Zero Flag)            | Se establece si el **resultado es 0**.                       | Útil para comparar si la suma dio cero.                      |
| SF (Sign Flag)            | Se establece según el **bit más significativo del resultado**. | Indica si el resultado es negativo en enteros con signo.     |
| PF (Parity Flag)          | Se establece si el **número de bits en 1 del byte menos significativo es par**. | Se usa raramente, pero es parte del comportamiento estándar de ALU. |
| AF (Auxiliary Carry Flag) | Se establece si hay un **acarreo desde el nibble inferior (bit 3) al nibble superior (bit 4)**. | Se usa principalmente en operaciones BCD (Binary-Coded Decimal). |

**Usos típicos**

- Arimética multiprecisión: Cuando los registros individuales no son suficientes.
- Suma de números grandes en cryptografía: como en operaciones de BigInt.
- Operaciones con flags dependientes: `ADC` respeta el `CF`, por lo que es útil en cadenas de sumas condicionales.

**Cálculo del flag OF**

**Fórmula:** 

```
R = A + B + CF
OF = (~(A ⊕ (B+CF)) & (A ⊕ R)) & MSB
OF = [ NOT( XOR(A, (B + CF)) ) AND XOR(A, R) ] AND MSB
```

En principio la fórmula es la misma, solo que `ADC` considera B + CF. OF se pregunta lo siguiente: ¿sumé dos números con el mismo signo y el resultado cambió de signo?. Si la respuesta es sí, tienes `OF = 1`, de lo contrario, `OF = 0`. Esto explica por qué en el ejemplo anterior, aunque hubo un overflow unsigned, `OF` no cambió. 

## Instrucción `INC` (increment)

Incrementa en 1 el valor de su operando. Funciona con registros y memoria, pero no con inmediatos.
Internamente se aplican las reglas normales de suma binaria con acarreo interno.  

**Sintaxis:** `inc op`

**Ejemplo**

```asm
# Intel
mov al, 5 # al = 0000 0101b
inc al    # al = 6 (0000 0110b)

# Equivale conceptualmente a: al += 1
```

**Flags del CPU afectados por `INC**`

| Flag | ¿Se modifica? | Significado                         |
| ---- | ------------- | ----------------------------------- |
| ZF   | Sí            | Resultado es 0                      |
| SF   | Sí            | Bit más significativo del resultado |
| OF   | Sí            | Overflow en signed                  |
| AF   | Sí            | Acarreo entre bit 3 ↔ 4             |
| PF   | Sí            | Paridad del resultado               |
| CF   | No            | Se mantiene como estaba             |

**Cálculo del flag overflow en `INC`**

El resultado del flag OF se establece en 1 cuando el operando tenía signo positivo y el resultado tiene signo negativo.

**Fórmula:** `OF=1 ⟺ (signo_antes = 0) ∧ (signo_despues = 1)`
**Mas legible:** `OF=1 si y solo si (signo_antes = 0) AND (signo_despues = 1)`

**Usos típicos de `INC`**

- Contadores en loops

  ```asm
  inc ecx
  cmp ecx, 10
  jl loop
  ```

- Iteradores simples

  ```asm
  inc esi # avanzar índice
  ```
  
- Cuando no te importa el flag CF
  
  Si necesitas preservar CF, `INC` es ideal.
  

Cuando no usar `INC`

- Cuando dependes del flag CF

## Instrucción `DEC` (decrement)

Decrementa en 1 el valor de su operando. Utiliza una resta binaria (con borrow interno), usando las reglas normales. No modifica el flag CF (a diferencia de `SUB`).

Sintaxis: `dec op`

**Ejemplo**

```asm
# Intel
mov al, 5 # al = 0000 0101b
dec al    # al = 4 (0000 0100b)

# Equivale a: al -= 1
```

**Flags del CPU afectados por `DEC`**

| Flag | ¿Se modifica? | Significado                         |
| ---- | ------------- | ----------------------------------- |
| ZF   | Si            | Resultado es 0                      |
| SF   | Si            | Bit más significativo del resultado |
| OF   | Si            | Overflow signed                     |
| AF   | Si            | Borrow entre bit 3 ↔ 4              |
| PF   | Si            | Paridad del resultado               |

**Cálculo del flag OF para `DEC`**

El overflow ocurre cuando se pasa del mínimo signed al máximo.

**Fórmula:** `OF=1 ⟺ (signo_antes = 1) ∧ (signo_despues = 0)`
**Simplificada:** `OF=1 si y solo si (signo_antes = 1) AND (signo_despues = 0)`

**Usos típicos de `DEC`**

- Contadores regresivos

  Muy común en bucles clásicos

  ```asm
  mov ecx, 10
  loop:
      # código
      dec ecx
      jnz loop
  ```

- Iterar hacia atrás

  ```asm
  dec esi # retroceder índice
  ```

- Cuando quieres preservar CF
  ```asm
  # CF contiene info previa importante
  dec eax # CF no se altera
  ```

Cuando no usar `DEC`

- Cuando dependes del borrow

  ```asm
  dec eax
  jc error # Incorrecto
  ```

## Instrucción `NEG` (negación aritmética)

Realiza el negado aritmético de un operando, o mejor dicho:

- Convierte un número positivo en negativo.
- Convierte un número negativo en positivo.
- Implementa el complemento a dos.

**No admite inmediatos**.

En binario, negar un número es:

- Invertir todos los bits (`not`)

- Sumar 1

**Ejemplo con 8 bits**

```asm
 5 = 0000 0101
~5 = 1111 1010
+1 = 1111 1011 -> -5
```

  `NEG` hace esto internamente en una sola instrucción.

**Sintaxis:** `NEG op`

**Ejemplo**

```asm
# Intel
# Número positivo
mov al, 5 # al = 0000 0101b
neg al    # al = 1111 1010b (-5)

# Número negativo
mov al, -5 # 1111 1011b
neg al     # 0000 0101b (5)
```

**Forma conceptual de entender `NEG`**

```asm
NEG x: x = 0 - x
# Mientras que NOT hace lo siguiente
NOT x: x = ~x
```

**Flags del CPU afectados por `NEG`**

| Flag | Nombre         | ¿Cómo queda después de `NEG dest`?                           |
| ---- | -------------- | ------------------------------------------------------------ |
| CF   | Carry Flag     | **1** si `dest ≠ 0`**0** si `dest = 0`                       |
| OF   | Overflow Flag  | **1** *solo* si `dest` era el **mínimo representable**(ej: `0x80`, `0x8000`, `0x80000000`, `0x8000000000000000`) |
| SF   | Sign Flag      | Copia del **bit más significativo** del resultado            |
| ZF   | Zero Flag      | **1** si el resultado es `0`                                 |
| AF   | Auxiliary Flag | **1** si hay **préstamo** entre el bit 3 y 4 (nibble bajo)   |
| PF   | Parity Flag    | Depende de la **paridad** del byte bajo del resultado        |

**Flag OF en `NEG` es un caso especial**

El overflow ocurre solo en un caso puntual para esta instrucción, cuando se niega el valor mínimo representable, observa la siguiente tabla:

| Tamaño  | Valor mínimo |
| ------- | ------------ |
| 8 bits  | -128 (0x80)  |
| 16 bits | -32768       |
| 32 bits | -2147483648  |
| 64 bits | -2⁶³         |

**Ejemplo**

```asm
# Intel
mov al, 0x80 # al = -128
neg al       # al = -128
# OF: 1
```

No existe el **128 positivo** en 8 bits, es por eso que se produce el overflow.

## Instrucción `MUL` (multiply)

Multiplica sin signo el acumulador implícito por el operando indicado. Por lo que no se indica el destino, el CPU lo decide automáticamente. El resultado siempre ocupa el doble de bits.

**Sintaxis:** `MUL op`

**Registros implícitos según el tamaño**

| Tamaño  | Operando explícito | Registros implícitos usados   | Resultado |
| ------- | ------------------ | ----------------------------- | --------- |
| 8 bits  | r/m8               | **AL** × r/m8 → **AX**        | AX        |
| 16 bits | r/m16              | **AX** × r/m16 → **DX:AX**    | DX:AX     |
| 32 bits | r/m32              | **EAX** × r/m32 → **EDX:EAX** | EDX:EAX   |
| 64 bits | r/m64              | **RAX** × r/m64 → **RDX:RAX** | RDX:RAX   |

**Ejemplo**

**Multiplicación de 8 bits**

```asm
# Intel
mov al, 5 # al = 0000 0101b
mov bl, 3 # bl = 0000 0011b
mul bl    # 5 x 3 = 15 (0000 1111b)

# Resultado (cabe en 8 bits)
# ax = 0000 0000 0000 1111b
# al = 15
# ah = 0
```

**Multiplicación de 16 bits**

```asm
# Intel
mov ax, 300 # ax = 0000 0001 0010 1100b
mov bx, 200 # bx = 0000 0000 1100 1000b
mul bx      # 300 x 200 = 60000 (sesenta mil)

# Resultado: 60000 (sesenta mil) (0xEA60)
# Se almacena en 32 bits usando DX:AX
# DX:AX (0x0000:0xEA60)
# (Parte alta 0x0000)   (Parte baja 0xEA60)
# 0000 0000 0000 0000 | 1110 1010 0110 0000
```

El resultado no cabe en 16 bits, se guarda en 32 bits, es decir, usando dos registros, `DX` y `AX`. Pero si `MUL` realiza una multiplicación sin signo, ¿por qué se usan dos registros siendo que el máximo teórico de 16 bits unsigned es de 65535?.
La instrucción `MUL` no comprueba si cabe o no, siempre genera el resultado completo aunque los bits altos sean ceros. Es decir, que no hay una optimización al respecto, por lo que para este caso puntual, `DX` igualmente fue sobrescrito con ceros. Si cabe ono, se deduce mirando `DX`.

**¿Cuando se usa `DX`?**

Cuando el resultado supera el límite de 16 bits, es decir 65536 (2¹⁶) (0xFFFF). En otras palabras, el resultado se distribuye en dos registros (`DX`y `AX`).

 **Multiplicación de 32 bits**

```asm
# Intel
mov eax, 0xFFFFFFFF # eax = 4_294_967_295
# 32 bits
# 1111 1111 1111 1111 1111 1111 1111 1111
mov ebx, 2
mul ebx
# Resultado no cabe en 32 bits
# Resultado 8_589_934_590 (0x1FFFFFFFE)
# Se almacena en 64 bit usando EDX:EAX
# En EDX se almacena la parte alta (0x00000001)
# En EAX se almacena la parte baja (0xFFFFFFFE)
# Se genera overflow: OF = 1
```

**Flags del CPU afectados por `MUL`**

`MUL` solo define dos flags

| Flag | Significado                          |
| ---- | ------------------------------------ |
| CF   | 1 si la mitad alta del resultado ≠ 0 |
| OF   | 1 si la mitad alta del resultado ≠ 0 |

 **Fórmula:** `CF = OF = (parte_alta_del_resultado ≠ 0)`

El flag `CF` no representa un acarreo como en la instrucción `ADD`, al contrario, indica si la mitad alta del resultado es distinta de cero. El flag `OF` copia exactamente el mismo valor. ¿Entonces que significa carry en `MUL`?.
Históricamente Intel reutilizó el flag `CF` porque necesitaba un indicador de overflow nsigned, no porque hubiese un carry como tal. Por lo que, `CF` solo indica un overflow unsigned y `OF` copia su valor.

**Contexto histórico**

Históricamente el flag `OF` es posterior al flag `CF`. Originalmente el ***carry flag*** `CF` existe desde los primeros diseños aritméticos (antes del Intel 8086). Su razón de ser era eléctrica / matemática, es decir, indicaba acarreo o préstamo en aritmética unsigned y permitía aritmética multiprecisión. Aun no existía el concepto formal de ***signed overflow***.
El flag `OF` (overflow flag) apareció formalmente con el [intel 8086](https://en.wikipedia.org/wiki/Intel_8086) en 1978. Se consolida el uso intensivo de enteros con signo (complemento a dos) en lenguajes de alto nivel y compiladores. El flag `OF` ayudó a gestionar la precisión (desbordamientos aritméticos) de las operaciones aritméticas a bajo nivel. El hardware necesitaba verificar si el resultado de una operación era o no representable dentro del límite de los bits disponibles, especialmente cuando se trabajaba con números con signo.

## Instrucción `IMUL` (integer multiply signed)

Realiza multiplicación con signo. Según la forma usada, el resultado completo se almacena en un par de registros o se trunca al tamaño del registro destino. Los flags `CF` y `OF` indican si el resultado no cabe en el tamaño destino. El resto de los flags quedan indefinidos.

**Flags del CPU**

`CF` y `OF` se activan si el resultado no cabe en el tamaño del operando destino.. Es decir, cuando hay truncamiento del resultado.
En la forma de un operando, esto ocurre cuando la parte alta del resultado no es extensión del signo de la parte baja. En las formas de dos y tres operandos, ocurre cuando el resultado es truncado.

**Sintaxis:** 

- Un Operando `IMUL src`
  **Registros implícitos según el tamaño del operando.**

  | Tamaño del operando | Operando explícito | Registros implícitos usados   | Resultado |
  | ------------------- | ------------------ | ----------------------------- | --------- |
  | 8 bits              | r/m8               | **AL** × r/m8 → **AX**        | AX        |
  | 16 bits             | r/m16              | **AX** × r/m16 → **DX:AX**    | DX:AX     |
  | 32 bits             | r/m32              | **EAX** × r/m32 → **EDX:EAX** | EDX:EAX   |
  | 64 bits             | r/m64              | **RAX** × r/m64 → **RDX:RAX** | RDX:RAX   |

- Dos operandos `IMUL dest, src`

- Tres operandos `IMUL dest, src, inmediato`

**Ejemplo (forma implícita con un operando)**

Se usa un registro implícito como multiplicando (`AL`, `AX`, `EAX`, `RAX`), el resultado puede ser más grande que el registro original, en cuyo caso la parte alta del resultado va a `DX / EDX / RDX`.

```asm
# Intel 16 bits
mov ax, -10 # ax = 1111 1111 1111 0110b (en complemento a dos)
mov bx, 3   # bx = 0000 0000 0000 0011b
imul bx     # DX:AX = -30
# La parte alta del número queda en el registro dx, y la baja en ax
;-30 = 1111 1111 1111 1111 | 1111 1111 1110 0010
#         ↑ DX = FFFF             ↑ AX = FFE2
```

En éste caso, el registro DX es una extensión del registro AX. Por lo que `CF` y `OF` quedan en cero.

**Ejemplo (con dos operandos)**

Esta forma guarda solo la parte baja del resultado (no usa registros implícitos). Por lo que el resultado se trunca al tamaño del registro de destino.

```asm
# Intel 8 bits
mov al, 50 # al = 0011 0010b
mov bl, 5  # bl = 0000 0101
imul al, bl
# Resultado debería ser 250 (50 * 5), pero 250 no cabe en al (8 bits), por lo que se trunca a 8 bits.
# 250 en 16 bits: 0000 0000 1111 1010
# 250 truncado a 8 bits: 1111 1010b
# al es interpretado como un int8 con signo, es decir como -6
# CF = 1
# OF = 1
```

En éste ejemplo, el truncamiento no recuerda el signo (se pierde), por lo que el resultado en 8 bits se interpreta como -6.

**Ejemplo (con tres operandos)**

No existe forma con tres operandos para 8 bits. Pero si está disponible para 16, 32 y 64 bits. Ésta forma se añadió mas tarde en x86, se pensó para optimizaciones de compiladores (en 8 bits no valía la pena).

```asm
# Intel 16 bits
# 300 * -3 = -900
mov bx, 300     # bx = 0000 0001 0010 1100b
imul ax, bx, -3 # ax = (int16)bx * (int16)-3
# Resultado
# ax = -900 (1111 1100 0111 1100b en complemento a dos)
# CF = 0
# OF = 0
```

En éste caso el resultado cabe en 16 bits, de lo contrario se hubiera truncado.

**Usos comunes**

- Multiplicación con signo

- Multiplicar por constantes

  ```asm
  # Intel (ejemplos)
  imul eax, ecx, 10
  imul edx, esi, -4
  ```

- Cálculo de offsets (array, structs)

  Muy típico en C/C++

  ```asm
  # Intel
  # C: arr[i]
  imul eax, ecx, 4 # i * sizeof (int)
  add eax, arr
  ```

- Alternativa a `LEA` (cuando el factor no es potencia de dos)

  Con `LEA` se puede hacer: `1×, 2×, 4×, 8×.`

  Pero si el multiplicador no es uno de esos se usa `IMUL.`

  ```asm
  # Intel
  imul eax, eax, 3
  ```

- Detección de overflow con signo

  `IMUL` es la forma correcta de detectar overflow en multiplicación con signo.

  ```asm
  # Intel
  imul eax, ebx
  jo overflow_handler # jo = jump if overflow
  ```

  Esta forma es muy usada en: validaciones, código seguro y/o librerías matemáticas.

- Sign extension implícita (forma de un operando)

- Reversing / malware / cracks

  `IMUL` aparece mucho en: ofuscación simple, keygens, checksums, mezclado de valores.

  ```asm
  # Intel
  imul eax, eax, 0x343FD
  add eax, 0x269EC3
  ```

  LCG clásico (Linear congruential generator). Una forma muy simple de generar números pseudo-aleatorios.
  El ejemplo implementa la fórmula del generador congruencial lineal: `Xn + 1 = (a ⋅ Xn + c) mod m`.

## Instrucción `PUSH`

Guarda un valor en la pila y mueve el puntero de pila. No afecta ni lee ningún flag del CPU.
Siempre realiza dos operaciones:

1. Baja el puntero de pila.
2. Escribe el valor.

**La pila:** Tiene una estructura **LIFO** (last in, first out), en X86 corre hacia direcciones de memoria bajas. Está controlada por `SP` (16 bits), `ESP` (32 bits) y `RSP` (64 bits).

**Sintaxis:** `PUSH op`
El operando puede ser registro, memoria o inmediato.

**Ejemplo**

```asm
# Intel

# 16 bits
push ax
# Equivale a
# sp = sp - 2
# [sp] = ax

# Con memoria
push word [var]

# 32 bits
push eax
# Equivale a
# esp = esp - 4
# [esp] = eax

# Con memoria
push dword [var]

# 64 bits
push rax
# Equivale a
# rsp = rsp - 8
# [rsp] = rax

# Con memoria
push qword [var]

# Con inmediatos (se extienden con signo y se empuja al tamaño de la pila)
push 10
push -1 # empuja 0xFFFF / 0xFFFFFFFF / 0xFFFFFFFFFFFFFFFF
push 0x1234
```

**Restricciones**

- El registro `CS` (code segment) no se puede pushear. Controla el flujo de ejecución y no puede modificarse arbitrariamente.

- Instruction pointers no son pusheables (`IP`, `EIP`, `RIP`).

-  Registros de control no son pusheables (`CR0`, `CR2`, `CR3`, `CR4`, `CR8`). Se accede a ellos via mov:

  ```asm
  # Intel
  mov reg, crX
  mov crX, reg
  ```

- Registros de depuración no son pusheables (`DR0` a `DR7`).
- Registros SIMD / FPU no son pusheables. (`MM0` a `MM7`, `XMM0` a `XMM31`, `YMM/ZMM`, `ST0` a `ST7`). Tienen instrucciones específicas para ser guardados.

**Registros que si se pueden pushear a la pila**

- No puedes pushear `CF`, `ZF`, pero si existe: `pushf` (16 bits), `pushfd` (32 bits), `pushfq` (64 bits).
- Registros generales (`AX`, `EAX`, `RAX`, etc).
- Segmentos: `DS`, `ES`, `SS`, `FS`, `GS`.
- Inmediatos.
- Memoria.

**Consideraciones**

- `PUSH` no modifica ni lee los flags del CPU.

- El tamaño de la pila manda (no el operando). Es decir que el dato empujado siempre coincide con el tamaño de la pila, no con el literal.

  ```asm
  # Intel
  # Ejemplo en 32 bits
  push 1 # Empuja 00000001h   (4 bytes) 
  ```

- El inmediato se extiende con signo.

  Dado que el signo se indica por le MSB, se extiende.

  ```asm
  # Intel
  # Ejemplo en 32 bits
  push 0xFF
  # No empuja 0x000000FF si no 0xFFFFFFFF
  ```

- `PUSH SP / ESP / RSP` es especial.

  ```asm
  # Intel
  push sp
  ```

  Empuja el valor original de `SP` antes de decrementarlo. (Esto es una fuente clásica de confusión y bugs).

- La pila crece hacia abajo. Siempre `PUSH` incrementa `SP` y `POP` decrementa `SP`. (Nunca al revés).

- `PUSH` no valida alineación. El CPU no se queja si:

  - `ESP` no está alineado.
  - Se rompe la ABI.
  - Se desalinea la pila.

  El crash viene después, no en la ejecución de `PUSH`.

- Si ocurre una excepción, el estado de la pila puede quedar parcialmente modificado. Por lo que algunos kernels usan cuidado extra.

- El orden importa.

  ```asm
  # Intel
  push ax
  push bx
  push cx
  
  # Luego
  pop dx # dx = cx
  pop bx # bx = bx
  pop ax # ax = ax
  ```

- `PUSH` guarda temporalmente hasta que se ejecute `POP`, o hasta que la pila se reutilice, por lo que nunca es memoria segura.

## Instrucción `POP`

Saca (extrae) un valor desde la pila y lo carga en un registro o en memoria, ajustando el puntero de pila `SP / ESP / RSP`.

**Sintaxis:** `POP destino`. Lee el valor apuntado por `SP / ESP / RSP`, lo copia en `destino` e incrementa el puntero de pila.

**Incrementos del puntero de pila**

| Modo   | Registro | Tamaño   |
| ------ | -------- | -------- |
| 16-bit | `SP`     | +2 bytes |
| 32-bit | `ESP`    | +4 bytes |
| 64-bit | `RSP`    | +8 bytes |

**Ejemplo**

```asm
# Intel

# 16 bits en real mode / DOS
mov ax, 0x1234
push ax # SP = SP - 2, [SP] = 0x1234
pop bx  # BX = 0x1234, SP = SP + 2 (SP aumenta 2 bytes)
# La pila queda como antes del push

# 32 bits
push 0xDEADBEEF
pop eax # ESP aumenta 4 bytes

# 64 bits
push rax
pop rbx # RSP aumenta 7 bytes

# 32 bits con memoria
pop dword [resultado]

# 64 bits con memoria
pop qword [resultado]
```

**Importante**

- No existe `POP` con inmediatos, por lo que `POP 5 / 0x1234`  es inválido.
- `POP` lee primero e incrementa `SP / ESP / RSP` después. (Útil de saber cuando se realiza análisis o exploits).

## Directiva `.stack`

**Solo funciona con:** NASM/TASM pero no con GAS

Directiva del ensamblador que se utiliza para reservar espacio para la pila en el programa. Es decir, le dice al ensamblador cuánto espacio se debe reserva para la pila en memoria cuando el programa se ejecute.

**Sintaxis:** `.stack <tamaño>[, <opciones>]`

**Parámetros**

- `tamaño` (obligatorio)
  Es la cantidad de memoria que se reserva para la pila. Puede escribirse en decimal o hexadecimal (prefijado con `0x` o postfijado con `h`). Ejemplo: `100h`, `0x100`.
  Si es omitido, el ensamblador asigna automáticamente `1024`.

- `opciones` (opcional)
  Puede ser `BYTES`, `WORD`, `DWORD`, etc. Indica la unidad de reserva (aunque normalmente no se usa).
  **Ejemplos**

  ```asm
  .stack 100h        # Reserva 256 bytes de pila
  .stack 4096        # Reserva 4096 bytes (4 KB)
  .stack 200h, DWORD # Reserva 512 bytes en unidades de 4 bytes
  ```

  En ensambladores como NASM, esta directiva solo le indica al ensamblador cuánto espacio reservar para el **stack segment**# el CPU no necesita saber `.stack`, solo usa `ESP/RSP` para apuntar a la pila.

## Variantes de la instrucción `PUSH` (`PUSHF / PUSHFD / PUSHFQ`)

Existen tres variantes que permiten empujar los flags del CPU de un tamaño específico a la pila. Ninguna de ellas modifica los flags del CPU. 

| Modo   | Instrucción | Qué empuja  |
| ------ | ----------- | ----------- |
| 16-bit | `pushf`     | FLAGS (16)  |
| 32-bit | `pushfd`    | EFLAGS (32) |
| 64-bit | `pushfq`    | RFLAGS (64) |

**Sintaxis:** `PUSHF / PUSHFD / PUSHFQ` (sin operandos).

**Ejemplo**

```asm
# Intel
pushfd  # Guarda EFLAGS en el stack
pop eax # eax = flags
```

**Usos típicos**

- Guardar estado del CPU.
- Detectar capacidades (ej: CPUID antiguo)
- Debug / Reversing

## Variantes de la instrucción `PUSH` (`PUSHA / PUSHAD`)

Ambas instrucciones empujan todos los registros generales en el stack de una sola vez. Su principal diferencia es el tamaño del modo (actualmente existe en 16 y 32 bits pero no en 64 bits). No modifica los flags del CPU.

| Instrucción | Modo    | Tamaño  |
| ----------- | ------- | ------- |
| `pusha`     | 16 bits | 16 bits |
| `pushad`    | 32 bits | 32 bits |

**Sintaxis:** `PUSHA / PUSHAD` (sin operandos).

**Ejemplo**

```asm
# Intel
# Modo de 16 bits
pusha
# Equivale a
push ax
push cx
push dx
push bx
push sp   # valor ORIGINAL de SP (antes de pusha)
push bp
push si
push di
# Detalle importante
# El SP que se guarda no es el SP ya decrementado, sino el valor original antes del pusha.
# Resultado
# Empuja 8 registros (2 bytes c/u)
# 8 x 2 = 16 bytes
# Decrementa SP en 16 bytes

# Modo de 32 bits
pushad
# Equivale a
push eax
push ecx
push edx
push ebx
push esp   # valor ORIGINAL de ESP
push ebp
push esi
push edi
# Detalle importante
# El ESP guardado es el valor antes del pushad (no el ESP modificado).
# Resultado
# Empuja 8 registros (4 bytes c/u)
# 8 x 4 = 32 bytes
# Decrementa ESP en 32 bytes
```

**¿Por qué guardar el SP/ESP original?**

Porque permite que el par `PUSHA / POPA` o `PUSHAD / POPAD` restaure exactamente el estado anterior del stack, incluso si dentro del bloque se usó el stack.

## Variantes de la instrucción `POP` (`POPF / POPFD / POPFQ`)

Restauran el registro de flags desde la pila (stack).  Y a diferencia de `PUSHF*` si afectan los flags del CPU.
El CPU filtra qué bits pueden cambiar, dependiendo de:

- Modo (16 / 32 / 64 bits).
- Nivel de privilegio (CPL).
- Tipo de Flag (control, estado, reservado).

| Instrucción | Registro | Tamaño  |
| ----------- | -------- | ------- |
| `popf`      | FLAGS    | 16 bits |
| `popfd`     | EFLAGS   | 32 bits |
| `popfq`     | RFLAGS   | 64 bits |

**Sintaxis:** `POPF / POPFD / POPFQ` (sin operandos).

**Ejemplo**

```asm
# Intel

# Restaurado del flag DF
pushfq # Guarda flags
cld    # DF = 0
std    # DF = 1
popfq  # Restaura DF al valor original

# Donde no funciona como se espera
pushfq
popfq # Intento de cambiar IF desde ring 3
# Resultado
# IF permanece igual
# No hubo excepción
# El bit simplemente se ignoró
```

**Flags del CPU que si son restaurados (generalmente)**

- `CF` Carry Flag
- `PF` Parity Flag
- `AF` Auxiliar Carry Flag
- `ZF` Zero Flag
- `SF` Sign Flag
- `OF` Overflow Flag

**Flags de control (con restricciones)**

- `DF` Direction Flag
  - Restaurable con `POPF*`.
  - Cambia la dirección de `MOVS`, `STOS`, etc. 

- `TF` Trap Flag

  - Es restaurable.
  - Puede provocar debug exception (`#DB`) inmediatamente.

- `IF` Interrupt Flag

  - En `Ring 0` es restaurado.
  - En `Ring 1 / 2 / 3` es ignorado.

  En modo usuario `POPF*` no puede habilitar/deshabilitar interrupciones, por lo que el valor del stack se ignora para `IF`.

- `IOPL` I/O Privilege Level
  - Solo modificable en `Ring 0`.
  - En `Ring 3` los bits `IOPL` no cambian y se mantienen el valor actual.

**Flags reservados**

- El bit 1 (siempre `1`)
- Bits no documentados / futuros

Son leídos desde el stack. El CPU fuerza su valor arquitectónico y nunca quedan en estado invalido.

**Caso especial `POPFQ`**

En `RFLAGS` existen bits que jamás se pueden modificar:

| Bit  | Nombre     | Resultado   |
| ---- | ---------- | ----------- |
| 1    | Always-1   | Forzado a 1 |
| 3,5  | Reservados | Forzados    |
| >21  | Reservados | Ignorados   |

**Aunque metas basura en el stack, el CPU la limpia.**

Usos típicos

- Guardar flags alrededor de código crítico.

- Manipular `DF`.

  ```asm
  # Intel
  pushfq
  cld
  # operaciones string
  popfq
  ```

- Debug / Trampas

  ```asm
  # Intel
  pushfq
  or qword [rsp], 0x100  # setea TF (bit 8 de RFLAGS)
  popfq                  # single-step
  # Cuando se setea TF = 1 el CPU entra en single-step mode, Esto significa que después de ejecutar cada instrucción, el CPU lanza una excepcin #DB (Debug Exception).
  # No se interrumpe antes de la instrucción, sino después.
  
  # Ejemplo de breakpoint
  int3
  # Trampa especial de debug
  # Un solo byte 0xCC
  # Usada por gdb, x64dbg, etc
  # El programa se detiene justo después de ejecutarla
  
  # Ejemplo de trampa moderna y rápida
  syscall
  # Entrada controlada por kernel (muy usada en x86-64)
  
  # Ejemplo de trampa en x86
  int 0x80
  # Se usa en Linux x86 para llamadas al sistema
  # El CPU guarda EIP/RIP, CS y EFLAGS para luego saltar al handler del sistema operativo
  ```
  
  **¿Qué son las trampas?**
  
  Son mecanismos de control del CPU que interrumpen el flujo normal de ejecución para que el procesador pase el control al sistema operativo (o a un manejador especial), generalmente de forma sincrónica, justo después de ejecutar una instrucción.
  
  **Características**
  
  - Ocurren porque el propio programa ejecutó algo específico.
  - El CPU sabe exactamente en qué instrucción ocurrió.
  - El control pasa a un handler (manejador) definido por el SO.
  - Tras manejarla, normalmente se puede continuar la ejecución.
  
  **Trampa vs interrupción**
  
  | Característica | Trampa                        | Interrupción        |
  | -------------- | ----------------------------- | ------------------- |
  | Origen         | Software / instrucción        | Hardware            |
  | Momento        | Después de la instrucción     | Entre instrucciones |
  | Predecible     | Sí                            | No                  |
  | Ejemplo        | `int 0x80`, `syscall`, `int3` | Teclado, reloj, red |

## Variantes de la instrucción `POP` (`POPA / POPAD`)

Son las instrucciones complementarias de `PUSHA / PUSHAD`. Sacan del stack todos los registros generales en bloque. (Existen en modos ed 16 y 32 bits pero no 64 bits). No modifica los flags del CPU.

| Instrucción | Modo    | Tamaño  |
| ----------- | ------- | ------- |
| `popa`      | 16 bits | 16 bits |
| `popad`     | 32 bits | 32 bits |

**Sintaxis:** `POPA / POPAD` (sin operandos).

**Ejemplo**

```asm
# Intel

# Modo de 16 bits
popa
# Equivale a
pop di
pop si
pop bp
pop sp   # Se descarta
pop bx
pop dx
pop cx
pop ax
# Importante: el valor de SP se lee desde el stack pero no se restaura en SP
# Resultado
# Se consumen 16 bytes desde el stack
# SP incrementa en 16 bytes
# SP no es restaurado

# Modo de 32 bits
popad
# Equivale a
pop edi
pop esi
pop ebp
pop esp   # Se descarta
pop ebx
pop edx
pop ecx
pop eax
# Importante: ESP no se restaura pése a que si es leído desde el stack.
# Resultado
# Se consumen 32 bytes
# ESP es incrementado en 32 bytes
```

**¿Por qué no se restauran `SP / ESP`?**

Porque sería peligroso. Si `POPA / POPAD` restauran `SP / ESP` el puntero cambiaría a mitad de la instrucción, el resto de los pop leerían desde una dirección distinta y el stack quedaría corrupto.
Por eso el valor se descarta pero el stack avanza normalmente.

## Instrucción `DIV` (división entera sin signo)

Permite realizar **división entera sin signo**. Tiene varias modalidades según el tamaño del operando, y eso cambia qué registros se usan implícitamente y dónde quedan el cociente y el resto. `DIV` siempre usa registros fijos (a diferencia de `ADD` o `MUL`). No define ningún flag del CPU. Para la división con signo se usa la instrucción `IDIV`.

**Reglas generales**

- El dividendo está en registros implícitos.
- El cociente y el resto quedan en registros implícitos.
- Si el cociente no cabe en el registro implícito, ocurre #DE (Division Error).

**División de 8 bits**

**Sintaxis:** `DIV r/m8`.

**Registros usados**

| Rol       | Registro       |
| --------- | -------------- |
| Dividendo | `AX` (16 bits) |
| Divisor   | `r/m8`         |
| Cociente  | `AL`           |
| Resto     | `AH`           |

**Ejemplo**

```asm
# Intel
mov ax, 100 # ax = 100
mov bl, 7   # divisor = 7
div bl
# Resultado
# al = 14 (100 / 7)
# ah = 2 (100 % 7)
```

**Importante:** Aunque el divisor sea de 8 bits, el dividendo siempre es `AX`.

**División de 16 bits**

**Sintaxis:** `DIV r/m16`

**Registros usados**

| Rol       | Registro          |
| --------- | ----------------- |
| Dividendo | `DX:AX` (32 bits) |
| Divisor   | `r/m16`           |
| Cociente  | `AX`              |
| Resto     | `DX`              |

**Ejemplo**

```asm
# Intel
mov dx, 0
mov ax, 1000
mov bx, 30
div bx
# Resultado
# ax = 33
# dx = 10
# dx:ax forman el dividendo de 32 bits
```

**División de 32 bits**

**Sintaxis:** `DIV r/m32`

**Registros usados**

| Rol       | Registro            |
| --------- | ------------------- |
| Dividendo | `EDX:EAX` (64 bits) |
| Divisor   | `r/m32`             |
| Cociente  | `EAX`               |
| Resto     | `EDX`               |

**Ejemplo**

```asm
# Intel
mov edx, 0
mov eax, 100000
mov ecx, 300
div ecx
# Resultado
# eax = 333
# edx = 100
```

**División de 64 bits**

**Sintaxis:** `DIV r/m64`

**Registros usados**

| Rol       | Registro             |
| --------- | -------------------- |
| Dividendo | `RDX:RAX` (128 bits) |
| Divisor   | `r/m64`              |
| Cociente  | `RAX`                |
| Resto     | `RDX`                |

**Ejemplo**

```asm
# Intel
mov rdx, 0
mov rax, 100000000000
mov rbx, 3000
div rbx
# Resultado
# rax = 33333333333
# rdx = 1000
```

**Nota:** el dividendo puedo ser de 128 bits.

**Importante:**

Como se vio en todos los ejemplos que componen al dividendo con dos registros, primero se limpia la parte alta. Olvidar limpiar dichos registros, constituye un error común que afecta los resultados de la división.

## Instrucción `IDIV` (división entera con signo)

Divide un dividendo implícito (más grande) por un divisor explícito y devuelve: cociente (en otro registro), resto (en otro registro). Todo con signo (usando complemento a dos para números negativos).
El divisor es el único operando de la instrucción.
**Importante:** el resto conserva el signo del dividendo.

**Sintaxis:**

```asm
idiv r/m8
idiv r/m16
idiv r/m32
idiv r/m64
```

**Registros usados por `IDIV` según el tamaño del divisor**

| Tamaño del divisor (`idiv r/mX`) | Dividendo implícito (entrada) | Cociente (salida) | Resto (salida) |
| -------------------------------- | ----------------------------- | ----------------- | -------------- |
| **8 bits** (`idiv r/m8`)         | `AX` → (`AH:AL`)              | `AL`              | `AH`           |
| **16 bits** (`idiv r/m16`)       | `DX:AX`                       | `AX`              | `DX`           |
| **32 bits** (`idiv r/m32`)       | `EDX:EAX`                     | `EAX`             | `EDX`          |
| **64 bits** (`idiv r/m64`)       | `RDX:RAX`                     | `RAX`             | `RDX`          |

**Antes de usar `IDIV` se debe extender el signo correctamente.**

Significa copiar el bit del signo del valor menor hacia los bits altos del dividendo completo, antes de ejecutar `IDIV`. (Nótece que los dividendos son compuestos por dos registros).

**Instrucciones usadas para extender el signo antes de `IDIV`.**

| Instrucción | Modo CPU | Extiende **desde** | Extiende **hacia** | Tamaños  |
| ----------- | -------- | ------------------ | ------------------ | -------- |
| **CBW**     | 16-bit   | `AL`               | `AX`               | 8 → 16   |
| **CWDE**    | 32-bit   | `AX`               | `EAX`              | 16 → 32  |
| **CDQE**    | 64-bit   | `EAX`              | `RAX`              | 32 → 64  |
| **CWD**     | 16-bit   | `AX`               | `DX:AX`            | 16 → 32  |
| **CDQ**     | 32-bit   | `EAX`              | `EDX:EAX`          | 32 → 64  |
| **CQO**     | 64-bit   | `RAX`              | `RDX:RAX`          | 64 → 128 |

### Instrucción `CBW` (convert byte to word)

Convierte un valor con signo de 8 bits a 16 bits, extendiendo el bit de signo. Toma el contenido de `AL` (8 bits), lo extiende con signo y deja el resultado en `AX`. No afecta ningún flag del CPU. Cuesta 1 µop (micro operación).

**Ejemplo**

```asm
# Intel
# Valor positivo
mov al, 0x7F # 0111 1111b (127)
cbw          # ax = 0x007F
# MSB de al es 0
# ax = 0000 0000 0111 1111

# Valor negativo
mov al, 0x80 # 10000000b (-128) (en complemento a dos)
cbw          # ax = 0xFF80
# MSB de al es 1
# ax = 1111 1111 1000 0000
```

### Instrucción `CWDE` (convert word to dbubleword extended)

Extiende el signo de `AX` a `EAX`, interpretando `AX` como un entero con signo. (Solo funciona en 32 bits). En CPUs modernas cuesta 1 µop (micro operación).
Toma el valor de `AX` (16 bits con signo), copia su valor en `EAX` (32 bits) y rellena los bits altos del 31 al 16 con:

- 0 si el bit de signo de `AX` es 0.
- 1 si el bit de signo de `AX` es 1.

Es decir, preserva el valor numérico con signo.

**Ejemplo**

```asm
# Intel
# Valor positivo
mov ax, 0x007F # 127 (0000 0000 0111 1111)
cwde           # eax = 0x0000007F (0000 0000 0000 0000 0000 0000 0111 1111)

# Valor negativo
mov ax, 0xFF80 # -128 (1111 1111 1000 0000)
cwde           # EAX = 0xFFFFFF80 (1111 1111 1111 1111 1111 1111 1000 0000)
```

### Instrucción `CDQE` (convert doubleword to quadword extended)

Extiende con signo un entero de 32 bits a 64 bits. No afecta los flags del CPU. En CPUs modernas cuesta 1 µop (micro operación).
Toma el valor de `EAX` (32 bits) y lo extiende con signo, dejando el resultado en `RAX` (64 bits). El bit de signo de `EAX` (bit 31) se replica en los bits altos de `RAX`.

**Ejemplo**

```asm
# Intel
# Valor positivo
mov eax, 0x0000007F # 127 (0000 0000 0000 0000 0000 0000 0111 1111)
cdqe                # rax = 0x000000000000007F
# RAX: 0000 0000 0000 0000 0000 0000 0000 0000
#      0000 0000 0000 0000 0000 0000 0111 1111

# Valor negativo
mov eax, 0xFFFFFF80 # -128 (1111 1111 1111 1111 1111 1111 1000 0000)
cdqe                # rax = 0xFFFFFFFFFFFFFF80
# RAX: 1111 1111 1111 1111 1111 1111 1111 1111
#      1111 1111 1111 1111 1111 1111 1000 0000
```

### Instrucción `CWD` (convert word to doubleword)

Extiende el signo del acumulador antes de una división con signo `IDIV`. No modifica los flags del CPU de forma útil. Según algunos manuales de Intel y AMD, algunos flags internos si pueden cambian, pero no deben usarse después.
En CPUs modernas `CWD` cuesta 0 µops (micro instrucciones). En arquitecturas como: Intel Core (Nehalen a Aldr Lake / Raptor Lake) y AMD Zen (Zen 1 al 4), `CWD` es una instrucción simple, determinista y sin dependencias externas, por lo que:

- No se decodifica en µops reales.
- Se resuelve en el register rename / execution stage.
- Tiene una latencia efectiva de 0 ciclos.

**Nota:** En CPUs antiguas (pre P6) no existía el concepto de µops, debido a que internamente era lógica cableada. El coste era 1 instrucción (no comparable a µops modernos).

Toma el valor con signo de `AX` (16 bits) y lo extiende con signo en `DX:AX` (32 bits). Se usa antes de `IDIV r/m16`. `CWD` copia el bit de signo de `AX` (bit 15) a todos los bits de `DX`. (`AX` no cambia).

| AX (signo) | DX después de CWD |
| ---------- | ----------------- |
| positivo   | `0x0000`          |
| negativo   | `0xFFFF`          |

**Ejemplo**

```asm
# Intel
# Valor positivo
mov ax, 0x1234 # 0001 0010 0011 0100
cwd            # dx = 0x0000
# Resultado
# DX:AX = 0000:1234

# Valor negativo
mov ax, 0xFF80 # -128 (16 bits)
cwd            # dx = 0xFFFF
# Resultado
# DX:AX = FFFF:FF80 (-128 en 32 bits)
```

### Instrucción `CDQ` (convert doubleword to quadword)

Extiende el signo de `EAX` hacia `EDX:EAX`. No modifica ningún flag del CPU (mantienen sus valores después de ejecutar `CDQ`). En CPUs modernas cuesta 1 µops (micro instrucciones).
Toma el bit de signo de `EAX` (bit 31) y llena `EDX` con:

- `0x00000000` si `EAX` es positivo o cero.
- `0xFFFFFFFF` si `EAX` es negativo.

No modifica `EAX`, solo prepara `EDX`.
`CDQ` Se usa casi exclusivamente para preparar una división con signo de 32 bits.

**Ejemplo**

```asm
# Intel
# Valor positivo
mov eax, 123
cdq
# Resultado
# EAX = 0x0000007B
# EDX = 0x00000000
# EDX:EAX = 00000000:0000007B

# Valor negativo
mov eax, -1 # eax = 0xFFFFFFFF
# eax = 1111 1111 1111 1111 1111 1111 1111 1111
cdq
# Resultado
# EAX = 0xFFFFFFFF
# EDX = 0xFFFFFFFF
# EDX:EAX = FFFFFFFF:FFFFFFFF

# Valor límite
mov eax, 0x80000000 # eax = -2147483648
cdq
# Resultado
# EAX = 0x80000000
# EDX = 0xFFFFFFFF
# EDX:EAX FFFFFFFF:80000000
```

### Instrucción `CQO` (convert quadword to octword)

Es la versión de 64 bits de la familia de sign-extension usada antes de divisiones con signo en x86. No modifica ningún flag del CPU. En CPUs modernas cuesta 1 µops (micro operación).
Extiende el signo de `RAX` hacia `RDX:RAX`.
Toma el valor con signo que está en `RAX` (64 bits) y rellena `RDX` con:

- `0x0000000000000000` si `RAX >= 0`.
- `0xFFFFFFFFFFFFFFFF` si `RAX < 0`.

Formando un entero con signo de 128 bits en el par `RDX:RAX`.

**Ejemplo**

```asm
# Intel
# Valor positivo
mov rax, 42
cqo
# Resultado
# RDX = 0x0000000000000000
# RAX = 0x000000000000002A
# RDX:RAX 0000000000000000:000000000000002A

# Valor negativo
mov rax, 042
cqo
# Resultado
# RAX = 0xFFFFFFFFFFFFFFD6
# RDX = 0xFFFFFFFFFFFFFFFF
# RDX:RAX FFFFFFFFFFFFFFFF:FFFFFFFFFFFFFFD6
```

## De vuelta a `IDIV`

**Ejemplo (división de 8 bits `CBW`)**

```asm
# Intel
# Dividir: -20 / 3 usando CBW
mov al, -20 # al = -20 (0xEC)
cbw         # extiende signo AL -> AX (ah = 0xFF)
mov bl, 3   # divisor
idiv bl     # ax / bl = -20 / 3
# Resultado
# AL = -6 (cociente)
# AH = -2 (resto)
```

**¿Qué sucede si no se usa `CBW`?**

- `AH` contendría basura
- `AX` no representaría -20
- Resultado incorrecto o **#DE**.

**Ejemplo (división de 16 bits con `CWD`)**

```asm
# Intel
# Dividir -100 / 9
mov ax, -100 # ax = -100 (0xFF9C)
cwd          # extiende signo de AX en DX -> DX:AX
mov bx, 9    # divisor (r/m16)
idiv bx      # (DX:AX) / BX
# Resultado
# AX = -11 (cociente)
# DX = -1 (resto)
```

**Ejemplo (división de 32 bits con `CDQ`)**

```asm
# Intel
# Dividir -1_000_000 / 3
mov eax, -1000000
cdq        # extiende el signo de EAX a EDX:EAX
mov ecx, 3 # divisor (r/m32)
idiv ecx   # (EDX:EAX) / ECX
# Resultado
# EAX = -333333 (cociente)
# EDX = -1 (resto)
```

**Ejemplo (división de 64 bits con `CQO`)**

```asm
# Intel
# Dividir -1_000_000_000_000 / 7
mov rax, -1000000000000 # RAX = -1e12
cqo                     # extiende el signo de RAX a RDX:RAX
mov rcx, 7              # divisor (r/m64)
idiv rcx                # (RDX:RAX) / RCX
# Resultado
# RAX = -142857142857 (cociente)
# RDX = -1 (resto)
```

**Ejemplo (división de 32 bits con `CWDE`)**

Se tiene un valor con signo en `AX` (16 bits) y se quiere:

- Promover a 32 bits correctamente.
- Dividirlo usando `IDIV r/m32`.

```asm
# Intel
# Dividir -300 / 7
mov ax, -300 # ax = -300 (0xFED4)
cwde         # extiende AX a EAX con signo
cdq          # extiende EAX a EDX:EAX
mov ecx, 7   # divisor (32 bits)
idiv ecx     # (EDX:EAX) / ECX
# Resultado
# EAX = -42 (cociente)
# EDX = -6 (resto)
```

**Ejemplo (división de 64 bits con `CDQE`)**

Se tiene un valor con signo en `EAX` (32 bits) y se quiere:

- Promover a 64 bits correctamente.
- Dividir usando `IDIV r/m64`.

```asm
# Intel
# Dividir -2_000_000 / 9
mov eax, -2000000 # eax = 0xFFE17B80
cdqe              # extiende EAX a RAX
cqo               # extiende RAX a RDX:RAX
# RDX = 0xFFFFFFFFFFFFFFFF
# RAX = 0xFFFFFFFFFFE17B80 (-2_000_000)
mov rcx, 9        # divisor (64 bits)
idiv rcx          # (RDX:RAX) / RCX
# Resultado
# RAX = -222_222
# RDX = -2
```

### Excepción #DE (Divide Error)

`#DE` es una excepción de CPU que ocurre durante `DIV` / `IDIV`. (No exclusivamente por dividir por cero).

**Casos en que ocurre `#DE`**

- Dividir por 0

  ```asm
  # Intel
  mov eax, 10
  cdq
  mov ecx, 0
  idiv ecx # #DE
  ```

- El cociente no cabe en el registro destino

  Es la que mas bugs reales causa. Si el cociente no cabe en: `AL` (8 bits), `AX` (16 bits), `EAX` (32 bits), `RAX` (64 bits). Entonces la CPU lanza `#DE` (aunque matemáticamente la división sea válida).

  **Ejemplo clásico de overflow (16 bits)**

  ```asm
  # Intel
  # 32_768 / 1 da overflow en AX
  mov ax, 0x8000 # ax = -32_768
  cwd
  mov bx, -1
  idiv bx        # #DE
  ```

  **¿Por qué falla?**

  Porque `-32_768 / -1 = +32_768`, y `AX` solo puede representar de `-32_768` a `+32_767`, por lo que `+32_768` no cabe en `AX`. El resultado es `#DE`.

  **Ejemplo en 32 bits**

  ```asm
  # Intel
  mov eax, 0x80000000 # -2_147_483_648
  cdq
  mov ecx, -1
  idiv ecx            # #DE
  ```

  Mismo problema, `-2_147_483_648 / -1 = +2_147_483_648  (overflow)`.

## Instrucción `BT` (bit test)

Prueba un bit específico en un registro o en memoria y copia su valor a `CF` (Carry Flag) sin modificar el operando. No afecta a ningún otro flag del CPU.

**Sintaxis:** `BT src, pos` donde `src` puede ser un registro o una dirección de memoria, y `pos` es la posición del bit a probar, el que puede ser un registro o un valor inmediato. En `pos` el bit se numera desde cero (LSB o bit menos significativo) hasta `n-1`, donde `n` es el tamaño del operando.

**Ejemplo**

```asm
# Intel
# Bit en registro
mov eax, 0xA4 # eax = 1010 0100b
bt eax, 5     # prueba el bit 5 de EAX
# EAX = 0xA4 (no cambia)
# CF = 1 porque el bit 5 es uno

# Bit con registro como índice
mov eax, 0xFFF # eax = 4095 (0000 0000 0000 0000 0000 1111 1111 1111b)
mov ecx, 7
bt eax, ecx    # prueba el bit 7 de eax
# EAX = 0xFFF (no cambia)
# CF = 1 porque el bit 7 es uno
```

## Instrucción `BTS` (bit test and set)

Prueba un bit específico en un registro o memoria, copia su valor a `CF` (Carry Flag) y luego lo setea en uno. No afecta a ningún otro flag del CPU.

**Sintaxis:** `BT src, pos`, donde `src` es la fuente con la que se opera, la que puede ser un registro o una dirección de memoria, y `pos` es el índice del bit desde cero (siendo cero el bit LSB).

Ejemplo

```asm
# Intel
# Bit en registro
mov eax, 0x24 # eax = 0010 0100b
bts eax, 5    # prueba el bit 5 y lo pone en uno
# Bit 5 = 1 por lo que CF = 1
# Después de BTS, EAX = 0010_0100b | 0010_0100b = 0010_0100b
# En este caso el bit 5 ya estaba en uno, así que no cambia
# CF captura el valor original del bit y luego bts lo setea en uno

# Bit en memoria
mov dword [var], 0x0000 # [var] 0000 0000 0000 0000 0000 0000 0000 0000
bts dword [var], 3 # [var] = 0000 0000 0000 0000 0000 0000 0000 1000
# CF = 0 porque el bit 3 original estaba en cero
# [var] = 0x0008 (bit 3 ahora en uno)
```

## Instrucción `BTR` (bit test and reset)

Prueba un bit específico en un registro o memoria, copia su valor a `CF` (Carry Flag) y luego lo setea en cero. No afecta a ningún otro flag del CPU.

**Sintaxis:** `BTR src, pos` donde `src` es la fuente con la que se opera, la que puede ser un registro o una dirección de memoria, y `pos` es el índice del bit desde cero (siendo cero el bit LSB).

**Ejemplo**

```asm
# Intel
# Bit en registro
mov eax, 0x2C # eax = 0000 0000 0000 0000 0000 0000 0010 1100
btr eax, 5    # prueba el bit 5 y lo pone en cero
# EAX = 0000 0000 0000 0000 0000 0000 0000 1100
# Bit 5 original = 1 por lo tanto CF = 1
# Después de BTR, el bit 5 de EAX queda en cero

# Bit en memoria
mov dword [var], 0x0008 # [var] = 0000 0000 0000 0000 0000 0000 0000 1000
btr dword [var], 3      # prueba el bit 3 y lo pone en cero
# [var] = 0000 0000 0000 0000 0000 0000 0000 0000
# CF = 1 porque el bit original era uno
# Bit 3 después de BTR queda en cero
```

## Instrucción `BTC` (bit test and complement)

Prueba un bit específico de un operando y lo invierte (complementa). Es como combinar un `BT` con una operación de negación `NOT` solo en el bit seleccionado. No afecta a ningún otro flag del CPU.

**Sintaxis:** `BTC src, pos`

```asm
BTC r/m, r
BTC r/m, imm
```

Donde `src` es la fuente donde está el bit a manipular, y puede ser un registro o una dirección de memoria. Y  `pos` es el índice del bit desde cero (siendo cero el bit LSB), el que puede ser un registro (indicando el número del bit) o un valor inmediato.

**Ejemplo: **

```asm
# Intel
mov eax, 10 # eax = 0000 0000 0000 1010
btc eax, 1  # Complementa el bit 1
# eax = 0000 0000 0000 1000
# CF = 1 porque el bit 1 original estaba en uno
# El bit 1 queda en cero
```

## Instrucción `ROL` (rotate left)

Rota los bits de un operando hacia la izquierda. Los bits que salen por la izquierda vuelven a entrar por la derecha. (No se pierden bits, solo se reacomodan). Afecta principalmente a `CF` (Carry Flag) y en el caso de que solo se rote 1 bit a `OF` (Overflow Flag).

**¿Cómo afecta los flags?**

- `CF` toma el valor del último bit que salió por la izquierda.
- `OF` puede modificarse solo si se rota un bit.
  **Fórmula:** `OF = XOR(CF, NUEVO_MSB)`
- El resto de flags no se  ven afectados.

**Sintaxis:**

```asm
ROL r/m, cl  # número de bits a rotar determinado por CL
ROL r/m, imm # número de bits a rotar determinado por un inmediato
```

**Ejemplo**

```asm
# Intel
mov al, 0x99 # al = 1001 1001b
rol al, 1    # rota 1 bit a la izquierda
# AL = 0011 0011b
# CF = 1 porque el bit que salió por la izquierda era 1
```

**Usos comunes**

- Cifrado y hash
  Muchos algoritmos de cifrado (DES, RC5, SHA, etc) usan rotaciones circulares para mezclar bits sin perder información.
- Manipulación de flags o empaquetamiento de bits.
  Permite mover bits a posiciones específicas dentro de un registro sin sobrescribir otros.
- Cálculo de checksum o CRC
  Para generar sumas de verificación rápidas o códigos de redundancia cíclica.
- Optimización en algoritmos aritméticos
  Los PRNG (generadores de números pseudoaleatorios) usan rotaciones de bits para mezclar el estado interno.
- Códigos de compresión o empaquetamiento de datos
  Para reorganizar bits y aprovechar mejor el espacio en memoria.
- Criptografía simple de "ofuscación"
  Rotaciones rápidas de bytes o palabras pueden servir para ocultar datos sin un cifrado completo. (Muy usado en malware o juegos para proteger variables).

## Instrucción `ROR` (rotate right)

Rota los bits del operando a la derecha, reingresando por la izquierda los bits que salen (por la derecha). No se pierden bits (se reacomodan). Afecta a `CF` (Carry Flag) y a `OF` (Overflow Flag) (cuando la rotación es de solo un bit, para conteos mayores `OF` queda indefinido). 

**¿Cómo afecta los flags?**

- `CF` recibe el último bit rotado fuera, es decir, el LSB original del operando.

- `OF` solo se define si el conteo de bits rotados es de uno. Para conteos mayores queda indefinido.
  **Fórmula: ** `OF = XOR(MSB_RESULTADO, BIT(MSB_RESULTADO - 1))`

  ```asm
  # Resultado = 1010 1010
  # MSB = 1
  # MSB - 1 = 0
  ```

**Sintaxis:**

```asm
ROR r/mX, CL # rnúmero de bits a rotar determinado por CL
ROR r/mX, 1  # número de bits a rotar determinado por un inmediato
# X: 8, 16, 32, 64
```

**Ejemplo**

```asm
# Intel
# Rotación de 1 bit
mov al, 0xB1 # al = 1011 0001b
ror al, 1    # rota 1 bit a la derecha
# AL = 1101 1000b (0xD8)
# CF = 1 porque el último bit rotado es un uno
# OF = 0 porque XOR(1,1) = 0

# Rotación de 2 bits
mov al, 0xB1 # 1011 0001b
ror al, 2    # rota 2 bits a la derecha
# AL = 0110 1100
# CF = 0 porque el último rotado fue un cero
# OF indefinido porque se rotaron dos bits
```

## Rotaciones pares respecto al tamaño del registro

Supongamos un registro de 8 bits como `AL`.

```asm
# Intel
rol al, 8
```

El desplazamiento es igual al tamaño del registro, por lo que el CPU no cambia el valor de `AL`. Esto se debe a que rotar 8 bits un registro que ya es de 8 bits es equivalente a dar una vuelta completa en donde cada bit vuelve a su posición original. Lo mismo ocurre con cualquier múltiplo del tamaño del registro:

- `ROL AL, 16` idéntico a `ROL AL, 8` (`mod 8 = 0`).
- `ROL EAX, 32` no cambia `EAX` (32 bits).

En general si `[ bit_pos % length(operando) ] = 0` no pasa nada.

**Estado de `CF` (Carry Flag)**

En estas rotaciones completas `CF` puede comportarse de manera predecible o indefinida dependiendo del procesador. Por ej. en Intel, cuando el desplazamiento es igual al tamaño del registro, `CF` no se actualiza, o se mantiene igual.

**Optimizaciones**

Esto permite hacer optimizaciones. Si se quiere rotar un registro completo varias veces, es posible omitir las rotaciones que sean múltiplos del tamaño del registro, porque no alteran el valor. Es común ver esto en micro código o en algoritmos criptográficos cuando se hacen rotaciones de 32 o 64 bits.

## Instrucción `RCR` (rotate through carry right)

Rota a la derecha a través del carry. A diferencia de una rotación normal `ROR`, `RCR` incluye el Carry Flag `CF` como parte de la rotación. Es decir, la rotación no es circular solo sobre el registro, sino sobre el `registro + CF`.

**¿Qué flags del CPU modifica?**

- `CF` (Carry Flag) Se actualiza siempre con el último bit que sale del operador de destino. 
- `OF` (Overflow Flag) Se actualiza solo si se rota un bit. Indica si el signo cambió de manera inconsistente en operaciones de rotación de 1 bit.
  **Fórmula:** `OF = XOR(MSB original, CF después de la rotación)`
  **Importante:** Para rotaciones de mas de un bit, `OF` permanece indeterminado. 
- El resto de flags no se ven afectados.

**Sintaxis:** `RCR r/m, count`

- `r` registro de 8/16/32/64 bits.
- `m` posición de memoria.
- `count` número de posiciones a rotar. Normalmente entre 1 y 31/63 según arquitectura.

**Ejemplo (rotación de 1 bit)**

```asm
# Intel
# Rotación de 1 bit
# CF = 1
mov al, 0xB6 # al = 1011 0110b
rcr al, 1 # Cada bit se mueve una posición a la derecha
# El bit LSB (0) se va a CF 1011 011[0] -> CF
# CF = 0
# El CF original (1) entra como el bit MSB
# CF original -> [1]101 1011
# Todos los demás bits de mueven a la derecha
# AL = 1101 1011
```

**Ejemplo (rotación de `n > 1` bits)**

Cuando `n > 1`, el desplazamiento se realiza en pasos de rotación (incluyendo `CF`).  Se rotan un total de posiciones de `mod (tamaño(registro) + 1)` porque el ciclo completo incluye `registro + CF`.

**Paso a paso**

```asm
# Intel
# CF = 1
mov al, 0b10110110 # al = 0xB6
rcr al, 3
# Primera rotación
# AL = 1011 0110
# CF = 1
# LSB (0) -> CF (0)
# CF (original) -> MSB (1)
# AL = 1101 1011
# CF = 0

# Segunda rotación
# AL = 1101 1011
# CF = 0
# LSB (1) -> CF (1)
# CF anterior (0) -> MSB (0)
# AL = 0110 1101
# CF = 1

# Tercera rotación
# AL = 0110 1101
# CF = 1
# LSB (1) -> CF (1)
# CF anterior (1) -> MSB (1)
# AL = 1011 0110
# CF = 1
```

## Instrucción RCL (rotate through carry left)

Toma un registro o un valor en memoria y lo rota hacia la izquierda usando `CF` como bit extra en la rotación. Es decir, que `CF` entra en el bit LSB durante la rotación, y el bit MSB sale a `CF`.

**¿Que flags del CPU afecta?**

- `CF`Siempre se modifica, después de `RCL` queda con el último bit que salió del MSB del operando.

- `OF` Solo cuando se realizan rotaciones de 1 bit. Para `count > 1` queda indefinido. (Se define al final de la operación).

  **Fórmula:** `XOR(MSB, CF)`

**Sintaxis:** `RCL r/m, count`

**Parámetros**

- `r/m` Registro o posición de memoria (byte o word según el tamaño).
- `count` Valor inmediato, 1-31 dependiendo del tamaño del operando (8 a 32 bits). O el registro `CL` para rotaciones variables.

**Ejemplo (rotación de 1 bit)**

```asm
# Intel
# Rotación de 1 bit
# CF = 1
mov al, 0xB6 # al = 1011 0110b
rcl al, 1
# MSB -> CF (1)
# CF anterior -> LSB (1)
# AL = 0110 1101
# CF = 1
```

**Ejemplo (rotación de 3 bits)**

```asm
# Intel
# Rotación de 3 bits
# CF = 1
mov al, 0xB6 # al = 1011 0110b
rcl al, 3
# Primera rotación
# AL = 1011 0110
# CF = 1
# MSB -> CF (1)
# CF anterior -> LSB (1)
# AL = 0110 1101
# CF = 1

# Segunda rotación
# AL = 0110 1101
# CF = 1
# MSB -> CF (0)
# CF anterior -> LSB (1)
# AL = 1101 1011
# CF = 0

# Tercera rotación
# AL =  1101 1011
# CF = 0
# MSB -> CF (1)
# CF anterior -> LSB (0)
# AL = 1011 0110
# CF = 1
```

## ¿Qué es un `OPCODE` en x86-64?

Un `opcode` es el byte (o bytes) que indican qué instrucción ejecutar. En x86-64 una instrucción no es un byte fijo, sino algo como:

`[prefixes] [opcode] [ModRM] [SIB] [displacement] [immediate]`

**Nota:** Algunas partes puede no existir.

### Longitud variable

Las instrucciones pueden medir entre 1 a 15 bytes de largo, por ej:

- `NOP` mide 1 byte y se representa por el byte `90` (en hex).
- `mov rax, 0x1122334455667788` mide 10 bytes y es representada por `48 B8 88 77 66 55 44 33 22 11`.

### Prefijo `REX`

En x86-64 aparece el prefijo `REX` (acrónimo: **R**egister **EX**tension) de 1 byte que extiende las capacidades del encoding x86 en modo 64 bits.

```asm
REAX = 0100WRXB
# W R X B son las extensiones

Bit: 7 6 5 4 3 2 1 0
     0 1 0 0 W R X B
```

- `0100` identifica que es un `REX`.
- `W` operando de 64 bits.
- `X` extiende el campo `reg`.
- `B` extiende el campo `index` (SIB).
- `B` extiende el campo `r/m` o registro base.

**Ejemplos concretos**

`REX` usa estos bytes (`0x40-0x4F`) como un prefijo para decirle al CPU cómo debe interpretar la instrucción que viene después.
No es una instrucción por sí misma, sino metadatos para el decodificador.

| Hex    | Binario    | Significado               |
| ------ | ---------- | ------------------------- |
| `0x40` | `01000000` | REX presente, sin flags   |
| `0x48` | `01001000` | `W=1` → operación 64 bits |
| `0x41` | `01000001` | `B=1` → registros r8–r15  |
| `0x4C` | `01001100` | `W=1, R=1`                |
| `0x4F` | `01001111` | W,R,X,B = 1               |

El CPU decodifica el instruction stream en modo 64 bits haciendo algo como:

1. Leer un byte.
2. Si el byte está entre `0x40` y `0x4F` lo reconoce como prefijo `REX`.
3. Guarda los bits `W R X B` en flags internos del decodificador.
4. Lee el `opcode` real.
5. Usa esos flags para:
   1. Decidir tamaño de operando (32 vs 64 bits).
   2. Extender registros (`RAX` -> `R8-R15`).
   3. Extender Campos `ModRM` / `SIB`.

Luego `REX` ya no existe y solo afectó la decodificación.

**Sin `REX`**

- Solo hay 8 registros (`RAX` a `RDI` o sus versiones de 32/16/8 bits).
- Los operandos por defecto son de 32 bits.

**Con `REX`**

- Aparecen los registros `R8` al `R15`.
- Se pueden usar operandos de 64 bits.
- Se amplían campos del `ModRM/SIB`.
  `ModRM` es un byte que acompaña a muchos `opcodes` x86 y sirve para decir que registros se usan y/o qué modo de direccionamiento de memoria se aplica. Básicamente indica que tal `opcode` opera con tal registro y/o tal dirección.
  `SIB` (Scale-Index-Base) es otro byte opcional, usado solo cuando hay direcciones complejas, para describir `[base + index * escala]`. Es usado en direcciones de tipo array y/o punteros complejos.

**Ejemplo**

```asm
# Intel
mov eax, ebx
# Código máquina
# 89 D8
# Registros solo eax-edi
# Operando implícitamente de 32 bits

# Con REX
mov rax, rbx
# Código máquina
# 48 89 D8
# 48 = REX.W
# El CPU ve: Esto es 64 bits y usa registros de 64 bits

# Registros extendidos
mov r8, rax
# Código máquina
49 89 C0
# 49 = 01001001
# W = 1
# B = 1 -> R8
# Sin ese byte esa instrucción no existe para el CPU
```

### `OPCODE` principal

Puede ser de 1 byte:

- `NOP -> 90`
- `RET -> C3`

De 2 bytes (0F xx)

- `SYSCALL 0F 05`

De 3 bytes (0F 38 / 0F 3A). Usado por SSE / AVX antiguas.

### `ModRM`

Define qué registro, memoria o registro y cómo se direcciona.

```
7 6 | 5 4 3 | 2 1 0
mod |  reg  | r/m
```

**Ejemplo**

```asm
# Intel
mov rax, rbx
# Código máquina
48 89 D8
# mod = 11 (registro)
# reg = 011 (rbx)
# r/m = 000 (rax)
```

### `SIB` (Scale Index Base)

Se usa cuando hay escalado:

```asm
# Intel
mov rax, [rbx + rcx*4]
# Si no hay escalado no hay SIB
# base = rbx
# index = rcx (1, 2, 4 u 8)
```

### Displacement (offsets reales)

En x86-64 el direccionamiento RIP-relative es siempre con un displacement de 32 bits, aunque el valor sea pequeño. Es decir, un entero de 32 bits con signo.

```asm
# Intel
mov eax, [rip + 0x1234]
# dirección de memoria efectiva = RIP siguiente + dirección de 32 bits
```

Rango efectivo del desplazamiento: `-2^31` (-2 GB) a `+2^31 - 1` (+2 GB).

**¿Qué sucede si el símbolo está a más de ±2 GB?**

El ensamblador/linker debe recurrir a una dirección de memoria de 64 bits.

```asm
# Intel
mov rax, 0x1122334455667788 # imm64
# Esto ya no es RIP-relative
```

### Inmediatos (valores literales)

```asm
# Intel
mov eax, 1
# Bytes
# B8 01 00 00 00
# 01 00 00 00 es el inmediato
```

### Relación con los saltos en x86-64

Los saltos no guardan direcciones, guardan `RIP_siguiente + offset`, donde `offset` depende del `opcode`.

| Tipo de salto | Opcode | Offset  |
| ------------- | ------ | ------- |
| short         | EB     | 8 bits  |
| near          | E9     | 32 bits |

```asm
# Intel
jmp short label
# Bytes
# EB xx
# xx es el desplazamiento con signo desde la siguiente instrucción

# salto tipo near 64 bits
start:
	nop             # 1 byte
	nop             # 1 byte
	jmp near target # salto relativo de 32 bits
	nop             # no se ejecuta
	nop             # no se ejecuta

target:
	nop
# opcode de jmp near
# E9 xx xx xx xx (rel32)
# E9 es el op code de jmp near
# rel32 es el desplazamiento con signo de 32 bits
# El offset es relativo al RIP de la instrucción siguiente
```

**Si se cuentan las direcciones:**

Suponmiendo que el cóðigo empieza en `0x400000`.

| Dirección | Instrucción |
| --------- | ----------- |
| 0x400000  | nop         |
| 0x400001  | nop         |
| 0x400002  | jmp near    |
| 0x400007  | nop         |
| 0x400008  | nop         |
| 0x400009  | target: nop |

El `jmp near` mide 5 bytes (1 byte del `opcode` + 4 bytes del offset).

**Cálculo del offset**

**Fórmula:** `offset = destino - RIP_siguiente`
**RIP siguiente:**  `0x400007`
**Destino:** `0x400009`

`offset = 0x400009 - 0x400007 = 0x00000002`

**Bytes finales del salto:** `E9 02 00 00 00`. En LE (little-endian) `02 00 00 00`.

**¿Qué hace la CPU?**

1. Ejecuta `jmp`.
2. RIP ya apunta a `0x400007`.
3. Suma `+2`.
4. Nuevo RIP = `0x400009` (`target`).

## Etiquetas

Las etiquetas son nombres simbólicos que representan una dirección de memoria dentro del programa. No ocupan espacio por sí mismas, simplemente sirven como referencias.

**Usos comunes**

- Saltos incondicionales/condicionales: `JMP`, `JE`, `JNE`, `JL`, etc.
- Llamadas a funciones `CALL`.
- Definir posiciones de datos: `.data`, `.bss`.

**Sintaxis**

```asm
nombre_etiqueta:
    # instrucciones o datos
```

El carácter `:` (dos puntos) indica que es una etiqueta.

**Tipos de etiquetas**

1. Etiquetas de código

   Se usan para saltos y llamadas.
   ```asm
   section .text
   global _start
   
   _start:
       # Programa principal
   hola:
       # Código
   fin:
       # Código
   section .data
       # Código
   ```

   En el ejemplo `hola` y `fin` son etiquetas.

2. Etiquetas de datos

   Se usan en `.data` o `.bss` para definir variables o cadenas.

   ```asm
   section .data
       contador: db 0     # un byte inicializado a 0
       texto: db "hola",0 # cadena terminada en null 
   ```

   `contador` y `texto` son etiquetas de datos (variables). Se pueden usar en instrucciones como:

   ```asm
   mov al, [contador] # carga el valor de contador en AL
   ```

**Reglas para los nombres de etiquetas**

- Pueden incluir letras, números y `_`.
- No pueden empezar con un número.
- Sensibles a mayúsculas y minúsculas (en NASM y GAS).
- Deben ser únicas dentro de la misma sección (aunque algunos ensambladores permiten etiquetas locales).

**Etiquetas locales**

Algunas sintaxis como NASM permiten etiquetas locales usando el prefijo `.` (punto).

```asm
# NASM
inicio:
	# Código
.loop: # Etiqueta local
	# Código
```

En el ejemplo anterior `.loop` es una etiqueta local.
**Nota:** Solo son accesibles dentro del alcance de `inicio:` (dependiendo del ensamblador).

## Instrucción `JMP` (jump)

Realiza un salto incondicional. Siempre transfiere el flujo de ejecución sin mirar flags ni condiciones. Cambiando el **instruction pointer** `IP / EIP / RIP` (según modo)  sin modificar los flags del CPU.
A diferencia de `CALL` no guarda la dirección de retorno. Es un cambio directo en el flujo de ejecución.

**Hay diversos tipos de `JMP`, los cuales se listan a continuación:**

**1. Salto relativo (el más común)**

**Sintaxis:** `JMP etiqueta`

El destino es relativo al instruction pointer según el modo. Se considera como un desplazamiento y es muy usado en bucles y control de flujo.

**Ejemplo**

```asm
# Intel
# 16 bits
start:
	mov ax, 1
	jmp start
# IP = IP siguiente + offset
# offset de 8 a 16 bits

# 32 bits
start:
	mov eax, 1
	jmp start
# EIP = EIP siguiente + offset
# offset de 8 a 32 bits

# 64 bits
start:
	mov rax, 1
	jmp start
# RIP = RIP siguiente + offset
# offset de 32 bits (no existe un offset de 64 bits)
```

**2. Salto corto (short  jump)**

Son desplazamientos de 8 bits con un rango de `-128` a `+127` bytes, medidos desde la instrucción siguiente.

**Ejemplo**

```asm
# Intel
section .text
global _start

_start:
	mov eax, 1
	jmp short lopp # Salto corto (offset de 8 bits)
	mov eax, 2     # Instrucción saltada
	
loop:
	inc eax
	jmp short loop # salto corto hacia atrás
```

El ensamblador verifica que `loop` esté a menos de `±128` bytes.
Codifica el salto como `EB xx` donde `xx` es el offset relativo `destio - IP_siguiente`, y `EB` es el `opcode`.

**3. Salto cercano (near jump)**

```asm
# Intel
jmp near etiqueta
```

Tiene un desplazamiento de 16 a 32 bits.

**4. Salto indirecto**

```asm
# Intel
jmp rax
jmp [memoria]
```

El destino no está codificado directamente, sino que está en un registro o en memoria.

```asm
# Intel
jmp rax         # RIP = rax
jmp [table+rcx] # salto por tabla
```

Se usa mucho en: switch/case, jump tables, virtualización, obfuscación , ROP (return-oriented programming) / explotación.

**5. Salto lejano**

```asm
# Intel
jmp far seg:offset
```

Cambia `CS:IP`. Se usa en modo real y protegido. Prácticamente inexistente en código moderno de 64 bits.

**Efecto en el predictor de saltos**

`JMP` rompe la predicción de saltos. El salto indirecto es más costoso, por lo que los compiladores intentan minimizar saltos o usar fall-through.

## Instrucción `JE` (jump if equal)

Salto condicional que depende del estado de los flags del CPU.
`JE` salta si el flag `ZF` (Zero Flag) está en uno. En otras palabras `JE  ⇔  ZF = 1` (salta si y solo sí ZF = 1).
La instrucción **no compara nada**, solo lee el estado de `ZF` y dependiendo de su valor realiza el salto.

**¿Cuándo se activa el `ZF`?**

El `ZF` se activa cuando una operación previa produce un resultado 0, típicamente con: `CMP`, `TEST` u operaciones aritméticas como `SUB`, `ADD`, etc.

**Sintaxis:** `JE etiqueta`

**Ejemplo**

```asm
# Intel
cmp eax, ebx # Internamente hace eax - ebx
je etiqueta  # Salta si eax == ebx a etiqueta:

# Ejemplo paso a paso
mov eax, 5
cmp eax, 5 # 5 - 5 = 0 -> ZF = 1
je ok      # Salta porque ZF = 1

mov ebx, 0 # Instrucción saltada
ok:        # Etiqueta a la que salta JE
mov ebx, 1 # Esta instrucción se ejecuta
# Resultado
# EBX = 1
```

**Tamaños de salto**

| Característica     | **Short**     | **Near (16-bit)** | **Near (32/64-bit)** | **Far**      |
| ------------------ | ------------- | ----------------- | -------------------- | ------------ |
| Nombre             | short         | near              | near                 | far          |
| Offset             | 8 bits signed | 16 bits signed    | 32 bits signed       | seg:offset   |
| Rango              | −128 a +127 B | −32 768 a +32 767 | ±2 GB                | Segmentado   |
| Tamaño instrucción | 2 bytes       | 3–4 bytes         | 6 bytes              | Variable     |
| Modos CPU          | 16 / 32 / 64  | 16 bits           | 32 / 64 bits         | Real / Prot. |
| RIP-relative (64b) | Sí            | No                | Sí                   | No           |
| Inmediato 64 bits  | No            | No                | No                   | No           |
| Uso actual         | Muy común     | Antiguo           | Muy común            | Obsoleto     |

## Instrucción `JZ` (jump if zero)

Salta a la irección indicada si el flag `ZF` (Zero Flag) está en uno. `ZF` queda en uno cuando el resultado de la última operación es cero. Puede ocurrir típicamente con: `CMP`, `TEST`, `SUB`, `ADD`, `AND`, `XOR`, etc.
`JZ` y `JE` son similares.

Pudiera parecer que `JZ` es una instrucción distinta a `JE`, no obstante ambas instrucciones se ensamblan al mismo `opcode` y verifican `ZF = 1`. Se aplican distintos nombres por legibilidad para los siguientes usos:

- `JE` es usado en comparaciones (`CMP`).
- `JZ` es usado en operaciones aritméticas o lógicas.

**Sintaxis:** `JZ etiqueta`

**Ejemplo**

```asm
# Intel
test eax, eax # eax & eax
jz etiqueta   # Salta si ZF = 1 después de una operación lógica
# Si eax == eax el resultado será 0 y por lo tanto ZF = 1
```

`JZ` es semánticamente mas claro que `JE` para el presente contexto.

**Tamaños de salto soportados**

`JZ` no admite saltos lejanos (solo relativos).

| Tipo  | Displacement  | Arquitectura     |
| ----- | ------------- | ---------------- |
| short | 8 bits (±128) | x86 / x64        |
| near  | 16 bits       | x86 16-bit       |
| near  | 32 bits       | x86 32-bit / x64 |

**`OPCODES`**

| Tipo       | Opcode     |
| ---------- | ---------- |
| `jz short` | `74 cb`    |
| `jz near`  | `0F 84 cd` |

## Instrucción `JNE` (jump if not equal)

Salto condicional. Salta si los valores comparados no son iguales. Es decir, salta si `ZF` es cero. Por lo que también se le conoce como su versión `JNZ` (jump is not zero). No modifica ningún flag del CPU. Solo lee el flag `ZF` (Zero Flag).
Usada normalmente después de instrucciones como: `CMP`, `TEST`, `SUB`, `ADD`, etc.

**Sintaxis:** `JNE etiqueta`

**Ejemplo**

```asm
# Intel
cmp eax, ebx
jne etiqueta # Salta a etiqueta si eax - ebx != 0
```

**Equivalente en alto nivel**

```C
if (eax != ebx)
	salto
```

**Ejemplo simple**

```asm
# Intel
mov eax, 5
mvo ebx, 3
cmp eax, ebx
jne no_iguales # 5 - 3 != 0 (salta)

iguales:
	# Este código no se ejecuta
	jmp fin
no_iguales:
	# Este codigo sí se ejecuta
fin:
```

**Tamaños de los saltos de `JNE`**

| Tipo de salto     | Nombre      | Tamaño del displacement | Rango             |
| ----------------- | ----------- | ----------------------- | ----------------- |
| **Corto**         | `short JNE` | 8 bits (signed)         | −128 a +127 bytes |
| **Near (16-bit)** | `near JNE`  | 16 bits (signed)        | −32 768 a +32 767 |
| **Near (32-bit)** | `near JNE`  | 32 bits (signed)        | −2³¹ a +2³¹−1     |

**Notas:**

- El displacement siempre es signed (con signo).

- El cálculo es:

  `IP/EIP/RIP = IP/EIP/RIP_siguiente + displacement`

## Instrucción `JNZ` (jump if not zero)

Salto condicional. Salta si el resultado de la operación anterior fue distinto a cero. Es decir cuando `ZF` es cero. No modifica ningún flag del CPU. Solo lee `ZF`.
Es sinónima de la instrucción `JNE`, ya que ambas verifican `ZF = 0` para realizar el salto. Pero `JNZ` se usa cuando tratas con resultados numéricos, y `JNE` cuando tratas con comparaciones.

**¿Cuando salta?**

- `ZF = 0` salta.
- `ZF = 1` el salto no se realiza.

**Sintaxis:** `JNZ etiqueta`

**Ejemplo**

```asm
# Intel
mov eax, 5
sub eax, 5    # eax = 0 → ZF = 1
jnz etiqueta: # No salta

mov eax, 5
sub eax, 3   # eax = 2 → ZF = 0 (resultado distinto de cero)
jnz etiqueta # Sí salta
```

**Ejemplo en bucle clásico**

```asm
# Intel
mov ecx, 5
loop_start:
	# Cuerpo del bucle
	dec ecx # ZF = 1 cuando ECX llega a 0
	jnz loop_start
# El bucle se repite mientras ECX != 0
```

**Tamaño del salto**

| Tipo      | Tamaño del desplazamiento  |
| --------- | -------------------------- |
| **Short** | 8 bits (-128 a +127 bytes) |
| **Near**  | 16 bits (modo 16)          |
| **Near**  | 32 bits (modo 32 y 64)     |

**Nota:** en x86-64 no existe `far jnz`.

**`OPCODEs`**

| Forma       | Opcode     |
| ----------- | ---------- |
| `jnz short` | `75 cb`    |
| `jnz near`  | `0F 85 cd` |

## Instrucción `JS` (jump if sign)

Salto condicional. Depende exclusivamente de `SF` (Sign Flag). Salta si el resultado previo fue negativo, es decir `SF = 1`. Lo que significa que el último resultado aritmético/lógico tuvo su MSB en uno. Si `SF = 0` el salto no se realiza. No modifica ningún flag del CPU. Solo lee `SF`.

**Sintaxis:** `JS etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo básico
mov eax, -5   # eax = 0xFFFFFFFB (11111111 11111111 11111111 11111011)
test eax, eax # eax & eax = eax (no cambia EAX, solo ajusta los flags)
# SF = 1
js negativo   # Salta a la etiqueta netagivo

negativo:
	# Código ejecutado después del salto

# TEST realiza un AND lógico entre los operandos (mismo registro) solo para afectar los flags, sin guardar el resultado.

# Ejemplo comparando valores con signo
cmp eax, ebx # eax - ebx
js salto     # Resultado de la resta negativo, SF = 1, js salta.

salto:
	# Código ejecutado después del salto
```

**Tamaños del salto**

| Tipo de salto | Desplazamiento          | Rango             |
| ------------- | ----------------------- | ----------------- |
| **Short**     | rel8 (8 bits, signed)   | −128 a +127 bytes |
| **Near**      | rel32 (32 bits, signed) | ±2 GB             |

**Nota:** En modo 64 bits no existe `JS rel64`.

**Usos típicos**

- Verificar resultados negativos en operaciones.
- Detectar underflow con signo.
- Control de flujo tras: `ADD`, `SUB`, `CMP`, `TEST`.

## Instrucción `JNS` (jump if not sign)

Salto condicional. Salta a la etiqueta si `SF = 0`, es decir si el resultado no es negativo o es cero. Esto significa que para el resultado el bit MSB es cero.
No modifica los flags del CPU, lee solo `SF` (Sign Flag).

**Sintaxis:** `JNS etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo básico
mov eax, 5    # eax = 00000000 00000000 00000000 00000101
test eax, eax # SF = 0 porque eax AND eax = eax
jns salto     # SF = 0, salta

salto:
	# Código que se ejecuta después del salto

# Ejemplo con número negativo
mov eax, -5   # eax = 11111111 11111111 11111111 11111011
test eax, eax # SF = 1
jns salto     # SF = 1, no salta
```

**Tamaños del salto**

| Tipo  | Tamaño  | Rango       |
| ----- | ------- | ----------- |
| short | 2 bytes | −128 a +127 |
| near  | 6 bytes | ±2 GB       |

**Nota:** En modo 64 bits no existe `JS rel64`.

**Usos típicos**

- Verificar si un valor es `>= 0`.
- Después de `test reg, reg`.
- Validaciones.
- Bucles.
- Manejo de errores.

## Instrucción `JO` (jump if overflow)

Salto condicional. Salta cuando el flag `OF` (Overflow Flag) está en uno. Es decir, cuando ocurre un overflow en operaciones aritméticas con signo (cuando el resultado no cabe en el rango del operando). No modifica los flags del CPU. Solo lee `OF`.

**¿Cuando `OF` es seteado?**

El flag se ajusta principalmente por: `ADD`, `SUB`, `IMUL`, `INC`, `DEC`.

**Sintaxis:** `JO etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo de overflow con signo
mov al, 127 # 0111 1111  (+127)
add al, 1   # resultado = 1000 0000 (-128)
jo etiqueta
# 127 + 1 = 128 (no cabe en int8 con signo)
# OF = 1 indicando overflow
# jo salta al detectar OF = 1

# Ejemplo sin overflow
mov al, 5
add al, 3 # resultado = 8
jo etiqueta # No salta
# OF = 0 (no se produjo overflow)
```

**Tamaños del salto**

| Tipo   | Desplazamiento                |
| ------ | ----------------------------- |
| Short  | 8 bits (±128 bytes)           |
| Near   | 16 / 32 bits                  |
| x86-64 | RIP-relative (32 bits signed) |

## Instrucción `JNO` (jump if not overflow)

Salto condicional. Salta si el flag `OF` esta en cero, es decir, cuando el resultado cabe en el registro destino. Es la instrucción complementaria a `JO`. No modifica ningún flag de la CPU. Solo lee `OF` (Overflow Flag).
**Nota:** Solo tiene sentido después de una instrucción que afecte a OF.

**Sintaxis:** `JNO etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo sin overflow
# OF = 0
mov al, 100
add al, 20 # 100 + 20 = 120 (cabe en AL en 8 bits, OF no se modifica).
jno etiqueta # Salta porque OF = 0

# Ejemplo con overflow
# OF = 0 Inicial
mov al, 127
add al, 1    # overflow (127 + 1 = -128)
jno etiqueta # No salta porque OF = 1
```

## Instrucción `JC` (jump if carry)

Salto condicional. Salta si hubo acarreo, es decir cuando `CF = 1`. Normalmente con instrucciones como: `ADD` o `SUB`. No modifica ningún flag del CPU. Solo lee `CF` (Carry Flag).

**Sintaxis:** `JC etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo con acarreo
mov al, 255
add al, 1 # AL = 0, CF = 1 porque 255 + 1 desborda el registro de 8 bits
jc etiqueta  # Salta porque CF = 1

# Ejemplo sin acarreo
mov al, 100
add al, 10  # AL = 110, CF = 0 porque no se desborda el registro de 8 bits
jc etiqueta # No salta porque CF = 0
```

## Instrucción `JNC` (jump if not carry)

Salto condicional. Salta si `CF = 0`. Es complementaria a `JC`. No modifica ningún flag, solo lee `CF` (Carry Flag).

**Sintaxis:** `JNC etiqueta`

**Ejemplo**

```asm
# Intel
# Ejmplo de suma simple
mov al, 200  # AL = 200
add al, 100  # AL = 200 + 100 = 44 (por desbordamiento en 8 bits)
# Overflow porque 200 + 100 = 300 mod 256 = 44
jnc etiqueta # No salta porque CF = 1 (overflow unsigned)

# Ejemplo con resta
mov al, 50  # AL = 0011 0010
sub al, 100 # AL = 50 - 100 = -50 (signed) o 206 (unsigned)
# 100 = 0110 0100
#     0011 0010   (50)
#   - 0110 0100   (100)
#   -----------
# (1) 1100 1110
# (1): borrow (acarreo)
# CF = 1
jnc etiqueta # no salta porque CF = 1
```

## Instrucción `JB` (jump if below)

Salto condicional. Salta si el primer operando es **menor que** el segundo en una comparación sin signo (unsigned). Es decir, salta si `CF = 1`. No modifica ningún flag, solo lee `CF` (Carry Flag).
La diferencia de `JC` es semántica, mientras ésta se usa en un contexto aritmético / bit a bit, `JB` se usa en un contexto de comparación unsigned.

**Sintaxis:** `JB etiqueta`

```asm
# Intel
# Comparación unsigned
cmp al, bl
jb menor_unsigned
# ¿AL es menor a BL (sin signo)?

# En cambio si se usara jc, quien leyera el código pensaría en acarreo, mas no en comparación sin signo.
```

## Instrucción `JNAE` (jump if not abobe or equal)

Salto condicional. Salta si el primer operando es menor que el segundo, cuando se interpretan como unsigned. (Generalmente después de `CMP`). Es decir cuando `CF = 1`. No modifica los flags del CPU. Solo lee `CF` (Carry Flag).
Nuevamente la diferencia respecto a `JC` y `JB` es semántica para el programador. `JNAE` se puede leer como ***Salta si no es mayor o igual*** o, de forma equivalente ***salta si es menor (unsigned)***. La primera es una negación lógica (no depende de signed/unsigned), en cambio la segunda es una relación de orden (sí depende de signed/unsigned).

**Sintaxis:** `JNAE etiqueta`

**Ejemplo**

```asm
# Intel
mov al, 50
cmp al, 100   # 50 - 100 requiere borrow (CF = 1)
jnae etiqueta # Salta porque CF = 1
# El borrow nos dice que 50 < 100 en unsigned
```

## Instrucción `JAE` (jump if above or equal)

Salto condicional. Salta si el primer operando es mayor o igual al segundo en una comparación unsigned. Es decir cuando `CF = 0`. No modifica los flags del CPU. Solo lee `CF` (Carry Flag). Normalmente usada después de `SUB` o `CMP`.
La diferencia respecto a `JNC` nuevamente es solo semántica para el programador (comparten el mismo `opcode`). Mientras que `JNC` es usada para revisar si hubo carry o borrow, `JAE` se usa para comparar números unsigned.

**Sintaxis:** `JAE etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo con cmp
cmp a, b # hace a - b (no guarda el resultado, ajusta flags solamente)
jae etiqueta # Salta solo si CF = 0

# Ejemplo con sub
sub a, b
jae etiqueta

# Ejemplo simple en 8 bits
mov al, 100
cmp al, 50      # 100 - 50 = 50
jae mayor_igual # CF = 0, salta

# Caso contrario
mov al, 50
cmp al, 100     # 50 - 100 → borrow
jae mayor_igual # CF = 1 → no salta
```

## Instrucción `JNB` (jump if not below)

Salto condicional. Salta si no hubo borrow en una comparación unsigned. Es decir cuando `CF = 0` respecto de la operación anterior y el resultado no fue menor (unsigned). No modifica ningún flag del CPU. Solo lee `CF`.
A diferencia de sus instrucciones similares semánticamente, `JNE` se usa cuando el programador piensa en comparaciones unsigned.

**Sintaxis:** `JNB etiqueta`

**Ejemplo**

```asm
# Intel
# Aritmética
add al, bl
jnc sin_overflow

# Comparación unsigned
cmp al, bl
jnb mayor_o_igual

# Ejemplo práctico
mov al, 5
cmp al, 3 # 5 - 3 = 2, CF = 0
jnb etiqueta # CF = 0, salta
```

## Instrucción `JA` (jump if above)

Salto condicional. Salta si el primer operando es estrictamente mayor que el derecho, en una comparación unsigned. Es decir si `CF = 0` y `ZF = 0`. No modifica ningún flag del CPU. Solo lee `CF` y `ZF`.

**Sintaxis:** `JA etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo unsigned
mov al, 200 # 200 unsigned
mov bl, 100 # 100 unsigned
cmp al, bl  # AL - BL = 200 - 100 = 100
ja mayor    # Salta porque ZF = 0 y CF = 0 (comparación unsigned)

# Ejemplo donde no salta
mov al, 100
mov bl, 200
cmp al, bl  # AL - BL = 100 - 200
ja mayor    # no salta porque CF = 1 (hubo borrow)  y ZF = 0

# Ejemplo valores negativos (trampa común)
mov al, -1 # 0xFF = 255 unsigned
mov bl, 1
cmp al, bl # AL - BL = 255 - 1
ja mayor   # sí salta
# Porque:
# -1 con signo = -1
# -1 sin signo = 255
```

A simple vista se piensa "-1 no puede ser mayor que 1", pero eso solo funciona con números con signo. `JA` no usa signo, usa unsigned.

**¿Qué valor real se guarda en el registro?**

`AL` es un registro de 8 bits, cuando se hace `mov al, -1` el CPU no guarda `-1` como concepto, guarda bits.

```
-1 en complemento a dos (8 bits)
1111 1111b
0xFF
```

Ese patrón de bits se puede interpretar como:

| Interpretación    | Valor |
| ----------------- | ----- |
| **signed int8**   | -1    |
| **unsigned int8** | 255   |

`CMP` hace `AL - BL`, lo que sustituyendo queda como `0xFF - 0x01 = 0xFE` o en binario:

```
  11111111
- 00000001
----------
  11111110
```

**Resultado:** `0xFE` (254 unsigned o -2 signed), es decir, no hubo borrow.

## Instrucción `JBE` (jump if below or equal)

Salto condicional. Salta si es menor o igual en comparación unsigned. Es decir **cuando** `CF = 1` **o** `ZF = 1`. Equivale a `if (a <= b) (unsigned)`. No modifica los flags del CPU. Solo lee `CF` (Carry Flag) y `ZF` (Zero Flag).

**Sintaxis:** `JBE etiqueta`

**Casos posibles**

| Resultado | Flags          | Significado              |
| --------- | -------------- | ------------------------ |
| `a < b`   | CF = 1         | Hubo borrow → a es menor |
| `a == b`  | ZF = 1         | Resultado cero           |
| `a > b`   | CF = 0, ZF = 0 | No salta                 |
| `z ≤ b`   | ZF = o CF = 1  | Salta                    |

**Ejemplo**

```asm
# Intel
# Menor (unsigned)
mov al, 50
mov bl, 100
cmp al, bl        # AL - BL = 50 - 100 → borrow
jbe menor_o_igual # Salta porque CF = 1 y ZF = 0

# Igual
mov al, 100
mov bl, 100
cmp al, bl  # 100 - 100 = 0
jbe menor_o_igual # Salta porque ZF = 1 y CF = 0

# Mayor
mov al, 200
mov bl, 100
cmp al, bl        # 200 - 100
jbe menor_o_igual # No salta porque CF = 0 y ZF = 0

# Menor o igual (unsigned)
mov al, 30
mov bl, 50
cmp al, bl      # 30 - 50 → borrow
jbe menor_igual # CF = 1 -> salta
```

## Instrucción `JG` (juimp if greater)

Salto condicional. Es usada en comparaciones con signo. Salta si el primer operando es mayor que el segundo (signed). Es decir cuando `ZF = 0` y `SF = 0`. No modifica ningún flag del CPU. Lee `SF` y `ZF`.

**Equivale a:** `if (x > y)`

**Interpretación de los flags**

- `ZF = 0` Operandos no son iguales.
- `SF = OF` El resultado fue positivo sin error de signo.

Ambas juntas indican que el resultado de la resta fue mayor que cero (interpretado con signo).

**Sintaxis:** `JG etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo simple (signed)
mov al, 10
mov bl, 5
cmp al, bl # 10 - 5 = 5, ZF = 0 y CF = 0
jg mayor   # Salta

# Ejemplo trampa
mov al, -1 # 0xFF = -1 (signed)
mov bl, 1  # 1
cmp al, bl # -1 - 1 = -2

jg mayor   # no salta
```

Aunque `0xFF` es 255 unsigend, para `JG` se interpreta como -1 y `-1 > 1 → falso`.

## Instrucción `JGE` (jump if greater or equal)

Salto condicional. Salta si la comparación previa indica "mayor o igual" (signed). Es decir cuando `SF == OF`. No modifica los flags del CPU. Lee `SF` y `OF`.

**¿Qué indican los flas?**

- `SF` indica si el resultado fue negativo.
- `OF` indica overflow en aritmética con signo.

Si ambos coinciden, el número es >= 0 en comparación signed, es decir: mayor que o igual.

**Equivale a:** `a ≥ b (signed)`

**Sintaxis:** `JGE etiqueta`

**Ejemplo**

```asm
# Intel
# Mayor (signed)
mov al, 10
mov bl, 5
cmp al, bl        # 10 - 5 = 5, SF = 0 y OF = 0
jge mayor_o_igual # Salta

# Igual
mov al, -3
mov bl, -3
cmp al, bl        # -3 - (-3) = 0, SF = 0 y OF = 0
jge mayor_o_igual # salta

# Menor
mov al, -10
mov bl, 5
cmp al, bl        # -10 - 5 = -15, SF = 1 y OF = 0
jge mayor_o_igual # No salta
```

## Instrucción `JL` (jump if less)

Salto condicional. Salta si el primer operando es menor que el segundo, interpretados como números con signo. Es decir cuando `SF != OF`.

**Equivale a: ** `x < y (signed)`

**¿Por qué `SF != OF` significa "menor" (signed)?**

En aritmética con signo, el bit de signo por sí solo no siempre es confiable si hubo overflow.

- `SF` signo del resultado.
- `OF` indica si el signo es inválido por overflow.

Cuando `SF != OF`, el resultado es negativo real y eso implica `x < y`.

**Sintaxis:** `JL etiqueta`

**Ejemplo**

```asm
# Intel
# Simple
mov al, -10
mov bl, 5
cmp al, bl # -10 - 5 = -15
jl menor   # Salta porque SF != OF
# -10 < 5 → correcto

# Ejemplo en donde unsigned fallaría
mov al, 200 # 200 unsigned = -56 signed
mov bl, 100
cmp al, bl  # 200 - 100
jl menor
# Interpretación signed
# -56 < 100 → salta
# Interpretación unsigned
# 200 > 100 → no salta
# Por esto JL se usa solo para signed y se usa JB para unsigned
```

## Instrucción `JLE` (jump if less or equal)

Salto condicional. Salta si es menor o igual en una comparación con signo. Es decir, salta cuando `ZF = 1` o `SF != OF`. No modifica los flags del CPU. Lee solo `ZF`, `ZF` y `OF`.
`JLE` se usa con números con signo. Para unsigned la instrucción equivalente es `JBE`.

**Condición del salto**

`JLE` salta si `(x < y) || x == y` (menor o igual).

- `ZF = 1` los valores son iguales (`x == y`).
- `SF != OF` el primero es menor que el segundo (`x < y` con signo).

**Equivale a:** `if (x == y || x < y)`.

**Sintaxis:** `JLE etiqueta`

**Ejemplo**

```asm
# Intel
mov eax, -5
mov ebx, 3
cmp eax, ebx # -5 - 3 = -8
# Flags
# ZF = 0 (no son iguales)
# SF = 1 (resultado negativo)
# OF = 0 (sin overflow)
jle etiqueta # Salta ZF = 1 || SF != OF
```

## Instrucción `JP` (jump if parity)

Salto condicional. Salta si el bit de paridad está activo. Es decir `PF = 1`. No modifica los flags del CPU. Lee solo `PF`.

**`PF` (Parity Flag) flag**

- `PF = 1` cuando el byte LSB del resultado tiene una cantidad par de bits encendidos.
- `PF = 0` cuando tiene una cantidad impar de bits encendidos.

**Sintaxis:** `JP etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo en donde salta
mov al, 3   # 0000 0011 → 2 bits encendidos (PF = 1)
test al, al # actualiza flags según AL
jp etiqueta # salta porque PF = 1

# Ejemplo donde no salta
mov al, 7   # 0000 0111 → 3 bits encendidos (PF = 0)
test al, al # actualiza flags según AL
jp etiqueta # no salta porque PF = 0
```

**Usos comunes**

Hoy en día `JP` casi no se usa en programación de aplicaciones, pero aparece en:

- Rutinas de bajo nivel
- Criptografía antigua / checksums
- Optimización muy específica
- Código ofuscado o reversing
- Control de errores de hardware o comunicaciones antiguas

## Instrucción `JPE` (jump if parity even)

Salto condicional. Tiene el mismo `opcode` que `JP` y un sentido mas semántico (salta si la paridad es par) a diferencia de `JP` (salta si hay paridad).

**Sintaxis:** `JPE etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo en donde salta
mov al, 3   # 0000 0011 → 2 bits encendidos (PF = 1)
test al, al # actualiza flags según AL
jpe etiqueta # salta porque PF = 1

# Ejemplo donde no salta
mov al, 7   # 0000 0111 → 3 bits encendidos (PF = 0)
test al, al # actualiza flags según AL
jpe etiqueta # no salta porque PF = 0
```

## Instrucción `JNP` (jmp if not parity)

Salto condicional. Salta si el bit de paridad está inactivo. Es decir cuando `PF = 0` (cuando no hay paridad). En otras palabras, cuando el byte LSB del resultado tiene una cantidad de bits encendidos impares.
No modifica los flags del CPU. Lee solo `PF`.

**Sintaxis:** `JNP etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo en donde no salta
mov al, 5    # 0000 0101 → tiene 2 bits encendidos (PF = 1)
test al, al  # actualiza flags según AL
jnp etiqueta # No salta porque PF = 1

# Ejemplo en donde salta
mov al, 7    # 0000 0111 → 3 bits encendidos (PF = 0)
test al, al  # actualiza flags según AL
jnp etiqueta # salta porque PF = 0
```

## Instrucción `JPO` (jump if parity odd)

Salto condicional. Tiene el mismo `opcode` de `JNP` y un sentido semánticamente distinto (salta si la paridad del resultado es impar), a diferencia de `JNP` (salta si no hay paridad par). Para todos los otros efectos, `JPO` funciona igual que `JNP`.
No modifica los flags del CPU. Lee solo `PF`.

**Sintaxis:** `JPO etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo en donde no salta
mov al, 5    # 0000 0101 → tiene 2 bits encendidos (PF = 1)
test al, al  # actualiza flags según AL
jpo etiqueta # No salta porque PF = 1

# Ejemplo en donde salta
mov al, 7    # 0000 0111 → 3 bits encendidos (PF = 0)
test al, al  # actualiza flags según AL
jpo etiqueta # salta porque PF = 0
```

## Instrucción `LOOP`

Instrucción de control de flujo pensada para hacer bucles "clásicos" usando un contador en un registro.

**¿Qué hace `LOOP`?**

- Incrementa el registro `RCX/ECX/CX` (dependiendo del modo 64/32/16) en 1.
- Si `RCX != 0`, salta a `etiqueta`.
- Si `RCX == 0`, continúa con la siguiente instrucción.

Es decir, "repite mientras RCX no llegue a cero".

**Sintaxis**: `LOOP etiqueta`

**Ejemplo**

```asm
# Intel
mov rcx, 5 # número de iteraciones
inicio:
	# código del bucle
	loop inicio
# Ejecución
# - Iteración 1: RCX = 5 → se decrementa a 4 → salta
# - Iteración 2: RCX = 4 → 3 → salta
# - Iteración 3: RCX = 3 → 2 → salta
# - Iteración 4: RCX = 2 → 1 → salta
# - Iteración 5: RCX = 1 → 0 → NO salta → sale del bucle
# El bloque se ejecuta exactamente 5 veces
```

**No usa los flags del CPU**

`LOOP` no evalúa ningún flag, solo revisa si el registro `RCX/ECX/CX` (según el modo 64/32/16).

**Importante:** En arquitecturas modernas `LOOP` es mas lento que usar instrucciones normales, debido a esto:

- Casi no se usa en código optimizado.
- Los compiladores modernos no generan `LOOP`.
- Se enseña más por motivos históricos y didácticos.

**¿Qué haría un compilador moderno?**

```asm
# Intel
mov rcx, 5
inicio:
	# trabajo del bucle
	dec rcx
	jnz inicio
```

El código anterior tiene el mismo comportamiento, pero un mejor rendimiento.

## Variantes `LOOPE` y `LOOPZ`

Ambas instrucciones comparten el mismo `opcode`. Su diferencia es netamente semántica. No modifican ningún flag del CPU. Leen `ZF` solamente.

**Significados semánticos**

- `LOOPE`: Loop while equal (bucle mientras sea igual). 
- `LOOPZ`: Loop while zero (bucle mientras `ZF = 1`).

Saltan si `(RCX/ECX/CX != 0) AND (ZF == 1)`. Ambas leen `ZF` y usan a `RCX/ECX/CX` como contador. Pero `LOOPE` se usa típicamente después de `CMP` "mientras los valores comparados sean iguales". Y `LOOPZ` se usa típicamente después de `TEST` "mientras el resultado sea cero".

**Sintaxis:** `LOOPE/LOOPZ etiqueta`

**Ejemplo**

```asm
# Intel

# Ejemplo con loope
mov rcx, 5 # máximo 5 iteraciones
bucle:
	# código
	mov al, [rsi]
	cmp al,  [rdi] # ZF = 1 si son iguales
	loope bucle    # repite si RCX != 0 y ZF = 1
	# loope decrementa rcx y salta a la etiqueta bucle
# El bucle se detiene si encuentra una diferencia (ZF = 0), o se agotan las iteraciones (RCX = 0).

# Ejemplo con loopz
mov rcx, 3    # máximo 3 iteraciones
mov al, [val] # carga valor inicial
bucle:
	# código
	test al, al # ZF = 1 si AL == 0
	loopz bucle # repite mientras RCX != 0 y ZF == 1
	# loopz decrementa RCX y salta a la etiqueta bucle
# El bucle se repetirá máximo tres veces o hasta que AL sea distinto de cero.
```

## Variantes `LOOPNE` y `LOOPNZ`

Ambas instrucciones comparten el mismo `opcode`. Su diferencia es netamente semántica. No modifican ningún flag del CPU. Leen `ZF` solamente.

**Significados semánticos**

- `LOOPNE`: Loop not equal (bucle mientras no sea igual (a cero)).
- `LOOPNZ`: Loop not zero (bucle mientras no sea cero).

Saltan si `(RCX/ECX/CX != 0) AND (ZF == 0)`.  Ambas leen `ZF` y usan a `RCX/ECX/CX` como contador. `LOOPNE` es usado típicamente después de `CMP` "mientras que no sea igual". Y `LOOPNZ` es usado después de operaciones aritméticas "mientras el resultado no sea cero". (En la práctica son intercambiables, solo cambia su intención semántica de cara al programador que interpreta el código).

**Sintaxis:** `LOOPNE/LOOPNZ etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo con loopne
mov rcx, 5   # inicializa el contador en 5
xor rax, rax # setea ZF en cero (simulando una condición no cero).
bucle:
	# código
	loopne bucle
	# loopne decrementa rcx y salta si RCX != 0 y ZF = 0
# El bucle puede iterar hasta 5 veces

# Ejemplo con loopnz
mov rcx, 5      # inicializa el contador en 5
xor rax, rax    # ZF = 0
bucle:
    # código
    loopnz bucle # decrementa RCX y salta si RCX != 0 y ZF = 0
# Ejemplo con loopnz
```

## Instrución `JCXZ` (jum if CX zero)

Salto condicional. Se usa solo con el registro `CX` en 16 bits. Comprueba si `CX == 0`. Cuando `CX == 0` salta a la `etiqueta`, de lo contrario continua a la instrucción siguiente. Es útil en bucles donde se usa a `CX` como contador.
No modifica ningún flag del CPU ni tampoco los lee.

**Sintaxis:** `JCXZ etiqueta`

**Ejemplo**

```asm
# Intel
# Ejemplo simple
mov cx, 0  # inicializa CX a cero
jcxz fin # como CX = 0, salta a la etiqueta fin
# Código saltado
mov ax, 0x1234
fin:
	mov ax, 0x5678 # Código que se ejecuta
	
# Ejemplo en donde se usa a CX como contador
mov cx, 5       # contador de iteraciones
bucle:
# hacer algo
loop bucle      # decrementa CX y salta si CX != 0
jcxz fin        # si CX ya es 0, termina el bucle
jmp bucle       # repetir
fin:
# código después del bucle
```

**Nota:** En la actualidad su uso es menor a `LOOP` y sus variantes.

**Modos de 32 y 64 bits**

Para dichos modos existen instrucciones específicas: `JECXZ` (32 bits) y `JRCXZ` (64 bits). **Comparten** `opcodes` y funcionan de la misma manera que `JCXZ`, con la excepción de que en el modo de 64 bits se usa el prefijo `REX`.

**Desplazamiento relativo de 8 bits**

Todas usan un desplazamiento relativo de 8 bits, por lo que solo pueden saltar `±128` bytes desde la instrucción siguiente.

## Instrucción `MOVZX` (move with zero-extend)

Copia el valor de un registro o memoria de menor tamaño a un registro más grande sin tener en cuenta el signo. Rellena conceros los bits MSB del registro destino. Es decir, si se copia un byte a un registro de 32 bits, los 24 bits altos se ponen a cero. No afecta los flags del CPU.

**Sintaxis:** `MOVZX dest, src`, donde `dest` es un registro de 16/32/64 bits y `src` un registro de 8/16 bits o una ubicación de memoria de 8/16 bits.

**Reglas de tamaños**

| Tamaño fuente | Tamaño destino permitido | Comentario                          |
| ------------- | ------------------------ | ----------------------------------- |
| 8 bits        | 16 o 32 bits             | Rellena con ceros los bits altos    |
| 16 bits       | 32 bits                  | Rellena con ceros los 16 bits altos |
| 8/16 bits     | 64 bits (x86-64)         | Rellena los bits altos a 0          |

**Nota:** No se puede mover un registro de 32 bits a 16 bits usando `MOVZX`. Para eso se usan instrucciones normales como `MOV` o truncamiento.

**Ejemplo**

```asm
# Intel
# 8 bits a 32 bits
movzx eax, byte ptr [rbx] # Copia 1 byte desde memoria en RBX a EAX
# Los 24 bits altos de EAX se ponen a cero

# 8 bits a 16 bits
movzx dx, al # Copia AL (8 bits) a DX (16 bits)
# Los 8 bits altos de DX se ponen a cero

# 16 bits a  32 bits
movzx ecx, bx# Copia BX (16 bits) a ECX (32 bits)
# Los 16 bits altos de ECX se ponen a cero

# 8 bits a 64 bits
movzx rax, al # Copia AL (8 bits) a RAX (64 bits)
# Los 56 bits altos de RAX se ponen a 0
```

## Instrucción `MOVSX` (move with sign-extend)

Copia un valor de tamaño pequeño a un registro mas grande teniendo en cuenta el signo. Si el valor de origen es negativo (con el bit MSB en 1), extiende el signo para que el resultado grande también sea negativo. Si el valor de origen es positivo, rellena con ceros el resto del registro destino.

**Sintaxis:** `dst, src` donde `dst` es un registro de tamaño mayor (16/32/64 bits) y `src` un registro o memoria de tamaño menor (generalmente 8/16 bits).

**Tamaños permitidos**

| Origen | Destino | Comentario            |
| ------ | ------- | --------------------- |
| 8-bit  | 16-bit  | Se extiende a `word`  |
| 8-bit  | 32-bit  | Se extiende a `dword` |
| 8-bit  | 64-bit  | Se extiende a `qword` |
| 16-bit | 32-bit  | Se extiende a `dword` |
| 16-bit | 64-bit  | Se extiende a `qword` |

**Nota:** no se puede usar `MOVSX` para mover desde un registro mas grande a uno más pequeño.

**Ejemplo**

```asm
# Intel
# 8 bits a 64 bits
movsx rax, al  # al = 8 bits, rax = 64 bits
# Si AL = 127 (0x7F), RAX = 0x000000000000007F
# Si AL = -16 (0xF0), RAX = 0xFFFFFFFFFFFFFFF0

# 16 bits a 32 bits
movsx eax, bx  # bx = 16 bits, eax = 32 bits
# Si bx = 0x1234, eax = 0x00001234
# Si bx = 0xF234 (-3564 decimal), eax = 0xFFFFF234

# Desde memoria a registro
movsx rdx, byte ptr [rbx]  # toma 8 bits de memoria y extiende a 64 bits
# [rbx] es la dirección de memoria de donde se lee el byte
```

## Instrucción `SETcc` (set byte on condition)

La instrucción es un mnemónico genérico que significa "set byte on condition", donde `cc` es un condicional que depende de los flags de la CPU. Si la condición se cumple, se escribe 1 en un byte de destino, de lo contrario (cuando no se cumple), se escribe 0 en dicho byte.

**Destino:** Un registro de 8 bits: `AL`, `BL`, `CL`, `DL`, `SIL`, `DIL` o sus equivalentes de 64 bits truncados: `R8B` al `R15B`, o una posición de memoria de 8 bits.
**Flags usados:** Depende de la condición `cc` que se use.
**Operandos de 32/64 bits:** No tiene. Para usar el resultado en registros más grandes, hay que extender con `MOVXZ`.

```asm
# Intel
movzx eax, al # Extiende AL (8 bits) a EAX (32 bits)
```

**Sintaxis:** `SETcc r/m8`

**Condiciones**

| Instrucción `SETcc` | Significado / Condición             | Flags utilizados |
| ------------------- | ----------------------------------- | ---------------- |
| `SETE` / `SETZ`     | Igual / Zero                        | ZF = 1           |
| `SETNE` / `SETNZ`   | No igual / Not Zero                 | ZF = 0           |
| `SETL` / `SETNGE`   | Menor (signed)                      | SF ≠ OF          |
| `SETLE` / `SETNG`   | Menor o igual (signed)              | ZF = 1 o SF ≠ OF |
| `SETG` / `SETNLE`   | Mayor (signed)                      | ZF = 0 y SF = OF |
| `SETGE` / `SETNL`   | Mayor o igual (signed)              | SF = OF          |
| `SETB` / `SETC`     | Menor (unsigned) / Carry            | CF = 1           |
| `SETAE` / `SETNC`   | Mayor o igual (unsigned) / No Carry | CF = 0           |
| `SETA` / `SETNBE`   | Mayor (unsigned)                    | CF = 0 y ZF = 0  |
| `SETBE` / `SETNA`   | Menor o igual (unsigned)            | CF = 1 o ZF = 1  |
| `SETO`              | Overflow                            | OF = 1           |
| `SETNO`             | No overflow                         | OF = 0           |
| `SETP` / `SETPE`    | Paridad par                         | PF = 1           |
| `SETNP` / `SETPO`   | Paridad impar                       | PF = 0           |
| `SETNEG` / `SETS`   | Signo negativo                      | SF = 1           |
| `SETPOS` / `SETNS`  | Signo positivo                      | SF = 0           |

**Notas importantes**

- Las instrucciones `SETL`, `SETLE`, `SETG`, `SETGE` usan números con signo.
- Las instrucciones `SETB`, `SETBE`, `SETA`, `SETAE` usan números sin signo.
- Muchas tienen alias, por ejemplo: `SETZ = SETE`, `SETNZ = SETNE`, `SETB = SETC`, `SETAE = SETNC`. 

**Ejemplo**

```asm
# Intel
sete al         # AL = 1 si ZF=1, AL=0 si ZF=0
setne bl        # BL = 1 si ZF=0, BL=0 si ZF=1
setl cl         # CL = 1 si SF≠OF, CL=0 si SF=OF
setg dl         # DL = 1 si ZF=0 y SF=OF, DL=0 si ZF=1 o SF≠OF
seto byte [res] # escribe 1/0 en memoria
```

**Usos comunes**

1. Convertir comparaciones en valores booleanos.

   Es el uso más típico de `SETcc`. Simular un booleano.

   ```asm
   # Intel
   mov rax, 10
   cmp rax, 20       # ajusta ZF, SF, OF, CF según rax - 20
   setl al           # AL = 1 si RAX < 20 (signed), AL = 0 si no
   movzx rax, al     # extendemos a 64 bits si necesitamos usarlo como entero
   ```

   ```
   // Equivalente en un lenguaje de alto nivel
   bool resultado = (rax < 20)
   ```

   Es útil para evitar ramas y hacer código más predecible para la CPU (menos saltos, menos predicción de ramas).

2. Implementar operaciones condicionales sin `JMP`.

   Se puede usar `SETcc` para hacer operaciones condicionales sin saltos.
   ```asm
   # Intel
   # Ejemplo de suma solo si una condición es verdadera
   mov rax, 5
   mov rbx, 10
   cmp rax, rbx       # verifica si rax < rbx
   setl cl            # CL = 1 si rax < rbx, 0 si no
   movzx rcx, cl      # RCX = 0 o 1
   add rax, rcx       # suma 1 a rax si se cumplió la condición
   ```

   Evita usar un `JLE` y un bloque extra de código, muy útil para optimización de bucles o cálculos de vectores.

3. Operaciones sobre memoria.

   `SETcc` puede escribir directamente en memoria de 8 bits.

   ```asm
   # Intel
   cmp rax, rbx
   sete byte [res]   # res = 1 si RAX = RBX, 0 si no
   ```

   Muy útil para flags de estado, estructuras de datos tipo bitfield, o para buffers que indican `true/false`.

4. Condiciones de paridad u overflow.

   Algunas condiciones son más raras, pero se usan en algoritmos de criptografía, checksum o codificación, donde los flags de overflow o paridad importan.

   ```asm
   # Intel
   test al, al
   seto bl           # BL = 1 si hubo overflow
   ```

5. Uso combinado con `MOVZX` para cálculos enteros.

   Como `SETcc` solo escribe 1 byte, si se quiere usar el resultado como entero de 32/64 bits:

   ```asm
   # Intel
   cmp rax, rbx
   setg cl           # CL = 1 si RAX > RBX (signed)
   movzx rcx, cl     # RCX = 0 o 1
   imul rcx, 5       # multiplicar condicionalmente
   ```

   Esto permite hacer aritmética condicional sin ramas, muy útil en bucles vectorizados o simd.

## Instrucción `CMOVcc` (conditional move)

Mueve el contenido de un registro o memoria a otro registro solo si se cumple cierta condición basada en los flags del CPU. Si dicha condición no se cumple, el registro destino no se modifica.
Es una instrucción muy útil para hacer saltos condicionales sin usar ramas, ayudando así a evitar las "branch mispredictions" en CPUs modernas. Es decir que evita los saltos condicionales clásicos (`JMP`, `JE`, `JNE`, etc) y bucles de predicción. Tiene especial utilidad en código crítico donde se quiere mantener el flujo lineal.
No afecta los flags del CPU. Dependiendo de `cc` es el flag que lee.

**Sintaxis: ** `CMOVcc dest, src` donde `dest` siempre es un registro, `src` puede ser un registro o memoria y `cc` es la condicóon basada en flags.

**Condiciones comunes**

| Condición                 | CC                 | Significado        |
| ------------------------- | ------------------ | ------------------ |
| Overflow                  | `O`                | OF = 1             |
| Not overflow              | `NO`               | OF = 0             |
| Carry                     | `C` / `B` / `NAE`  | CF = 1             |
| Not carry                 | `NC` / `AE` / `NB` | CF = 0             |
| Zero                      | `Z` / `E`          | ZF = 1             |
| Not zero                  | `NZ` / `NE`        | ZF = 0             |
| Sign                      | `S`                | SF = 1             |
| Not sign                  | `NS`               | SF = 0             |
| Paridad                   | `P` / `PE`         | PF = 1             |
| Not paridad               | `NP` / `PO`        | PF = 0             |
| Less (signed)             | `L` / `NGE`        | SF ≠ OF            |
| Greater or equal (signed) | `GE` / `NL`        | SF = OF            |
| Less or equal (signed)    | `LE` / `NG`        | ZF = 1 or SF ≠ OF  |
| Greater (signed)          | `G` / `NLE`        | ZF = 0 and SF = OF |
| Below (unsigned)          | `B` / `C` / `NAE`  | CF = 1             |
| Above or equal (unsigned) | `AE` / `NC` / `NB` | CF = 0             |
| Below or equal (unsigned) | `BE` / `NA`        | CF = 1 or ZF = 1   |
| Above (unsigned)          | `A` / `NBE`        | CF = 0 and ZF = 0  |

**Nota:** muchas condiciones tienen múltiples alias, por ejemplo: `B = C = NAE`.

**Ejemplo**

```asm
# Intel
# Mueve RBX a RAX solo si ZF = 1
cmp rdx, rcx   # Compara rdx con rcx (afecta flags)
cmove rax, rbx # Solo mueve rbx → rax si ZF = 1

# Mueve RBX a RAX solo si ZF = 0
cmp rdx, rcx
cmovne rax, rbx # Solo mueve si ZF = 0 (rdx != rcx)
```

**Usos típicos**

- Optimización de bucles pequeños.
- Reemplazo de `if-else` que generan ramas costosas.

## Instrucción `POPCNT` (population count)

Cuenta cuántos bits están encendidos (en uno) en un operando. Tambien se le llama *Hamming weight*.

**¿Qué hace exactamente?**

1. Toma el operando fuente.
2. Cuenta los bis encendidos (que están en uno).
3. Guarda el resultado en el registro destino.

**Flags del CPU**

A pesar de que `POPCNT` no es una instrucción aritmética, si toca los flags del CPU.

| Flag   | Estado                                |
| ------ | ------------------------------------- |
| **ZF** | **1 si el resultado es 0**, si no → 0 |
| CF     | 0                                     |
| OF     | 0                                     |
| SF     | 0                                     |
| PF     | 0                                     |
| AF     | indefinido                            |

**Sintaxis:** `POPCNT reg, r/m`

**Ejemplo**

```asm
# Intel
# Ejemplos válidos
popcnt eax, ebx # 32 bits
popcnt rax, rbx # 64 bits
popcnt ecx, [mem]

# Ejemplo en 64 bits
mov rax, 0b10101101
popcnt rbx, rax     # rbx = 5
```

No existe forma de 8 a 16 bits por lo que no puedes usar `AL` o `AX`.

Usos comunes

- Comprobar si un número es potencia de 2. Una potencia de 2 tiene exactamente un bit encendido.
  ```asm
  # Intel
  popcnt rcx, rax
  cmp rcx, 1
  je es_potencia_de_dos
  ```

- Criptografía

- Bitboards (ajedrez, juegos, etc)

- Compresión

- Máscaras de permisos
  ```asm
  # Intel
  # rax = máscara de permisos
  popcnt rcx, rax
  # rcx = cantidad de permisos activos
  ```

- Análisis binario / reversing

- SIMD / optimizaciones low-level

### Requisitos de CPU

`POPCNT` no es x86 clásico, es una extensión introducida por ***SSE4.2***. Su Flag CPUID es `POPCNT`.

**Alternativa portable**: `x &= x - 1 en bucle`

**Rendimiento**: En CPUs modernas su latencia es de aproximadamente 3 ciclos y un throughtput de 1 ciclo. (Mas rápido que hacerlo a mano).

## Funciones personalizadas

En asm x86-64 una función suele tener la siguiente forma:

```asm
# Intel
nombre_funcion:  # etiqueta que define la función
	push rbp     # guarda el valor actual de RBP (base pointer)
	mov rbp, rsp # crea un nuevo frame de pila
	# código de la función
	mov rsp, rbp # restaura el stack pointer
	pop rbp      # restaura RBP
	ret          # vuelve a la instrucción después del CALL
```

**¿Qué es un stack frame?**

Es la zona de trabajo de una función en la pila. Dentro de el se guardan:

- La dirección de retorno (puesta por `CALL`).
- El `RBP` anterior (del caller).
- Variables locales.
- A veces parámetros.

Cada función tiene su propio frame para no pisar los datos de otras funciones.

### ¿Qué hace `CALL` antes de que la función empiece?

Supongamos `CALL nombre_funcion`, Internamente la CPU realiza lo siguiente:

- Empuja a la pila a la dirección de retorno.
- Salta a la etiqueta `nombre_funcion`.

La pila queda así:

```
Direcciones altas
-----------------
...
[ return address ]  ← RSP después del CALL
-----------------
Direcciones bajas
```

Aún no hay frame para la función, solo está la dirección a la que se volverá con `RET`.

Luego cuando se ejecuta `PUSH RBP`, se guarda el valor actual de `RBP` en `[RSP]`, la pila ahora se ve así:

```
Direcciones altas
-----------------
...
[ return address ]
[ old RBP ]        ← RSP
-----------------
Direcciones bajas
```

**Importante:** La función llamadora estaba usando su propio `RBP`. Si no se guarda, se destruye y se rompe su stack frame.

Luego de ejecutar `MOV RBP, RSP`, `RBP` apunta al inicio del nuevo stack frame, `RSP` sigue apuntando al mismo lugar. Y la pila ahora se ve así:

```
Direcciones altas
-----------------
...
[ return address ]
[ old RBP ]   ← RBP, RSP   ← base del frame
-----------------
Direcciones bajas
```

Esto define el frame de la función en la pila. Desde ahora, `RBP` es el punto fijo de referencia, mientras que `RSP` puede moverse con cada ejecución de `PUSH/POP` o cuando se reserva espacio para variables locales.

### ¿Cómo se reserva espacio para variables locales?

Para reservar espacio bien se puede usar `SUB` respecto de `RSP`.

``` asm
# Intel
una_funcion:
	# Prólogo de la función
    push rbp
    mov rbp, rsp
    sub rsp, 8   # Reserva 8 bytes en la pila (variable local)

    # Usa la variable local
    mov qword ptr [rbp-8], 42  # Variable_local = 42
    mov rax, qword ptr [rbp-8] # RAX = variable_local

    # Se debe restaurar la pila antes de salir de la función
    add rsp, 8 # Libera el espacio reservado

    pop rbp
    ret
```

Luego de reservar espacio para variables locales la pila se ve así:

```
Direcciones altas
-----------------
...
[ return address ]     ← RBP + 8
[ old RBP ]            ← RBP
-----------------
[ local var 1 ]        ← RSP
-----------------
Direcciones bajas
```

Aquí es en donde a las variables locales se accede con desplazamientos negativos:

```asm
# Intel
mov eax, [rbp-4] # Asigna el contenido de una variable local a EAX 
```

Y los parámetros o retornos se acceden con desplazamientos positivos:

```asm
# Intel
mov rax, [rbp+8] # Dirección de retorno
mov rax, [rbp+16] # primer argumento (convención antigua)
```

**¿Por qué no usar solo `RSP`?**

`RSP` cambia con cada `PUSH`, `POP`, `CALL`, etc. En cambio `RBP` sigue fijo. Usar `RBP` para direccionar variables es una regla estable.

**Destruir el stack frame**

```asm
# Intel
mov rsp, rbp
pop rbp
ret
```

`mov rsp, rbp` devuelve `RSP` a la posición de `RBP` olvidando los espacios de memoria reservados para las variables. El stack vuelve al inicio del frame:

```
Direcciones altas
-----------------
...
[ return address ]
[ old RBP ]   ← RSP, RBP
-----------------
Direcciones bajas
```

`pop rbp` restaura el valor de `RBP` desde la pila a `RBP` dejando a la pila de la siguiente manera:

```
Direcciones altas
-----------------
...
[ return address ]  ← RSP
-----------------
Direcciones bajas
```

**Nótece** que ahora `RET` tiene a disposición la dirección de retorno para cargarla en `RIP`.

Finalmente `RET` saca la dirección de retorno desde la pila y salta a ella, devolviendo el control a la función llamadora, con su pila intacta.

### Convención System V AMD64 para los 6 primeros argumentos de una función

| Argumento | Registro |
| --------- | -------- |
| 1         | **RDI**  |
| 2         | **RSI**  |
| 3         | **RDX**  |
| 4         | **RCX**  |
| 5         | **R8**   |
| 6         | **R9**   |

Esto significa que el primer argumento debe ir en `RDI`, el segundo en `RSI`, etc, hasta `R9`.

### Convención Caller-saved  y Callee-saved

- **Caller-saved:** Son los registros que la función que llama (caller) debe respaldar si quiere preservar su valor.
- **Callee-saved**: Son los registros que la función llamada (callee) debe respaldar y restaurar si los modifica. Es decir que la función que llama no se preocupa por ellos.

**Registros caller-saved en System V AMD64**

**Registros Generales**

Pueden ser usados libremente por la función llamada. Si la función que llama necesita mantener su valor después de la llamada, debe guardarlos en la pila antes de llamar y restaurarlos después.

- `RAX`: Retorno de valores, uso temporal.
- `RCX`: Argumento temporal (también usado en llamadas a funciones).
- `RDX`: Argumento temporal.
- `RSI`: Argumento temporal.
- `RDI`:  Argumento temporal.
- `R8`:  Argumento temporal.
- `R9`:  Argumento temporal.
- `R10`:  Argumento temporal.
- `R11`:  Argumento temporal.

**¿Por qué existen?**

La idea es optimizar la velocidad, los registros caller-saved permiten que la función llamada use registros temporales sin tener que guardarlos en la pila. Solo la función que necesita conservar valores específicos se encarga de preservarlos.

**Registros calle-saved en System V AMD64**

Son aquellos registros (no volátiles) que la función llamada debe preservar si los modifica. (Por convenciones de ABI y buena ingeniería de software). Si la función los usa, antes debe preservar su valor en la pila, para posteriormente antes de ejecutar `RET`, restaurarlos.

**Registros Generales**

`RBX`, `RBP` (Usado como frame pointer), `R12`, `R13`, `R14` y `R15`.

**Stack pointer**

`RSP` siempre debe estar correctamente alineado, así que también se considera implícitamente calle-saved.

### Etiquetas locales dentro de la función

GAS permite variables locales en forma de etiquetas con `1:`, `2:`, etc, que solo existen dentro del contexto de la función:

```asm
# Intel
fn:
	# Prólogo
	push rbp
	mv rbp, rsp
	sub rsp, 8
	
	jmp skip_var
	
	1: .byte 0x55   # pseudo variable (1 byte)
	2: .quad 0x1234 # pseudo variable (8 bytes)
	
	skip_var:
    mov al, [1] 
    mov rax, [2]

	# Epílogo
    mov rsp, rbp
    pop rbp
    ret
```

**¿Por qué es necesario realizar un salto con `JMP`?**

Antes que nada, cabe recordar que lo que se ve arriba corresponde a la sección `.text`, es decir que es una sección de código ejecutable.

Recordar que la anatomía básica de un programa asm en GAS es la siguiente:

```asm
.intel_syntax noprefix
.section .data
	var: .int 10
.section .text
.global _start
_start:
	# Código de la función
```

Si no se realizara un salto obviando las etiquetas `1:` y `2:`, el CPU intentaría ejecutar esos bytes causando un error. Lo que indica que principalmente, todo lo que hay en la sección `.text` debe ser información ejecutable y/o información que pueda ser manipulada/utilizada por los `opcodes` ejecutables.

**¿Cómo se ve la memoria en las etiquetas?**

Cuando se define una etiqueta `1: .byte 'A'`, la etiqueta `1:` apunta exactamente a la dirección donde comienza el dato definido por `.byte`. No apunta "antes" ni "después", mas bien al primer byte del valor `A`. Entonces se ve algo así:

```
Dirección: 0x1000
Contenido: 0x41 ('A')
Etiqueta 1: apunta a 0x1000
```

Por lo que `[1]`, `[1b]` o `[1f]` accederán al valor en `0x1000`, es decir a `A` (0x41).

Es posible usar los postfijos `b` (backward) y `f` (forward) para accesar a etiquetas locales numéricas que se repiten varias veces en relación a la posición actual. Recordar que dentro de la memoria del programa, es decir, la que almacena su código en disco, existen posiciones.

Veamos el siguiente ejemplo:

```asm
Direcciones (código):
0x1000: 1: .byte 'A'
0x1001: 1: .byte 'B'
0x1002: código ...
```

Si una instrucción está en `0x1003`:

| Referencia | Apunta a:                                                    |
| ---------- | ------------------------------------------------------------ |
| `1b`       | 0x1001 (la segunda `1:` hacia atrás)                         |
| `1f`       | no hay ninguna `1:` adelante, error si no hay etiqueta hacia adelante |

La etiqueta no incrementa ni retrocede por sí sola. `b` o `f` solo elige cuál de las etiquetas con ese número usar como punto de referencia.

Para el ejemplo anterior, `1f` causaría un error, ya que no existe una etiqueta posterior a `0x1003`, la cual pudiera ser accedida desde la instrucción de la dirección `0x1003`.

### Variables con nombre dentro de la función

Si se quiere algo parecido a `.data` pero local y temporal, se puede hacer un macro o pseudo-etiqueta usando la directiva `equ`. Solo funciona con variables de stack.

**Sintaxis:** `nombre = valor` o `nombre equ valor`

```asm
# Intel
buf_size equ 16 # define un tamaño de buffer
my_var  = rbp-8 # define un alias a un offset de stack
```

Cada vez que se escriba `[my_var]`, el ensamblador lo reemplazará por `[rbp-8]`. La diferencia con una etiqueta normal, es que `labek: .quad 0` si ocupa memoria en `.data`, `.bss` o `.text`, en cambio `equ` no. Solo es un nombre simbólico temporal.

**Ejemplo completo**

```asm
# Intel
funcion:
    push rbp
    mov rbp, rsp
    sub rsp, 16      # reservo stack para variables

    var1 = rbp-8
    var2 = rbp-16

    mov QWORD PTR [var1], 42
    mov QWORD PTR [var2], 100

    mov rax, [var1]
    add rax, [var2]

    mov rsp, rbp
    pop rbp
    ret
```

`var1` y `var2` son los alias para las variables de stack. No ocupan memoria extra, pero hacen que el código sea mucho más legible.

## Instrucción `CALL`

Llama a una función (semánticamente hablando). Técnicamente realiza dos acciones atómicas:

1. Guardar la dirección de retorno en la pila (de la siguiente instrucción, es decir, a dónde volver después).

2. Salta a la dirección de la función.

   Equivale conceptualmente a:

   ```asm
   # Intel
   push dirección_de_retorno
   jmp destino
   ```

   Pero `CALL` lo hace como una sola instrucción.

No modifica los flags del CPU. En 64 bits el retorno que se empuja es una dirección de 64 bits. Por cada `CALL` debe ejecutarse un `RET` correspondiente o el flujo de rompe.

**Importante:** Muchas vulnerabilidades clásicas (buffer overflow) se basan en sobreescribir la dirección

**Sintaxis:** `CALL etiqueta/registro/memoria`

**Ejemplo**

```asm
# Intel
call mi_funcion    # salto directo
call rax           # salto indirecto usando un registro
call [tabla + rbx] # salto indirecto desde memoria
```

**¿Qué sucede en la pila?**

```asm
# Intel
0x401000: call mi_funcion
0x401005: mov rax, 1   # siguiente instrucción
```

Cuando se ejecuta `call mi_funcion` el CPU empuja `0x401005` en la pila.

```
RSP -> [ 0x401005 ]
```

Carga `RIP = dirección de mi_funcion`. Luego dentro de la función, al ejecutar el `RET`, ocurre lo inverso. Es decir `RET`, hace `pop rip` y vuelve exactamente a `0x401005`.

**Nota:** El armado del stack frame es responsabilidad del código de la función.

**Tipos de `CALL`**

1. Llamada directa: 

   `CALL mi_funcion`. El destino está codificado en la instrucción (offset relativo a `RIP`).

2. Llamada indirecta.

   ```asm
   # Intel
   call rax
   call [direccion]
   ```

   El destino se calcula en tiempo de ejecución. Muy común en: punteros en C, tablas virtuales y `switch` compilados con "jump tables" (tablas de saltos).

**Argumentos**

`CALL` no se encarga de gestionar argumentos, eso queda para las convenciones definidas en las respectivas [ABI](https://es.wikipedia.org/wiki/Interfaz_binaria_de_aplicaciones).
Se dejan a modo de ejemplo algunos manuales ABI.

- [musl libc](https://wiki.musl-libc.org/abi-manuals)
- [System V ABI AMD64 ABI Draft V0.99.6 - Julio de 2012](https://refspecs.linuxbase.org/elf/x86_64-SysV-psABI.pdf)
- [Microsoft Learn - Overview of X64 ABI conventions](https://learn.microsoft.com/en-us/cpp/build/x64-software-conventions?view=msvc-170)
- [Microsoft Learn - Calling Conventions](https://learn.microsoft.com/en-us/cpp/cpp/calling-conventions?view=msvc-170)
- [System V psABI for AMD64](https://gitlab.com/x86-psABIs/x86-64-ABI)
- [Mac OS X ABI Functions Call Guide](https://personal.denison.edu/~bressoud/cs281-s07/MacOSXLowLevelABI.pdf)

**psABI:** Processor Suplement ABI.

El System V ABI es un estándar general, pero cada arquitectura necesita detalles propios, por eso existen documentos del tipo **psABI**.

## Instrucción `RET`

Vuelve al punto desde donde se llamó a una función con `CALL`. No debe ejecutarse sin un `CALL` previo o lo mas seguro es que la ejecución termine en un crash. (Aunque técnicamente, es posible emular el comportamiento de `CALL`, resulta impráctico).
`RET` no calcula ninguna dirección por sí mismo, solo realiza lo siguiente:

```
RIP = [RSP]
RSP += 8
```

Toma lo que esté encima de la pila y salta a dicha dirección. Si se ejecuta un `RET` antes de un `CALL`, lo mas probable es que el resultado sea un **segmentation fault**, un crash o un salto a código inválido, lo que igualmente terminaría en un crash del programa.

No modifica ni lee flags del CPU.

**Sintaxis**

```
RET
RET imm16
```

Admite dos formas, una básica sin operador y otra con un inmediato de 16 bits para ajustes adicional de pila. La primera realiza la operación inversa a `CALL`. En cambio la segunda:

- Carga la dirección de retorno desde la pila.

- Incrementa `RSP` en 8.

- Suma el inmediato a `RSP`.

  ```
  RSP = RSP + 8 + imm16
  ```

  Se usaba principalmente por convenciones antiguas como `stdcall` (donde la función llamada limpia los argumentos de la pila).

  **Diferencias por modo**

  | Modo   | Tamaño de retorno | Ajuste               |
  | ------ | ----------------- | -------------------- |
  | 16-bit | 2 bytes           | `SP += 2 (+ imm16)`  |
  | 32-bit | 4 bytes           | `ESP += 4 (+ imm16)` |
  | 64-bit | 8 bytes           | `RSP += 8 (+ imm16)` |

**Ejemplo**

```asm
# Intel
mi_funcion:
	push rbp
	mov rbp, rsp
	# código de la función
	pop rbp
	ret
```

**¿Por qué se restaura la pila antes de ejecutar `RET`?**

`RET` asume que en la cima de la pila está la dirección de retorno. Si `RSP` no es restaurada, `RET` sacará basura y saltará a una dirección inválida ocasionando un crash en la ejecución.

## Instrucción `NOP` (no operation)

Instrucción que no hace nada excepto consumir tiempo de ejecución y espacio en el programa. No modifica registros, memoria ni algún flag del CPU. Sí avanza el puntero de instrucciones (`RIP/EIP/IP`) para pasar a la instrucción siguiente.

Su `opcode` es `90` (hexadecimal), mide exactamente 1 byte.

**Sintaxis:** `NOP`

**Usos comunes**

- Alineación de código (usada como padding).

  Se usa para alinear instrucciones o bloques a ciertos límites de bytes (útil para caché, pipelines, o convenciones del compilador).

- Relleno / parcheo (patching).

  Cuando se quiere reemplazar una instrucción sin cambiar el tamaño del código se usa `NOP`.

  ```asm
  # Intel
  mov eax, 1 # B8 01 00 00 00 (5 bytes)
  # Para reemplazar esta instrucción se usaría NOP (5 veces)
  nop # (1 byte)
  nop # (1 byte)
  nop # (1 byte)
  nop # (1 byte)
  nop # (1 byte)
  ```

  **Nótece** que la cantidad de `NOP` a utilizar viene dada por el largo en bytes de la instrucción a reemplazar. El largo final se verá en el ejecutable particular, puesto que muchas instrucciones dependen de como sean codificadas en `opcodes`. (Pero a nivel conceptual se esboza la idea). 

  Esto se realiza en: Inveniería inversa, para deshabilitar checks y/o hot-patching.

- Delays mínimos / sincronización.

  Aunque no es la forma ideal de hacer esperas, se usa para pequeñas pausas o en bucles de espera.

  ```asm
  # Intel
  wait:
  	not
  	not
  	jmp wait
  ```

- Optimización del pipeline.

  En arquitecturas modernas, algunos `NOP` se usan para evitar "hazards" (peligros). Los hazards son situaciones que impiden que el pipeline de la CPU ejecute instrucciones de forma continua y correcta. En  otras palabras: son conflictos que obligan al procesador a esperar, reordenar o descartar trabajo para no producir resultados incorrectos. Esto debido a que las CPUs modernas ejecutan varias instrucciones "al mismo tiempo" (por el predictor de saltos) en distintas etapas (fetch, decode, execute, memory, write-back), a veces dichas instrucciones se estorban entre sí.

  `NOP` ayuda a que el pipeline se estabilice. Actualmente lo maneja mas el compilador/CPU, pero históricamente fue importante.

**Detalles técnicos sobre `NOP`**

En realidad el `opcode` de `NOP` es un alias de `xchg eax, eax`, que permite intercambiar un registro consigo mismo, sin cambiar nada.

En x86-64 existen `NOPs` de múltiples bytes (multi-byte NOPs`) para relleno más eficiente.

```asm
# Intel
nop
nop word ptr [rax+rax]
nop dword ptr [rax+rax]
```

El ensamblador/compilador los usa para alineación.

## Instrucción `XCHG` (exchange)

Intercambia (swap) el contenido de dos operandos sin usar un registro temporal. No modifica ningún flag del CPU. `XCHG` puede operar en todos los modos (8/16/32/64 bits).

**Sintaxis:** `XCHG dst, src`

**Operandos permitidos**

| Operando 1 | Operando 2 | ¿Válido?     |
| ---------- | ---------- | ------------ |
| Registro   | Registro   | Sí           |
| Registro   | Memoria    | Sí           |
| Memoria    | Registro   | Sí           |
| Memoria    | Memoria    | No permitido |
| Inmediato  | Cualquiera | No permitido |

**Ejemplo**

```asm
# Intel
# Ejemplo básico
mov rax, 10
mov rbx, 20
xchg rax, rbx
# RAX = 20
# RBX = 10

# Ejemplo con memoria
mov [rbp-8], 2
mov rax, 3
xchg rax, [rbp-8]
# [rbp-8] = 3
# RAX = 2
```

**`LOCK` implícito**

Cuando uno de los operandos es memoria, la instrucción es atómica, es decir, equivale a usar el prefijo `LOCK`.

```asm
# Intel
xchg rax, [variable_compartida]
```

Esto garantiza que ningún otro hilo o CPU pueda acceder a esa dirección de memoria durante el intercambio. Por eso `XCHG` se usa mucho en spinlocks, implementación de mutex y en sincronización en multiprocesadores.

**Caso especial con `RAX`**

Existe una codificación mas corta cuando uno de los operandos es `RAX`.

```asm
# Intel
xchg rax, rbx
```

Se codifica en un byte menos que otras combinaciones. Por eso a veces se ve en código optimizado o shellcode. (Donde la cantidad de bytes importa).

**Usos típicos**

- Intercambiar valores sin registro temporal
- Sincronización (locks) para variables compartidas entre hilos.
- Algoritmos de ordenamiento o manipulación de datos, para intercambios de elementos en arreglos.

**Importante**

Si bien `XCHG reg, reg` es rápido. `XCHG reg, [mem]` es mas lento porque es atómico por hardware. Por lo que si no se necesita atomicidad, es mejor usar el intercambio clásico.

```asm
# Intel
mov rcx, [mem]
mov [mem], rax
mov rax, rcx
```

**No existe** `XCHG mem, mem`.

## Instrucción `Enter`

Crea automáticamente el stack frame de una función, es decir, prepara la pila para las variables locales y encadena el frame anterior. Es una secuencia compacta de la secuencia clásica manual. 

```asm
# Intel
push rbp
mov rbp, rsp
sub rsp, tamaño
```

**Sintaxis:** `ENTER tamaño, nivel` donde `tamaño` son los bytes a reservar en la pila para variables locales. Y `nivel` cuántos frames anidados se deben enlazar (usado en lenguajes antiguos con funciones anidadas, como Pascal).

En la práctica moderna `nivel` casi siempre es cero y `tamaño` es el espacio para variables locales.

**Ejemplo**

```asm
# Intel
enter 32, 0
# Equivale a
push rbp     # guarda el frame pointer anterior
mov rbp, rsp # nuevo frame
sub rsp, 32  # reserva 32 bytes para avariables locales
```

Es decir:

- Guarda el `RBP` anterior.
- Fija `RBP` como base del nuevo stack frame.
- Reserva espacio en la pila.

**Ejemplo simple**

```asm
# Intel
mi_funcion:
    enter 16, 0     # crea frame y reserva 16 bytes
    mov  qword [rbp-8], 5
    mov  qword [rbp-16], 10
    leave
    ret

# Equivalente sin Enter
mi_funcion:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16

    mov  qword [rbp-8], 5
    mov  qword [rbp-16], 10

    mov  rsp, rbp
    pop  rbp
    ret
```

**Importante**

Cuando `nivel > 0`, `ENTER` copia valores antiguos de `RBP` para permitir acceso a variables de funciones "padre" en lenguajes con funciones anidadas.

**Ejemplo conceptual**

```asm
# Intel
enter 16, 2
```

Construye una cadena de stack frames para acceder a varios niveles superiores.

En C/C++, ensamblador moderno y compiladores actuales no se usa.

**¿Por qué no se usa?**

- Es mas lenta que `PUSH RBP / MOV RBP, RSP / SUB RSP, N`
- Es menos flexible para optimización.
- Los compiladores modernos prefieren emitir las instrucciones explícitas.
- En x86-64 con optimizaciones, muchas funciones ni siquiera usan frame pointer.

Por eso, aunque existe, `ENTER` es mas histórica que práctica.

## Instrucción `LEAVE`

Destruye el stack frame actual de una función y restaura el frame anterior. Es decir, es el epílogo automático de una función. Se usa típicamente antes de `RET`. No modifica los flags del CPU ni tampoco los lee. Requiere que el stack frame esté bien formado, asumiendo que `RBP` apunta al inicio del stack frame.

**Sintaxis:** `LEAVE`

**Ejemplo**

```asm
# Intel
mi_funcion:
    enter 16, 0
    # cuerpo de la función
    leave
    ret
```

Internamente `LEAVE` equivale a:

```asm
# Intel
mov rsp, rbp   # restaura el stack pointer al inicio del frame
pop rbp        # recupera el RBP anterior (frame del caller)
```

Es decir que:

- Elimina las variables locales restaurando `RSP`.
- Restaura el frame anterior sacando el `RBP` guardado.

**Importante:** En funciones sin frame pointer no se usa. Muchos compiladores modernos no usan `RBP` como frame pointer para optimizar.

```asm
# Intel
mi_funcion:
    sub rsp, 32
    ...
    add rsp, 32
    ret
```

Tal y como se ve, no hay `ENTER` ni `LEAVE`, solo ajustes manuales de `RSP`.

**¿Por qué no se usa mucho hoy?**

Al igual que `ENTER`, es más lenta que la secuencia manual. Limita optimizaciones del compilador. En x86-64, el uso de `RBP` como frame pointer es opcional, por eso, se suele ver más esto:

```asm
# Intel
push rbp
mov rbp, rsp
...
pop rbp
ret

# O directamente
sub rsp, 32
...
add rsp, 32
ret
```

# Manejo de strings

## Operadores de datos

No son instrucciones que el CPU ejecute. Su función principal es reservar e inicializar memoria en en tiempo de ensamblado, para que el programa tenga espacio para almacenar datos.

Van ubicados en las secciones: `.data`, `.bss`, `.rodata` y/o `.text`.

**Listado de secciones comunes en un programa X86-64**

| Sección                              | Propósito                                                    | Ejemplo típico                                      |
| ------------------------------------ | ------------------------------------------------------------ | --------------------------------------------------- |
| `.data` (Intel/MASM: `DATA SEGMENT`) | Datos **inicializados** que tu programa va a usar. Se reservan en memoria y ya tienen un valor definido. | `valor DB 10`                                       |
| `.bss` (Intel/MASM: `BSS SEGMENT`)   | Datos **no inicializados**. La memoria se reserva pero se llena con 0 automáticamente en tiempo de carga. | `buffer resb 4` (GAS) / `buffer DB 4 DUP(?)` (MASM) |
| `.rodata` (GAS) o `CONST SEGMENT`    | Datos **solo lectura**, como cadenas constantes o tablas de lookup que no cambian. | `msg DB "Hola",0`                                   |
| `.text` (Intel/MASM: `CODE SEGMENT`) | Contiene las instrucciones ejecutables (código). No se suelen poner datos aquí, salvo constantes rápidas dentro de instrucciones. | `MOV AL, 10`                                        |

**Uso según la sección**

1. `.data`: Datos inicializados

   Normalmente usa los operadores `DB`, `DW`, `DD`, `DUP` con valores inicializados.

   ```asm
   # Intel
   .section .data
   	mensaje:
   		.ascii "Hola\0" # Cadena con terminador nulo
       buffer:
       	.byte 0,0,0,0   # Buffer de 4 bytes inicializados en cero
   ```

   **Nota:** `.ascii` define cadena sin terminador automáticamente, por eso se debe agregar un carácter `\0` nulo al final.

2. `.bss`: Datos sin inicializar

   GAS no soporta `?` ni `DUP`, se usa `.skip N` para reservar N bytes sin inicializar.

   ```asm
   # Intel
   .section .bss
   	buffer2:
   		.skip 4 # Reserva 4 bytes sin inicializar
   ```

   Equivalente en MASM/TASM

   ```asm
   # Intel
   BSS SEGMENT
   buffer2 DB 4 DUP(?) # Reserva 4 bytes sin inicializar
   ```

   - `DB` define bytes.
   - `4 DUP(?)` repite 4 veces sin valor definido usando `?` (significa no inicializado).
   - Se crea un buffer de 4 bytes que la CPU podrá usar después.

3. `.rodata`: Datos de solo lectura

   ```asm
   # Intel
   .section .rodata
   	saludo:
   		.ascii "Hola Mundo\0"
   ```

   Los datos definidos en `.rodata` no deben ser modificados en tiempo de ejecución.

### Operador `DB` (define byte)

Se usa para reservar espacio en memoria y opcionalmente inicializarlo con valores ed un byte cada uno.

**Disponible en:** NASM, MASN, TASM y FASM pero no en GAS.

**Sintaxis:** `nombre_etiqueta db valor1, valor2, valor3, ...` donde:

- `nombre_etiqueta`: Es opcional. Sirve para referirse a la dirección del dato.
- `db`: define bytes.
- `valor1, valor2, valor3, ...`: Son los valores con los que se inicializan los bytes. Pueden ser números, caracteres o expresiones.

**Ejemplo**

```asm
# Intel
# Define un solo byte con un valor
mi_byte db 0x7F # Un byte con valor hexadecimal 7F

# Define varios bytes
array_bytes db 1, 2, 3, 4, 5 # 5 bytes consecutivos

# Definir un string
mensaje db 'Hola Mundo', 0 # String terminado en null (0)
# Cada caracter usa un byte. El 0 al final es tipico para C-Style strings

# Reserva bytes sin inicializar
buffer db 10 dup(?) # Reserva 10 bytes sin inicializar
```

### Operador `DW` (define word)

Se usa para reservar espacio en memoria y opcionalmente inicializarlo con un valor. Usa "**word**" (16 bits).

**Disponible en:** NASM (uso en minúscula), MASN, TASM y FASM pero no en GAS.

**Sintaxis:** `etiqueta DW valor1 [, valor2, valor3, ...]` donde:

- `etiqueta`: nombre de la variable o del arreglo.
- `DW`: Define una palabra de 16 bits.
- `valor1, valor2...`: valores iniciales (opcionales). Si no se da valor, se reserva el espacio sin inicializar.

**Ejemplo**

```asm
# Intel
# Definir una sola palabra con valor
mi_numero DW 1234h      # 16 bits inicializados con 0x1234

# Definir un arreglo de 3 palabras
mi_arreglo DW 1, 2, 3   # 3 palabras consecutivas

# Reservar espacio sin inicializar
mi_espacio DW ?         # 1 palabra reservada, sin valor inicial
```

**Importante**

- Cada `DW` reserva 2 bytes en memoria.
- Los valores se pueden escribir en decimal, hexadecimal (`h`) o binario (`b`).
- Para acceder a los datos, normalmente se usa un registro de 16 bits (`AX`, `BX`, etc).

### Operador `DD` (define dubleword)

Se usa para reservar una "**doubleword**" (que en x86-64 es de 32 bits (4 bytes)), punteros o valores inicializados de 4 bytes.

**Disponible en:** NASM, MASN, TASM y FASM pero no en GAS.

**Sintaxis:** `etiqueta DD valor1 [, valor2, valor3, ...]` donde:

- `etiqueta`: nombre de la variable o arreglo.
- `DD`: reserva 4 bytes por cada valor.
- `valor1, valor2...`: valores iniciales opcionales. Si no se da valor, se puede usar `?` para reservar sin inicializar.

**Ejemplo**

```asm
# Intel
# Definir un entero de 32 bits
mi_entero DD 12345678h   # 4 bytes con valor 0x12345678

# Definir un arreglo de 3 doublewords
mi_arreglo DD 1, 2, 3    # 12 bytes en total (3*4)

# Reservar espacio sin inicializar
mi_espacio DD ?          # 4 bytes reservados
```

**Acceso en registros**

Para manipular un `DD` se usa un registro de 32 bits: `EAX`, `EBX`, `ECX`, `EDX`.

```asm
# Intel
mov eax, mi_entero   # carga el valor de 32 bits en EAX
mov [mi_arreglo+4], 5 # escribe 5 en el segundo elemento del arreglo
```

### Operador `DQ` (define quadword)

Se usa para reservar memoria para enteros de 64 bits, punteros de 64 bits o valores grandes de 8 bytes. Usa una "**quadword**" (que en x86-64 es ed 64 bits).

**Disponible en:** NASM (en minúscula), MASN, TASM y FASM (en minúscula) pero no en GAS.

**Sintaxis:** `etiqueta DQ valor1 [, valor2, valor3, ...]` donde:

- `Etiqueta`: nombre de la variable o arreglo.
- `DQ`: reserva 8 bytes por cada valor.
- `valor1, valor2...`: valores iniciales opcionales. Si no se quiere inicializar, se usa `?`.

**Ejemplo**

```asm
# Intel
# Definir un entero de 64 bits
mi_entero64 DQ 123456789ABCDEF0h  # 8 bytes con este valor

# Definir un arreglo de 2 quadwords
mi_arreglo64 DQ 1, 2               # 16 bytes en total

# Reservar espacio sin inicializar
mi_espacio64 DQ ?                   # 8 bytes reservados
```

**Acceso en registros**

Para manipular un `DQ` se usa un registro de 64 bits: `RAX`, `RBX`, `RCX`, `RDX`, etc.

```asm
# Intel
mov rax, mi_entero64      # carga el valor de 64 bits en RAX
mov [mi_arreglo64+8], 5   # escribe 5 en el segundo elemento del arreglo
```

### Operador `DUP`(duplicate)

Se usa para repetir un valor o un patrón al inicializar datos en memoria. Sirve con `DB`, `DW`, `DD`, `DQ` en ensambladores Intel (MASM/TASM/NASM/FASM).

**Sintaxis:** `n DUP(valor)` donde;

- `n`: es cuántas veces quieres repetir el valor.
- `valor`: puede ser un número, un carácter, o incluso una expresión.
- Se puede combinar con directivas como `DB`, `DW`, `DD`, `DQ`.

**Ejemplo**

```asm
# Intel
.DATA

# Definir 10 bytes inicializados a 0
mi_buffer DB 10 DUP (0)  

# Definir 5 palabras (16 bits) inicializadas a 1234h
mis_palabras DW 5 DUP (1234h)

# Definir 3 doublewords (32 bits) inicializadas a 0
mis_dwords DD 3 DUP (0)

# Definir 4 quadwords (64 bits) inicializadas a 0
mis_qwords DQ 4 DUP (0)
```

**¿Cómo funciona en memoria?**

- `mi_buffer DB 10 DUP(0)`: reserva 10 bytes consecutivos, todos con valor `0`.
- `mis_palabras DW 5 DUP(1234h)`: reserva 10 bytes (5*2), todos con `0x1234`.

**Notas**

1.  Solo funciona con la sintaxis Intel (MASM/TASM/NASM/FASM).

2. Permite ahorrar mucho código al inicializar arreglos grandes.

3. Se puede usar expresiones dentro de los paréntesis, no solo con números constantes:

   ```asm
   # Intel
   DW 4 DUP (100 + 2) # inicializa 4 palabras con 102
   ```

## Prefijo `REP` (repeat)

Modifica instrucciones que soportan repetición como las de movimiento o comparación de strings, para que se repitan varias veces en automático. Utiliza el registro `RCX` como contador y ejecuta tantas veces como el registro indique decrementandolo en cada repetición. No modifica los flags del CPU pero si sus variantes leen `ZF`.

**Sintaxis:** `REP <instrucción>`

**Ejemplo**

```asm
# Intel
# Copia 10 bytes de [RSI] a [RDI]
mov rcx, 10 # número de bytes
rep movsb   # mueve 1 byte de RSI a RDI RCX veces

# Pone 5 palabras de 16 bits en AX en [RDI]
mov ax, 0x1234
mov rcx, 5
rep stosw # almacena AX en RDI 5 veces
```

### Variantes

Existen variantes condicionales que combinan `REP` con saltos por cero o no cero:

- `REPE` / `REPZ`: Repite mientras `ZF = 1` (útil en comparación de cadenas `CMPS`).

- `REPNE` / `REPNZ`: Repite mientras `ZF = 0`.

  ```asm
  # Intel
  mov rcx, 10
  repe cmpsb  # compara bytes en RSI y RDI, repite mientras sean iguales y RCX > 0
  ```

**Nota:** `REP` es muy útil para operaciones de memoria masiva, porque evita escribir bucles manuales en ensamblador.

**Instrucciones típicas para `REP` y sus variaciones**

| Prefijo       | Función                       | Instrucciones típicas          |
| ------------- | ----------------------------- | ------------------------------ |
| `REP`         | Repetir N veces (RCX)         | `MOVS`, `STOS`, `LODS`, `CMPS` |
| `REPE/REPZ`   | Repetir mientras ZF=1 y RCX>0 | `CMPS`, `SCAS`                 |
| `REPNE/REPNZ` | Repetir mientras ZF=0 y RCX>0 | `CMPS`, `SCAS`                 |

## Instrucción `CLD` (clear direction flag)

Borra el flag de dirección `DF` (Direction Flag). Es decir que setea `DF = 0` asegurando que las instrucciones de strings avancen hacia direcciones más altas en memoria (de izquierda a derecha). Solo afecta a flag `DF`.

`DF` controla la dirección en la que se procesan las instrucciones de strings con `MOVS`, `LODS`, `STOS`, `SCAS` y `CMPS`. Significa lo siguiente:

- `DF = 0`: El string se procesa de izquierda a derecha (incrementando los punteros `ESI`/`RSI` y `EDI`/`RDI`).
- `DF = 1`: El string se procesa de derecha a izquierda (decrementando los punteros `ESI`/`RSI` y `EDI`/`RDI`).

**Sintaxis:** `CLD`

**Ejemplo**

```asm
# Intel
# Suponiendo que se quiere copiar 5 bytes de src a dst
cld               # Asegura que DF=0, avanzamos hacia adelante
mov rcx, 5        # Contador
mov rsi, src      # Fuente
mov rdi, dst      # Destino
rep movsb         # Copia rcx bytes de [rsi] a [rdi]
```

`CLD` asegura que `REP MOVSB` copie hacia adelante incrementando `RSI` y `RDI`.

## Instrucción `STD` (set direction flag)

Enciende el flag `DF`. Es decir setea `DF = 1` asegurando que las instrucciones de strings avancen hacia direcciones más bajas en memoria (de derecha a izquierda). Solo afecta al flag `DF`.

`DF` controla la dirección en la que se procesan las instrucciones de strings con `MOVS`, `LODS`, `STOS`, `SCAS` y `CMPS`. Significa lo siguiente:

- `DF = 0`: El string se procesa de izquierda a derecha (incrementando los punteros `ESI`/`RSI` y `EDI`/`RDI`).
- `DF = 1`: El string se procesa de derecha a izquierda (decrementando los punteros `ESI`/`RSI` y `EDI`/`RDI`).

**Sintaxis:** `STD`

**Ejemplo**

```asm
# Intel
# Copiar 5 bytes desde el final de src hasta dst (hacia atrás)
std               # DF = 1, avanza hacia atrás
mov rcx, 5
lea rsi, [src+4]  # apunta al último byte de src
lea rdi, [dst+4]  # apunta al último byte de dst
rep movsb         # copia rcx bytes de [rsi] a [rdi] decrementando punteros
cld               # es recomendable restaurar DF = 0 después de realizar la operación
```

**Nota:** Siempre que se use `STD` es buena práctica restaurar `DF` con `CLD` al terminar la operación, para no afectar código que espera `DF = 0`.

## Instrucción `MOVS` (move string)

Copia datos de una dirección de memoria a otra dirección de memoria. Es como un `memcpy` en C, pero a nivel de CPU. No afecta los flags del CPU. Siempre depende de `RSI`, `RDI` y el flag `DF` para saber hacia dónde y cómo mover.

**Sintaxis:** `MOVS[m] dest, src`

En ensamblador moderno no se suelen escribir los operandos directamente, la CPU usa registros especiales:

- `RSI`: Source Index (puntero de origen).
- `RDI`: Destination Index (puntero de destino).
- `RCX`: Contador (solo si usamos `REP`).
- `AL/AX/EAX/RAX`: para tamaños de 1,2,4 y 8 bytes.

Y los sufijos determinan el tamaño que mueve:

| Instrucción | Tamaño  | Descripción                  |
| ----------- | ------- | ---------------------------- |
| `MOVSB`     | 1 byte  | Mueve un byte                |
| `MOVSW`     | 2 bytes | Mueve una palabra (word)     |
| `MOVSD`     | 4 bytes | Mueve un double word         |
| `MOVSQ`     | 8 bytes | Mueve un quad word (64 bits) |

**¿Cómo funciona?**

1. `MOVS` copia el contenido de `[RSI]` a `[RDI]`.
2. Incrementa o decrementa `RSI` y `RDI` automáticamente según el tamaño y `DF` (Direction Flag).
   - `CLD` setea `DF` a cero (avanza o incrementa).
   - `STD` setea `DF` a uno (retrocede o decrementa).
3. Si se combina con `REP`, repite la operación `RCX` veces.

**Ejemplo mínimo sin `REP`**

```asm
# Intel
section .data
origen db 'H','i','!',0
destino db 4 dup(0) # byfufer de 4 bytes

section .text
global _start
_start:
    mov rsi, origen     # puntero al origen
    mov rdi, destino    # puntero al destino
    cld                 # asegura que DF=0 (incrementa)
    
    movsb               # mueve 1 byte de [RSI] a [RDI]
    movsb               # mueve otro byte
    movsb               # mueve otro byte
    movsb               # mueve el null terminator
```

**Ejemplo con `REP MOSB` (más eficiente)**

```asm
# Intel
section .data
origen db 'Hola',0
destino db 5 dup(0)

section .text
global _start
_start:
    mov rsi, origen
    mov rdi, destino
    mov rcx, 5          # número de bytes a copiar
    cld                  # DF=0
    rep movsb           # repite movsb RCX veces
```

`REP MOVSB` hace lo mismo que el ejemplo anterior de manera mas eficiente. `RCX` se decrementa hasta cero.

## Instrucción `LODS` (load string)

Lee un elemento desde memoria y lo carga en un registro, avanzando y retrocediendo automáticamente el puntero. Es decir, copia un dato desde `[RSI]` a un registro (`AL/AX/EAX/RAX`) y mueve `RSI`. No modifica los flags del CPU. Solo lee `DF`.

`LODS` toma un valor desde la dirección apuntada por `RSI` y lo carga en el acumulador:

| Variante | Tamaño  | Operación     |
| -------- | ------- | ------------- |
| `LODSB`  | 1 byte  | `AL ← [RSI]`  |
| `LODSW`  | 2 bytes | `AX ← [RSI]`  |
| `LODSD`  | 4 bytes | `EAX ← [RSI]` |
| `LODSQ`  | 8 bytes | `RAX ← [RSI]` |

  Luego actualiza `RSI` automáticamente:

- Si `DF = 0` (dirección hacia adelante, normal):

  ```
  RSI = RSI + tamaño
  ```

- Si `DF = 1` (dirección hacia atrás):

  ```
  RSI = RSI - tamaño
  ```

**Sintaxis:** `LODS[m]` donde `m `es un modificador:

| Instrucción | Nombre                 | Tamaño leído | Registro destino | Efecto en `RSI` (DF=0) | Efecto en `RSI` (DF=1) |
| ----------- | ---------------------- | ------------ | ---------------- | ---------------------- | ---------------------- |
| `LODSB`     | Load String Byte       | 1 byte       | `AL`             | `RSI = RSI + 1`        | `RSI = RSI - 1`        |
| `LODSW`     | Load String Word       | 2 bytes      | `AX`             | `RSI = RSI + 2`        | `RSI = RSI - 2`        |
| `LODSD`     | Load String Doubleword | 4 bytes      | `EAX`            | `RSI = RSI + 4`        | `RSI = RSI - 4`        |
| `LODSQ`     | Load String Quadword   | 8 bytes      | `RAX`            | `RSI = RSI + 8`        | `RSI = RSI - 8`        |

**Relación con el modo**

| Modo    | Variantes disponibles              |
| ------- | ---------------------------------- |
| 16 bits | `LODSB`, `LODSW`                   |
| 32 bits | `LODSB`, `LODSW`, `LODSD`          |
| 64 bits | `LODSB`, `LODSW`, `LODSD`, `LODSQ` |

**Ejemplo**

```asm
# Intel
# Lee bytes de una cadena uno por uno
cld             # DF = 0, avanzar
mov rsi, texto  # RSI apunta al inicio

lodsb           # AL = [RSI], RSI++
# ahora AL tiene el primer byte

lodsb           # AL = [RSI], RSI++
# ahora AL tiene el segundo byte
```

Si el texto es `ABC`:

- La primera ejecución de `LODSB` carga `A` en `AL`.
- La segunda ejecución de `LODSB` carga `B` en 'AL'.

**Ejemplo 2**

```asm
# Intel
# Leer palabras de 16 bits
cld
mov rsi, datos    # datos: dw 100, 200, 300

lodsw             # AX = 100, RSI += 2
lodsw             # AX = 200, RSI += 2
```

**Ejemplo 3**

```asm
# Intel
cld
mov rsi, buffer
mov rcx, 5

rep lodsb          # ejecuta LODSB 5 veces
```

Equivale a:

```asm
bucle:
    lodsb
    loop bucle
```

**Usos comunes**

- Recorrer una secuencia de datos (strings, buffers, arrays).
- Procesar cada elemento en el acumulador (comparar, transformar, sumar, etc).
- Se combina con otras instrucciones de strings.

## Instrucción `STOS` (store string)

Copia el contenido de un registro hacia memoria, en la dirección apuntada por `DI/EDI/RDI`, y luego avanza o retrocede el puntero automáticamente según lo indique `DF`. Es palabras simples: `STOS` guarda un valor en memoria y mueve el puntero de destino. No modifica los flags del CPU. Lee `DF`.

**Sintaxis:** `STOS[m]` donde `m` es un modificador:

| Instrucción | Tamaño          | Registro origen | Destino en memoria |
| ----------- | --------------- | --------------- | ------------------ |
| `STOSB`     | Byte (8 bits)   | `AL`            | `[RDI]`            |
| `STOSW`     | Word (16 bits)  | `AX`            | `[RDI]`            |
| `STOSD`     | Dword (32 bits) | `EAX`           | `[RDI]`            |
| `STOSQ`     | Qword (64 bits) | `RAX`           | `[RDI]`            |

**Nota:** En modo 64 bits siempre se usa `RDI` como puntero destino.

**Internamente realiza lo siguiente**

```
[Destino] ← Registro
RDI ← RDI ± tamaño
```

El incremento o decremento depende de `DF`.

| DF                   | Comportamiento    |
| -------------------- | ----------------- |
| `DF = 0` (con `CLD`) | RDI **avanza**    |
| `DF = 1` (con `STD`) | RDI **retrocede** |

**Ejemplo**

```asm
# Intel
# Guarda un byte en memoria
cld                 # DF = 0 (avanza)
mov rdi, buffer     # destino
mov al, 0x41        # 'A'
stosb               # [RDI] = AL, RDI++
```

Luego de que se ejecuta `STOSB`:

```
buffer[0] = 0x41
RDI = buffer + 1
```

**Ejemplo 2**

```asm
# Intel
# Guarda 2 bytes
cld
mov rdi, buffer
mov ax, 0x1234
stosw               # escribe 0x1234 en memoria
```

**Ejemplo 3**

`STOS` se usa mucho para rellenar memoria (como `memset` en C).

```asm
# Intel
# Rellenar un buffer con ceros (64 bits)
cld
mov rdi, buffer     # destino
xor rax, rax        # valor a escribir = 0
mov rcx, 16         # número de elementos
rep stosq           # escribe 16 * 8 bytes = 128 bytes
```

Equivale a

```C
memset(buffer, 0, 128);
```

**Ejemplo 3**

```asm
# Intel
# Escribe hacia atrás
std                 # DF = 1 (retrocede)
mov rdi, buffer+7
mov al, 0xFF
stosb               # escribe en [RDI], luego RDI--
cld                 # DF = 0 (resetea DF)
```

**Usos comunes**

- Inicializar buffers.
- Escribir valores repetidos en memoria.
- Rutinas de bajo nivel, kernels, loaders, bootloaders.
- Implementaciones optimizadas de librerías estándar.

## Instrucción `SCAS` (scan string)

Compara un valor en un registro con el contenido de memoria apuntado por `RDI/EDI/DI` avanzando automáticamente el puntero según `DF`. En otras palabras: `SCAS` busca un valor en memoria comparándolo con un registro.

**¿Qué hace?**

`SCAS` compara:

```
ACUMULADOR  vs  [RDI]
```

- En modo 64 bits: `RAX` vs `[RDI]`
- En modo 32 bits: `EAX` vs `[EDI]`
- En modo 16 bits: `AX`  vs `[DI]`
- En modo 8 bits: `AL`  vs `[DI/EDI/RDI]`

Internamente ejecuta una resta sin guardar el resultado.

```
ACUMULADOR - [RDI]
```

Pero sí actualiza los flags (`ZF`,`SF`, `CF`, `OF`, etc ).

Finalmente incrementa o decrementa `RDI` según el tamaño del dato y el estado de `DF`.

**Sintaxis:** `SCAS[m]` donde `m` es un modificador:

| Instrucción | Tamaño          | Registro usado | Avance de RDI |
| ----------- | --------------- | -------------- | ------------- |
| `SCASB`     | Byte (8 bits)   | `AL`           | ±1            |
| `SCASW`     | Word (16 bits)  | `AX`           | ±2            |
| `SCASD`     | Dword (32 bits) | `EAX`          | ±4            |
| `SCASQ`     | Qword (64 bits) | `RAX`          | ±8            |

**Flags del CPU afectados por `SCAS`**

| Flag | Nombre         | ¿Cómo queda tras `SCAS`?                            | Significado                                                  |
| ---- | -------------- | --------------------------------------------------- | ------------------------------------------------------------ |
| ZF   | Zero Flag      | 1 si `ACUMULADOR == [RDI]` 0 si son distintos       | Indica igualdad (coincidencia encontrada)                    |
| SF   | Sign Flag      | Copia del bit más significativo del resultado       | Indica si el resultado es negativo (en aritmética con signo) |
| CF   | Carry Flag     | 1 si hubo *borrow* (ACUMULADOR < [RDI] en unsigned) | Comparación sin signo                                        |
| OF   | Overflow Flag  | 1 si hubo desbordamiento con signo                  | Comparación con signo                                        |
| PF   | Parity Flag    | 1 si el byte bajo del resultado tiene paridad par   | Poco usado en práctica                                       |
| AF   | Auxiliary Flag | Según borrow entre bit 3 y 4                        | Usado en BCD                                                 |
| DF   | Direction Flag | No se modifica                                      | Controla si `RDI` incrementa o decrementa                    |
| IF   | Interrupt Flag | No se modifica                                      | —                                                            |

**Interpretación de los flags**

| Condición                       | ZF   | CF   | Interpretación      |
| ------------------------------- | ---- | ---- | ------------------- |
| `ACUMULADOR == [RDI]`           | 1    | 0    | Coincidencia exacta |
| `ACUMULADOR > [RDI]` (unsigned) | 0    | 0    | Acumulador mayor    |
| `ACUMULADOR < [RDI]` (unsigned) | 0    | 1    | Acumulador menor    |
| `ACUMULADOR != [RDI]`           | 0    | ?    | No hay coincidencia |

**Ejemplo**

```asm
# Intel
# Busca el byte 0x41 'A' en un buffer
cld                 # DF = 0 → avanzar hacia adelante
mov al, 0x41        # valor a buscar ('A')
mov rdi, buffer     # dirección del buffer
mov rcx, 100        # número de bytes a revisar

repne scasb         # busca AL en [RDI]
```

**¿Qué hace?**

1. Compara `AL` con `[RDI]`.
2. Si no son iguales (es decir, `ZF = 0`), sigue.
3. Decrementa `RCX`.
4. Avanza `RDI`.
5. Repite hasta: Encontrar coincidencia (`ZF = 1`) o el fin del buffer (`RCX = 0`).

Al terminar se obtiene `ZF = 1` si el valor fue encontrado, en tal caso `REPNE` se detiene inmediatamente, por lo que `RCX > 0` (siempre queda al menos un elemento sin consumir cuando hay coincidencia), `RDI` queda incrementado si `DF = 0` apuntando al byte siguiente al encontrado.  En cambio si el valor no estaba en el buffer, se obtiene `RCX = 0` y `ZF = 0`.

**Ejemplo 2**

```asm
# Intel
# Ejemplo mínimo sin usar el prefijo REP
mov al, 0x30
mov rdi, buffer
scasb

# Equivale a
cmp al, byte [rdi]
add rdi, 1    # o sub si DF=1
```

**Usos comunes**

- Búsqueda de caracteres o valores específicos en buffers.
- Implementaciones de `memchr` y/o detecciones de terminadores de strings.
- Rutinas de parsing a bajo nivel.

## Instrucción `CMPS` (compare string)

Compara dos strings en memoria, elemento por elemento, sin almacenar el resultado, solo actualizando los flags del CPU. (Igual que `CMP`).

**¿Qué hace?**

`CMPS` compara un dato apuntado por `RSI` (fuente), con un dato apuntado por `RDI` (destino). Internamente equivale a:

```asm
# Intel
CMP [RDI], [RSI]
```

Luego actualiza lso flags del CPU según el resultado, y avanza o retrocede ambos punteros (`RSI` y `RDI`) dependiendo de `DF`.

**Sintaxis:** `CMPS[m]` donde `m` es un modificador.

| Instrucción | Tamaño comparado        |
| ----------- | ----------------------- |
| `CMPSB`     | 1 byte                  |
| `CMPSW`     | 2 bytes (word)          |
| `CMPSD`     | 4 bytes (dword)         |
| `CMPSQ`     | 8 bytes (qword, x86-64) |

**Movimiento de punteros `RSI` y `RDI`**

| Tamaño | Si DF=0 (CLD) (incrementa) | Si DF=1 (STD) (decrementa) |
| ------ | -------------------------- | -------------------------- |
| B      | `RSI += 1` / `RDI += 1`    | `RSI -= 1` / `RDI -= 1`    |
| W      | `+= 2`                     | `-= 2`                     |
| D      | `+= 4`                     | `-= 4`                     |
| Q      | `+= 8`                     | `-= 8`                     |

**Flags del CPU afectados por `CMPS`**

| Flag              | Significado tras `CMPS`                      |
| ----------------- | -------------------------------------------- |
| **ZF** (Zero)     | 1 si los valores son **iguales**             |
| **SF** (Sign)     | Según el signo del resultado                 |
| **CF** (Carry)    | 1 si `[RDI] < [RSI]` (comparación sin signo) |
| **OF** (Overflow) | Si hay overflow con signo                    |
| **AF**            | Ajuste BCD                                   |
| **PF**            | Paridad                                      |

**Ejemplo**

```asm
# Intel
# Compara dos cadenas byte a byte
cld           # avanzar hacia adelante
mov rsi, str1
mov rdi, str2
mov rcx, len

repe cmpsb    # compara byte a byte mientras sean iguales    
# Al terminar:
# ZF = 1 → cadenas iguales
# ZF = 0 → se encontró diferencia
```

Equivalente en C

```C
int iguales = (memcmp(str1, str2, len) == 0);
```

Equivalente conceptual

```
for (i = 0# i < len# i++) {
    if (str1[i] != str2[i])
        break;
}
```

**Comparación manual vs `CMPS`**

```asm
# Intel
# Manual
mov al, [rsi]
cmp al, [rdi]
inc rsi
inc rdi

# Con CMPSB
cmpsb
```

Como se aprecia, usar `CMPS` es compacto y está diseñado para operaciones sobre bloques de memoria.

**Usos típicos**

- Comparar buffers, strings o estructuras en memoria.
- Implementar funciones tipo `memcmp`, `strcmp`.
- Búsqueda de diferencias en bloques binarios.

# Llamadas al sistema (syscalls)

Son el mecanismo que usa un programa en modo usuario para pedirle servicios al kernel del sistema operativo, tales como: leer/escribir archivos, usar red, crear procesos, terminar el programa, etc.

Existen porque el programa no puede acceder directamente al hardware ni a los recursos del sistema (disco, memoria protegida, procesos). El kernel sí puede. Entonces el programa realiza lo siguiente:

1. Pide algo (syscall).
2. El CPU cambia a modo kernel.
3. El kernel ejecuta la operación.
4. El kernel devuelve el control al programa.

De esta manera se mantiene el sistema seguro y estable.

## ¿Cómo se realiza una syscall en x86-64 linux?

Se usa la instrucción `syscall`, y antes de ejecutarla se debe cargar `RAX` con el número de la syscall y los argumentos en los registros `RDI`, `RSI`, `RDX`, `R10`, `R8`, `R9` (en ese orden).

**Nota:** En 32 bits se usa `int 0x80` en vez de `syscall`.

**Escribir en pantalla**

**Sintaxis:** `write(fd, buffer, length);`

**Diferencias clave: 32 vs 64 bits**

| Aspecto           | Linux 32-bit              | Linux 64-bit              |
| ----------------- | ------------------------- | ------------------------- |
| Instrucción       | `int 0x80`                | `syscall`                 |
| Número de syscall | `eax = 4`                 | `rax = 1`                 |
| Arg 1             | `ebx`                     | `rdi`                     |
| Arg 2             | `ecx`                     | `rsi`                     |
| Arg 3             | `edx`                     | `rdx`                     |
| Registros         | 32 bits (`eax`, `ebx`, …) | 64 bits (`rax`, `rdi`, …) |

**Ejemplo**

Equivalente a C.

```C
write(1, "Hola\n", 5);
```

**Equivalente en 64 bits**

```asm
# Intel
section .data
    msg db "Hola", 10
    len equ $ - msg

section .text
global _start

_start:
    mov rax, 1        # syscall: sys_write
    mov rdi, 1        # fd = 1 (stdout)
    mov rsi, msg      # dirección del mensaje
    mov rdx, len      # tamaño
    syscall           # llamada al kernel

    mov rax, 60       # syscall: sys_exit
    xor rdi, rdi      # código de salida = 0
    syscall
```

El orden de los parámetros es el siguiente:

| Registro | Significado       |
| -------- | ----------------- |
| `RAX`    | Número de syscall |
| `RDI`    | Primer argumento  |
| `RSI`    | Segundo argumento |
| `RDX`    | Tercer argumento  |

Luego `SYSCALL` transfiere el control al kernel.

**Equivalente en 32 bits**

```asm
# Intel
mov eax, 4      # write
mov ebx, 1      # stdout
mov ecx, msg    # buffer
mov edx, len    # tamaño
int 0x80
```

**Salir del programa**

```asm
# Intel
mov rax, 60   # sys_exit
mov rdi, 0    # código de retorno
syscall
```

## Algunas syscalls comunes (Linux x86-64 ABI System V)

### Básicas de archivos y procesos

| Syscall          | RAX | Descripción                      |
| ---------------- | --- | -------------------------------- |
| `read`           | 0   | Leer de un descriptor de archivo |
| `write`          | 1   | Escribir en un descriptor        |
| `open`           | 2   | Abrir archivo                    |
| `close`          | 3   | Cerrar archivo                   |
| `stat`           | 4   | Obtener info de archivo          |
| `fstat`          | 5   | Info de archivo por FD           |
| `lstat`          | 6   | Info sin seguir symlink          |
| `poll`           | 7   | Esperar eventos en FDs           |
| `lseek`          | 8   | Mover puntero de archivo         |
| `mmap`           | 9   | Mapear memoria                   |
| `mprotect`       | 10  | Cambiar permisos de memoria      |
| `munmap`         | 11  | Liberar memoria mapeada          |
| `brk`            | 12  | Ajustar heap                     |
| `rt_sigaction`   | 13  | Manejar señales                  |
| `rt_sigprocmask` | 14  | Bloquear/desbloquear señales     |
| `ioctl`          | 16  | Control de dispositivos          |
| `pread64`        | 17  | Leer desde offset                |
| `pwrite64`       | 18  | Escribir desde offset            |
| `readv`          | 19  | Leer con múltiples buffers       |
| `writev`         | 20  | Escribir con múltiples buffers   |
| `access`         | 21  | Verificar permisos               |
| `pipe`           | 22  | Crear pipe                       |
| `select`         | 23  | Multiplexar I/O                  |
| `sched_yield`    | 24  | Ceder CPU                        |
| `mremap`         | 25  | Redimensionar mmap               |
| `msync`          | 26  | Sincronizar memoria              |
| `mincore`        | 27  | Ver páginas en RAM               |
| `madvise`        | 28  | Sugerencias al kernel            |
| `shmget`         | 29  | Obtener memoria compartida       |
| `shmat`          | 30  | Adjuntar memoria compartida      |
| `shmctl`         | 31  | Controlar memoria compartida     |
| `dup`            | 32  | Duplicar FD                      |
| `dup2`           | 33  | Duplicar FD en uno específico    |
| `pause`          | 34  | Esperar señal                    |
| `nanosleep`      | 35  | Dormir en na                     |

### Procesos, señales y ejecución

| Syscall   | RAX | Descripción           |
| --------- | --- | --------------------- |
| `fork`    | 57  | Crear proceso         |
| `vfork`   | 58  | Fork optimizado       |
| `execve`  | 59  | Ejecutar programa     |
| `exit`    | 60  | Terminar proceso      |
| `wait4`   | 61  | Esperar proceso hijo  |
| `kill`    | 62  | Enviar señal          |
| `uname`   | 63  | Info del sistema      |
| `getppid` | 110 | Obtener PID del padre |
| `getuid`  | 102 | Obtener UID           |
| `geteuid` | 107 | Obtener EUID          |
| `getgid`  | 104 | Obtener GID           |
| `getegid` | 108 | Obtener EGID          |
| `setuid`  | 105 | Cambiar UID           |
| `setgid`  | 106 | Cambiar GID           |
| `setsid`  | 112 | Crear nueva sesión    |
| `ptrace`  | 101 | Debug/tracing         |
| `prctl`   | 157 | Control del proceso   |

### Red (sockets)

| Syscall       | RAX | Descripción              |
| ------------- | --- | ------------------------ |
| `socket`      | 41  | Crear socket             |
| `connect`     | 42  | Conectar socket          |
| `accept`      | 43  | Aceptar conexión         |
| `sendto`      | 44  | Enviar datos             |
| `recvfrom`    | 45  | Recibir datos            |
| `sendmsg`     | 46  | Enviar mensaje           |
| `recvmsg`     | 47  | Recibir mensaje          |
| `shutdown`    | 48  | Cerrar conexión          |
| `bind`        | 49  | Asociar socket           |
| `listen`      | 50  | Escuchar conexiones      |
| `getsockname` | 51  | Obtener nombre de socket |
| `getpeername` | 52  | Obtener peer             |
| `socketpair`  | 53  | Crear par de sockets     |
| `setsockopt`  | 54  | Opciones de socket       |
| `getsockopt`  | 55  | Leer opciones            |

### Memoria y sistema

| Syscall             | RAX | Descripción                |
| ------------------- | --- | -------------------------- |
| `clone`             | 56  | Crear proceso/hilo         |
| `arch_prctl`        | 158 | Configurar registros FS/GS |
| `set_tid_address`   | 218 | TID para threads           |
| `futex`             | 202 | Sincronización de hilos    |
| `sched_setaffinity` | 203 | Afinidad de CPU            |
| `sched_getaffinity` | 204 | Leer afinidad              |
| `getrandom`         | 318 | Generar números aleatorios |
| `memfd_create`      | 319 | Archivo en memoria         |

### Sistema de archivos moderno

| Syscall      | RAX | Descripción                 |
| ------------ | --- | --------------------------- |
| `openat`     | 257 | Abrir archivo relativo a FD |
| `mkdirat`    | 258 | Crear directorio            |
| `mknodat`    | 259 | Crear nodo                  |
| `fchownat`   | 260 | Cambiar dueño               |
| `fstatat`    | 262 | Info de archivo             |
| `unlinkat`   | 263 | Borrar archivo              |
| `renameat`   | 264 | Renombrar                   |
| `linkat`     | 265 | Crear hard link             |
| `symlinkat`  | 266 | Crear symlink               |
| `readlinkat` | 267 | Leer symlink                |
| `fchmodat`   | 268 | Cambiar permisos            |
| `faccessat`  | 269 | Verificar permisos          |
| `utimensat`  | 280 | Cambiar timestamps          |

### Terminación del programa

| Syscall      | RAX | Descripción              |
| ------------ | --- | ------------------------ |
| `exit`       | 60  | Terminar proceso         |
| `exit_group` | 231 | Terminar todos los hilos |

**Syscall vs función de biblioteca (libc)**

Cuando en C se hace: `printf("hola");` no se está llamando directamente al kernel. En realidad ocurre lo siguiente:

```
printf() → libc → write() → syscall
```

Como se ve, se tienen capas intermedias, en ASM se puede saltar a libc y hablar directo con el kernel.

todo: hacer algunos programas

todo: ver instrucciones relacionadas a xchg (las del archivo fundamentos-intercambios.odt)

todo: abordar el uso de fpu x87 (fdiv, fdivp, etc)

**todo: abordar SSE / AVX**
