FROM johnkit:cmb-truchas-centos7-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# COPY remove_build_files.sh /home/buildslave/remove_build_files.sh
WORKDIR /home/buildslave/cmb-superbuild/build

RUN  scl enable devtoolset-7 -- make smtkprojectmanager/fast; /home/buildslave/remove_build_files.sh; exit 0
