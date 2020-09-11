#!/bin/sh

set -e

mkdir build
cd build

cmake -LAH -G"Ninja" \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_BUILD_TYPE=Release \
  -DCATCH_ENABLE_WERROR=OFF \
  ..

# build and install
cmake --build . --target install

# test
ctest -R
