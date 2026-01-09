#! /usr/bin/bash
# $1: -r|--run Corre el archivo binario compilado.
# $1: -d Inicia debug con gdb 

src="hw.asm"
obj="hw.o"
bin="hw.bin"

# Limpieza previa
if [[ -f "$obj" ]]; then
    rm "$obj"
    echo "Info: $obj file deleted!"
fi
if [[ -f "$bin" ]]; then
    rm "$bin"
    echo "Info: $bin file deleted!"
fi

# Ensamblar sum.asm a código objeto 64 bits
as -g --64 -o "$obj" "$src"

# Verifica ensamblado
if [ $? -ne 0 ]; then
    echo "Error: the assembly process failed!"
    exit 1
fi

# Linkear a ejecutable ELF de 64 bits
ld -g -o "$bin" "$obj"

# Verifica linkeado
if [ $? -ne 0 ]; then
    echo "Error: the link process failed!"
    exit 1
fi

echo "Info: Compile process sucess!"

# No se encuentra el archivo bin
if [[ ! -e "$bin" ]]; then
    echo "${bin} not found!"
fi

# Ejecuta solo cuando -r|--run es entregado como parámetro
if [[ -n "$1" && ($1 == "--run" || $1 == "-r") ]]; then
    ./"$bin"
elif [[ -n "$1" && $1 == '-d' ]]; then
    gdb ./"$bin"
fi