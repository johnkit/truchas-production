FROM johnkit/mono-paraview
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave
WORKDIR /home/buildslave

# Build smtk
COPY smtk_build.sh /home/buildslave/smtk_build.sh
RUN  scl enable devtoolset-7 -- sh /home/buildslave/smtk_build.sh
