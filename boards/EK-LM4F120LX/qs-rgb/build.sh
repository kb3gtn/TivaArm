#!/bin/bash

if [ -d "work" ]; then
  echo "Cleaning up old build"
  rm work -rf
fi

if [ $1 = "clean" ]; then
    exit 0
fi

echo "Starting build from scratch.."

mkdir work
cd work
cmake -G "CodeBlocks - Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=../../Common/toolchain-gcc-arm-none-eabi.cmake -DCMAKE_C_FLAGS="-nostartfiles" ../

# for verbos builds
make VERBOSE=1

#normal quite builds
#make

echo "result is in ./work/qs-rgb"
