#!/bin/sh

readonly cmake_root="$HOME/misc/root/cmake"
PATH="$PATH:$cmake_root/bin"

cd $HOME/cmb-superbuild/build
mv CMakeCache.txt Ninja-CMakeCache.txt

#  -G '"Unix Makefiles"' \
cmake \
  -DBUILD_TESTING:BOOL=ON \
  -DCMAKE_INSTALL_PREFIX:PATH=./install \
  -DDEVELOPER_MODE_cmb:BOOL=OFF \
  -DDEVELOPER_MODE_smtk:BOOL=OFF \
  -DENABLE_cmb:BOOL=ON \
  -DENABLE_cmbusersguide:BOOL=OFF \
  -DENABLE_DOCUMENTATION:BOOL=OFF \
  -DENABLE_python3:BOOL=ON \
  -DENABLE_smtk:BOOL=ON \
  -DENABLE_smtkprojectmanager:BOOL=ON \
  -DENABLE_smtkresourcemanagerstate:BOOL=OFF \
  -DENABLE_smtktruchasextensions:BOOL=ON \
  -DENABLE_smtkusersguide:BOOL=OFF \
  -DQt5_DIR:PATH="$HOME/misc/root/qt5/lib/cmake/Qt5" \
  -DTEST_cmb:BOOL=OFF \
  -DTEST_smtk:BOOL=OFF \
  -DUSE_SYSTEM_qt5:BOOL=ON \
   $HOME/cmb-superbuild/src

make smtk/fast

# Remove build files except for CMake cache
cd superbuild/smtk/build
mv CMakeCache.txt ..
rm -rf *
mv ../CMakeCache.txt .

ls -l
