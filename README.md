![screenshot](/bin/assets/screenshot.png)

### Terminal and shell:

- [alacritty](/alacritty.yml)
- [zsh](/zshrc) + [oh-my-zsh](/oh-my-zsh/custom/themes)
- [tmux](/tmux.conf) (a little bit messy, but pretty usable)

### Editor:

- [Vim](/vimrc) + [plugins](/vim/pack/vendor/start)

### Firefox:

- https://github.com/theel0ja/ubo-recommendations
- https://github.com/theel0ja/CrapBlock
- **TODO**: user.js (maybe https://github.com/ghacksuserjs/ghacks-user.js or https://github.com/pyllyukko/user.js)

### GNOME:

- Icons: [Boston](https://github.com/heychrisd/Boston-Icons)
- [Keybindings](keys.conf) (using [gnome-keys](/bin/gnome-keys) for loading and dumping)
- Extensions: [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/)
- [Utility script](/bin/adwaita-shell) for extracting and installing default Adwaita theme on Ubuntu

## Installation

This repo uses [Dotbot][dotbot] for installation.

**Clone:**

```
$ git clone https://github.com/sorebit/dotfiles ~/.dotfiles
```

**Install with [Dotbot][dotbot]:**

```shell
$ cd ~/.dotfiles
$ ./install
```

**Note**, that the install script is idempotent: it can safely be run multiple times.

## Local changes

These dotfiles support adding local configuration files which are not stored in the repo.
This might comes handy when configuration needs to contain some secrets or credentials (eg. gitconfig)

Supported `*.local` configs:
- ZSH:
  - `~/.zshrc.plugins.local` - sourced *before* oh-my-zsh (see [zshrc](/zshrc) for more details)
  - `~/.zshrc.local` - sourced *after* oh-my-zsh
- Vim: `~/.vimrc.local`
- TMUX: `~/.tmux.conf.local`
- Git: `~/.gitconfig.local`

## Third party submodules (see /dist):

- 

## License

Copyright (c) 2015-2022 Simon. Released under the MIT License. See [LICENSE](/LICENSE) for details.

[dotbot]: https://github.com/anishathalye/dotbot
