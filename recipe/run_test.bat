setlocal EnableDelayedExpansion

:: Make a build folder and change to it
mkdir build
cd build

:: configure
cmake -LAH -G"Ninja" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  %RECIPE_DIR%/test

if errorlevel 1 exit 1

:: build and install
cmake --build . --target all
if errorlevel 1 exit 1

:: test
ctest --progress --output-on-failure
if errorlevel 1 exit 1
