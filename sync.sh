#!/usr/bin/env bash

##
# ENV VARS
# ========
#
# • DOTFILES_FETCH_REPOS: If set, clone or update stuff that depend
# on code repositories. Example:
#
#   $ DOTFILES_FETCH_REPOS=1 bash sync.sh
#

dir_script="$(cd "$(dirname "$0")" && pwd -P)"

##
# Files that can be symblinked in a simple and straightforward way.
#
deploy () {
  while read -r file ; do
    mkdir -pv "$(dirname "$HOME/$file")"

    if [ ! -L "$file" ]; then
      if [ -e "$HOME/$file" ]; then
        printf '%s\n' "[SKIP]: ~/$file exists and is NOT a symblink..."
      else
        printf '%s\n' "[SYMB]: ~/$file is bing symblinked"
        ln -sv "$dir_script/$file" "$HOME/$file"
      fi
    fi
  done < ./MANIFEST-LINUX.txt
}

deploy

##
# Kitty Terminal Emulator
#
mkdir -pv ~/.config/kitty

[[ ! -f ~/.config/kitty/kitty.conf ]] \
  && ln -sv \
    ~/work/src/dotfiles/.config/kitty/kitty.conf \
    ~/.config/kitty/kitty.conf

##
# Clone or update kitty-themes repo.
#
if [[ -n $DOTFILES_FETCH_REPOS ]] ; then
  if [[ -d ~/.config/kitty/kitty-themes ]] ; then
    (
      cd ~/.config/kitty/kitty-themes

      printf '%s\n' '→ Updating kitty-themes'
      git pull origin --rebase
    )
  else
    (
      cd ~/.config/kitty
      git clone --depth 1 \
        git@github.com:dexpota/kitty-themes.git \
        ./kitty-themes
    )
  fi
fi


# vim: set tabstop=2 softtabstop=2 shiftwidth=2:

