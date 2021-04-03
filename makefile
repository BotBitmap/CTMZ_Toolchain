# CTMZ
CTMZ_HOME = $(PWD)

# PATH
PATH := $(PATH):$(CTMZ_HOME)/Toolchain-M68K/bin:$(CTMZ_HOME)/Toolchain-Z80/bin

# File archiver
FILE_ARCHIVER = unzip

# Binutils-GDB
LINK_BINUTILS-GDB = https://codeload.github.com/bminor/binutils-gdb/zip/master
DOWN_BINUTILS-GDB = binutils-gdb.zip
PATH_BINUTILS-GDB = binutils-gdb-master

# GCC
LINK_GCC = https://codeload.github.com/gcc-mirror/gcc/zip/master
DOWN_GCC = GCC.zip
PATH_GCC = gcc-master

# Newlib
LINK_NEWLIB = https://codeload.github.com/bminor/newlib/zip/master
DOWN_NEWLIB = Newlib.zip
PATH_NEWLIB = newlib-master

# SDCC
LINK_SDCC = https://codeload.github.com/swegener/sdcc/zip/master
DOWN_SDCC = SDCC.zip
PATH_SDCC = sdcc-master

all: install_gcc-newlib_m68k install_sdcc_z80

$(DOWN_BINUTILS-GDB):
	curl $(LINK_BINUTILS-GDB) -o $(DOWN_BINUTILS-GDB)

$(PATH_BINUTILS-GDB): $(DOWN_BINUTILS-GDB)
	$(FILE_ARCHIVER) $(DOWN_BINUTILS-GDB)

$(DOWN_GCC):
	curl $(LINK_GCC) -o $(DOWN_GCC)

$(PATH_GCC): $(DOWN_GCC)
	$(FILE_ARCHIVER) $(DOWN_GCC)

$(DOWN_NEWLIB):
	curl $(LINK_NEWLIB) -o $(DOWN_NEWLIB)

$(PATH_NEWLIB): $(DOWN_NEWLIB)
	$(FILE_ARCHIVER) $(DOWN_NEWLIB)

$(DOWN_SDCC):
	curl $(LINK_SDCC) -o $(DOWN_SDCC)

$(PATH_SDCC): $(DOWN_SDCC)
	$(FILE_ARCHIVER) $(DOWN_SDCC)

install_binutils-gdb_m68k: $(PATH_BINUTILS-GDB)
	mkdir -p $(PATH_BINUTILS-GDB)/build
	cd $(PATH_BINUTILS-GDB)/build && ../configure --target=m68k-elf --prefix=$(CTMZ_HOME)/Toolchain-M68K --with-cpu=m68000 --enable-install-libbfd --enable-shared=no --disable-multilib --disable-tls --disable-nls --disable-werror
	make -j8 all LDFLAGS=-Wl,--allow-multiple-definition -C $(PATH_BINUTILS-GDB)/build
	make install -C $(PATH_BINUTILS-GDB)/build
	touch $@

install_gcc_m68k: $(PATH_BINUTILS-GDB) $(PATH_GCC) install_binutils-gdb_m68k
	mkdir -p $(PATH_GCC)/build
	cd $(PATH_GCC)/build && ../configure --target=m68k-elf --prefix=$(CTMZ_HOME)/Toolchain-M68K --enable-languages=c --with-cpu=m68000 --without-headers --disable-libstdcxx --disable-libquadmath --disable-libssp --disable-libstacktrace --disable-threads --disable-tls --disable-multilib --enable-shared=no --disable-nls --disable-werror
	make -j8 all-gcc -C $(PATH_GCC)/build
	make install-gcc -C $(PATH_GCC)/build
	touch $@

install_newlib_m68k: $(PATH_BINUTILS-GDB) $(PATH_GCC) $(PATH_NEWLIB) install_binutils-gdb_m68k install_gcc_m68k
	cd $(PATH_NEWLIB)
	mkdir -p $(PATH_NEWLIB)/build
	cd $(PATH_NEWLIB)/build && ../configure --target=m68k-elf --prefix=$(CTMZ_HOME)/Toolchain-M68K --with-cpu=m68000 --enable-shared=no --disable-nls --disable-werror
	make -j8 all -C $(PATH_NEWLIB)/build
	make install -C $(PATH_NEWLIB)/build
	touch $@

install_gcc-newlib_m68k: $(PATH_BINUTILS-GDB) $(PATH_GCC) $(PATH_NEWLIB) install_binutils-gdb_m68k install_gcc_m68k install_newlib_m68k
	cd $(PATH_GCC)/build && ../configure --target=m68k-elf --prefix=$(CTMZ_HOME)/Toolchain-M68K --enable-languages=c --with-cpu=m68000 --without-headers --with-newlib --disable-libquadmath --disable-libssp --disable-libstacktrace --disable-libstdcxx --disable-threads --disable-tls --disable-multilib --enable-shared=no --disable-nls --disable-werror
	make -j8 all -C $(PATH_GCC)/build
	make install -C $(PATH_GCC)/build
	touch $@

install_sdcc_z80: $(PATH_SDCC)
	mkdir -p $(PATH_SDCC)/build
	cd $(PATH_SDCC)/build && ../configure --prefix=$(CTMZ_HOME)/Toolchain-Z80 --disable-non-free --enable-z80-port --disable-mcs51-port --disable-pic14-port --disable-pic16-port --disable-gbz80-port --disable-tlcs90-port --disable-stm8-port --disable-avr-port --disable-ds390-port --disable-ds400-port --disable-hc08-port --disable-pic-port --disable-pic16-port --disable-xa51-port --disable-s08-port --disable-z180-port --disable-r2k-port --disable-r3ka-port
	make -j8 -C $(PATH_SDCC)/build
	make install -C $(PATH_SDCC)/build
	touch $@

clean:
	rm -rf $(DOWN_BINUTILS-GDB)
	rm -rf $(DOWN_GCC)
	rm -rf $(DOWN_NEWLIB)
	rm -rf $(DOWN_SDCC)

	rm -rf $(PATH_BINUTILS-GDB)
	rm -rf $(PATH_GCC)
	rm -rf $(PATH_NEWLIB)
	rm -rf $(PATH_SDCC)

	rm -rf $(CTMZ_HOME)/Toolchain-M68K
	rm -rf $(CTMZ_HOME)/Toolchain-Z80
	rm -rf install_binutils-gdb_m68k install_gcc_m68k install_newlib_m68k install_gcc-newlib_m68k install_sdcc_z80

.PHONY: clean all
