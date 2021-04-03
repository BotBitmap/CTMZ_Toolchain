# CTMZ_Toolchain
C cross compiler toolchain targeting M68K and Z80 microprocessors (Neo Geo/Mega Drive/Master System) should compile under Linux and Windows (With MSYS2/WSL) Mac was not been tested, but should work with the necessary dependencies.

The makefile download software latest versions from their respective mirrors by default. To use a different version, change the ```$(LINK...)``` variables.

**Dependencies**

Ubuntu
```
apt-get install make texinfo bison flex unzip gcc g++ curl python expat diffutils libgmp-dev libmpfr-dev mpc libmpc-dev libisl-dev libc++-dev libboost-all-dev
```
Windows (MSYS2 MinGW terminal) 
``` 
pacman -S make texinfo bison flex unzip mingw-w64-x86_64-gcc mingw-w64-x86_64-curl mingw-w64-x86_64-python mingw-w64-x86_64-expat mingw-w64-x86_64-diffutils mingw-w64-x86_64-gmp mingw-w64-x86_64-mpfr mingw-w64-x86_64-mpc mingw-w64-x86_64-isl mingw-w64-x86_64-libc++ mingw-w64-x86_64-boost 
```

**NeoGeo and Mega Drive compiler toolchain**
```
make install_gcc-newlib_m68k && make install_sdcc_z80
```
**The Master System only needs SDCC**
```
make install_sdcc_z80
```

**To set the environment variables**
```
source set_environment_variables.sh
```

**To set the environment variables permanently**
```
# Add environment variables to ~/.bash_profile
source set_environment_variables_permanently.sh
```

**Windows extra information - Using the Toolchain outside of MSYS2 MinGW terminal**

You may want to use this Toolchain outside of MSYS2 MinGW terminal on Windows, for use in IDE's, in order to do that, copy any needed libraries to the Toolchain /bin folder. ``ldd`` command can help you with that. Only files inside ``/mingw64/bin/`` are needed.

Usage example:
```
ldd ./m68k-elf-gcc
```
