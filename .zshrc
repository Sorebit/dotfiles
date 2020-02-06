## Global variables
# export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/opt/erlang@20/bin:$PATH:$HOME/.rvm/bin:$HOME/.pyenv/bin"
export EDITOR="vim"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

## Prompt & colors
export ZSH_THEME="sorbet"
autoload -U colors && colors
export GCC_COLORS=1

## Autostart tmux
export ZSH_TMUX_AUTOSTART=true

## Plugins
plugins=(git sublime zsh-autosuggestions history-substring-search tmux)

## OS-specific configs
case $(uname) in
  Darwin)
    # Plugins
    plugins+=(osx)

    # Aliases
    alias sp="split_tab"
    alias vp="vsplit_tab"
  ;;
  Linux)
    # Plugins
    plugins+=(fedora)

    # Vim fix
    stty -ixon

    # Gnome-terminal default colors fix
    export LS_COLORS=""

    # Aliases
    alias wl="nmcli dev wifi list"
    alias wn="nmcli dev wifi connect"
    alias fehf="feh --force-alias"
    alias xo="xdg-open"

    # Functions
    # Override default super+num app shortcuts
    function fixGnomeAppShortcuts() {
        for i in {1..9}; do
            gsettings set "org.gnome.shell.keybindings" "switch-to-application-$i" "[]";
        done &&
        gsettings list-recursively | grep switch-to-application | sort;
    }
    function installAddons {
        dnfi gnome-terminal-nautilus
    }
  ;;
esac

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
function installAutosuggestions() {
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

