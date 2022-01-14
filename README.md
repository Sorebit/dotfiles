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
- Extensions: [Just Perfection](https://extensions.gnome.org/extension/3843/just-perfection/), [gTile](https://extensions.gnome.org/extension/28/gtile/)

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

Supported `*.local` configs:
- zsh:
  - `~/.zshrc.local`
  - `~/.zshrc.plugins.local` for plugins
- vim: `~/.vimrc.local`
- tmux: `~/.tmux.conf.local`
- git: `~/.gitconfig.local`

## License

Copyright (c) 2015-2021 Simon. Released under the MIT License. See [LICENSE](/LICENSE) for details.

[dotbot]: https://github.com/anishathalye/dotbot
