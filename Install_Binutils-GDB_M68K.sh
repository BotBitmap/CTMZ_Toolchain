#!/bin/bash
cd Binutils-GDB
mkdir build
cd build
../configure --target=m68k-elf --prefix=$CTMZ_HOME/Toolchain-M68K --with-cpu=m68000 --enable-install-libbfd --enable-shared=no --disable-multilib --disable-tls --disable-nls --disable-werror
make -j8 all LDFLAGS=-Wl,--allow-multiple-definition
make install
