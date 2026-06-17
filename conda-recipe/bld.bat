mkdir build

cd build

cmake .. ^
 -G Ninja ^
 -DCMAKE_INSTALL_PREFIX=%PREFIX%

cmake --build .

cmake --install .