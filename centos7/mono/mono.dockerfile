FROM kitware/cmb:ci-superbuild-centos7-20200831
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# Set up the buildslave user
RUN useradd -c buildslave -d /home/buildslave -M buildslave
RUN mkdir /home/buildslave
RUN chown buildslave:buildslave /home/buildslave

USER buildslave
WORKDIR /home/buildslave

# Pull cmb-superbuild and install cmake, ninja
# RUN git clone --depth 1 --recursive https://gitlab.kitware.com/john.tourtellott/cmb-superbuild.git src
RUN  git clone --depth 1 --recursive https://gitlab.kitware.com/cmb/cmb-superbuild.git src
RUN cd src && .gitlab/ci/cmake.sh
RUN cd src && .gitlab/ci/ninja.sh

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
RUN echo $PATH
RUN echo $PWD
ENV PATH="/home/buildslave/src/.gitlab:/home/buildslave/src/.gitlab/cmake/bin:${PATH}"
RUN echo $PATH
RUN ls -l /home/buildslave/src/.gitlab/cmake/bin/cmake

# Setup build directory and configure
COPY mono.cmake /home/buildslave/
RUN mkdir /home/buildslave/build
RUN cd build && scl enable devtoolset-7 -- cmake -G Ninja -C /home/buildslave/mono.cmake ../src

RUN ls -l /home/buildslave/src/.gitlab/ninja
RUN cd build && scl enable devtoolset-7 -- ninja
