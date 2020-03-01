FROM johnkit/cmb-truchas-ubuntu1604-paraview
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave

WORKDIR /home/buildslave/cmb-superbuild/build

# Build smtk
COPY smtk_build.sh /home/buildslave/smtk_build.sh
RUN  /home/buildslave/smtk_build.sh; /home/buildslave/remove_build_files.sh; exit 0
