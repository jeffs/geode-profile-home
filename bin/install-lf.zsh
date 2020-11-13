#!/usr/bin/env -S zsh -euo pipefail

# Install the [lf]( https://github.com/gokcehan/lf ) file explorer.
#
# To install a particular version, specify (e.g.): github.com/gokcehan/lf@r17
CGO_ENABLED=0 GO111MODULE=on go get -u -ldflags="-s -w" github.com/gokcehan/lf
