FROM johnkit/cmb-truchas-centos7-paraview
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave

WORKDIR /home/buildslave/cmb-superbuild/build

# Build smtk
COPY smtk_build.sh /home/buildslave/smtk_build.sh
RUN  scl enable devtoolset-7 -- sh /home/buildslave/smtk_build.sh; /home/buildslave/remove_build_files.sh; exit 0
