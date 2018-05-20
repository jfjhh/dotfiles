if [ -x /usr/bin/dircolors ]; then
	[ -r ~/.dircolors ] \
		&& eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias \
		ls='ls --color=auto' \
		dir='dir --color=auto' \
		vdir='vdir --color=auto' \
		less='less -R' \
		grep='grep --color=auto' \
		fgrep='fgrep --color=auto' \
		egrep='egrep --color=auto'
fi
alias \
	l='ls -CF' \
	la='ls -A' \
	ll='ls -FlAh' \
	g='git'

which() {
	(alias; declare -f) | /usr/bin/which --tty-only --read-alias \
		--read-functions --show-tilde --show-dot $@
}; export -f which

