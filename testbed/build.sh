#!/bin/bash
# Build script for engine
set echo on

mkdir -pv ../bin

# Get a list of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="testbed"
compilerFlags="-g "
# -fms-extensions 
# -Wall -Werror
includeFlags="-Isrc  -I../engine/src"
linkerFlags="-L./../bin/ -lengine"
defines="-D_DEBUG -DIEXPORT"

echo "$(tput setaf 1)Building $assembly...$(tput setaf 7)"
clang $cFilenames $compilerFlags -o ../bin/$assembly $defines $includeFlags $linkerFlags