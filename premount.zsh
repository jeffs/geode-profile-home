#!/usr/bin/env -S zsh -euo pipefail

# This script starts a container with a detached process that never dies (until
# you manually stop it), so that future invocations of `geode run` need not
# start new containers themselves.

if docker container inspect geode-home >&/dev/null; then
    echo 'error: container is already running' >&2
    exit 1
fi

cd $(dirname $0)
geode run . sh -c 'echo premount: Ready; perl -MPOSIX -e pause' </dev/null &
