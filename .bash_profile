[ -z "$DISPLAY" ] && [ "`tty`" = "/dev/tty1" ] && stty intr undef && exec startx
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

