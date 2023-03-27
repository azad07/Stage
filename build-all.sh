#!/bin/bash
# Build script for engine
set echo on

echo "$(tput setaf 1)Building Everything... $(tput setaf 7)"

pushd engine
./build.sh
popd


pushd testbed
./build.sh
popd

echo "All assemblies built successfully."