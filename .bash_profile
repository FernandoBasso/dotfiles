# vim: set filetype=sh:

# It seems tmux won't load ~/.bashrc by default, but it reads
# ~/.bash_profile by default.
[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

##
# Seems to be required with some terminal applications. In my case, it was
# necessary with [n]vim + vim-gnupg.
#
GPG_TTY=`tty`
export GPG_TTY

##############################################################################
# GNU Coreutils on MACOS
# On the shell, run this:
#
#   $ find /usr/local/opt -type d -follow -name gnubin -print
#
# Then paste the output lines on this array.
#
# REFS:
# • https://gist.github.com/skyzyx/3438280b18e4f7c490db8a2a2ca0b9da
# • https://github.com/fabiomaia/linuxify
# • https://apple.stackexchange.com/questions/69223/how-to-replace-mac-os-x-utilities-with-gnu-core-utilities
#
gnubins=(
  '/usr/local/opt/coreutils/libexec/gnubin'
  '/usr/local/opt/gnu-indent/libexec/gnubin'
  '/usr/local/opt/gnu-tar/libexec/gnubin'
  '/usr/local/opt/grep/libexec/gnubin'
  '/usr/local/opt/gnu-sed/libexec/gnubin'
  '/usr/local/opt/gsed/libexec/gnubin'
  '/usr/local/opt/gawk/libexec/gnubin'
  '/usr/local/opt/findutils/libexec/gnubin'
  '/usr/local/opt/sphinx-doc/bin'
  '/usr/local/opt/make/libexec/gnubin'
  '/usr/local/opt/gcc/bin'
)

for gnubin in "${gnubins[@]}"; do
  PATH="$gnubin:$PATH"
done

##
# From `brew install openjdk@11`.
#
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export JAVA_HOME='/usr/local/opt/openjdk@11'

##
# Installing bash and coreutils stuff on MacOS does not setup
# completions automatically like it is the case on Linux.
#
if command -v brew &> /dev/null
then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
  fi
fi

if [ -f ~/work/local/npm-completion.bash ]; then
  source ~/work/local/npm-completion.bash
fi

