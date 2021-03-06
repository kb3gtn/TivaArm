# CMake 2.8.10 Documentation: http://www.cmake.org/cmake/help/v2.8.10/cmake.html
cmake_minimum_required( VERSION 2.8 )
 
# Mark the language as C so that CMake doesn't try to test the C++
# cross-compiler's ability to compile a simple program because that will fail
project( Blinky C ASM )

# We had to adjust the CMAKE_C_FLAGS variable in the toolchain file to make sure
# the compiler would work with CMake's simple program compilation test. So unset
# it explicitly before re-setting it correctly for our system
unset( CMAKE_C_FLAGS )
# flags for a Cortex M4 Float processor
set( CMAKE_C_FLAGS "-O0 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -march=armv7-m -mtune=cortex-m4 -mthumb -nostartfiles " )
 
# Set the linker flags so that we use our "custom" linker script
# this is depent on project.. so should be in project directory
set( CMAKE_EXE_LINKER_FLAGS "-Wl,-T,${PROJECT_SOURCE_DIR}/qs-rgb.ld --entry ResetISR" )

# Add include directorys to search in..
include_directories ( "${PROJECT_SOURCE_DIR}/../Common/" )

add_library( libdriver STATIC IMPORTED )
set_target_properties( libdriver PROPERTIES IMPORTED_LOCATION "${PROJECT_SOURCE_DIR}/../Common/driverlib/libdriver.a" )
 
add_executable( qs-rgb
        qs-rgb.c
        rgb_commands.c
        startup_gcc.c
    )

#TARGET_LINK_LIBRARIES(qs-rgb libdriver)

