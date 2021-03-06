# ~/.bashrc utf8=✔ 💩 ‽ λ

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


git_prompt_locations=(
	'/usr/share/git/git-prompt.sh' # Arch Linux
	'/usr/local/Cellar/git/2.32.0/etc/bash_completion.d/git-prompt.sh' # Mac
	'/usr/local/Cellar/git/2.32.0/etc/bash_completion.d/git-completion.bash' # Mac
)

for file in "${git_prompt_locations[@]}" ; do
  if [ -f "$file" ] ; then source "$file" ; fi
done

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/Projects/dotfiles/bin:$HOME/local/bin"

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##
# Java, JDK
#
# This works for Arch Linux, which has the ‘archlinux-java’ command to switch
# between different java versions and implementations.
#
# • https://wiki.archlinux.org/index.php/Java
#
# export JAVA_HOME=/usr/lib/jvm/default

##
# Maven
#
# • http://maven.apache.org/
#
PATH="$PATH:$HOME/bin/apache-maven-3.6.3/bin"

#
# FZF
# https://github.com/junegunn/fzf
# https://wiki.archlinux.org/index.php/Fzf
#
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

export FZF_DEFAULT_OPTS='--preview-window right:36%'

export DENO_INSTALL="$HOME/.deno"
PATH="$PATH:$DENO_INSTALL/bin"

PATH="$PATH:$HOME/local/bin/chicken-5.2.0/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


if [[ $(hostname) = 'work1' ]] ; then
    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
            source /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
            source /etc/bash_completion
        fi
    fi
fi


#
# BASIC SETTINGS
#
# We don't want C-s to lock and terminal (which is unlocked with C-q).
stty -ixon

MANWIDTH=80

unset HISTFILESIZE
HISTSIZE=2000
HISTCONTROL=ignorespace,erasedups
shopt -s histappend

export HISTSIZE
export MANWIDTH
export EDITOR=vim
export BROWSER=firefox

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

#
# https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue
#
if [ "$TILIX_ID" ] || [ "$TERMINATOR_UUID" ] ; then
  #
  # NOTE:
  # If your system does not contain /etc/profile.d/vte.sh, run:
  #
  #   sudo ln -s \
  #       /etc/profile.d/vte-<some-version>.sh \
  #       /etc/profile.d/vte.sh
  #
  [ -f /etc/profile.d/vte.sh ] && source /etc/profile.d/vte.sh
fi

#
# My own customizations require that programs like Ruby, Node and other things
# be known beforehand so my Bash stuff is aware of them.
#

#
# Path for files that are sourced.
#
path_incl=~/Projects/dotfiles/bash_incl

to_source=(
  "$path_incl/bash-colors.sh"
  "$path_incl/bash-prompts.sh"
  "$path_incl/bash-aliases.sh"
  "$path_incl/bash-utils.sh"
  "$path_incl/gen-passwords.sh"
  "$path_incl/git-helpers.sh"
  "$path_incl/wrappers.sh"
  "$path_incl/c-helpers.sh"
  ~/work/local/local.bash
  ~/local/lib/node-completions.sh
  ~/local/lib/deno-completions.sh
)

for file in "${to_source[@]}" ; do
  if [[ -f "$file" ]] ; then
    source "$file"
  fi
done

##
# Kitty terminal emulator
#
# • https://sw.kovidgoyal.net/kitty/index.html#completion-for-kitty
#
source <(kitty + complete setup bash)

[ -f "/Users/fernando/.ghcup/env" ] && source "/Users/fernando/.ghcup/env" # ghcup-env

#
# https://github.com/rupa/z
#
#   pacman -S z
#   man z
#
# @NOTE: This _MUST_ be included _AFTER_ my local bash stuff otherwise
# my stuff overwrites PROMPT_COMMAND stuff from ‘z’ (check ‘man z’) and
# it breaks ‘z’, which stops creating ‘~/.z’ and/or updating the entries.
#
[ -r /usr/share/z/z.sh ] && source /usr/share/z/z.sh
[ -r ~/bin/z.sh ] && source ~/bin/z.sh

##
# FZF installed manually from the GIT repo:
#
# https://github.com/junegunn/fzf#using-git
#
fzf_to_source=(
  ~/.fzf.bash # From git repo
  /usr/local/opt/fzf/shell/completion.bash # brew macos fzf
)

for file in "${fzf_to_source[@]}" ; do
  if [ -f "$file" ] ; then
    source "$file"
  fi
done

# vim: set textwidth=78:
# vim: set nowrap:
