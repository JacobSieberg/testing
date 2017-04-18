#cmake .. -DSETUP=legato

execute_process(COMMAND source /opt/swi/y17-ext/environment-setup-armv7a-vfp-neon-poky-linux-gnueabi)

set(CMAKE_C_COMPILER arm-poky-linux-gnueabi-gcc)
set(CMAKE_CXX_COMPILER arm-poky-linux-gnueabi-g++)