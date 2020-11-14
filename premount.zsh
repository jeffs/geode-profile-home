#!/usr/bin/env -S zsh -euo pipefail

# This script starts a container with a detached process that never dies (until
# you manually stop it), so that future invocations of `geode run` need not
# start new containers themselves.
#
# Bind-mounting volumes is very slow in my MacBook for some reason.  Launching
# a new geode-home container takes 6.5s, whereas attaching to an
# existing one takes only 0.5s.

if docker container inspect geode-home >&/dev/null; then
    echo 'error: container is already running' >&2
    exit 1
fi

cd $(dirname $0)
geode run . perl -MPOSIX -e pause </dev/null &
