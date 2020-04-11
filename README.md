# Fernando Basso Dotfiles

## Instructions

Clone the repository and run `sync.sh`:

```shell-session
$ cd $HOME/Projects
git clone git@gitlab.com:fernandobasso/dotfiles.git dotfiles
cd !$
bash sync.sh
```



## My Tmux Workflow

I use [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) so I don't have to constantly create shell scripts or start sessions with a dozen params manually. There are a few projects I am always working on, so, I just save and restore my entire Tmux “env” with a couple of key-strokes.

I am not using tmux-resurrect optional saving and restoring of Vim (perhaps in the future, if I feel the need for it).

* Run Tmux by simply typing `tmux` on the terminal.
* From that initial dummy session, I restore my previously saved session with `C-b C-r`.
* I use a Vim wrapper [bash script](https://gitlab.com/fernandobasso/dotfiles/-/blob/master/bash_incl/wrappers.sh) and _always_ start Vim instances as servers, so, I type `v SESSION-NAME &lt;extra vim arguments&gt;.
* When I want to stop all sessions, reboot or shutdown the computer, I need to close all Tmux sessions, but I don't want to abruptly kill Vim, so, I send a message to all running Vim servers to quit themselves without saving. I do that with [another script](https://gitlab.com/fernandobasso/dotfiles/-/blob/master/bin/hvim.sh): `hvim.sh -k`.
* I then save the Tmux state with `C-b C-s` (only if I changed something in any of the sessions) and kill the entire Tmux server with `C-b :kill-server`.



In short:

```
$ tmux           # from the shell
C-b C-r          # from inside tmux, load last saved state
v PROJECT-X      # vim server
...work...
kvim.sh -k       # from the shell, close all vim instances
C-b C-s          # from inside tmux, save state
C-b :kill-server # from inside tmux, quit tmux

```



## TODO

Allow for commented lines and empty lines in the manifest file.

