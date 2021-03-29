# CTMZ_Toolchain
C cross compiler toolchain targeting M68K and Z80 microprocessors (Neo Geo/Mega Drive/Master System) should compile under Linux and Windows (With MSYS2/WSL) Mac was not been tested, but should work with the necessary dependencies.

The scripts download software latest versions from their respective mirrors by default. To use a different version, change the URL.

**Dependencies**

Ubuntu
```
apt-get install make texinfo bison flex libarchive-tools gcc g++ curl python expat diffutils libgmp-dev libmpfr-dev mpc libmpc-dev libisl-dev libc++-dev libboost-all-dev
```
Windows (MSYS2 MinGW terminal) 
``` 
pacman -S make texinfo bison flex mingw-w64-x86_64-libarchive mingw-w64-x86_64-gcc mingw-w64-x86_64-curl mingw-w64-x86_64-python mingw-w64-x86_64-expat mingw-w64-x86_64-diffutils mingw-w64-x86_64-gmp mingw-w64-x86_64-mpfr mingw-w64-x86_64-mpc mingw-w64-x86_64-isl mingw-w64-x86_64-libc++ mingw-w64-x86_64-boost 
```
**Before building the toolchain, set the environment variables**
```
source Set_environment_variables.sh
```
**To set the environment variables permanently, run this inside CTMZ_Toolchain directory**
```
echo "" >> ~/.bash_profile
echo "# CTMZ_Toolchain environment variables" >> ~/.bash_profile
echo "export CTMZ_HOME=$PWD" >> ~/.bash_profile
echo "export PATH=\$PATH:\$CTMZ_HOME/Toolchain-M68K/bin" >> ~/.bash_profile
echo "export PATH=\$PATH:\$CTMZ_HOME/Toolchain-Z80/bin" >> ~/.bash_profile
```

**NeoGeo and Mega Drive compiler toolchain**
```
# Set environment variables
source Set_environment_variables.sh
# Download
./Download_Binutils-GDB.sh
./Download_GCC.sh
./Download_Newlib.sh
./Download_SDCC.sh
# Build and install
./Install_Binutils-GDB_M68K.sh
./Install_GCC_M68K.sh
./Install_Newlib_M68K.sh
./Install_GCC-Newlib_M68K.sh
./Install_SDCC_Z80.sh
```
**The Master System only needs SDCC**
```
# Set environment variables
source Set_environment_variables.sh
# Download
./Download_SDCC.sh
# Build and install
./Install_SDCC_Z80.sh
```

**Windows extra information - Using the Toolchain outside of MSYS2 MinGW terminal**

You may want to use this Toolchain outside of MSYS2 MinGW terminal on Windows, for use in IDE's, in order to do that, copy any needed libraries to the Toolchain /bin folder. ``ldd`` command can help you with that. Only files inside ``/mingw64/bin/`` are needed.

Usage example:
```
ldd m68k-elf-gcc
```
