if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sammy"
if [[ "$(pidof i3)" != "" ]]; then 
  ZSH_THEME="powerlevel10k/powerlevel10k" 
fi

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias cat="bat"
alias layout="setxkbmap -layout"
alias brightness="xrandr --output eDP-1 --brightness"
