#!/usr/bin/env -S zsh -euo pipefail

# Install plugins for Neovim.
d=~/.local/share/nvim/site/pack/plugins/start
mkdir -p $d && cd $d
git clone https://github.com/cespare/vim-toml.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/mbbill/undotree.git
git clone https://github.com/preservim/nerdtree.git
git clone https://github.com/rvesse/vim-sparql

# Install the Smyck color scheme.
d=~/.local/share/nvim/site/colors
mkdir $d && cd $d
curl -OSs https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/smyck.vim
