# Script to build johnkit/cmb-truchas-win-paraview
# This builds all of the prerequisites needed to build smtk in a downstream image.
# docker build -f paraview.dockerfile -t johnkit/cmb-truchas-win-paraview -m 20g --no-cache .

FROM johnkit/cmb-truchas-win-base
SHELL [ "powershell", "-command"]

# Build + remove build files
RUN cd C:/Users/ContainerUser/code/cmb-superbuild; git fetch origin truchas-production; git checkout FETCH_HEAD; git submodule update; git log -1
RUN ninja; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\*\build\*

RUN ls
