# vim: set filetype=sh:

# It seems tmux won't load ~/.bashrc by default, but it reads
# ~/.bash_profile by default.
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

##
# Seems to be required with some terminal applications. In my case, it was
# necessary with [n]vim + vim-gnupg.
#
GPG_TTY=`tty`
export GPG_TTY

