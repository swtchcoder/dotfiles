# .bashrc
if [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi

. /usr/share/git/git-prompt.sh

cat ~/.ascii

alias ls="ls --color=auto"
alias vi="nvim"
alias vim="nvim"

PS1="[\033[32m\u@\h \033[33m\w\033[35m\$(__git_ps1 ' %s')\033[39m]\n$ " 
. "$HOME/.cargo/env"
export PATH="$HOME/opt/cross/bin:$PATH"
