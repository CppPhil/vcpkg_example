#!/bin/bash

if [ "$1" == "rebuild" ]; then
    rm -rf ./build
    mkdir build    
fi

cd build
cmake .. "-DCMAKE_TOOLCHAIN_FILE=~/vcpkg/scripts/buildsystems/vcpkg.cmake"
cmake --build .
exit 0

