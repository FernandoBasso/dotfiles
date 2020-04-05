#
# Git Prompt
# ==========
#
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=git


# For a terminal emulator includes a ✔ char in the git prompt thing.
if test "$TERM" == linux ; then
  check=' '
else
  check=$'\u2714'
fi

curdir () {
  printf '%s' "${PWD##*/}"
}

version_git () {
  ver=$(git --version | sed 's/ version / /')
  printf '%s' "$ver"
}

version_node () {
  printf '%s' "$(node --version)"
}

hr='--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
# Basic prompt. No git brach thing, no node/ruby version.
ps1basic () {
  PS1='\n\[\e[0;34m\]$(printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}")\n\[\e[0;34m\]\w/\[\e[1;0m\]\n\$ '
}

# PS1 with ruler, bash/node/ruby version and git prompt.
ps1all () {
  PS1='\n\[\e[0;34m\]$(printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}")\n\[\e[0;35m\][bash-$(echo -n $BASH_VERSION)] [$(~/.rvm/bin/rvm-prompt)] $(printf '%s' [node-`node -v`)] \e[0m\[\e[0;35m\][$(version_git)] \e[0;31m$(__git_ps1 "[%s ${check}]")\n\[\e[0;34m\]$(date +'%H:%M:%S') \[\e[0;34m\]\w/ \n \[\e[1;0m\] \n\$ '
}


ps1simple () {
  PS1='\n\[\e[0;34m\]\w \e[0;31m$(__git_ps1 "[%s]")\n\[\e[1;0m\]\n$ '
}

git_info () {
  printf '%s' "$red\$(__git_ps1 "[%s]")"
}

ps1nodejs () {
  PS1="\n${blue}\$(curdir) ${cyan}[node:\$(version_node)] $(git_info)\n${normal}$ "
}


#
# Sets the default prompt.
#
ps1nodejs

# vim: set filetype=sh softtabstop=2 shiftwidth=2:
# vim: set nowrap:

