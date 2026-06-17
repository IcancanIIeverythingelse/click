$PYTHON setup.py install     # Python command to install the script.

mkdir build

cd build

cmake .. \
    -G Ninja \
    -DCMAKE_INSTALL_PREFIX=$PREFIX

cmake --build .

cmake --install .