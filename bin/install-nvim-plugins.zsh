#!/usr/bin/env -S zsh -euo pipefail

# Install plugins for Neovim.
d=~/.local/share/nvim/site/pack/plugins/start
mkdir -p $d && cd $d
git clone git@github.com:preservim/nerdtree.git
git clone git@github.com:cespare/vim-toml.git
