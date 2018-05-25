[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
(slock && eval $(keychain id_rsa)) &
xrdb ~/.Xresources &
slstatus &
redshift &
~/.fehbg &
xautolock -time 5 -locker slock -corners 0+-0 -cornerdelay 1 -cornersize 2 &
xmodmap ~/.xmodmap &
xbindkeys &
exec dwm

