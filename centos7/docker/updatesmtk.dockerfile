# docker build -f updatesmtk.dockerfile -t johnkit:debug --no-cache .

FROM johnkit:cmb-centos7-modelbuilder-truchas

RUN cd /home/buildslave/cmb-superbuild/build/superbuild/smtk/src; git remote add john https://gitlab.kitware.com/john.tourtellott/smtk.git; git fetch john; git checkout now-debug-visibility-icons; git log -1
RUN cd /home/buildslave/cmb-superbuild/build/superbuild/smtk/build; scl enable devtoolset-7 -- make -j9 install
RUN cd /home/buildslave/cmb-superbuild/build; scl enable devtoolset-7 -- $HOME/misc/root/cmake/bin/ctest -R cpack-modelbuilder > ctest.log 2>&1; exit 0
