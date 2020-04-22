FROM johnkit/cmb-ubuntu1604-qt
MAINTAINER John Tourtellott <john.tourtellott@kitware.com>


# Install packages required for ParaView
USER root
# RUN apt-get install -y libgl1-mesa-dev libxt-dev qt5-default libqt5x11extras5-dev libqt5help5 qttools5-dev qtxmlpatterns5-dev-tools libqt5svg5-dev python3-dev libopenmpi-dev libtbb-dev
RUN apt-get install -y libgl1-mesa-dev libxt-dev libtbb-dev


USER buildslave

# Clone cmb-superbuild
RUN mkdir -p /home/buildslave/cmb-superbuild/build
RUN git clone --branch truchas-production --depth 1 --recursive https://gitlab.kitware.com/john.tourtellott/cmb-superbuild.git  /home/buildslave/cmb-superbuild/src
RUN cd /home/buildslave/cmb-superbuild/src && git log -1

# Copy build scripts
COPY remove_build_files.sh /home/buildslave/remove_build_files.sh
COPY paraview_build.sh /home/buildslave/paraview_build.sh

WORKDIR /home/buildslave/cmb-superbuild/build
RUN  /home/buildslave/paraview_build.sh; /home/buildslave/remove_build_files.sh; exit 0
