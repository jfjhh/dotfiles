[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
lit 20 &
xrdb ~/.Xresources &
~/.fehbg &
slstatus 2> /dev/null &
exec dwm

