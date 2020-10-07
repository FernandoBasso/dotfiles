# shellcheck disable=2034,2154

#
# Git Prompt
# ==========
#
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=verbose
GIT_PS1_SHOWCOLORHINTS=1


curdir () {
  printf '%s' "${PWD##*/}"
}

version_git () {
  printf '%s' "$(git --version | sed 's/[^0-9.]//g')"
}

version_node () {
  printf '%s' "$(node --version | sed 's/^v//')"
}

version_bash () {
  printf '%s' "$(printf '%s' "$BASH_VERSION" | sed 's/[^0-9.]//g')"
}

hr='--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

make_line () {
  printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}"
}

git_info () {
  printf '%s' "$red\$(__git_ps1 "[%s]")"
}

ps1simple () {
  PS1="$blue\$(curdir) $red\$(__git_ps1 '[%s]')\n$normal\$ "
}

#
# Contains a leading newline so there is always an empty line
# before the prompt itself.
#
ps1simple_nl () {
  PS1="\n$blue\$(curdir) $red\$(__git_ps1 '[%s]')\n$normal\$ "
}

#
# PS1 simple, full path, newline
#
ps1sfpnl () {
  PS1="\n$blue\w $red\$(__git_ps1 '[%s]')\n$normal\$ "
}

ps1all () {
  PS1="\n${purple}\$(make_line)\n${purple}[bash-\$(version_bash)] [git-\$(version_git)] [$(~/.rvm/bin/rvm-prompt)] [node-\$(version_node)]"
  PS1+="\n${blue}\w $red\$(__git_ps1 '[%s]')\n$normal\$ "
}

ps1nodejs () {
  PS1="\n${blue}\$(curdir) ${purple}[node-\$(version_node)] $(git_info)\n${normal}$ "
}

ps1heart () {
  PS1="\n$blue\w $red\$(__git_ps1 '[%s]')\n$normal💖️ "
}

ps1tux () {
  PS1="\n$blue\w $red\$(__git_ps1 '[%s]')\n$normal "
}

##
# Sets the default prompt.
#
# This setting may be overridden in ‘~/work/local/local.bash’.
#
ps1tux

# vim: set filetype=sh softtabstop=2 shiftwidth=2:
# vim: set wrap:

