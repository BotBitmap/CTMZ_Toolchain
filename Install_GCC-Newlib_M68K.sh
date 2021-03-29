#!/bin/bash
# Building GCC and newlib together
cd GCC
cd build
../configure --target=m68k-elf --prefix=$CTMZ_HOME/Toolchain-M68K --enable-languages=c --with-cpu=m68000 --without-headers --with-newlib --disable-libquadmath --disable-libssp --disable-libstacktrace --disable-libstdcxx --disable-threads --disable-tls --disable-multilib --enable-shared=no --disable-nls --disable-werror
make -j8 all
make install
