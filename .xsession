[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
slock &
xbacklight -set 10 &
xrdb ~/.Xresources &
slstatus &
redshift &
~/.fehbg &
xautolock -time 5 -locker slock -corners 0+-0 -cornerdelay 1 -cornersize 2 &
xmodmap ~/.xmodmap &
xbindkeys &
(sleep 0.1 && urxvt ) &> /dev/null &
(sleep 0.1 && google-chrome-unstable ) &> /dev/null &
(sleep 0.1 && urxvt -e $HOME/bin/reconnect) &> /dev/null &
exec dwm

