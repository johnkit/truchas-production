#!/bin/sh

set -e

readonly ninja_version="1.7.2"

readonly url="https://github.com/ninja-build/ninja"

readonly workdir="$HOME/misc/code/ninja"
readonly srcdir="$workdir"

git clone "$url" "$srcdir"
cd "$srcdir"
git checkout "v$ninja_version"
/usr/bin/python3 "$srcdir/configure.py" \
    --bootstrap \
    --verbose
install -m 755 ninja "$HOME/misc/root/cmake/bin/ninja"
rm -rf "$workdir"
