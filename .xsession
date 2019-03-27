[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
xbacklight -set 50 &
xrdb ~/.Xresources &
slstatus &
redshift &
~/.fehbg &
syndaemon -d -i 0.5 &
xmodmap ~/.xmodmap &
xbindkeys &
(sleep 0.1 && google-chrome-unstable ) &> /dev/null &
(sleep 0.1 && urxvt -e $HOME/bin/reconnect) &> /dev/null &
exec dwm

