#!/bin/bash
echo "" >> ~/.bash_profile
echo "# CTMZ_Toolchain environment variables" >> ~/.bash_profile
echo "export CTMZ_HOME=$PWD" >> ~/.bash_profile
echo "export PATH=\$PATH:\$CTMZ_HOME/Toolchain-M68K/bin" >> ~/.bash_profile
echo "export PATH=\$PATH:\$CTMZ_HOME/Toolchain-Z80/bin" >> ~/.bash_profile
