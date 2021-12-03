local ret_status="%(?:%{$reset_color%}>:%{$fg_bold[red]%}%? >)"

function root() {
  [[ $UID -eq 0 ]] && echo "%{$reset_colors%}root "
}

function get_pwd() {
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='$(root)${ret_status} %{$fg_bold[blue]%}$(get_pwd) $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=") %{$fg_bold[red]%}+"
ZSH_THEME_GIT_PROMPT_CLEAN=")"
