# Prompt
PS1="\[\033[01;35m\]\w \[\033[0m\]"

# If not running interactively, don"t do anything
[[ $- != *i* ]] && return

# Ignore duplicates in history
export HISTCONTROL=ignoreboth:erasedups

# ls aliases
alias ls="ls --color=auto"
alias l="ls -lFh"
alias la="ls -lAFh"
alias lr="ls -tRFh"
alias lt="ls -ltFh"
alias ll="ls -l"
alias ldot="ls -ld .*"
alias lS="ls -1FSsh"
alias lart="ls -1Fcart"
alias lrt="ls -1Fcrt"

# Dot aliases
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Network aliases
alias eth="sudo ip link set net0 up && sudo dhcpcd"
alias net="sudo ip link set wlp2s0 up"

# Global variables
export EDITOR="vim"

