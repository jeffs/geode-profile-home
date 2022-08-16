#!/usr/bin/env -S zsh -euo pipefail
#
# This script installs support for the Scala programming language.  See also:
# https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html

# Part of the support we'll need is SBT, the Simple/Scala Built Tool.  SBT's
# documentation advise installation using SDKman; so first, we install SDKman.

readonly sdkman_installer="$(mktemp get-sdkman-XXXXXXXX --suffix=.sh --tmpdir)"
curl --silent --show-error --fail-with-body --output "$sdkman_installer" https://get.sdkman.io
bash "$sdkman_installer"
rm "$sdkman_installer"

# Both sdk's init script and sdk itself attempt to expand unset variables, and
# return non-zero status on success.  What a trash heap.
set +eu
source ~/.sdkman/bin/sdkman-init.sh

#readonly java_version="$(sdk list java | grep --only-matching --max-count=1 '\b8\.[0-9]*\.[0-9]*\-tem')"
sdk install java # "$java_version"
sdk install sbt
