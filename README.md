# Fernando Basso Dotfiles

* [Node and Deno Bash Completion](#node-and-deno-bash-completion)
* [Git Whitespace Errors](#git-whitespace-errors)
* [TODO](#todo)

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



## Node and Deno Bash Completion

From time to time, update the completion scripts as necessary (like when changing versions or upgrading to new versions). Run these from bash, as a normal user:

```
mkdir -pv ~/local/lib
npm completion > ~/local/lib/node-completions.sh
deno completions bash > ~/local/lib/deno-completions.sh
```

## Git Whitespace Errors

There are specific situations where we need blank lines at the end of files. One such case is with YASnippet. If I have a snippet like this:

```
dotfiles [devel *% u+2]
$ bat --terminal-width=62 .emacs.d/my-yasnippets/rst-mode/code.snip.txt
───────┬──────────────────────────────────────────────────────
       │ File: .emacs.d/my-yasnippets/rst-mode/code.snip.txt
───────┼──────────────────────────────────────────────────────
   1   │ # -*- mode: snippet -*-
   2   │ # name: .. code-block::
   3   │ # key: code
   4   │ # --
   5   │ .. code-block:: $1
   6   │
   7   │    ${2:code here}
   8   │
───────┴──────────────────────────────────────────────────────
```

That last line (8) has to be there for this snippet. We want to have one empty line after the content in `${2:code}`. But since for the snippet file itself it becomes the last line of a file, git complains about whitespace errors. We could configure git to ignore that kind of whitespace errors, but there are other cases where empty lines at the end of files are not desirable at all.

In the case of YASnippet, it does not allow comments after the body of the snippets (they become part of the content/body of the snippet. Not sure if we can do something about this except to ignore whitespace errors for this specific case of empty lines at the end of YASNippet snippets. Vim's Ultisnips uses a python-like DSL and snippets are ended with a keyword `endsnippet`, so, even if there are empty lines at the end of the snippets body, the last line of a snippet file can just be `endsnippet` (and not an empty line). Also, Ultisnips groups multiple snippets for a filetype under a single file for that file type. YASNippet seems to require one file for snippet. I don't think one way is better than the other, though.

On the other hand, I noticed that YASnippet snippets seem to add a newline after expanded snippets even if there isn't one in the snippet body. That is OK.

We can also, if we want an empty line inside YASnippets snippets, end it with the placeholder `$0`, like this:

```
# -*- mode: snippet -*-
# name: .. code-block::
# key: code
# --
.. code-block:: $1

   ${2:code here}
$0
```

The placeholder zero is the ending place for the cursor after the snippet has finished expandign and all its tab pitstops have been consumed. Note above that there is no empty line between `${2:code here}` and `$0`. Still, YASnippet adds one after the snippet is expanded.

We have a file containing one line, and we type `code`:

```
code
An existing line!
```

When we hit `<Tab>`, the expansion gives us:

```
.. code-block:: {tab pit stop 1}

   code here {tab pit stop 2}


An existing line!
```

So yeah, YASnippet added two empty lines between the tab pit stop 2 and the existing line.

If we just end the snippets without any empty line at the end, YASnippet will expand them adding one empty line after the expansion.

As a final note, for global snippets, follow [this issue](https://github.com/joaotavora/yasnippet/issues/557).

## TODO

Allow for commented lines and empty lines in the manifest file.

