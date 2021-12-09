# vim: set filetype=sh:

shopt -s checkwinsize # For hr stuff to work.

##
# Sets the terminal title to just show the working directory
# instead of user@host:pwd. Also, the working directory
# uses a ~/ instead of verbuse /home/youruser.
#
PROMPT_COMMAND='echo -ne "\033]0; $(dirs +0) \007"'

