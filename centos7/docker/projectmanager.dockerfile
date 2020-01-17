FROM johnkit:cmb-truchas-centos7-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# COPY remove_build_files.sh /home/buildslave/cmb-superbuild/remove_build_files.sh
WORKDIR /home/buildslave/cmb-superbuild/build

RUN  scl enable devtoolset-7 -- make smtkprojectmanager/fast; ../remove_build_files.sh; exit 0
