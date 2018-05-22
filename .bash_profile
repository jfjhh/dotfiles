[ -z "$DISPLAY" ] && [ "`tty`" = "/dev/tty1" ] && exec startx
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

