FROM johnkit/mono-centos7-paraview
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave
WORKDIR /home/buildslave

# Hack to get latest superbuild source
# RUN cd /home/buildslave/src; git fetch origin; git reset --hard origin/truchas-production; git log -1

# Build smtk
COPY smtk_build.sh /home/buildslave/smtk_build.sh
RUN  scl enable devtoolset-7 -- sh /home/buildslave/smtk_build.sh
