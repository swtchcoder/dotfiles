# .bashrc
if [ "$(tty)" = "/dev/tty1" ]; then
	startx
	echo "no xorg?.."
fi

. /usr/share/git/git-prompt.sh

export PATH="$PATH:~/.local/bin"
alias dodo="sudo halt && sudo shutdown now"
cat ~/.ascii

alias ls="ls --color=auto"

PS1="[\033[32m\u@\h \033[33m\w\033[35m\$(__git_ps1 ' %s')\033[39m]\n$ " 

export PATH=/home/switchcodeur/.local/bin:$PATH
export PATH=/home/switchcodeur/.cargo/bin:$PATH


export EDITOR=nvim
alias ed="$EDITOR"
alias ex="lf"
