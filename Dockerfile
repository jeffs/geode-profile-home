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
#       clang-format    # C/C++ beautifier
#       cmake           # CMake build file generator
#       golang          # The Go programming language
#
#       python3         # Python 3 with pip, venv, and headers
#       (mypy python3-pip python3-venv)
#
# network:
#       curl            # HTTP utility
#       libssl-dev      # OpenSSL libraries; required by cargo-audit
#       net-tools       # ifconfig et al
#       ping            # iputils-ping
#       rsync           # tool for synchronizing directory contents
#       whois           # shows domain names registration details
#
#       netcat          # TCP/IP Swiss army knife
#       (netcat-traditional)
#
# basic commands:
#       file            # guesses file types
#       git             # version control system
#       jq              # parses, queries, transforms, and formats JSON
#       man             # manual page viewer
#       markdown        # converts Markdown files to HTML
#       cal (ncal)      # calendar
#       sudo            # runs commands as superuser
#       zip             # creates or expands .zip compressed archives
#
# enhanced commands:
#       bat             # alternative to cat
#       fd (fd-find)    # alternative to find
#       neovim          # fork of vim
#       ripgrep         # alternative to grep
#       sl              # steam locomotive when you mistype ls
#       tmux            # terminal multiplexer
#       zsh             # alternative to sh
#
# data:
#       lsb-release     # /etc/lsb-release
#       wamerican       # /usr/share/dict/words
#
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy \
    build-essential clang-format cmake golang python3-pip python3-venv \
    curl file iputils-ping libssl-dev net-tools netcat-traditional rsync whois \
    git jq man markdown ncal sudo zip \
    bat fd-find neovim ripgrep sl tmux zsh \
    lsb-release wamerican \
 && python3 -m pip install mypy

# Install a web browser so I can run (headless) JavaScript test drivers.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy firefox

# Install the AWS CLI, which is a prerequisite for Terraform.
RUN curl -OSs https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip \
 && unzip awscli-exe-linux-x86_64.zip \
 && ./aws/install \
 && rm -fr aws awscli-exe-linux-x86_64.zip

# Install the Terraform CLI.
RUN curl -Ss https://apt.releases.hashicorp.com/gpg \
        | gpg --dearmor > /usr/share/keyrings/hashicorp-archive-keyring.gpg \
 && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list \
 && DEBIAN_FRONTEND=noninteractive apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get install terraform

# Install Java.
RUN DEBIAN_FRONTEND=noninteractive apt-get install -qqy default-jdk-headless

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
