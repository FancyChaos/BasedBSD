#!/bin/sh

### Get path of script
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
export SCRIPTPATH

echo "Please add the 'nopass' option to your /etc/doas.conf config for the installation to avoid re-entering the password"
printf "Continue? (y/N): "
read confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# Update system
doas pkg_add -vuI

# Automatically install needed firmware
doas fw_update

# Install packages
doas pkg_add -l packages

# python -> python3
doas ln -s /usr/local/bin/python3 /usr/local/bin/python

# Make sure installation scripts are executable
chmod +x installations/*

# creating dirs
mkdir $HOME/.config/ || true
mkdir $HOME/GitRepos/ || true

# copying /etc/ files
doas rsync -avr rootfs/etc/ /etc/

# copying configs
rsync -avr rootfs/home/ $HOME/

# Make custom scripts executable (be sure)
doas chmod -R +x /etc/fos/bin/*
doas chmod -R +x /etc/fos/statusbar/*

# Compile applications under applications/
for app in $(find applications/ -type f -name 'build.sh'); do
    echo "Execting build script: " "$app"
    dir=$(dirname $app)
    cd $dir
    ./build.sh
    cd $SCRIPTPATH
done

# Execute install scripts under installations/
for install_script in $(find installations/ -type f | sort); do
    name=$(basename $install_script)
    echo "Executing $name..."
    chmod +x $install_script
    ./$install_script
done

# creating dirs like "Pictures", "Downloads" etc.
xdg-user-dirs-update

# Git env
git config --global user.email "Felixs.Developer@tutanota.com"
git config --global user.name "FancyChaos"

# Generate generic key for later git access
ssh-keygen -q -f $HOME/.ssh/git_key -t ecdsa -b 521 -N ""

# Enable apmd
doas rcctl enable apmd
doas rcctl set apmd flags -A

echo "Everything done. Reboot to enjoy your system"
