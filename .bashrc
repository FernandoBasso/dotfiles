# ~/.bashrc utf8=✔ 💩 ‽ λ

# shellcheck source=/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Arch Linux
[[ -f /usr/share/git/completion/git-prompt.sh ]] && source '/usr/share/git/git-prompt.sh'

# Fedora
[[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]] && source '/usr/share/git-core/contrib/completion/git-prompt.sh'

PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/Projects/dotfiles/bin:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#
# FZF
# https://github.com/junegunn/fzf
# https://wiki.archlinux.org/index.php/Fzf
#
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

export DENO_INSTALL="$HOME/.deno"
PATH="$PATH:$DENO_INSTALL/bin"

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
    source /etc/profile.d/vte.sh
fi

#
# https://github.com/rupa/z
#
#   pacman -S z
#   man z
#
[ -r /usr/share/z/z.sh ] && source /usr/share/z/z.sh
[ -r ~/bin/z.sh ] && source ~/bin/z.sh


#
# My own customizations require that programs like Ruby, Node and other things
# be known beforehand so my Bash stuff is aware of them.
#

#
# Path for files that are sourced.
#
path_incl=~/Projects/dotfiles/bash_incl


source "$path_incl/bash-colors.sh"
source "$path_incl/bash-prompts.sh"
source "$path_incl/bash-aliases.sh"
source "$path_incl/bash-utils.sh"
source "$path_incl/gen-passwords.sh"
source "$path_incl/git-helpers.sh"
source "$path_incl/wrappers.sh"

#
# Work-related stuff. I'm better off not committing this to
# any public repo.
#
[ -e "$path_incl/workprojs.sh" ] && source "$path_incl/workprojs.sh"


# vim: set textwidth=78:
# vim: set nowrap:

