# Dotfiles

This repo uses [Dotbot](https://github.com/anishathalye/dotbot) for installation.

### Terminal and shell:

- [gnome-terminal](/gnome-terminal.conf) (using [term-prof](/bin/term-prof) to load and dump profiles)
- [zsh](/zshrc) + [oh-my-zsh](/oh-my-zsh/custom/themes)
- [tmux](/tmux.conf) (a little bit messy, but pretty usable)

### Editors:

- [Vim](/vimrc)
- [Sublime Text 3](/.config/sublime-text-3/Packages/User) *(Ditching soon)*

### Firefox:

- https://github.com/theel0ja/ubo-recommendations
- https://github.com/theel0ja/CrapBlock
- **TODO**: user.js (maybe https://github.com/ghacksuserjs/ghacks-user.js or https://github.com/pyllyukko/user.js)

### Icons:

- [Boston](https://github.com/heychrisd/Boston-Icons)

## Installation

After cloning this repo, run `./install` to automatically set up the development environment.
Note that the install script is idempotent: it can safely be run multiple times.

For the color scheme to look right, you will also need to run `bin/term-prof load gnome-terminal.conf`.

## License

Copyright (c) 2015-2020 Simon. Released under the MIT License. See [LICENSE][/LICENSE] for details.
