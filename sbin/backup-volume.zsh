#!/usr/bin/env zsh

set -euo pipefail

docker volume create --name bak-geode-eai
docker container run --rm \
    -v geode-home:/from \
    -v bak-geode-home:/to \
    alpine ash -c 'cd /from ; cp -av . /to'
