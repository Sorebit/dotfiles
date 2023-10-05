## Global variables
export ZSH="$HOME/.oh-my-zsh"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:/usr/local/opt/erlang@20/bin:$HOME/.rvm/bin:$PATH"
export EDITOR="vim"

# pyenv
#eval "$(pyenv init --path)"
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
# export ZSH_TMUX_AUTOSTART=true


## Plugins
plugins=(git gitignore zsh-autosuggestions history-substring-search tmux docker docker-compose alias-finder)

# Local plugins (plugins need to be added before sourcing oh-my-zsh)
if [ -f ~/.zshrc.plugins.local ]; then
    source ~/.zshrc.plugins.local
fi


# Enable options stacking for docker autosuggestions
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes


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
    function open() {
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
# Alias finder plugin shorthands
ZSH_ALIAS_FINDER_AUTOMATIC=true
alias afl="alias-finder -l"

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

alias sd="sdcv --color"
alias virtualenv="pyenv virtualenv"  # No more mixing up

# Protection from overwriting
alias cp="cp -i"
alias mv="mv -i"

# Common shorthands
alias dcef="docker-compose --env-file"
alias jn="jupyter notebook"
# Recursively change ownership
alias rch="sudo chown -R $(whoami):$(whoami)"


## Functions
function mkcd() { mkdir -p "${1}" && cd "${1}" }
function installAutosuggestions() {
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}


## Enable local changes
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
