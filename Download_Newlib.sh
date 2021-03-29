#!/bin/bash
FILE=Newlib.zip
curl https://codeload.github.com/bminor/newlib/zip/master -o $FILE
bsdtar xzvf $FILE
rm $FILE
mv newlib-master Newlib
