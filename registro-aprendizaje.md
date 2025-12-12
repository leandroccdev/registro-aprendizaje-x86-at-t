# ASM X86 - Registro de aprendizaje (con sintaxis AT&T)

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

## Memoria

En x86 existen distintas maneras de direccionar la memoria.

#### ¿Cómo funciona la copia de memoria entre registros?

Existen instrucciones como `mov` que copian información desde una **fuente** a un **destino**. Entre registros del mismo tamaño, es posible realizar copias sin mayor problema especificando una instrucción `mov` para el tamaño dado agregando un sufijo.

`mov{b|w|l|q} fuente destino`

El sufijo indica el tipo de datos a copiar
- **b:** byte (8 bits)
- **w:** word (16 bits)
- **l:** long (32 bits)
- **q:** quad (64 bits)

Ejemplos

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


#### Registros del CPU

##### De propósito general

**8 bits (bits bajos):** AL, BL, CL, DL
**8 bits (bits altos):** AH, BH, CH, DH
**16 bits:** AX, BX, CX, DX
**32 bits:** EAX, EBX, ECX, EDX

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

Dentro de un registro X-- un registro -X se ubica en su parte baja. En el ejemplo siguiente podemos visualizarlo a mas detalle.

```
Grupos de 8 bits

EAX: 11111111 11111111 11111111 11111111
 AX: -------- -------- 11111111 11111111
 AH: -------- -------- 11111111 --------
 AL: -------- -------- -------- 11111111

EBX: 11111111 11111111 11111111 11111111
 BX: -------- -------- 11111111 11111111
 BH: -------- -------- 11111111 --------
 BL: -------- -------- -------- 11111111

ECX: 11111111 11111111 11111111 11111111
 CX: -------- -------- 11111111 11111111
 CH: -------- -------- 11111111 --------
 CL: -------- -------- -------- 11111111

EDX: 11111111 11111111 11111111 11111111
 DX: -------- -------- 11111111 11111111
 DH: -------- -------- 11111111 --------
 DL: -------- -------- -------- 11111111
```

Lo mismo aplicaría para registros de 64 y mas bits

#### Memoria compartida entre registros del mismo tipo

Como ya se vió, un registro grande puede ser subdividido en registros mas pequeños, esto se debe a que la memoria es compartida físicamente entre registros. Por lo tanto, el mismo registro A en sus diferentes versiones (respecto al tamaño), puede accesar a distintas regiones de la memoria compartida.

```
     (A)      (B)      (C)      (D)
EAX: 11111111 11111111 11111111 11111111
 AX: -------- -------- 11111111 11111111
 AH: -------- -------- 11111111 --------
 AL: -------- -------- -------- 11111111
```

De acuerdo a esto, registros mas pequeños acceden a diferentes partes de la memoria respecto del registro mas grande.

Si por ejemplo se quisiera accesar a la porción C o D se haría lo siguiente:

```asm
movl $5, %eax  # Copia el valor inmediato $5 en el registro eax
movb %al, %bl # Copia la porción D de EAX accesando por medio de AL a BL
```

En cambio para copiar la sección C sería así:

```asm
movl $5, %eax # copia el valor inmediato $5 en el registro eax
mob %ah, %bl  # copia la porción C de EAX accesando por medio de ah a bl
```

#### Valores inmediatos

Los valores inmediatos en sintaxis AT&T comienzan con $. Se insertan directamente en la instrucción como operandos fuente. Como no cambian se puede decir que son valores literales que se mantienen durante la ejecución.

En el siguiente ejemplo se ven algunos valores literales.

```asm
movb $10, %al     # Copia el inmediato $10 decimal en el registro al
movb $0xA, %al    # copia el inmediato $0xA hexadecimal en el registro al
movb $012, %al    # copia el inmediato $012 octal en el registro al
movb $0b1010, %al # copia el inmediato $0b1010 binario en el registro al
```

##### 0b no soportado en GAS
Nótese que GAS no soporta el formato binario, en tal caso se debería usar un ensamblador como NASM (soporta prefijo 0b para inmediatos binarios).

#### Registros de propósito general con usos específicos

ESI: fuente en copias (string src)
EDI: destino en copias (string dst)
EBP: Puntero base (base pointer en stack frame)
ESP: Puntero de pila (stack pointer)

#### Registros de segmento

Son usados para direccionamiento segmentado de memoria. En x86-64 tienen poco uso (modo protegido).

CS: Código
DS: Datos
SS: Pila (Stack)
ES: Segmento Extra (Extra segment)
FS: General (propósito especial)
GS: General (usado por sistemas operativos)

En OS modernos como linux `fs` y `gs` se usan a menudo para Thread Local Storage (TLS) o estructuras internas del kernel por hilo. Se puede acceder con instrucciones como `%fs:0x10` sin que el sistema reclame, porque linyx y otros sistemas modernos cargan selectores válidos en `fs`/`gs`.
Estos registros no se usan automáticamente, así que el programador tiene control.

Para los demas registros de segmento (`ds`, `es`, `ss`, etc), su uso explícito es innecesario o problemático porque:
- `ds`, `es` y `ss` se usan implícitamente para casi todas las instrucciones de acceso a datos o pila.
- Si tratas de escribir mov %ds:0x10, %al en modo protegido, puede fallar o comportarse de forma no esperada si el selector de %ds no es válido.
- En modo real (16 bits) sí se usan todos activamente, pero eso no aplica a Linux moderno ni a código 32/64 bits típico.

En el caso del registro `cs`, no se puede modificar directamente porque se cambia con `jmp` o `call` a otra sección de código.

Por lo tanto, los registros `ds`, `es` y `ss` deben ser evitados, ya que el sistema los maneja y su uso explícito no es común.

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
2. **DPL:** Descriptor Privilege Level (nivel requerido para acceder al segmento; está en el descriptor de la GDT/LDT).
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

**¿Por qué importa?
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

`movl $5, %eax # eax = 5 (valor inmediato)`

#### Direccionamiento por registro

En éste método ambos operandos son registros, por lo tanto, la operación se raliza desde el registro a al b.

`movl %eax, %ebx`

#### Direccionamiento directo

Éste método usa una dirección de memoria fija.

`movl (0x12345678), %eax # Carga el contenido de la dirección 0x12345678 en el registro eax`

#### Direccionamiento indirecto por registro

Éste método usa un registro que contiene una dirección de memoria

`movl %eax, (%ebx) # eax contiene la dirección de memoria`

El operador `[registro]` se usa para acceder al contenido de la dirección contenida en `registro`.

#### Direccionamiento con desplazamiento

Éste método usa un registro base y un desplazamiento constante.

`movl 4(%eax), %ebx # se copia el valor de eax + 4 en el registro ebx`

La operación `4(%eax)` indica la dirección de memoria desde donde comenzar a leer. El registro `eax` contiene una dirección de memoria, luego se le suma 4 y de esa dirección resultante, se copia la información en el registro `ebx`.

#### Direccionamiento segmentado (modo real 16 bits)

En éste método no se usa una dirección de 32 bits lineal como en el modo protegido (32 bits) o modo largo (64 bits). En su lugar se combinan dos valores para formar una dirección física.
- Segmento (segment register de 16 bits)
- Desplazamiento (offset 16 bits)

La dirección es calculada entonces como:

`dirección = (segmento x 16) + offset`

```asm
# DS = 0x1000 (registro de segmento de datos)
# BX = 0x0020 (registro offset)

movw %ds:(%bx), %ax # suma bx en ds, lee la dirección resultante y la carga en el registro ax
```

#### Direccionamiento indexado (Base + Index * Escala + Desplazamiento)

Éste modo se utiliza para accesar a estructura, arreglos o memoria compleja.

```asm
# movl despazamiento(dirección base, índice, escala o factor), destino 
movl 8(%ebx, %esi, 4), %eax
```

**Nótece:** que si `esi` permite el acceso a memoria que está mas allá de la estructura (lo que en lenguajes de alto nivel ocasionaría un error), ningún error será notificado al programador, salvo que la dirección a la que se intenta accesar fuera una región de memoria protegida (dando el error violación de segmento de memoria).

Es responsabilidad del programador asegurarse de que no ocurra un error de segmentación de memoria (segmentation fault).

##### Desplazamiento (displacement)

Es un número constante (inmediato) que se suma al resultado del calculo. Puede ser positivo o negativo y se usa típicamente para acceder a un campo específico dentro de una estructura, o como un offset inicial.

##### Base (registro base)

Es un registro que contiene la dirección base desde donde se empieza a contar(comienzo del arreglo o estructura). Es omitible dejando la dirección vacía.

```asm
desplazamiento(, índice, escala o factor)
```
##### Índice (index, registro índice)

Es un registro que se multiplica por la escala o factor (scale) para calcular un desplazamiento adicional.
Se usa comúnmente para representar un índice de un array o una posición relativa. Tambien es opcional y se puede omitir.

```asm
desplazamiento(base)
```

Cuando es omitido, tambien el valor de escala o factor debe ser omitido.

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

#### Directivas de ensamblador

Las directivas permiten definir datos en la sección `.data`, las mas comunes son las siguientes:

`.byte`:   De 1 byte. Permite definir valores de 8 bits
`.word`:   De 2 bytes. Permite definir valores de 16 bits
`.short`:  De 2 bytes. Alias de `.word`
`.long`:   De 4 bytes. Permite definir valores de 32 bits
`.int`:    De 4 bytes. Alias de `.lng`
`.quad`:   De 8 bytes. Permite definir valores de 64 bits
`.ascii`:  Largo variable. Permite definir cadenas sin \0 al final
`asciz`:   Largo variable. Permite definir cadenas con \0 al final
`.string`: Largo variable. Alias de `asciz`

##### Otras directivas útiles

`.space`:  Reserva N bytes sin inicializar (rellenados con ceros)
`.zero`:   Igual que `.space` pero el relleno es opcional
`.fill`:   Rellena memoria con un patrón `.fill count, size, value`
`.align`:  Alinea la siguiente dirección a una potencia de 2
`.balign`: Igual que `.align`, pero especifica para binarios
`.skip`:   Similar a .space (reserva sin inicializar)

##### Directivas de secciones y símbolos

`.data`:   Comienza la sección de datos (lectura/escritura)
`.bss`:    Sección de variables no inicializadas
`.text`:   Sección de código
`.globl`:  Declara un símbolo global
`.global`: Alias de `.globl`
`.extern`: Declara un símbolo externo
`.type`:   Define el tipo de símbolo (función, objeto)
`.size`:   Define le tamaño de un símbolo

#### Interrupciones

Una interrupción se define como un mecanismo que detiene temporalmente la ejecución normal del procesador, ya sea para atender un evento urgente/importante y luego retormar la ejecución en donde se quedó previo a la interrupción.

Cuando el CPU recibe una interrupción ejecuta una rutina especial llamada **manejador de interrupción** (interrupt handler).

Las interrupciones son generadas por componentes del hardware (dispositivo, timer, teclado) o del software (llamadas al sistema, excepciones).

Permiten al CPU reaccionar rápidamente a eventos externos sin necesidad de estar revisando constantemente (lo que se conoce como polling: consultar contínuamente el estado de un dispositivo o bandera en un bucle, hasta que cambia a un valor esperado).

Un ejemplo de ésto es por ejemplo, cuando una tecla del teclado es presionada, una interrupción es generada, y al CPU se le indica que hay datos para leer.

En ensamblador x86 de 32 bits, para hacer una llamada al sistema (syscall) se usa la instrucción:

`int $0x80`

Esto genera la interrupción de software número 128 (0x80). El kernel la atiende para realizar la función solicitada (leer archivo, escribir, salir, etc).

###### Resumen visual del flujo

1. Ejecución normal
2. Ocurre una interrupción
3. CPU guarda el contexto actual
4. Ejecuta rutina de interrupción
5. Restaura contexto
6. Resume ejecución normal

###### Interrupciones prefedinidas

En x86 existen (entre muchas otras) las siguientes interrupciones predefinidas:

- 0: Error de división por 0 (divide error)
- 6: Instrucción no valida (invalid op code)
- 13: Violación de protección (general protection)
- 14: Acceso a página de memoria no valida (page fault)
- 0x80: Usado en linux para hacer una llamada al sistema (software interrupt)

Estas son reservadas y manejadas por el procesador o el sistema operativo.

###### Interrupciones definidas por el usuario

El programador tambien puede definir y manejar interrupciones personalizadas, tanto por hardware como por software.
Para definir una se utiliza la instrucción `int n` con un número que **no esté reservado** por el sistema. Luego debe verificarse que ese número esté correctamente apuntado en la tabla `IDT` (interrupt descriptor table) hacia su propia rutina de manejo.

```asm
int $0x21 # interrupción personalizada
```

Si se configuró correctamente la entrada `0x21` en la `IDT` con el manejador o gestor, el CPU realizará el salto allí.

###### Interrupciones personalizadas por hardware

En el modo protegido y en sistemas operativos modernos, la `IDT` no es modificable desde el espacio de usuario, solo el kernel tiene control total.

###### Consideraciones

Para crear una interrupción propia, se necesita cumplir algún punto de los siguientes:

- Usar modo real (bootloader por ej)
- Tener acceso en modo kernel
- Trabajar en un OS propio o código que se ejecuta en hardware directamente

###### Intrucciones sti y cli en x86

Controlan el flag de interrupciones en el registro de estado `EFLAGS`.

`cli` desactiva las interrupciones externas de la CPU. Esto bloquea la atención a interrupciones de hardware.
Se usa para evitar que durante una sección crítica de código una interrupción interrumpa el flujo, evitando condiciones de carrera o corrupción de datos.

`sti` activa nuevamente las interrupciones, permitiendo que la CPU entienda las interrupciones externas.
Tiene un retraso de una instrucción antes de que realmente se activen las interrupciones, esto significa que la siguiente instrucción que viene después de `sti`, se ejecutar antes que las interrupciones sean atendidas.

**Importante**: solo afectan a las interrupciones externas, pero no a las excepciones internas. Además son instrucciones privilegiadas que solo son ejecutables en modo kernel (anillo 0).

###### Gestor o manejador de interrupciones pesonalizadas

En el siguiente ejemplo se escribirá la entrada 0x21 de la `IVT` (interrupt vector table) para que apunte a nuestro propio manejador. Luego desde el manejador se imprimirá una letra.

**Importante:** El ejercicio usa el modo real.

```asm
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

###### ¿Qué es la IVT?

LA interrupt vector table es una tabla en modo real de 256 entradas, que vive al inicio de la memoria RAM.

**Características**:

- Dirección: 0x0000:0000
- Tamaño: 256 vectores x 4 bytes = 1024 bytes
- Cada vector ocupa 4 byes: 2 bytes para el offset y 2 bytes para el segmento

Por ejemplo, la interrupción de 0x13 (servicios de disco del BIOS) está en:

```asm
0x13 * 4 = 0x4C # offset dentro de la ITV
```

###### ¿Qué sucede cuando ocurre una interrupción?

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

###### ¿Por qué no se debe usar `pop` al finalizar un manejador?

`pop` restaura la dirección de retorno desde la pila, pero **no restaura el context ocompleto como sí lo hace `ire`**.


##### interrupción 0x80

Ésta interrupción interrumple el flujo del programa, transfiere el control al kernel de linux y le pide que realiza una operación privilegiada como:
- Salir del programa (exit)
- Leer un archivo o stdin (read)
- Escribir en stdout (write)
- Abrir/Creaer archivos (open)

**Sintaxis**

```asm
movl $<número_syscall>, %eax    # número de la syscall
movl $<arg1>, %ebx              # primer argumento
movl $<arg2>, %ecx              # segundo argumento
movl $<arg3>, %edx              # tercer argumento
int $0x80                       # llamada al sistema
```

**Ejemplo: salir del programa**

```asm
.section .text
.globl _start

_start:
    movl $1, %eax    # syscall número 1: exit
    movl $0, %ebx    # código de salida = 0
    int $0x80        # interrupción al kernel
```

##### ¿Por qué una interrupción?

El modo usuario (userland) no puede hacer cosas como acceder directamente al disco, terminar procesos, etc.. Solo el kernel, que corre en modo privilegiado (ring 0), puede hacerlo. Entonces se necesita una puerta de entrada controlada, y esa puerta es int $0x80.

##### Tabla de registros (Linux x86 - 32 bits)

`%eax`: Número de syscall
`%ebx`: Primer argumento
`%ecx`: Segundo argumento
`%edx`: Tercer argumento
`%esi`: Cuarto argumento
`%edi`: Quinto argumento
`%ebp`: Sexto argumento

Luego el valor de retorno se entrega en el registro `%eax`

##### Tabla básica de syscalls en x86 (int $0x80)

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

### Instrucción `lahf`

La instrucción lahf en x86 significa Load AH from Flags, y su función es: **Cargar en el registro AH (parte alta de AX) una copia de ciertos flags del procesador.**

**¿Qué flags copia exactamente lahf?**
lahf copia los bits de estado bajos del registro EFLAGS (bits 0–7) al registro AH:
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

No copia el Overflow Flag (OF) — eso lo puedes recuperar con otras instrucciones como `seto`.

**Ejemplo de uso práctico en AT&T**
```asm
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

### Instrucción `mvzbl`
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
movb $0xFF, %al       # AL = 0xFF (11111111 en binario, que es 255 decimal)
movzbl %al, %ebx      # EBX = 0x000000FF, el byte 0xFF se extiende a 32 bits con ceros a la izquierda
```
**El resultado:**
- `%al` tiene 8 bits: 11111111 (255 decimal)
- `%ebx` tras `movzbl` será 000000FF (255 decimal), NO FFFFFFFF (que sería con signo)

**¿Cuál es la diferencia con movsbl?**
`movzbl` extiende con ceros (para valores sin signo).
`movsbl` extiende con signo (preserva el bit más alto, útil para números negativos en complemento a dos).

### Instrucción `movsbl`

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
movb $0xFF, %al        # AL = 0xFF (11111111 en binario, que es -1 en signed byte)
movsbl %al, %ebx       # EBX = 0xFFFFFFFF (extendido con signo, es -1 en 32 bits)
```
- El byte 0xFF representa -1 (en complemento a dos).
- Al hacer `movsbl`, el valor se extiende a 32 bits preservando el signo, por eso ebx termina con 0xFFFFFFFF (que es -1 en 32 bits).

**Uso típico**
- Se usa cuando quieres trabajar con valores signed (con signo), por ejemplo, cargar un byte a entero de 32 bits para hacer operaciones con signo.
- Muy común en procesamiento de caracteres, flags, o datos donde el signo importa.

## Instrucciones lógicas

Tambien conocidas como instrucciones bit a bit u operaciones bitwise. Son operaciones que trabajan a nivel de bits entre registros, memoria o valores inmediatos. Se usan para manipular bits directamente y para operaciones lógicas básicas que son muy comunes en programación de bajo nivel.

**Principales instrucciones lógicas en x86**
| Instrucción | Descripción                                                   |
| ----------- | ------------------------------------------------------------- |
| `AND`       | Realiza una operación lógica **AND** bit a bit.               |
| `OR`        | Realiza una operación lógica **OR** bit a bit.                |
| `XOR`       | Realiza una operación lógica **XOR** (o exclusivo) bit a bit. |
| `NOT`       | Realiza una operación lógica **NOT** (complemento) bit a bit. |

**¿Qué hacen?**
- `AND` Cada bit del resultado es 1 solo si ambos bits correspondientes de los operandos son 1; sino 0.
- `OR` Cada bit del resultado es 1 si al menos uno de los bits correspondientes es 1.
- `XOR` Cada bit del resultado es 1 solo si los bits correspondientes son diferentes.
- `NOT` Invierte todos los bits (0 → 1, 1 → 0) del operando.

**Ejemplo sencillo**
```asm
movl $0b1100, %eax   # eax = 1100 binario (decimal 12)
andl $0b1010, %eax   # eax = eax AND 1010 binario = 1000 binario (decimal 8)
```
Aquí `eax` pasa de 1100 a 1000 porque solo el bit que está en ambas posiciones como 1 queda en 1.

**¿Para qué se usan?**

- Enmascarar bits (usar AND para “apagar” bits no deseados)
- Encender bits específicos (usar OR para “prender” bits)
- Invertir bits (NOT)
- Comprobar cambios o diferencias en bits (XOR)
- Control de flags y lógica en condiciones
- Cálculos rápidos a nivel binario

#### Ejemplo AND
```asm
    # Supongamos que queremos hacer AND entre dos registros
    movl $0xF0F0F0F0, %eax   # Carga el valor 0xF0F0F0F0 en eax
    movl $0x0FF00FF0, %ebx   # Carga el valor 0x0FF00FF0 en ebx
    andl %ebx, %eax          # Realiza AND bit a bit entre eax y ebx, resultado queda en eax
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
| Byte         | `%eax` (binario) | `%ebx` (binario) | Resultado AND (binario) | Resultado AND (hex) |
| ------------ | ---------------- | ---------------- | ----------------------- | ------------------- |
| Byte 3 (MSB) | 11110000         | 00001111         | 00000000                | 0x00                |
| Byte 2       | 11110000         | 11110000         | 11110000                | 0xF0                |
| Byte 1       | 11110000         | 00001111         | 00000000                | 0x00                |
| Byte 0 (LSB) | 11110000         | 11110000         | 11110000                | 0xF0                |

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
Siempre se limpia (CF = 0) después de un `and`.
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `and`.

**Resumen**
| Flag | Efecto con `and`         |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

#### Ejemplo OR
```asm
    movl $0x0F0F0F0F, %eax   # Carga el valor 0x0F0F0F0F en eax
    movl $0x00FF00FF, %ebx   # Carga el valor 0x00FF00FF en ebx
    orl %ebx, %eax           # Realiza OR bit a bit entre eax y ebx, resultado queda en eax
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
Siempre se limpia (CF = 0) después de un `or`.
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `or`.

**Resumen**

| Flag | Efecto con `or`          |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

#### Ejemplo XOR
```asm
    movl $0xFF00FF00, %eax    # Carga 0xFF00FF00 en eax
    movl $0x0F0F0F0F, %ebx    # Carga 0x0F0F0F0F en ebx
    xorl %ebx, %eax           # Hace XOR bit a bit entre eax y ebx, resultado en eax
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
Siempre se limpia (CF = 0) después de un `xor`.
- OF (Overflow Flag):
Siempre se limpia (OF = 0) después de un `xor`.

**Resumen**

| Flag | Efecto con `xor`         |
| ---- | ------------------------ |
| ZF   | 1 si resultado = 0       |
| SF   | 1 si bit más alto = 1    |
| PF   | 1 si paridad bits es par |
| CF   | Siempre 0                |
| OF   | Siempre 0                |

#### Ejemplo NOT
```asm
    movl $0x0F0F0F0F, %eax   # Carga un valor en eax
    notl %eax                # Aplica la negación bit a bit (NOT) sobre eax
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
La instrucción `not` NO modifica ningún flag en el procesador. Todos los flags permanecen igual después de ejecutar `not`.

**Resumen**
| Flag | Efecto con `not` |
| ---- | ---------------- |
| ZF   | No cambia        |
| SF   | No cambia        |
| PF   | No cambia        |
| CF   | No cambia        |
| OF   | No cambia        |

Por lo tanto si necesitas invertir bits pero conservar el estado de los flags para operaciones condicionales posteriores, not es adecuado porque no altera los flags.

todo: ahora mirar comparaciones lógicas