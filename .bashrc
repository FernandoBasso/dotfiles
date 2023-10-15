# ~/.bashrc utf8=✔ 💩 ‽ λ

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


git_prompt_locations=(
	'/usr/share/git/git-prompt.sh' # Arch Linux

	##
	# Looks brew now places git/bash related files in a path
	# that does not require updating with every new version.
	#
	/usr/local/etc/bash_completion.d/git-prompt.sh
	/usr/share/git-core/contrib/completion/git-prompt.sh
	/usr/local/etc/bash_completion.d/git-completion.bash
)

for file in "${git_prompt_locations[@]}" ; do
  if [ -f "$file" ] ; then source "$file" ; fi
done

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/work/src/dotfiles/bin:$HOME/local/bin"

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
PATH="$PATH:$HOME/bin/apache-maven-3.8.4/bin"

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

PATH="$PATH:$HOME/local/build/chicken-5.3.0/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
PATH="$PATH:$HOME/.rvm/bin"
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
path_incl=~/work/src/dotfiles/bash_incl

to_source=(
  "$path_incl/bash-colors.sh"
  "$path_incl/bash-prompts.sh"
  "$path_incl/bash-aliases.sh"
  "$path_incl/bash-utils.sh"
  "$path_incl/bash-functions.sh"
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
# Installed in Arch Linux.
#
z_possible_paths=(
  # Arch Linux through pacman.
  "/usr/share/z/z.sh"

  # Installed manually.
  "$HOME/bin/z.sh"

  # macOS brew.
  "/usr/local/etc/profile.d/z.sh"
)

for z_path in "${z_possible_paths[@]}"; do
  [ -r "$z_path" ] && source "$z_path"
done

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

##
# https://exercism.org/cli-walkthrough
#
exercism_bin_path="$HOME/bin/exercism-linux/shell/exercism_completion.bash"
[ -r "$exercism_bin_path" ] && source "$exercism_bin_path"

export PATH="$PATH:$HOME/local/bin"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

[ -f "/home/fernando/.ghcup/env" ] && source "/home/fernando/.ghcup/env"

##
# For my C stuff.
#
# Check my notes on C and Criterion setup:
#
# • https://github.com/devhowto/devnotes/blob/main/C/README.adoc
#
export CLIBS="$HOME/local/clibs"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$CLIBS/criterion/lib"

#
# vim: set textwidth=78 nowrap:
#
