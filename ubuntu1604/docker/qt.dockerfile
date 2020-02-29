FROM johnkit/cmb-ubuntu1604-base
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

USER root
RUN apt-get install -y perl pkg-config
RUN apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev
RUN apt-get install -y vim; ln -s /usr/bin/python3 /usr/bin/python

USER buildslave

# Install Qt
COPY install_qt.sh /home/buildslave/install_qt.sh
RUN /home/buildslave/install_qt.sh; exit 0
