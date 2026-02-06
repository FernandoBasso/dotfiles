# shellcheck disable=2034,2154

##
# Also see ~/work/local/local.bash.
#
#  (hack nerd font mono)
# λ
# 💛️
#
# Let's default to the traditional “$” char 😄
#
BASH_PROMPT_CHAR="${BASH_PROMPT_CHAR:-$}"

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

version_bash () {
  printf 'bash-%s' "$(printf '%s' "$BASH_VERSION" | sed 's/[^0-9.]//g')"
}

version_git () {
	if command -v git 2>&1 1> /dev/null
	then
		printf ' git-%s' "$(git --version | sed 's/[^0-9.]//g')"
	fi
}

version_ruby () {
	if command -v ruby 2>&1 1> /dev/null
	then
		printf ' ruby-%s' "$(ruby --version | tr -s ' ' | cut -d ' ' -f 2)"
	fi
}

version_node () {
	if command -v node 2>&1 1> /dev/null
	then
		printf ' node-%s' "$(node --version | sed 's/^v//')"
	fi
}

version_npm () {
	if command -v npm 2>&1 1> /dev/null
	then
		printf ' npm-%s' "$(npm --version)"
	fi
}

version_go () {
	if command -v go 2>&1 1> /dev/null
	then
		##
		# Looks like Go 1.25.7 or displays “go version” differently.
		# printf ' go-%s' "$(go version | cut -d ' ' -f 3 | sed 's/^go/&-/')"

		##
		# Works for go 1.25.7.
		#
		printf '%s' "$(go version | cut -d ' ' -f 3 | sed 's/^go/&-/')"
	fi
}

hr='--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'

make_line () {
  printf "%s\n" "${hr:0:${COLUMNS:-$(tput cols)}}"
}

git_info () {
  printf '%s' "$red\$(__git_ps1 "[%s]")"
}

##
# Get aws-vault active profile session information.
#
# aws cli/vault sets the env var AWS_VAULT for the currently active
# profile session. Therefore, we just verify it is set with a
# non-empty value to decide if we display it in the prompty or not.
#
function aws_vault_profile_info () {
	if [[ -z $AWS_VAULT ]]
	then
		return 0
	fi

	printf '(AWS %s ☁️)' "$AWS_VAULT"
}

ps1simplest_nl () {
  PS1="\n${normal}${BASH_PROMPT_CHAR} "
}

ps1simple () {
  PS1="$blue\$(curdir) $red\$(__git_ps1 '[%s]')\n$normal\$ "
}

#
# Contains a leading newline so there is always an empty line
# before the prompt itself.
#
ps1simple_nl () {
  PS1="\n$blue\$(curdir) $red\$(__git_ps1 '[%s]')\n${normal}$BASH_PROMPT_CHAR "
}

#
# PS1 simple, full path, newline
#
ps1sfpnl () {
  PS1="\n$blue\w $red\$(__git_ps1 '[%s]')\n${normal}${BASH_PROMPT_CHAR} "
}

ps1all () {
  PS1="\n${purple}\$(make_line)\n${purple}"
  PS1+="\$(version_bash)"
  PS1+="\$(version_git)"
  PS1+="\$(version_ruby)"
  PS1+="\$(version_node)"
  PS1+="\$(version_npm)"
  PS1+="\n${blue}\w $red\$(__git_ps1 '[%s]')"
  PS1+="\n${normal}${BASH_PROMPT_CHAR} "
}

##
# Similar to ps1all, except shows only the last path part of the
# current directory.
#
ps1all_curdir () {
  PS1="\n${purple}\$(make_line)\n${purple}"
  PS1+="\$(version_bash)]"
  PS1+="\$(version_git)"
	PS1+="\$(version_ruby)"
  PS1+="\$(version_node)"
  PS1+="\$(version_npm)"
	PS1+="\n${blue}\$(curdir) $red\$(__git_ps1 '[%s]')"
  PS1+="\n${normal}${BASH_PROMPT_CHAR} "
}

ps1fullpath () {
  PS1="\n${purple}\$(make_line)\n${purple}"
	PS1+="${blue}\w $red\$(__git_ps1 '[%s]')"
  PS1+="\n${normal}${BASH_PROMPT_CHAR} "
}

##
# PS1 with curdir go version.
#
ps1go0 () {
  PS1="\n${blue}\$(curdir) ${purple}[\$(version_go)]\n${normal}${BASH_PROMPT_CHAR} "
}

##
# PS1 with curdir, go version, git and the aws-vault info.
#
ps1go1 () {
	PS1="\n${blue}\$(curdir) ${purple}\$(version_go) $(git_info) \$(aws_vault_profile_info)\n${normal}${BASH_PROMPT_CHAR} "
}

##
# Similar to ps1all, except shows only the last path part of the
# current directory.
#
ps1_bash_git_go () {
  PS1="\n${purple}\$(make_line)\n${purple}"
  PS1+="bash-\$(version_bash)"
  PS1+="git-\$(version_git)"
  PS1+="\$(version_go)"
	PS1+="\n${blue}\$(curdir) $red\$(__git_ps1 '[%s]')"
  PS1+="\n${normal}${BASH_PROMPT_CHAR} "
}

ps1nodejs () {
  PS1="\n${blue}\$(curdir)${purple}\$(version_node) $(git_info)\n${normal}${BASH_PROMPT_CHAR} "
}

ps1heart () {
  PS1="\n$blue\w $red\$(__git_ps1 '%s')\n$normal💖️ "
}

ps1tux () {
  PS1="\n$blue\w $red\$(__git_ps1 '%s')\n$normal "
}

##
# Sets the default prompt.
#
# This setting may be overridden in ‘~/work/local/local.bash’.
#
ps1tux

# vim: set filetype=sh softtabstop=2 shiftwidth=2:
# vim: set wrap:

