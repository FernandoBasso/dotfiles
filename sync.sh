#!/usr/bin/env bash

dir_script="$(cd "$(dirname "$0")" && pwd -P)"

deploy () {
  while read -r file ; do
    mkdir -pv "$(dirname "$HOME/$file")"

    if [ ! -L "$file" ]; then
      if [ -e "$HOME/$file" ]; then
        printf '%s\n' "[INFO]: ~/$file exists and is not a symblink..."
      else
        ln -sv "$dir_script/$file" "$HOME/$file"
      fi
    fi
  done < ./MANIFEST-LINUX.txt
}

deploy

#
# Setup nvim. Just link to good old Vim stuff.
#
mkdir -pv ~/.config/nvim/colors
ln -sv ~/.vimrc ~/.config/nvim/init.vim
ln -sv ~/.vim/colors/mylight1.vim ~/.config/nvim/colors/mylight1.vim
ln -sv ~/.vim/colors/mytheme1.vim ~/.config/nvim/colors/mytheme1.vim
ln -sv ~/.vim/after ~/.config/nvim/after
ln -sv ~/.vim/helpers ~/.config/nvim/helpers
ln -sv ~/.vim/syntax ~/.config/nvim/syntax
ln -sv ~/.vim/myultisnips ~/.config/nvim/myultisnips


# vim: set tabstop=2 softtabstop=2 shiftwidth=2:

