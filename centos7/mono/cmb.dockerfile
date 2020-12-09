FROM johnkit/mono-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave
WORKDIR /home/buildslave/build

# Build cmb
RUN scl enable devtoolset-7 -- make smtkprojectmanager/fast; /home/buildslave/remove_build_files.sh
RUN scl enable devtoolset-7 -- make cmb/fast; /home/buildslave/remove_build_files.sh
RUN scl enable devtoolset-7 -- ctest -R cpack-modelbuilder -VV > ctest.log 2>&1
RUN ls -l

WORKDIR /home/buildslave
