#!/usr/bin/env zsh
#
# https://github.com/google/evcxr/blob/main/evcxr_repl/README.md

set -euo pipefail

rustup component add rust-src
cargo install evcxr_repl
