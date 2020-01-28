FROM centos:7
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# Install packages required for CMake
RUN yum install -y curl-devel

# Install packages required for buildslave
RUN yum install -y epel-release
#     yum install -y python-virtualenv

# Install packages required for ParaView
RUN yum install -y \
    git-core chrpath libtool gperf \
    libX11-devel libXdamage-devel libXext-devel libXt-devel libXi-devel \
    libxcb-devel xorg-x11-xtrans-devel libXcursor-devel libXft-devel \
    libXinerama-devel libXrandr-devel libXrender-devel \
    dejavu-sans-fonts dejavu-sans-mono-fonts dejavu-serif-fonts \
    xkeyboard-config

# Install a newer set of compilers from the Software Collections repos
RUN yum install -y centos-release-scl && \
    yum install -y \
        devtoolset-7 devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-gcc-gfortran \
        python27 rh-git29-git

# Install GNU make for incremental builds
RUN yum install make

# Cleanup
RUN yum clean all

# Set up the buildslave user
RUN useradd -c buildslave -d /home/buildslave -M buildslave
RUN mkdir /home/buildslave
RUN chown buildslave:buildslave /home/buildslave

USER buildslave

# Install CMake
COPY install_cmake.sh /home/buildslave/install_cmake.sh
RUN scl enable devtoolset-7 -- sh /home/buildslave/install_cmake.sh

# Install Ninja
COPY install_ninja.sh /home/buildslave/install_ninja.sh
RUN scl enable devtoolset-7 -- sh /home/buildslave/install_ninja.sh

# Install Qt
COPY install_qt.sh /home/buildslave/install_qt.sh
RUN scl enable devtoolset-7 -- sh /home/buildslave/install_qt.sh
