# vim: set filetype=sh:

alias ls='ls --color=auto --classify'
alias l1='ls --color=auto --classify -1'
alias l1d='ls --color=auto --classofy -1 --group-directories-first'
alias ll='ls --color=auto --classify --human-readable --almost-all -o'
alias lsd='ls --group-directories-first'
alias t='tree -a -C'
alias P='pacman-color'

#
# Let's use ‘--interactive’ by default to avoid unwittingly
# overwriting files. Better safe than sorry.
#
alias cp='cp --verbose --interactive'

#
# Vim-related aliases.
#
#
# For this alias, also see tmux/themes/tmux-light.conf.
#
alias vimlight='vim -c "colorscheme mylight1" -c "AirlineTheme xtermlight"'

alias fzf=fzf --delimiter=: --preview='bat --style=numbers --color=always {1}'

