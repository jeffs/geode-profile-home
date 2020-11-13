#!/usr/bin/env -S zsh -euo pipefail

# Install the [Rust]( https://www.rust-lang.org/ ) toolchain.
curl -fsSLo /tmp/rustup.sh https://sh.rustup.rs/
sh /tmp/rustup.sh -q -y --no-modify-path
rm /tmp/rustup.sh
