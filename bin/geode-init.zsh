#!/usr/bin/env -S zsh -euo pipefail
#
# This script initializes my home directory.  Geode calls this script only
# once, when it creates the Docker volume where my home directory lives.

# Install [oh-my-zsh]( https://ohmyz.sh/#install ).
u=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
curl -fsSL $u | sh

# Install a syntax highlighting plugin for Zsh.
#
# To install a particular version: git clone --branch=0.7.1 ...
u=https://github.com/zsh-users/zsh-syntax-highlighting.git
o=~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 $u $o

# Symlink dot-files.
mkdir -p ~/.config
ln -s ~/conf/etc/nvim ~/.config/nvim
for f in gitconfig tmux.conf zprofile zshrc; do
    ln -fs ~/conf/etc/$f ~/.$f
done

# Create cache and history directories for Neovim.
for d in back swap undo view; do
    mkdir -p ~/var/nvim/$d
done
