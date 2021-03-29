#!/bin/bash
FILE=binutils-gdb.zip
curl https://codeload.github.com/bminor/binutils-gdb/zip/master --output $FILE
bsdtar xzvf $FILE
rm $FILE
mv binutils-gdb-master Binutils-GDB
