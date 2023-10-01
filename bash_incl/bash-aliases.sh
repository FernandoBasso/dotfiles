# vim: set filetype=sh:

########################################################################
# ls INI
#
alias ls='ls --color=auto --classify'
alias l1='ls --color=auto --classify -1'
alias l1d='ls --color=auto --classofy -1 --group-directories-first'
alias ll='ls --color=auto --classify --human-readable --almost-all -o'
alias lsd='ls --group-directories-first'
alias P='pacman-color'
#
# ls END
########################################################################

########################################################################
# cp INI
#
# Let's use ‘--interactive’ by default to avoid unwittingly
# overwriting files. Better safe than sorry.
#
alias cp='cp --verbose --interactive'
#
# cp END
########################################################################


########################################################################
# fzf INI
#
alias fzf=fzf --delimiter=: --preview='bat --style=numbers --color=always {1}'
#
# fzf END
########################################################################

########################################################################
# Git END
#
# Git mechanism for aliases is helpful, but it has some shortcomings. For
# one thing, we just type `git <some command>'. We can't have something
# quick and simple as `gl' for a customized `git log' or `gs' for some
# `git status' command. Also, I couldn't find a way to have it work with
# ENV VARS.
#
# So, here are some bash (not git) aliases around some git commands.
#
# TODO: I still need to try to figure out if there are other programs
# whose names would clash with my aliases for git below. Perhaps I could
# make my aliases always start with an uppercase ‘G’ or something else.
##

##
# Just like a `git log' but with custom options. I use this one most for
# work related tasks where I want to save my commits to my org-mode
# notes so I can have a reference in case the repository gets messy or I
# just need a refresher on something.
#
# Usage Examples
# --------------
#
# No limit. We can keep paging:
#
# 	$ gci
#
# Just the last commit:
#
# 	$ gci -1
#
alias gci="COLUMNS=78 git log --format=$'\n %s\n %h %an <%ae>' --abbrev=11 --stat"

##
# Git Status.
#
# Usage:
#
# 	$ gst
#
alias gst='git status'

##
# Git Log.
#
# Usage:
#
# 	$ gl
# 	$ gl -3
#
alias gl='git log'

##
# Git log oneline with graph.
#
# Usage:
#
# 	$ g1l
# 	$ g1l -5
#
alias g1l='git log --oneline --graph'

##
# Git log last 1 commit.
#
# Usage:
#
# 	$ gl1
# 	$ gl1 --stat
# 	$ gl1 --patch-with-stat
#
alias gl1='git log -1'

##
# Git log last 1 commit with stat.
#
# Usage:
#
# 	$ gl1s
#
alias gl1s='git log -1 --stat'

##
# Git log last 1 commit with patch and stat.
#
# Usage:
#
# 	$ gl1ps
#
alias gl1ps='git log -1 --patch-with-stat'

#
# Git END
########################################################################

########################################################################
# VirtualBox INI
#

alias vboxm=VBoxManage

alias vbox_nbsdc='VBoxManage startvm nbsdC --type headless'

alias vbox_debc='VBoxManage startvm DebC --type headless'

#
# VirtualBox END
########################################################################
