FROM johnkit/new-ubuntu1604-base
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

USER root
RUN apt-get update
RUN apt-get install -y perl pkg-config
RUN apt-get install -y '^libxcb.*-dev' libx11-xcb-dev libglu1-mesa-dev libxrender-dev libxi-dev

# Add symbolic link for /usr/bin/python
RUN ln -s /usr/bin/python3 /usr/bin/python

USER buildslave

# Install Qt
COPY install_qt.sh /home/buildslave/install_qt.sh
RUN /home/buildslave/install_qt.sh
