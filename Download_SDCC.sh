#!/bin/bash
FILE=sdcc.zip
curl https://codeload.github.com/swegener/sdcc/zip/master --output $FILE
bsdtar xzvf $FILE
rm $FILE
mv sdcc-master SDCC
