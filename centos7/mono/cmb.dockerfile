FROM johnkit/mono-truchas-centos7-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
ARG package_name
USER buildslave
WORKDIR /home/buildslave/build


# Hack to get latest superbuild source
# RUN cd /home/buildslave/src; git fetch origin; git reset --hard origin/truchas-production; git log -1

RUN cmake -DCMB_PACKAGE_FILE_NAME:STRING=${package_name} .

# Build cmb
RUN scl enable devtoolset-7 -- make smtkprojectmanager/fast; /home/buildslave/remove_build_files.sh
RUN scl enable devtoolset-7 -- make smtktruchasextensions/fast; /home/buildslave/remove_build_files.sh
RUN scl enable devtoolset-7 -- make cmb/fast; /home/buildslave/remove_build_files.sh
RUN scl enable devtoolset-7 -- ctest -R cpack-modelbuilder -VV > ctest.log 2>&1
RUN ls -l

WORKDIR /home/buildslave
