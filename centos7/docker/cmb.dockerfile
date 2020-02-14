FROM johnkit/cmb-truchas-centos7-truchasext
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
ARG package_name
USER buildslave

# Remove tags from smtk; otherwise wrong smtk version might be detected by superbuild
RUN cd /home/buildslave/cmb-superbuild/build/superbuild/smtk/src; git tag -d $(git tag -l)

WORKDIR /home/buildslave/cmb-superbuild/build

# Insert package name
RUN /home/buildslave/misc/root/cmake/bin/cmake -DCMB_PACKAGE_FILE_NAME:STRING=${package_name} .

RUN scl enable devtoolset-7 -- make cmb/fast; /home/buildslave/remove_build_files.sh; exit 0
RUN scl enable devtoolset-7 -- $HOME/misc/root/cmake/bin/ctest -R cpack-modelbuilder -VV > ctest.log 2>&1; exit 0

RUN ls
