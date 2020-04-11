# Script to build johnkit/cmb-win-smtk
# Note that this image replaces ninja with unix make, so that we can use
# the make "fast" targets.
# docker build -f smtk.dockerfile -t johnkit/cmb-truchas-win-smtk -m 20g --no-cache .

FROM johnkit/cmb-truchas-win-paraview
SHELL [ "powershell", "-command"]

# HACK for testing interim fixes
# RUN cd C:/Users/ContainerUser/code/cmb-superbuild; git fetch origin truchas-production; git checkout FETCH_HEAD; git log -1
# RUN cd C:/Users/ContainerUser/code/cmb-superbuild/superbuild; git remote add john https://gitlab.kitware.com/john.tourtellott/common-superbuild.git; git fetch john; git reset --hard john/truchas-production; git log -1

# Delete old cmake cache, which uses ninja generator
RUN mv CMakeCache.txt Ninja-CMakeCache.txt

# Configure with "make" generator
# Enable both smtk and cmb
RUN cmake \
  -G'\"Unix Makefiles\"' \
    -DBUILD_TESTING:BOOL=ON \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=install \
    -DDEVELOPER_MODE_cmb:BOOL=OFF \
    -DDEVELOPER_MODE_smtk:BOOL=OFF \
    -DENABLE_cmb:BOOL=ON \
    -DENABLE_cmbworkflows:BOOL=OFF \
    -DENABLE_cmbusersguide:BOOL=OFF \
    -DENABLE_DOCUMENTATION:BOOL=OFF \
    -DENABLE_paraview:BOOL=ON \
    -DENABLE_python3:BOOL=ON \
    -DENABLE_smtk:BOOL=ON \
    -DENABLE_smtktruchasextensions:BOOL=ON \
    -DENABLE_smtkprojectmanager:BOOL=ON \
    -DENABLE_smtkresourcemanagerstate:BOOL=OFF \
    -DPACKAGE_SYSTEM_python3:BOOL=ON \
    -DQt5Core_DIR:PATH=/Qt/5.12.5/msvc2017_64/lib/cmake/Qt5 \
    -DTEST_cmb:BOOL=OFF \
    -DTEST_smtk:BOOL=OFF \
    -DUSE_SYSTEM_python3:BOOL=ON \
    -DUSE_SYSTEM_qt5:BOOL=ON \
    /Users/ContainerUser/code/cmb-superbuild

# Build smtk + remove build files
RUN make smtk/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\smtk\build
