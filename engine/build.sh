#!/bin/bash
# Build script for engine
set echo on

mkdir -pv ../bin

# Get a list of all the .c files.
cFilenames=$(find . -type f -name "*.c")

# echo "Files:" $cFilenames

assembly="engine"
compilerFlags="-g -shared -fdeclspec -fPIC "
supressWarning=" -Wno-deprecated "
# -fms-extensions 
# -Wall -Werror
#includeFlags="-Isrc -I$VULKAN_SDK/include"
includeFlags="-Isrc "
#linkerFlags="-lglfw  -L$VULKAN_SDK/lib"
linkerFlags="-lglfw "
defines="-D_DEBUG -DNEXPORT"

echo "$(tput setaf 3)Building $assembly...$(tput setaf 7)"
clang++ -std=c++11 -stdlib=libc++ $cFilenames $compilerFlags $supressWarning -o ../bin/lib$assembly.so $defines $includeFlags $linkerFlags

if [[ "$?" -ne 0 ]] ; then
  echo "$(tput setaf 1)Build $assembly FAIL...$(tput setaf 7)"; exit $rc
else
  echo "$(tput setaf 2)Build $assembly SUCCESSFUL...$(tput setaf 7)";
fi