# Script to build johnkit:cmb-win-cmb
# docker build -f cmb.dockerfile -t johnkit:cmb-win-cmb -m 20g --no-cache .

FROM johnkit:cmb-truchas-win-truchas

SHELL [ "powershell", "-command"]

# HACK for testing interim fixes
# RUN cd C:/Users/ContainerUser/code/cmb-superbuild; git fetch origin truchas-production; git checkout FETCH_HEAD; git log -1

# Klugey, but get package name from .package_name file, because build args don't work
# COPY ./.package_name C:/Users/ContainerUser/.package_name
COPY ./set-packagename.ps1 C:/Users/ContainerUser/scripts/set-packagename.ps1
RUN C:/Users/ContainerUser/scripts/set-packagename.ps1 ${package_name}

RUN make cmb/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\cmb\build; exit 0
RUN ctest -R cpack-modelbuilder -VV > ctest.log 2>&1; exit 0
RUN ls
