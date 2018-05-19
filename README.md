# Fernando Basso Dotfiles

## Instructions

- Clone the repo;
- Change to the cloned repository's directory;
- Do a dry run first (read the output carefully);
- Run it for real;

```bash
sudo pacman -S rsync --needed
git clone <this project> ~/Dotfiles
git clone https://github.com/FernandoBasso/dotfiles ~/Projects/
cd !$
bash sync.sh --dry-run

# Finally, if you are sure you'll not override files you don't mean to:
bash sync.sh --sync
```

NOTE: Everytime a dotfile is to be edited, edit it (the file) from the repository's directory, then use `sync.sh` again to sync the changes to your `$HOME`. That is, do not edit, for instance, `~/.bashrc`. Rather, edit `~/Projects/dotfiles/.bashrc` and then:

```bash
bash ~/Projects/dotfiles/sync.sh --dry-run
bash ~/Projects/dotfiles/sync.sh --sync
```

## Fresh Machine

Or a fresh $HOME directory...

Do the steps above and optionally install vim stuff:

```bash
bash ~/Projects/dotfiles/sync.sh --setup-vim
```

TODO: Create a `setup_emacs` function since I used Emacs a lot as well.


