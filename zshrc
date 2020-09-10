## Global variables
export ZSH="$HOME/.oh-my-zsh"
export PATH="/usr/local/opt/erlang@20/bin:$PATH:$HOME/.rvm/bin:$HOME/.pyenv/bin"
export EDITOR="vim"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## Prompt & colors
export ZSH_THEME="sorbet"
autoload -U colors && colors
export GCC_COLORS=1

## Autostart tmux
export ZSH_TMUX_AUTOSTART=true

## Plugins
plugins=(git gitignore sublime zsh-autosuggestions history-substring-search tmux wd autopep8 alias-finder)
ZSH_ALIAS_FINDER_AUTOMATIC=true # temporary for learning git aliases

## OS-specific configs
case $(uname) in
  Linux)
    # Plugins
    plugins+=(dnf)

    # Vim fix
    stty -ixon

    # Gnome-terminal default colors fix
    export LS_COLORS=""

    # Aliases
    alias wl="nmcli dev wifi list"
    alias wn="nmcli dev wifi connect"

    # Functions
    # xdg-open shortcut
    function xo() {
        if [[ $# -ne 0 ]]; then
          xdg-open $@
        else
          xdg-open .
        fi
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

alias fd='find . -type d -name'
alias ff='find . -type f -name'

# Protection from overwriting
alias cp="cp -i"
alias mv="mv -i"

## Functions
function mkcd() { mkdir -p "${1}" && cd "${1}" }
function installAutosuggestions() {
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

## Enable local changes
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
