#!/bin/bash
cd SDCC
mkdir build
cd build
../configure --prefix=$CTMZ_HOME/Toolchain-Z80 --disable-non-free --enable-z80-port --disable-mcs51-port --disable-pic14-port --disable-pic16-port --disable-gbz80-port --disable-tlcs90-port --disable-stm8-port --disable-avr-port --disable-ds390-port --disable-ds400-port --disable-hc08-port --disable-pic-port --disable-pic16-port --disable-xa51-port --disable-s08-port --disable-z180-port --disable-r2k-port --disable-r3ka-port
make -j8
make install
