# Script to build johnkit:cmb-truchas-win-projectmanager
# docker build -f projectmanager.dockerfile -t johnkit:cmb-truchas-win-projectmanager -m 20g --no-cache .

FROM johnkit:cmb-truchas-win-smtk
SHELL [ "powershell", "-command"]
RUN make smtkprojectmanager/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\smtkprojectmanager\build; exit 0
