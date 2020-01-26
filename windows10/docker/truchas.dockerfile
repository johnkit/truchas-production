# docker build -f truchas.dockerfile -t johnkit:cmb-truchas-win-truchas -m 20g --no-cache .

FROM johnkit:cmb-truchas-win-projectmanager

SHELL [ "powershell", "-command"]

# HACK for testing interim fixes
# RUN cd C:/Users/ContainerUser/code/cmb-superbuild; git fetch origin truchas-production; git checkout FETCH_HEAD; git log -1
# RUN cmake .

RUN make smtktruchasextensions/fast; C:\Users\ContainerUser\scripts\remove-files.ps1 superbuild\smtktruchasextensions\build; exit 0
