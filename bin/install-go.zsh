#!/usr/bin/env zsh
#
# Technically, this script installs only tooling useful with Go.  It assumes Go
# itself is already installed.

set -euo pipefail

go install golang.org/x/tools/cmd/goimports@latest
