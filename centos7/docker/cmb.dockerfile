FROM johnkit:cmb-truchas-centos7-truchasext
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

ARG package_name

WORKDIR /home/buildslave/cmb-superbuild/build

# Insert package name
RUN $HOME/misc/root/cmake/bin/cmake -DCMB_PACKAGE_NAME:STRING=${package_name} .

RUN scl enable devtoolset-7 -- make cmb/fast; ../remove_build_files.sh; exit 0
RUN scl enable devtoolset-7 -- $HOME/misc/root/cmake/bin/ctest -R cpack-modelbuilder > ctest.log 2>&1; exit 0
