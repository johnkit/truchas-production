FROM johnkit/cmb-truchas-ubuntu1604-truchasext
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
ARG package_name
USER buildslave

# Remove tags from smtk; otherwise wrong smtk version might be detected by superbuild
# RUN cd /home/buildslave/cmb-superbuild/build/superbuild/smtk/src; git tag -d $(git tag -l)

WORKDIR /home/buildslave/cmb-superbuild/build

# Insert package name
RUN /home/buildslave/misc/root/cmake/bin/cmake -DCMB_PACKAGE_FILE_NAME:STRING=${package_name} .

RUN make cmb/fast; /home/buildslave/remove_build_files.sh
RUN $HOME/misc/root/cmake/bin/ctest -R cpack-modelbuilder -VV > ctest.log 2>&1; rm -rf _CPack_Packages; exit 0

RUN ls
