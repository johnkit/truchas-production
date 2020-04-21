#!/bin/sh

set -e

readonly cmake_version="3.13"
readonly cmake_version_patch="2"
readonly cmake_version_full="${cmake_version}.${cmake_version_patch}"

readonly url="https://cmake.org/files/v${cmake_version}/cmake-${cmake_version_full}.tar.gz"

readonly workdir="$HOME/misc/code/cmake"
readonly srcdir="$workdir/cmake-${cmake_version_full}"
readonly builddir="$workdir/build"

mkdir -p "$builddir"
/usr/bin/curl "$url" | tar xz -C "$workdir"
cd "$builddir"
"$srcdir/bootstrap" \
    --parallel=8 \
    --system-curl \
    --prefix="$HOME/misc/root/cmake"
make -j8 install
rm -rf "$workdir"
