#!/bin/bash
# remove old makefiles
rm **/Makefile
rm -R ./build/**/*
# run the qmake build
qmake
make clean
make
