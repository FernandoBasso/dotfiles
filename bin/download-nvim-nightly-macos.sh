#!/usr/bin/env bash

{
  cd ~/bin

  wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz -O ./nvim-macos.tar.gz

  xattr -c ./nvim-macos.tar.gz

  tar zxvf ./nvim-macos.tar.gz

  rm -rv ./nvim-macos.tar.gz

	rm -v ~/bin/nv

  ln -sv ~/bin/nvim-macos/bin/nvim ~/bin/nv
}
