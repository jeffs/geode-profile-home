#!/usr/bin/env -S zsh -euo pipefail
#
# This script installs the GitHub command-line interface.

declare tmp=$(mktemp -d)
trap "rm -rf $tmp" EXIT

git clone https://github.com/cli/cli.git $tmp/gh-cli
cd $tmp/gh-cli
make

mkdir -p ~/usr/bin
mv bin/gh ~/usr/bin
