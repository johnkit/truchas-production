#!/bin/sh
set -e  # exit on error

# Builds the entire modelbuilder-truchas software chain from scratch
datecode=`date +%y%m%d`
package_name=modelbuilder-truchas-centos7-${datecode}

# Generic (mono-centos7-*)
docker build -f paraview.dockerfile --tag=johnkit/mono-centos7-paraview .

# Truchas-specific (mono-truchas-centos7-*)
docker build -f smtk.dockerfile --tag=johnkit/mono-truchas-centos7-smtk --no-cache .
docker build -f cmb.dockerfile --build-arg package_name=${package_name} --tag=johnkit/mono-truchas-centos7-modelbuilder --no-cache .

# Copy the package file
timestamp=`date +%s`
temp="temp${timestamp}"
docker create -it --name ${temp} johnkit/mono-truchas-centos7-modelbuilder bash
docker cp ${temp}:/home/buildslave/build/ctest.log .
docker cp ${temp}:/home/buildslave/build/${package_name}.tar.gz .
docker rm -f ${temp}
