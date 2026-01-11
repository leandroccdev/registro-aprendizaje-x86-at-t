#! /usr/bin/bash
# Parameters
# $1: [-d|--run]
# --run: Run the compiled file
# -d:    Starts gdb debugging session
#
# Run: ./compile.sh [-d|--run] exercise-folder

# Flags
f_debug=0
f_run=0

#region Analyse parameters
if [[ $# -eq 0 ]]; then
    echo "Error: Not parameters given!"
    exit 1
fi

[[ "$@" =~ "--run" ]] && f_run=1
[[ "$@" =~ "-d" ]] && f_debug=1

if [[ $f_debug -eq 1 && $f_run -eq 1 ]]; then
    echo "Error: Can't run and debug at the same time!"
    exit 1
fi

# Remove parameters that start with -
params=()
for arg in "$@"; do
    [[ "$arg" == -* ]] && continue
    params+=("$arg")
done

# params is empty
if [[ ${#params[@]} -eq 0 ]]; then
    echo "Error: Excercise folder not given!"
    exit 1
fi

exercise_folder="${params[-1]%/}"

if [[ ! -d "$exercise_folder" ]]; then
    echo "Error: Excercise folder '${exercise_folder}' not found!"
    exit 1
fi
#endregion

# Global vars
arch="64"
src="${exercise_folder}/main.s"
obj="${src%.s}.o"
bin="${src%.s}.bin"

# Parameters
# $1: file path
function clean_file {
    file="$1"
    if [[ -f "$file" ]]; then
        rm "$file"
        echo "Info: '$file' file deleted!"
    fi
}

# Parameters
# $1: Source file
# $2: Object file
# $3: Arch (32|64)
function do_assemble {
    src_file="$1"
    obj_file="$2"
    _arch="$3"

    #region Validations
    if [[ "$_arch" -ne "32" && "$_arch" -ne "64" ]]; then
        echo "Error: 32|64 bits supported only!"
        exit 1
    fi
    if [[ ! -f "$src_file" ]]; then
        echo "Error: '$src_file' not found!"
        exit 1
    fi
    #endregion

    as -g "-$_arch" -o "$obj_file" "$src_file"
    # check
    if [ $? -ne 0 ]; then
        echo "Error: the assembly process failed!"
        exit 1
    fi
}

# Parameters
# $1: Object file
# $2: Output binary file
function do_link {
    obj_file="$1"
    bin_file="$2"

    #region Validations
    if [[ ! -f "$obj_file" ]]; then
        echo "Error: '$obj_file' not found!"
        exit 1
    fi
    #endregion

    ld -g -o "$bin_file" "$obj_file"
    # check
    if [ $? -ne 0 ]; then
        echo "Error: the link process failed!"
        exit 1
    fi
}

# Parameters
# $1: Source file
# $2: Output binary file
# $3: Arch (32|64)
function do_compile {
    src_file="$1"
    bin_file="$2"
    _arch="$3"

    #region Validations
    if [[ "$_arch" -ne "32" && "$_arch" -ne "64" ]]; then
        echo "Error: 32|64 bits supported only!"
        exit 1
    fi
    if [[ ! -f "$src_file" ]]; then
        echo "Error: '$src_file' not found!"
        exit 1
    fi
    #endregion

    gcc -no-pie \
        -nostdlib \
        "-m$_arch" \
        -g \
        -o "$bin_file" \
        "$src_file"

    # check
    if [ $? -ne 0 ]; then
        echo "Error: the compile process failed!"
        exit 1
    fi
}

# Clean previous files
clean_file "$obj" > /dev/null
clean_file "$bin" > /dev/null 

# Assemble for running
if [[ $f_run -eq 1 ]]; then
    do_assemble "$src" "$obj" "$arch"
    do_link "$obj" "$bin"
# Compile for debugging
elif [[ $f_debug -eq 1 ]]; then
    do_compile "$src" "$bin" "$arch"
fi

echo "Info: '$src' compiled!"
clean_file "$obj" > /dev/null

# Binary file not found
if [[ ! -e "$bin" ]]; then
    echo "${bin} not found!"
fi

# Run when the --run is detected
if [[ $f_run -eq 1 ]]; then
    ./"$bin"
# Debug when the -d is detected
elif [[ $f_debug -eq 1 ]]; then
    # Check if gdb is installed
    if [[ -z $(which gdb) ]]; then
        echo "Error: gdb is not installed!"
        exit 1
    fi

    gdb ./"$bin"
fi