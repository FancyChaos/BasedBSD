#!/bin/sh

cd /tmp/

git clone https://github.com/fancychaos/kisswm.git
cd kisswm/

gmake
doas gmake install
