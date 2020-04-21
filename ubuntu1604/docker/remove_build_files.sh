#!/bin/sh

# Removes all files in build folders except cmake cache files
echo Clearing build files
start_dir=`pwd`
for d in `find . -maxdepth 3 -type d -name build`; do
    cd $d
    if [ -f CMakeCache.txt ]; then
        mv CMakeCache.txt ..
        rm -rf *
        mv ../CMakeCache.txt .
    else
        rm -rf *
    fi
    cd $start_dir
done
