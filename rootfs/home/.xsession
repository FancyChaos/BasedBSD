. /etc/fos/config/fos_shell_settings

# Set Keyboard to germab
setxkbmap de

# Start ssh-agent
eval `ssh-agent -s`

# Start compositor for
picom --unredir-if-possible --experimental-backends --vsync &
sleep 2

# Start notification daemon
dunst &

# Set Wallpaper
fwallpaper

# Finally start glorious spectrwm
exec spectrwm
