#!/bin/bash
cd GCC
mkdir build
cd build
../configure --target=m68k-elf --prefix=$CTMZ_HOME/Toolchain-M68K --enable-languages=c --with-cpu=m68000 --without-headers --disable-libstdcxx --disable-libquadmath --disable-libssp --disable-libstacktrace --disable-threads --disable-tls --disable-multilib --enable-shared=no --disable-nls --disable-werror
make -j8 all-gcc
make install-gcc
