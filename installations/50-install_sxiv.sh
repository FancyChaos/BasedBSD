#!/bin/sh

cd /tmp/

git clone https://github.com/xyb3rt/sxiv.git
cd sxiv/

sed -i 's/install: all/install:/g' Makefile

export CFLAGS="-I/usr/local/include -I/usr/X11R6/include -I/usr/X11R6/include/freetype2"
export LDLIBS="-L/usr/local/lib -L/usr/X11R6/lib -L/usr/X11R6/freetype2/lib"

make AUTORELOAD=nop
doas make install
