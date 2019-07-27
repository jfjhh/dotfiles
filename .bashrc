[ -z "$PS1" ] && return
[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -d "$HOME/anaconda3/bin" ] && export PATH="/home/jfjhh/anaconda3/bin:$PATH"
[ -x /usr/bin/lesspipe ] && export LESSOPEN="| lesspipe %s"

shopt -s histappend checkwinsize cmdhist globstar
stty ixany stop ''
bind Space:magic-space

HISTCONTROL='erasedups:ignoreboth'
HISTSIZE=16384
HISTFILESIZE=32768
PROMPT_DIRTRIM=3

PSX="\[\e[0;35m\]\w\[\e[0;1;35m\] "
PS1="$PSX$\[\e[0m\] "
PS2="$PSX>\[\e[0m\] "

keychain -q ~/.ssh/id_rsa

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

