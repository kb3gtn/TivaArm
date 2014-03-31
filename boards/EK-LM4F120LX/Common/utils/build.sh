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
cmake -G "CodeBlocks - Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=../toolchain-gcc-arm-none-eabi.cmake -DCMAKE_C_FLAGS="-nostartfiles" ../

# for verbos builds
#make VERBOSE=1

#normal quite builds
make

cp libutils.a ../

# done with work..
cd ..
rm work -rf

echo "build output in ./libutils.a"

