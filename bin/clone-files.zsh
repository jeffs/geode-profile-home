#!/usr/bin/env -S zsh -euo pipefail
#
# Install everything I generally expect to be available, that won't otherwise
# be installed automatically.

d=$(dirname $0)
if [ ! -d ~/.local/share/nvim ]; then $d/install-nvim-plugins.zsh; fi

mkdir -p git ~/usr/bin
git clone git@github.com:jeffs/file.git

git clone git@github.com:jeffs/py-kart.git git/py-kart
ln -s ~/git/py-kart/smarten/main.py ~/usr/bin/smarten

# Do the slowest thing last.
if [ ! -d ~/.cargo ]; then $d/install-rust.zsh; fi
git clone git@github.com:jeffs/rust-kart.git git/rust-kart
cargo install --path git/rust-kart
