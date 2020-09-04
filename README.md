# Dotfiles

This repo uses [Dotbot](https://github.com/anishathalye/dotbot) for installation.

### Terminal and shell:

- [alacritty](/alacritty.yml)
- [zsh](/zshrc) + [oh-my-zsh](/oh-my-zsh/custom/themes)
- [tmux](/tmux.conf) (a little bit messy, but pretty usable)

### Editor:

- [Vim](/vimrc)

### Firefox:

- https://github.com/theel0ja/ubo-recommendations
- https://github.com/theel0ja/CrapBlock
- **TODO**: user.js (maybe https://github.com/ghacksuserjs/ghacks-user.js or https://github.com/pyllyukko/user.js)

### GNOME:

- Icons: [Boston](https://github.com/heychrisd/Boston-Icons)
- [Keybindings](keys.conf) (using [gnome-keys](/bin/gnome-keys) for loading and dumping)

## Installation

After cloning this repo, run `./install` to automatically set up the development environment.
Note that the install script is idempotent: it can safely be run multiple times.

## Local changes

Supported `*.local` configs:
- zsh: `~/.zshrc.local`
- vim: `~/.vimrc.local`
- tmux: `~/.tmux.conf.local`
- git: `~/.gitconfig.local`

## License

Copyright (c) 2015-2020 Simon. Released under the MIT License. See [LICENSE](/LICENSE) for details.

## TODO

- System: Figure out system-wide clipboard (that means terminal and vim count, too)
- Vim: Learn to use vim with multiple files (nerdtree will come in handy)
- Vim: Add configurable rulers as in subl
- Vim: Basically copy subl setup (whitespace and stuff, maybe checkout subvim and vim-sublime)
- Vim: Fix pasting
- Wallpapers: consider making it a submodule
