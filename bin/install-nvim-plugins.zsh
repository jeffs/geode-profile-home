#!/usr/bin/env -S zsh -euo pipefail

# Install plugins for Neovim.
d=~/.local/share/nvim/site/pack/plugins/start
mkdir -p $d && cd $d
git clone https://github.com/cespare/vim-toml.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/preservim/nerdtree.git
