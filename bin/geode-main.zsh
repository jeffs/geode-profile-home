#!/usr/bin/env -S zsh -euo pipefail
#
# Geode runs this script by default when it starts (or attaches) a container.

if [[ ! -v SSH_AUTH_SOCK ]]; then
    if tmux showenv -g SSH_AUTH_SOCK >& /dev/null; then
        export $(tmux showenv -g SSH_AUTH_SOCK)
    else
        eval `ssh-agent`
        tmux start
        tmux setenv -g SSH_AUTH_SOCK $SSH_AUTH_SOCK
    fi
fi

exec tmux new -As Geode
