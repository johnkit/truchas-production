#!/bin/sh
# Rerun cmake to change generator from ninja to make

cd /home/buildslave/build
mv CMakeCache.txt Ninja-CMakeCache.txt

cmake -G "Unix Makefiles" \
  -DBUILD_TESTING:BOOL=ON \
  -DCMAKE_INSTALL_PREFIX:PATH=./install \
  -Dcmb_FETCH_LFS:BOOL=OFF \
  -DDEVELOPER_MODE_cmb:BOOL=OFF \
  -DDEVELOPER_MODE_smtk:BOOL=OFF \
  -DENABLE_cmb:BOOL=ON \
  -DENABLE_cmbusersguide:BOOL=OFF \
  -DENABLE_DOCUMENTATION:BOOL=OFF \
  -DENABLE_python3:BOOL=ON \
  -DENABLE_smtk:BOOL=ON \
  -DENABLE_smtkprojectmanager:BOOL=OFF \
  -DENABLE_smtkresourcemanagerstate:BOOL=OFF \
  -DENABLE_smtktruchasextensions:BOOL=ON \
  -DENABLE_smtkusersguide:BOOL=OFF \
  -Dsmtk_FETCH_LFS:BOOL=OFF \
  -DTEST_cmb:BOOL=OFF \
  -DTEST_smtk:BOOL=OFF \
  /home/buildslave/src

# Have to explicitly download now (Mar 2021)
make smtk-download
make smtk/fast

# Remove lfs files (if any)
cd /home/buildslave/build/superbuild/smtk/src
rm -rf data

# Remove build files except for CMake cache
cd /home/buildslave/build/superbuild/smtk/build
mv CMakeCache.txt ..
rm -rf *
mv ../CMakeCache.txt .
