#!/bin/bash
# remove old makefiles
rm **/Makefile
# run the qmake build
qmake
make clean
make
