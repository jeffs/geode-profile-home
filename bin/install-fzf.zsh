#!/usr/bin/env -S zsh -euo pipefail

# Install the [fzf]( https://github.com/junegunn/fzf#using-git ) fuzzy finder.

mkdir -p ~/opt ~/usr/bin
git clone --depth 1 https://github.com/junegunn/fzf.git ~/opt/fzf

~/opt/fzf/install --bin --no-update-rc --no-bash --no-zsh --no-fish
for f in ~/opt/fzf/bin/*; do
    ln -s $f ~/usr/bin
done
