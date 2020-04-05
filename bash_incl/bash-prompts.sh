
# For a terminal emulator includes a ✔ char in the git prompt thing.
if test "$TERM" == linux ; then
  check=' '
else
  check=$'\u2714'
fi

hr='--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
# Basic prompt. No git brach thing, no node/ruby version.
ps1basic () {
  PS1='\n\[\e[0;34m\]$(printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}")\n\[\e[0;34m\]\w/\[\e[1;0m\]\n\$ '
}

git_version () {
  ver=$(git --version | sed 's/ version / /')
  printf '%s' "$ver"
}

# PS1 with ruler, bash/node/ruby version and git prompt.
ps1all () {
  PS1='\n\[\e[0;34m\]$(printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}")\n\[\e[0;35m\][bash-$(echo -n $BASH_VERSION)] [$(~/.rvm/bin/rvm-prompt)] $(echo -n [node-`node -v`)] \e[0m\[\e[0;35m\][$(git_version)] \e[0;31m$(__git_ps1 "[%s ${check}]")\n\[\e[0;34m\]$(date +'%H:%M:%S') \[\e[0;34m\]\w/ \n \[\e[1;0m\] \n\$ '
}


ps1simple () {
  PS1='\n\[\e[0;34m\]\w \e[0;31m$(__git_ps1 "[%s ${check}]")\n\[\e[1;0m\]\n$ '
}

version_node () {
  printf '%s' "$(node --version)"
}

ps1nodejs () {
  node="$(version_node)"
  dir="${PWD##*/}"

  PS1="\n${blue}$dir ${cyan}[node:$node]\n${black}$ "
}

#
# Sets the default prompt.
#
ps1nodejs

# vim: set filetype=sh softtabstop=2 shiftwidth=2:

