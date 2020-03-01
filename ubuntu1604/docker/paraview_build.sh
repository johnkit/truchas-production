#!/bin/sh

readonly cmake_root="$HOME/misc/root/cmake"
PATH="$PATH:$cmake_root/bin"

cd $HOME/cmb-superbuild/build

$HOME/misc/root/cmake/bin/cmake \
  -GNinja \
  -DBUILD_TESTING:BOOL=OFF \
  -DCMAKE_INSTALL_PREFIX:PATH=./install \
  -DDEVELOPER_MODE_cmb:BOOL=ON \
  -DDEVELOPER_MODE_smtk:BOOL=ON \
  -DENABLE_cmb:BOOL=ON \
  -DENABLE_cmbusersguide:BOOL=OFF \
  -DENABLE_DOCUMENTATION:BOOL=OFF \
  -DENABLE_mesa:BOOL=OFF \
  -DENABLE_python3:BOOL=ON \
  -DENABLE_smtk:BOOL=ON \
  -DENABLE_smtkprojectmanager:BOOL=OFF \
  -DENABLE_smtkresourcemanagerstate:BOOL=OFF \
  -DENABLE_smtktruchasextensions:BOOL=OFF \
  -DENABLE_smtkusersguide:BOOL=OFF \
  -DQt5_DIR:PATH=/home/buildslave/misc/root/qt5/lib/cmake/Qt5 \
  -DTEST_cmb:BOOL=OFF \
  -DTEST_smtk:BOOL=OFF \
  -DUSE_SYSTEM_qt5:BOOL=ON \
   $HOME/cmb-superbuild/src

ninja
ls -l

# Remove download files
rm -f $HOME/cmb-superbuild/build/downloads/*
