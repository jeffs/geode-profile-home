#!/usr/bin/env -S zsh -euo pipefail
#
# This script is meant to install Rust Analyzer support for Neovim.  It doesn't
# work though, because when I try to run an LSP client command in Neovim, it
# only prints the following error:
#
#   [LC] sending on a disconnected channel
#
# I have verified that rust-analyzer is in Vim's Path, Node is runnable, etc.

# Download the source code for the Rust standard library:
rustup component add rust-src

# Install the rust-analyzer binary.
git clone https://github.com/rust-analyzer/rust-analyzer.git ~/pkg/rust-analyzer
cd ~/pkg/rust-analyzer
cargo xtask install --server

# Install an LSP client plugin for Vim.  See:
# https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
cd ~/.local/share/nvim/site/pack/plugins/start
git clone --depth 1 https://github.com/autozimu/LanguageClient-neovim.git
cd LanguageClient-neovim
bash install.sh

# Enable the plugin in my Vim RC file.
cd $(dirname $0)
cat lc.vim >> ../etc/nvim/init.vim
