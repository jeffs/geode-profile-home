#!/usr/bin/env -S zsh -euo pipefail
#
# Install everything I generally expect to be available, that won't otherwise
# be installed automatically.

mkdir -p ~/git ~/usr/bin

d=$(dirname $0)
if [ ! -d ~/.local/share/nvim ]; then $d/install-nvim-plugins.zsh; fi
if [ ! -d ~/opt/fzf ]; then $d/install-fzf.zsh; fi

if [ ! -d ~/file ]; then
    git clone git@github.com:jeffs/file.git ~/file
fi

if [ ! -d ~/git/py-kart ]; then
    git clone git@github.com:jeffs/py-kart.git ~/git/py-kart
    for program in smarten url yesterday; do
        ln -s ~/git/py-kart/$program/main.py ~/usr/bin/$program
    done
fi

# Do the slowest thing last.
if [ ! -d ~/git/rust-kart ]; then
    if [ ! -d ~/.cargo ]; then $d/install-rust.zsh; fi
    git clone git@github.com:jeffs/rust-kart.git ~/git/rust-kart
    cargo install --path ~/git/rust-kart
fi
