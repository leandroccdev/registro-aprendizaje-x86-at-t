# Guía personal para el uso de GDB (GNU Debugger)

#### Iniciar debug

El programa deberá haber sido compilado con los siguientes parámetros cli:

- `-g` Genera información de depuración (debug).
- `--gstabs` Genera la información de depuración (debug) con STABS.
- `--gstabs+` Genera la información de depuración (debug) con extensiones GNU con STABS.
- `-gdwarf-<N>` Genera información de depuración en formato DWARF versión N (2, 3, 4, 5).
> 2: Información básica
> 3: Mehora soporte de estructuras
> 4: Más eficiente y mejor con expresiones
> 5: Último estándar, más compacto y mas expresivo
- `--gdwarf-cie-version=<N>` Especifica la versión de CIE (Common Information Entry), una estructura interna de DWARF para representar cómo se manejan las llamadas y el stack.
> CIE 1: DWARF 2
> CIE 3: DWARF 3/4
> CIE 4: DWARF 5
- `--gdwarf-sections` Hace que el ensamblador genere secciones de depuración separadas por función, para DWARF.
> Esto ayuda a que las herramientas de análisis localicen funciones individuales más eficientemente, porque cada función tiene su propio bloque de info de depuración.

Luego para iniciar la depuración del programa bastaría con: `gdb ./programa`

#### Symbol Table Strings (STABS)

Es un formato antiguo de información de depuración usado por compiladores como GCC. En la información de depuración añadida al binario incluye:
- Nombres de variables
- Nombres de unficones
- Estructuras y tipos
- Ubicaciones en el código fuente

La información de debug permite a herramientas como dgb entender el binario y mostrar datos útiles durante la depuración.

#### Debug With Arbitrary Record Format (DWARF)

DWARF es un formato de información de depuración utilizado por compiladores y depuradores para permitir la inspección detallada del código ejecutable (binaries) durante la depuración (debugging). Su nombre es un acrónimo recursivo humorístico.

Fue desarrollado originalmente como parte del sistema ELF (Executable and Linkable Format), y es ampliamente utilizado en sistemas Unix, Linux y otros entornos que usan compiladores como GCC, Clang o herramientas como GDB.

Fue desarrollado originalmente como parte del sistema ELF (Executable and Linkable Format), y es ampliamente utilizado en sistemas Unix, Linux y otros entornos que usan compiladores como GCC, Clang o herramientas como GDB.

DWARF proporciona la siguiente información de depuración añadida al binario:
Nombres de funciones y variables
- Tipos de datos usados (por ejemplo, structs, enums, etc.)
- Relaciones entre símbolos y direcciones de memoria
- Líneas de código fuente asociadas a instrucciones del binario
- Información sobre pila (stack frames), argumentos y variables locales
- Información sobre optimizaciones (como variables eliminadas)

**Versiones**
DWARF tiene varias versiones que van de la 1 a la 5:
- **DWARF 2:** muy común y ampliamente soportado.
- **DWARF 3 y 4:** añaden soporte para optimizaciones más avanzadas.
- **DWARF 5:** mejora la compresión, precisión y modularidad.

**Secciones típicas de DWARF**
Algunas secciones de un ejecutable ELF con DWARF incluyen:

- **.debug_info:** contiene la información estructurada de los símbolos.
- **.debug_line:** correlaciona direcciones de memoria con líneas del código fuente.
- **.debug_abbrev:** contiene abreviaciones usadas en .debug_info.
- **.debug_str:** contiene strings usados en otras secciones.

**Ver secciones**

**readelf** puede mostrar información detallada sobre DWARF.

Muestra todas las secciones de DWARF
`readelf --debug-dump a.out`

Ver secciones específicas de DWARF
```bash
readelf --debug-dump=abbrev a.out     # Abreviaturas para estructuras DWARF
readelf --debug-dump=aranges a.out    # Rangos de direcciones por CU (compilation unit)
readelf --debug-dump=frames a.out     # Información sobre stack frames
readelf --debug-dump=loc a.out        # Localizaciones de variables
readelf --debug-dump=macro a.out      # Macros
readelf --debug-dump=line a.out       # Mapeo entre código fuente y direcciones
readelf --debug-dump=str a.out        # Strings DWARF usados por otras secciones
``` 
**objdump** tambieén puede mostrar información DWARF, aunque menos detalladamente.

`objdump --dwarf=info a.out`

Para ver secciones detalladas se usa:

`objdump --dwarf=<tipo> a .out`

Los tipos pueden ser:
| Tipo             | Descripción                                                                   |
| ---------------- | ----------------------------------------------------------------------------- |
| `info`           | Información general DWARF (compilación, funciones, tipos, variables, etc.)    |
| `abbrev`         | Tabla de abreviaturas (DWARF abbreviation table)                              |
| `attr`           | Atributos encontrados (lista los atributos DWARF usados)                      |
| `decodedline`    | Información de líneas fuente, ya decodificada                                 |
| `rawline`        | Información cruda de línea (sin decodificar)                                  |
| `loc`            | Información de ubicación de variables (DW\_AT\_location, DW\_AT\_frame\_base) |
| `macro`          | Información sobre macros (si se compiló con `-g3`)                            |
| `macro-detailed` | Más detalle de macros (expansión, parámetros, etc.)                           |
| `aranges`        | Rangos de direcciones (útil para mapear funciones a rangos de memoria)        |
| `ranges`         | Rango de direcciones más detallado (DWARF v4+)                                |
| `frames`         | Información de pila (frame unwind info, DWARF CFI)                            |
| `pubnames`       | Lista pública de nombres (funciones globales, tipos)                          |
| `pubtypes`       | Tipos públicos definidos (DWARF v2/3)                                         |
| `str`            | Strings utilizados en DWARF (.debug\_str)                                     |
| `cu_index`       | Índice de unidades de compilación                                             |
| `tu_index`       | Índice de unidades de tipo                                                    |
| `gdb_index`      | Índice usado por GDB (no estándar DWARF)                                      |

**Requisitos**

El binario como ya se mencionó debe estar compilado con la información de depuración. Algunas secciones DWARF como **macro** o **frames** requieren `-g3` o compilación con soporte adicional.

**Niveles `-g` en GCC/Clang**

| Opción       | Significado          | ¿Qué incluye?                                                           | Notas                                                                 |
| ------------ | -------------------- | ----------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `-g0`        | Sin depuración       | No incluye información de depuración                                    | El binario es más pequeño, imposible depurar con GDB                  |
| `-g1`        | Depuración mínima    | Información básica de depuración (funciones, símbolos globales)         | Útil para trazas ligeras o depuración parcial                         |
| `-g` o `-g2` | Depuración estándar  | Información completa: tipos, variables locales, funciones, líneas, etc. | Valor por defecto cuando se usa solo `-g`                             |
| `-g3`        | Depuración extendida | Todo lo de `-g2`, **más información sobre macros**                      | Incluye `#define`, expansión de macros, útil para depuración avanzada |

#### Desensamblar una sección

Muestra las direcciones de las líneas del programa
`(gdb) disas sección`

Cada dirección tendrá una numeración relativa al inicio
de la sección como en el siguiente ejemplo:

```
Dump of assembler code for function _start:
   0x08049000 <+0>:     mov    a(%rip),%eax
   0x08049006 <+6>:     add    b(%rip),%eax
   0x0804900c <+12>:    mov    %eax,c(%rip)
```

#### Setear un breakpoint con la dirección del inicio de la instrucción

Cuando se tiene la dirección de memoria se puede agregar un break point con: `(gdb) b *0x08049006`.

**Importante**: El break point (punto de interrupción) detendrá el flujo del programa en un punto previo a la ejecución de la instrucción apuntada. Para ejecutar dicha instrucción hará falta hacer uso de `si` o `ni`.

##### Avanzar una instrucción con `si`

La instrucción `si` en gdb permite avanzar una instrucción, pero si dicha instrucción es una función, `si` entrará en ella.

`(gdb) si`

#### Avanzar una instrucción con `ni`

Funciona de la misma manera que `si` pero no entra en las funciones. Ésto es muy útil cuando queremos mantenernos en en un flujo determinado.

`(gdb) ni`

#### Ver información a partir de un punto

Ésta funcionalidad permite examinar instrucciones a partir de un punto en el programa. En el siguiente ejemplo `/10` es la cantidad de unidades a visualizar, `_start` es el punto del programa e `i` es el formato de visualización.

`(gdb) x/10i _start`

```
=> 0x8048080 <_start>:  mov    eax,0x1
   0x8048085:            mov    ebx,0x0
   0x804808a:            int    0x80
   ...
```

#### Ayuda

gdb viene internamente documentado, el comando help es un simil de `herramienta -h`, `help comando`, `comando /?` o `man herramienta`.

`(gdb) help comando`

Al llamar `help` sin parámetros muestra los comandos de gdb.
```
(gdb) help

List of classes of commands:

aliases -- Aliases of other commands
breakpoints -- Making program stop at certain points
data -- Examining data
files -- Specifying and examining files
internals -- Maintenance commands
running -- Running the program
stack -- Examining the stack
status -- Status inquiries
support -- Support facilities
tracepoints -- Tracing of program execution without stopping the program
user-defined -- User-defined commands.

Type "help" followed by a class name for a list of commands in that class.
Type "help" followed by a command name for full documentation.
```

Al entregar un parámetro se muestra su información.
```
(gdb) help break

Set breakpoint at specified line or function.
Usage: break [LOCATION] [thread THREADNUM] [if CONDITION]
```

#### Ejecución del programa

El comando `run` ejecuta el programa en gdb, cargandolo desde el principio como si se ejecutara desed la terminal. Si el programa ha terminado su ejecución se reiniciará.

`(gdb) run [argumentos]`

Se le puede entregar una sección para iniciar la ejecución como `_start`.

`(gdb) run _start`

O se le pueden entregar argumentos como si se llamara por terminal.

`(gdb) run archivo.txt -v`

El ejemplo anterior equivale a `./programa archivo.txt -v`.

#### Ver contenido de registros

Para ver la información de los registros del procesador en el momento actual de la depuración se puede usar:

`(gdb) info registers`

En arquitecturas x86 / x86_64, muestra registros como:
| Registro                          | Descripción                                   |
| --------------------------------- | --------------------------------------------- |
| `eax`, `ebx`, `ecx`, `edx`        | Registros generales (32 bits)                 |
| `esi`, `edi`                      | Índices para operaciones con memoria          |
| `esp`, `ebp`                      | Stack Pointer y Base Pointer                  |
| `eip`                             | Instruction Pointer (dónde está el CPU ahora) |
| `eflags`                          | Registro de banderas (flags del procesador)   |
| Segmentos: `cs`, `ds`, `ss`, etc. | Segmentación de memoria                       |

Segmentos: `cs`, `ds`, `ss`, etc.	Segmentación de memoria.

En **x86_64**, también se vera:
- `rax`, `rbx`, `rsi`, `rdi`, etc.
- `rip` (instruction pointer de 64 bits).

**Ejemplo de salida**
```
eax            0x0      0
ebx            0x1      1
ecx            0x2      2
edx            0x3      3
esi            0x0      0
edi            0x0      0
ebp            0xffffd1b8   0xffffd1b8
esp            0xffffd1a0   0xffffd1a0
eip            0x80483f0    0x80483f0 <main+4>
eflags         0x202    [ IF ]
```

#### ver solo un registro

Para ver un registro en específico se usa: `(gdb) print $eax`

#### Ver el contenido de una var definida en .section .data
> w: word 4 bytes
> d: formato decimal

`(gdb) x/wd dirección`

#### Ver información de símbolos

Te dice a qué símbolo (función, variable, etc.) pertenece una dirección de memoria. Muy útil cuando tienes una dirección como 0x08048400 y quieres saber si corresponde a main, _start, etc.

(gdb) info symbol <dirección>

Si se desea ver la información de un símbolo definido en .section .data se puede hacer con:

`(gdb) info symbol <variable>`

```asm
.section .data
   a: .int # variable a inspeccionar
```
Ahora para inspeccionar dicha variable sería con: `(gdb) info symbol a`

#### Ver información de secciones

Para ver información sobre los archivos cargados en la sesión de GDB, especialmente el binario principal, sus símbolos, las secciones de memoria, y otras posibles bibliotecas dinámicas si están presentes se usa:

`(gdb) info files`

**Salida de ejemplo**
```
Symbols from "/home/user/prog/hello".
Local exec file:
	`/home/user/prog/hello', file type elf32-i386.
	Entry point: 0x8048060
	0x08048134 - 0x08048147 is .interp
	0x08048148 - 0x08048168 is .note.ABI-tag
	0x08048168 - 0x08048188 is .note.gnu.build-id
	0x08048188 - 0x080481a4 is .gnu.hash
	0x080481a4 - 0x08048200 is .dynsym
	0x08048200 - 0x08048290 is .dynstr
	...
	0x08048460 - 0x08048488 is .text
```

#### Ver la dirección de un símbolo

Para obtener la dirección de memoria donde está ubicado el símbolo (que puede ser una variable, función, etc.) en el programa que estás debuggeando se hace: `(gdb) info address <simbolo>`

#### Imprimir el valor desde la dirección de memoria

Para mirar que hay en una dirección de memoria arbitraria de interés, se hace con:

`(gdb) x/<formato> <dirección>`

Donde:
- `<formato>` es el formato de visualización.
- `<dirección>` es la dirección de memoria que se quiere inspeccionar.

**Sintaxis:**
El comando `x` tiene la siguiente sintaxis: `x/[N][FU][formato] <dirección>`
- `N` es el número de unidades a mostrar (opcinal).
- `F` es el formato (el como se muestran los datos).
- `U` es la unidad.

**Unidades (U) — tamaño de dato**
| Código | Tamaño                         |
| ------ | ------------------------------ |
| `b`    | byte (1 byte)                  |
| `h`    | halfword (2 bytes)             |
| `w`    | word (4 bytes)                 |
| `g`    | giant word (8 bytes) (64 bits) |

**Formatos (F) — forma de mostrar**
| Código | Descripción                           |
| ------ | ------------------------------------- |
| `x`    | hexadecimal                           |
| `d`    | decimal                               |
| `u`    | decimal sin signo (unsigned)          |
| `o`    | octal                                 |
| `t`    | binario (bits)                        |
| `f`    | floating point (float)                |
| `a`    | dirección (address)                   |
| `i`    | instrucción ensamblador (disassembly) |
| `c`    | carácter ASCII                        |
| `s`    | cadena ASCII (string)                 |

**Ejemplos**
| Comando          | Qué muestra                                   |
| ---------------- | --------------------------------------------- |
| `x/4xb 0x60104c` | 4 bytes en hexadecimal (byte a byte)          |
| `x/2hw 0x60104c` | 2 halfwords (2 bytes cada uno) en hexadecimal |
| `x/wd 0x60104c`  | 1 palabra (4 bytes) en decimal                |
| `x/10i _start`   | 10 instrucciones ensamblador desde \_start    |
| `x/s 0x601050`   | cadena ASCII empezando en dirección 0x601050  |


#### Salir de gdb

Para salir de gdb basta: `(gdb) exit`

```
(gdb) exit
Quit anyway? (y or n) y
```