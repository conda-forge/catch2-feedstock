#!/bin/sh

set -e

mkdir build
cd build

# macOS: allow newer features
# https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

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
  ctest --progress --output-on-failure
fi
