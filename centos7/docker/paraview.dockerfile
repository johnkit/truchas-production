FROM johnkit:cmb-centos7-base
MAINTAINER John Tourtellott <john.tourtellott@kitware.com>

# Clone cmb-superbuild
RUN mkdir /home/buildslave/cmb-superbuild
RUN git clone --branch truchas-production --depth 1 --recursive https://gitlab.kitware.com/john.tourtellott/cmb-superbuild.git  /home/buildslave/cmb-superbuild/src
RUN cd /home/buildslave/cmb-superbuild/src && git log -1

# Copy build scripts
COPY remove_build_files.sh /home/buildslave/remove_build_files.sh
COPY paraview_build.sh /home/buildslave/paraview_build.sh

WORKDIR /home/buildslave/cmb-superbuild/build
RUN  scl enable devtoolset-7 -- sh /home/buildslave/paraview_build.sh; /home/buildslave/remove_build_files.sh; exit 0
