#!/usr/bin/env bash

# NOTICE: Keep synchronized with test_core.bat

set -eux

mcpl-config --help
mcpl-config -s
test -f "$(mcpl-config --show libpath)"
test -f "$(mcpl-config --show shlibpath)"
test -d "$(mcpl-config --show includedir)"
test -f "$(mcpl-config --show includedir)/mcpl.h"
cmake --find-package -DNAME=MCPL -DCOMPILER_ID=GNU -DLANGUAGE=CXX -DMODE=EXIST

test -f ./src/examples/downstream_cmake/CMakeLists.txt

mkdir -p ./build_ds
cmake \
    -S ./src/examples/downstream_cmake \
    -B ./build_ds \
    ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=./install_ds

cmake --build ./build_ds --config Release
cmake --install ./build_ds

test -f ./install_ds/bin/testapp

./install_ds/bin/testapp ./src/examples/example.mcpl
