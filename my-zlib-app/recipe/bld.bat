mkdir build
if errorlevel 1 exit 1

cd build
if errorlevel 1 exit 1

cmake .. ^
 -G Ninja ^
 -DCMAKE_INSTALL_PREFIX=%PREFIX%
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --install .
if errorlevel 1 exit 1