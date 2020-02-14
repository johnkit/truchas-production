# Script to build base image for truchas
#  - installs python3
#  - clones source files
# docker build -f python3.dockerfile -t johnkit/cmb-truchas-win-base -m 20g --no-cache .
FROM johnkit/cmb-win-tools
SHELL [ "powershell", "-command"]

RUN choco install python3 --version 3.7.4 --installargs " '/quiet TargetDir=C:\\Python37 Shortcuts=0 Include_doc=0 Include_tcltk=0 Include_launcher=0 PrependPath=0' " --overrideargs --yes
RUN C:/Python37/python.exe --version; exit 0

RUN mkdir /Users/ContainerUser/code
WORKDIR /Users/ContainerUser/code

# Use truchas-production branch with fixes and workarounds
RUN git clone --recursive --depth 1 --branch truchas-production https://gitlab.kitware.com/john.tourtellott/cmb-superbuild.git
RUN cd cmb-superbuild; git rev-parse HEAD
RUN cd C:/Users/ContainerUser/code/cmb-superbuild/superbuild; git remote add john https://gitlab.kitware.com/john.tourtellott/common-superbuild.git; git fetch john; git reset --hard john/truchas-production; git log -1

RUN mkdir -p /Users/ContainerUser/build/cmb-superbuild
WORKDIR /Users/ContainerUser/build/cmb-superbuild

RUN cmake \
  -GNinja \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=install \
    -DDEVELOPER_MODE_cmb:BOOL=ON \
    -DDEVELOPER_MODE_smtk:BOOL=ON \
    -DENABLE_cmb:BOOL=ON \
    -DENABLE_cmbusersguide:BOOL=OFF \
    -DENABLE_DOCUMENTATION:BOOL=OFF \
    -DENABLE_paraview:BOOL=ON \
    -DENABLE_python3:BOOL=ON \
    -DENABLE_smtk:BOOL=ON \
    -DENABLE_smtktruchasextensions:BOOL=OFF \
    -DENABLE_smtkprojectmanager:BOOL=OFF \
    -DENABLE_smtkresourcemanagerstate:BOOL=OFF \
    -DPACKAGE_SYSTEM_python3:BOOL=ON \
    -DQt5Core_DIR:PATH=/Qt/5.12.5/msvc2017_64/lib/cmake/Qt5 \
    -DTEST_cmb:BOOL=OFF \
    -DTEST_smtk:BOOL=OFF \
    -DUSE_SYSTEM_python3:BOOL=ON \
    -DUSE_SYSTEM_qt5:BOOL=ON \
    /Users/ContainerUser/code/cmb-superbuild
