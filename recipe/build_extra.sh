#!/usr/bin/env bash
set -eux

#NOTICE: Keep synchronized with build_extra.bat

test -f "${SRC_DIR}/src/mcpl_extra/CMakeLists.txt"

cmake \
    -B ./build_extra \
    -S "${SRC_DIR}/src/mcpl_extra" \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DMCPLEXTRA_NOTOUCH_CMAKE_BUILD_TYPE=ON

cmake --build ./build_extra --config Release --parallel ${CPU_COUNT:-2}
cmake --install ./build_extra
