# Get git branch
parse_git_branch() {
	    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Couleurs du préfix du terminal
NM="\[\033[0;38m\]"
HI="\[\033[0;37m\]"
HII="\[\033[0;36m\]"
SI="\[\033[0;33m\]"
IN="\[\033[0m\]"

export PS1="$NM[ $HI\u $HII\h \[\033[32m\]\w - \$(parse_git_branch)\[\033[00m\] $ "

# alias
alias ls='ls -GhF'
alias ll='ls -GlAhF'
alias cd..="cd .."
alias c="clear"
alias vi="vim"
