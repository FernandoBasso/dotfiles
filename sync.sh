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

# vim: set tabstop=2 softtabstop=2 shiftwidth=2:

