#!/bin/sh

cd /tmp/

git clone https://github.com/fancychaos/kisswm.git

cd kisswm/
# Uncomment for font soze 28
# git apply patches/font28.patch

make
doas make install
