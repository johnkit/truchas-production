#!/bin/sh

set -e

readonly common_sb_url="https://gitlab.kitware.com/paraview/common-superbuild.git"
readonly commit="21d199f349605853be4b64c0306b316da6c18cc6"

readonly workdir="$HOME/misc/code/qt5"
readonly srcdir="$workdir/src"
readonly builddir="$workdir/build"

readonly cmake_root="$HOME/misc/root/cmake"

PATH="$PATH:$cmake_root/bin"

mkdir -p "$builddir"
git clone "${common_sb_url}" "$srcdir"
cd "$srcdir"
git checkout "$commit"

cd "$builddir"

# Generate arguments for modules to skip
skip_option=
# For unknown reason, the array assignment line fails => Syntax error: "(" unexpected
# qt_skip_modules=(qtconnectivity qtgamepad qtlocation qtmultimedia qtsensors qtserialport qtwayland qtwebchannel qtwebengine qtwebsockets)
# for module in ${qt_skip_modules[@]}; do
#   skip_option="${skip_option};-skip;${module}"
# done
#
# So instead, generate the string explicitly
skip_option="-skip;qtconnectivity"
skip_option="${skip_option};-skip;qtdeclarative"
skip_option="${skip_option};-skip;qtgamepad"
skip_option="${skip_option};-skip;qtlocation"
skip_option="${skip_option};-skip;qtmultimedia"
skip_option="${skip_option};-skip;qtsensors"
skip_option="${skip_option};-skip;qtserialport"
skip_option="${skip_option};-skip;qtwayland"
skip_option="${skip_option};-skip;qtwebchannel"
skip_option="${skip_option};-skip;qtwebengine"
skip_option="${skip_option};-skip;qtwebsockets"

cmake \
  "-DENABLE_fontconfig:BOOL=OFF" \
  "-DENABLE_qt5:BOOL=ON" \
  "-Dqt_install_location:PATH=$HOME/misc/root/qt5" \
  "-Dqt5_ENABLE_SVG:BOOL=ON" \
  "-Dqt5_EXTRA_CONFIGURATION_OPTIONS:STRING=-no-use-gold-linker;${skip_option}" \
  "-DUSE_SYSTEM_freetype:BOOL=OFF" \
  -GNinja \
  "$srcdir/standalone-qt"
ninja

rm -rf "$workdir"
