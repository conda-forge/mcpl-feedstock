#!/usr/bin/env bash
set -eux

#NOTICE: Keep synchronized with build_core.bat

test -f "${SRC_DIR}/src/mcpl_core/include/mcpl.h.in"

cmake \
    -B ./build_core \
    -S "${SRC_DIR}/src/mcpl_core" \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DMCPL_NOTOUCH_CMAKE_BUILD_TYPE=ON

cmake --build ./build_core --config Release --parallel ${CPU_COUNT:-2}
cmake --install ./build_core
