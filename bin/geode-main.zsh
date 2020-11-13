#!/usr/bin/env -S zsh -euo pipefail
#
# Geode runs this script by default when it starts (or attaches) a container.

if [[ ! -v SSH_AUTH_SOCK ]]; then
    eval `ssh-agent` >/dev/null
fi

exec tmux new -As Geode
