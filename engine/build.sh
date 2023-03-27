#!/bin/bash
# Build script for engine
set echo on

mkdir -pv ../bin

# Get a list of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="engine"
compilerFlags="-g -shared -fdeclspec -fPIC"
# -fms-extensions 
# -Wall -Werror
#includeFlags="-Isrc -I$VULKAN_SDK/include"
linkerFlags="-lglfw  -L$VULKAN_SDK/lib"
defines="-D_DEBUG -DNEXPORT"

echo "$(tput setaf 1)Building $assembly...$(tput setaf 7)"
clang++ -std=c++11 -stdlib=libc++ $cFilenames $compilerFlags -o ../bin/lib$assembly.so $defines $includeFlags $linkerFlags