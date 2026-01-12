#!/bin/sh

set -e

mkdir build
cd build

cmake -LAH -G"Ninja" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  ../test

# build and install
cmake --build . --target all

# test
ctest --progress --output-on-failure
