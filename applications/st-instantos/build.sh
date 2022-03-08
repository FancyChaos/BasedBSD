#!/bin/sh

rm config.h || true
make
doas make install

make clean
rm config.h || true
