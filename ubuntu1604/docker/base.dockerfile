FROM amd64/ubuntu:16.04
LABEL maintainer="John Tourtellott <john.tourtellott@kitware.com>"

# Install build packages
RUN apt-get update
RUN apt-get install -y git build-essential libcurl4-openssl-dev curl python3-minimal zlib1g-dev vim

# Set up the buildslave user
RUN useradd -c buildslave -d /home/buildslave -M buildslave
RUN mkdir /home/buildslave
RUN chown buildslave:buildslave /home/buildslave

USER buildslave

# Install CMake
COPY install_cmake.sh /home/buildslave/install_cmake.sh
RUN /home/buildslave/install_cmake.sh

# Install Ninja
COPY install_ninja.sh /home/buildslave/install_ninja.sh
RUN /home/buildslave/install_ninja.sh
