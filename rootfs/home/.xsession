# Load Xresources
xrdb -merge ~/.Xresources

# Load fos defaults
. /etc/fos/config/fos_shell_settings

# Set Keyboard to germab
setxkbmap de

# Start ssh-agent
eval `ssh-agent -s`

# Start compositor
picom --vsync &

# Start notification daemon
dunst &

# Set Wallpaper
fwallpaper

# Disable touchpad on keyboard input
syndaemon -i 0.5 -t -K -R -d

# Finally start kissbar and kisswm
kissbar -wn &
exec kisswm
