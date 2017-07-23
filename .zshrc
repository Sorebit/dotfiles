## Global variables
export ZSH=/home/sorbet/.oh-my-zsh
export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export BROWSER="chromium-browser"
export EDITOR="vim"
export TERMINAL="gnome-terminal"
export TODO="/home/sorbet/.todo"

# Vim fix
stty -ixon

## Prompt & colors
export ZSH_THEME="sorbet"
autoload -U colors && colors
export GCC_COLORS=1
# Gnome-terminal default colors fix
export LS_COLORS=""

## Plugins 
plugins=(git sublime fedora zsh-autosuggestions history-substring-search)

## Completion & correction
autoload -U compinit && compinit
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
ENABLE_CORRECTION="true"

## History
HISTSIZE=1000
SAVEHIST=1000
HIST_STAMPS="yyyy-mm-dd"
HISTFILE="$HOME/.zsh/history"
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history
zmodload zsh/terminfo

## Aliases
alias ls="ls --color=auto"
alias l="ls -l"
alias la="ls -lAFh"
alias lr="ls -tRFh"
alias lt="ls -ltFh"
alias ldot="ls -ld .*"
alias lart="ls -1Fcart"
alias lrt="ls -1Fcrt"

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias wl="nmcli dev wifi list"
alias wn="nmcli dev wifi connect"

alias fehf="feh --force-alias"
function mkcd() { mkdir -p ./$1; cd ./$1 }

source $ZSH/oh-my-zsh.sh
