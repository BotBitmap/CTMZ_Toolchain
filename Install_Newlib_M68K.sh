#!/bin/bash
cd Newlib
mkdir build
cd build
../configure --target=m68k-elf --prefix=$CTMZ_HOME/Toolchain-M68K --with-cpu=m68000 --enable-shared=no --disable-nls --disable-werror
make -j8 all
make install
