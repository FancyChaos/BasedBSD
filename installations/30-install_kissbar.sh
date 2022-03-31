#!/bin/sh

cd /tmp/

git clone https://github.com/fancychaos/kissbar.git

cd kissbar/

make
doas make install
