#!/bin/sh
# Install fonts
# This takes a long time rn, because we clone the whole nerd font repo

# Clone repo into the main repo
cd $SCRIPTPATH
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts/

chmod +x install.sh
# Install fonts of choice here
./install.sh FiraCode
./install.sh FiraMono
./install.sh Hack
