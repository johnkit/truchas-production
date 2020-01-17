#!/bin/sh

# Removes all files in build folders except cmake cache files
echo Clearing build files
for d in `find . -maxdepth 3 -type d -name build`; do
    pushd $d > /dev/null
    if [ -f CMakeCache.txt ]; then
        mv CMakeCache.txt ..
        rm -rf *
        mv ../CMakeCache.txt .
    else
        rm -rf *
    fi
    popd > /dev/null
done
