FROM johnkit:cmb-truchas-centos7-projectmanager
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

WORKDIR /home/buildslave/cmb-superbuild/build
RUN  scl enable devtoolset-7 -- make smtktruchasextensions/fast; ../remove_build_files.sh; exit 0
