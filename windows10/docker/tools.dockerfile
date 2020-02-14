# Script to build johnkit/cmb-win-tools
# We update dev tools up front because chocolately servers are not 100%
# reliable, and we don't want a build to fail because of that.
# This dockerfile also installs our remove-files.ps1 script, which is used
# by downstream builds.
# Usage:
# docker build -f tools.dockerfile -t johnkit/cmb-win-tools -m 20g --no-cache .

FROM kitware/cmb:ci-superbuild-windows10-msvc2019-20191111
SHELL [ "powershell", "-command"]

# Update build tools:
#   - Upgrade cmake to get FindPython3 fix
#   - Install make in order to use smtk/fast target
#   - Install vim if needed for debug
RUN choco upgrade cmake make vim -y
# Must also update Path to override VS2019's cmake
COPY ./set-path.ps1 C:/Users/ContainerUser/scripts/set-path.ps1
RUN C:\Users\ContainerUser\scripts\set-path.ps1

# Also add our remove-files script
COPY ./remove-files.ps1 C:/Users/ContainerUser/scripts/remove-files.ps1
