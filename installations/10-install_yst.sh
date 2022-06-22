#!/bin/sh

cd /tmp/

git clone https://github.com/FancyChaos/yst.git

cd yst/

mv config.mk.openbsd config.mk
git apply additional_patches/00-openbsd.diff
# Uncomment for bigger font size
git apply additional_patches/10-fontsize28.diff

make
doas make install
