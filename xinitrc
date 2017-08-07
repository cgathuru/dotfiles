source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
#export $(/usr/bin/gnome-keyring-daemon --start --components=pskcs11,secrets)
exec i3
