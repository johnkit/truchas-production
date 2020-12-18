FROM johnkit/new-truchas-ubuntu1604-smtk
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"
ARG package_name
USER buildslave
WORKDIR /home/buildslave/build

# Insert package name
RUN cmake -DCMB_PACKAGE_FILE_NAME:STRING=${package_name} .

RUN make smtkprojectmanager/fast; /home/buildslave/remove_build_files.sh
RUN make smtktruchasextensions/fast; /home/buildslave/remove_build_files.sh
RUN make cmb/fast; /home/buildslave/remove_build_files.sh
RUN ctest -R cpack-modelbuilder -VV > ctest.log 2>&1; exit 0

RUN ls -l
