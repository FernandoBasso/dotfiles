# vim: set filetype=sh:

# It seems tmux won't load ~/.bashrc by default, but it reads
# ~/.bash_profile by default.
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
