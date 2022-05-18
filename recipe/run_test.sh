#!/bin/sh

set -e

mkdir build
cd build

cmake -LAH -G"Ninja" \
  -DCMAKE_BUILD_TYPE=Release \
  ${RECIPE_DIR}/test

# build and install
cmake --build . --target all

# test
ctest -R
