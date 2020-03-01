FROM johnkit/cmb-truchas-ubuntu1604-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
USER buildslave

# COPY remove_build_files.sh /home/buildslave/remove_build_files.sh
WORKDIR /home/buildslave/cmb-superbuild/build

# Update cmb-superbuild (dev only)
# RUN cd /home/buildslave/cmb-superbuild/src; git fetch; git reset --hard origin/truchas-production; git log -1
# RUN /home/buildslave/misc/root/cmake/bin/cmake .

RUN make smtkprojectmanager/fast; /home/buildslave/remove_build_files.sh; exit 0
