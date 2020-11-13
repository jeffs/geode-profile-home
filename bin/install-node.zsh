#!/usr/bin/env -S zsh -euo pipefail

local nvm_dir=~/.nvm

# Install [Node Version Manager]( https://github.com/nvm-sh/nvm ).
git clone --depth=1 https://github.com/creationix/nvm.git $nvm_dir

# Install the latest stable (Lifetime Support) version of Node.
source $nvm_dir/nvm.sh
nvm install --lts
