#!/bin/bash

# location of OpenOCD Board .cfg files
OPENOCD_BOARD_DIR=/opt/arm_tools/openocd/share/openocd/scripts/board
GDB_BIN=/opt/arm_tools/gcc-arm-none-eabi/bin/arm-none-eabi-gdb

# start xterm with openocd in the background
xterm -e openocd -f $OPENOCD_BOARD_DIR/ek-lm4f120xl.cfg &

# save the PID of the background process
XTERM_PID=$!

# wait a bit to be sure the hardware is ready
sleep 2

# execute some initialisation commands via gdb
$GDB_BIN --command=init.gdb work/qs-rgb

# close xterm when the user has exited nemiver
kill $XTERM_PID

