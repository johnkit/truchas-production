FROM amd64/ubuntu:16.04
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# Install build packages
RUN apt-get update
# RUN apt-get install -y git build-essential libcurl4-openssl-dev curl python3-minimal zlib1g-dev vim

# See https://askubuntu.com/a/857433
RUN cp /etc/apt/sources.list /etc/apt/sources.list~
RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list
RUN apt-get update

# See https://wiki.qt.io/Building_Qt_5_from_Git
RUN apt-get -y build-dep qt5-default
RUN apt-get -y install libxcb-xinerama0-dev

# Set up the buildslave user
RUN useradd -c buildslave -d /home/buildslave -M buildslave
RUN mkdir /home/buildslave
RUN chown buildslave:buildslave /home/buildslave

USER buildslave
