#!/usr/bin/env -S zsh -euo pipefail
#
# This script installs or updates NeoVim plugins and the Smyck color scheme.

readonly site=~/.local/share/nvim/site
readonly colors="$site/colors"
readonly plugins="$site/pack/plugins/start"

function upsert {
    readonly dir="$plugins/$(basename $1)"
    if [ -d "$dir" ]; then
        (cd "$dir" && git pull --quiet)
    else
        git clone "https://github.com/$1.git" "$dir"
    fi
}

mkdir -p $colors $plugins

# Other useful plugins include:
#
#   rvesse/vim-sparql
for repo in  \
        cespare/vim-toml \
        hashivim/vim-terraform \
        mattn/emmet-vim \
        mbbill/undotree \
        preservim/nerdtree \
        tpope/vim-abolish; do
    upsert "$repo"
done

curl --output "$colors/smyck.vim" --show-error --silent \
    https://raw.githubusercontent.com/hukl/Smyck-Color-Scheme/master/smyck.vim
