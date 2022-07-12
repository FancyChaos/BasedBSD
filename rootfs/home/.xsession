# Load Xresources
xrdb -merge ~/.Xresources

# Load fos defaults
. /etc/fos/config/fos_shell_settings

# Set Keyboard to germab
setxkbmap de

# Start ssh-agent
eval `ssh-agent -s`

# Start compositor for
picom --unredir-if-possible --experimental-backends --vsync &

# Start notification daemon
dunst &

# Set Wallpaper
fwallpaper

# Disable touchpad on keyboard input
syndaemon -i 0.5 -t -K -R -d

# Finally start glorious spectrwm
exec spectrwm
