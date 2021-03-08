#!/bin/sh

set -e

mkdir build
cd build

cmake ${CMAKE_ARGS} \
  -LAH -G"Ninja" \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_BUILD_TYPE=Release \
  -DCATCH_ENABLE_WERROR:BOOL=OFF \
  ..

# build and install
cmake --build . --target install

# test
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]]; then
  ctest -R
fi
