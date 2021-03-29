FROM {{.Base}}

# Restore man pages, etc. stripped from Ubuntu to minimize default image size.
RUN yes | unminimize

# Check package availability.  To rerun, pass --no-cache to docker image build.
RUN apt-get update -qq

# Set locale.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy locales \
 && locale-gen {{.Locale}} \
 && dpkg-reconfigure --frontend noninteractive locales \
 && echo LC_ALL={{.Locale}} >>/etc/default/locale
ENV LANG={{.Locale}}

# Set time zone.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy tzdata \
 && ln -snf /usr/share/zoneinfo/{{.TimeZone}} /etc/localtime \
 && echo {{.TimeZone}} > /etc/timezone \
 && dpkg-reconfigure --frontend noninteractive tzdata
ENV TZ={{.TimeZone}}

# Install command-line tools.
#
# programming languages:
#       c               # C and C++ toolchain and standard library
#       (build-essential)
#
#       golang          # The Go programming language
#
#       python3         # Python 3 with pip, venv, and headers
#       (mypy python3-pip python3-venv)
#
# network:
#       curl            # HTTP utility
#       libssl-dev      # OpenSSL libraries; required by cargo-audit
#       net-tools       # ifconfig et al
#
#       netcat          # TCP/IP Swiss army knife
#       (netcat-traditional)
#
# basic commands:
#       git             # version control system
#       jq              # parses, queries, transforms, and formats JSON
#       man             # manual page viewer
#       markdown        # converts Markdown files to HTML
#       sudo            # runs commands as superuser
#       zip             # creates or expands .zip compressed archives
#
# enhanced commands:
#       bat             # alternative to cat
#       exa             # alternative to ls and tree
#       fd (fd-find)    # alternative to find
#       neovim          # fork of vim
#       ripgrep         # alternative to grep
#       sl              # steam locomotive when you mistype ls
#       tmux            # terminal multiplexer
#       zsh             # alternative to sh
#
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    build-essential golang python3-pip python3-venv \
    curl libssl-dev net-tools netcat-traditional \
    git jq man markdown sudo zip \
    bat exa fd-find neovim ripgrep sl tmux zsh \
 && python3 -m pip install mypy

# Create myself, and give myself super powers.
#
# Enabling sudo coredumps works around a container bug that makes sudo unhappy:
# https://github.com/sudo-project/sudo/issues/42
RUN useradd -mk /dev/null -s /usr/bin/zsh {{.User}} \
 && echo '{{.User}} ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
 && echo "Set disable_coredump false" >> /etc/sudo.conf

# Make myself the default user.
USER {{.User}}

# Start containers in my home directory.
WORKDIR /home/{{.User}}

CMD {{ja .Command}}
