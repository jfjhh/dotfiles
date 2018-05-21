xautolock -time 5 -locker slock -corners 0+-0 -cornerdelay 1 -cornerredelay 10 -cornersize 2 &
xmodmap ~/.xmodmap &
xbindkeys &
xrdb ~/.Xresources &
slstatus &
eval $(keychain id_rsa) &
redshift &
~/.fehbg &
exec dwm

