# Geode Profile: Home

This is my primary [Geode][] profile.  The contents are as follows.

    README.md     This file

For use on the host machine:

    Dockerfile    Template for the file Geode passes to `docker image build`
    docker.toml   Settings for how Geode should create and run containers

For use in the guest container:

    bin/          Executable scripts
    etc/          Config files for my shell, editor, etc.

## Tips

By default, entering the keys ctrl-p,ctrl-q in an interactive Docker container
detaches the container from the terminal.  Unforunately, this means Docker
intercepts the keystroke ctrl-p, even when it was intended for a shell, editor,
or other terminal-based application hosted in the container.  As a work-around,
you can set a different sequence of "detach keys" in the config file
`~/.docker/config.json` on the host machine:

    {
      "detachKeys": "ctrl-\\,\\"
    }

[Geode]: https://github.com/jeffs/geode
