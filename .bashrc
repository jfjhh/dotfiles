[ -z "$PS1" ] && return
[ -d "$HOME/bin" ] && export PATH="$PATH:$HOME/bin"
[ -d "$HOME/.local/bin" ] && export PATH="$PATH:$HOME/.local/bin"
[ -x /usr/bin/lesspipe ] && export LESSOPEN="| lesspipe %s"
export TERM='rxvt-unicode-256color'

shopt -s histappend checkwinsize cmdhist globstar
stty ixany stop ''
bind Space:magic-space

HISTCONTROL='erasedups:ignoreboth'
HISTSIZE=16384
HISTFILESIZE=32768
PROMPT_DIRTRIM=3

PSX="\[\e[0;36m\]\$? \[\e[1;34m\]\u\[\e[0m\]@\[\e[1;32m\]\h "\
"\[\e[0;35m\]\w\[\e[0;1;35m\] "
PS1="$PSX$\[\e[0m\] "
PS2="$PSX>\[\e[0m\] "

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

eval `keychain --eval --quiet id_rsa`

