setlocal EnableDelayedExpansion

:: Make a build folder and change to it
mkdir build
cd build

:: configure
cmake -LAH -G"Ninja" ^
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
  -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
  -DCMAKE_BUILD_TYPE:STRING=Release ^
  -DBUILD_SHARED_LIBS=ON ^
  ..
if errorlevel 1 exit 1

:: build and install
cmake --build . --target install
if errorlevel 1 exit 1

:: test
ctest --progress --output-on-failure
if errorlevel 1 exit 1
