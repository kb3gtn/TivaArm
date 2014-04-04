# TivaArm

TI Tiva ARM projects using GCC/OpenOCD/CMake


## Setup Instructions for Ubuntu 14.04 (64 bit)

* Download the compiler tools from here: [GCC ARM Embedded](https://launchpad.net/gcc-arm-embedded/ "GCC ARM Embedded")
* Make a directory called /opt/arm_tools<br/>
  sudo mkdir -p /opt/arm_tools
* Extract the download tarbal to /opt/arm_tools<br/>
  cd /opt/arm_tools && sudo tar -xvjf /path/to/gcc-arm-none-eabi-<stuff>-linux.tar.bz2
* add a simlink in arm_tools called "gcc-arm-none-eabi" that points to the extracted tool chain<br/>
  sudo ln -s /opt/arm_tools/gcc-arm-none-eabi-<stuff> /opt/arm_tools/gcc-arm-none-eabi/
* Install the 32 bit binary compatibility packages multiarch-support binutils-multiarch<br/>
  sudo apt-get install multiarch-support binutils-multiarch








