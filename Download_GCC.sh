#!/bin/bash
FILE=GCC.zip
curl https://codeload.github.com/gcc-mirror/gcc/zip/master -o $FILE
bsdtar xzvf $FILE
rm $FILE
mv gcc-master GCC
