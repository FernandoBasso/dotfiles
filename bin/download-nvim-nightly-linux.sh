#!/usr/bin/env bash

{
	mkdir -pv ~/bin

	cd ~/bin

	rm -fv ./nvim.appimage ./nv

	wget \
		https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
		-O ./nvim.appimage

	chmod u+x ./nvim.appimage

	ln -sv ./nvim.appimage ./nv
}
