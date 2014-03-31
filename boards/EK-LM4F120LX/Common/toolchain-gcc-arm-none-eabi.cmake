# A CMake toolchain file so we can cross-compile for arm bare-metal
# This cmake script assume the use of the https://launchpad.net/gcc-arm-embedded compiler
# we assume this is installed (extracted) into /opt/arm_tools/
 
# usage normall, the CMakeFile will have this link in it.
# cmake -DCMAKE_TOOLCHAIN_FILE=../../Common/toolchain-arm-none-eabi.cmake ../
 
# The Generic system name is used for embedded targets (targets without OS) in
# CMake
set( CMAKE_SYSTEM_NAME Generic )
 
# Set a toolchain path. You only need to set this if the toolchain isn't in
# your system path. Don't forget a trailing path separator!
# We assume the compiler is located in /opt/arm_tools/gcc-arm-none-eabi/bin/
# This should be a pointer to the actually compiler version we should be using.
set( TC_PATH "/opt/arm_tools/gcc-arm-none-eabi/bin/" )
 
# The toolchain prefix for all toolchain executables
set( CROSS_COMPILE arm-none-eabi- )
 
# specify the cross compiler. CMake automatically adds the CMAKE_C_COMPILER
# value into the CACHE
set( CMAKE_C_COMPILER   ${TC_PATH}${CROSS_COMPILE}gcc )
set( CMAKE_CPP_COMPILER   ${TC_PATH}${CROSS_COMPILE}g++ )

# We must set the OBJCOPY setting into cache so that it's available to the
# whole project. Otherwise, this does not get set into the CACHE and therefore
# the build doesn't know what the OBJCOPY filepath is
set( CMAKE_OBJCOPY      ${TC_PATH}${CROSS_COMPILE}objcopy
    CACHE FILEPATH "arm-none-eabi-objcopy " FORCE )

#SET(CMAKE_C_LINK_EXECUTABLE "${TC_PATH}${CROSS_COMPILE}ld")

SET( CMAKE_LINKER ${TC_PATH}${CROSS_COMPILE}ld 
    CACHE FIELPATH "arm-none-eabi-ld " FORCE )


