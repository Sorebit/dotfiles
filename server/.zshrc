## Global variables
# export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/opt/erlang@20/bin:$PATH"
export EDITOR="vim"

## Prompt & colors
export ZSH_THEME="fishy"
autoload -U colors && colors
export GCC_COLORS=1

## Plugins
plugins=(git history-substring-search)

# Vim fix
stty -ixon

# Gnome-terminal default colors fix
export LS_COLORS=""

# Source here for proper aliasing
source $ZSH/oh-my-zsh.sh

# Alternatively
# source "${ZDOTDIR:-${HOME}}/.zshrc-`uname`"

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
HISTFILE="$HOME/.zsh_history"
setopt hist_ignore_dups
setopt inc_append_history
setopt share_history
zmodload zsh/terminfo

## Aliases
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

function mkcd() { mkdir -p ./$1; cd ./$1 }
