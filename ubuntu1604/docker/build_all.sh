#!/bin/sh
set -e  # exit on error

# Builds the entire modelbuilder-truchas software chain from scratch
datecode=`date +%y%m%d`
package_name=modelbuilder-truchas-ubuntu1604-${datecode}

# Generic (cmb-ubuntu1604-*)
docker build -f base.dockerfile --tag=johnkit/new-ubuntu1604-base .

# Truchas-specific (cmb-truchas-ubuntu1604-*)
docker build -f paraview.dockerfile --tag=johnkit/new-truchas-ubuntu1604-paraview --no-cache .
docker build -f smtk.dockerfile --tag=johnkit/new-truchas-ubuntu1604-smtk --no-cache .
docker build -f cmb.dockerfile --build-arg package_name=${package_name} --tag=johnkit/new-truchas-ubuntu1604-modelbuilder --no-cache .

# Copy the package file
timestamp=`date +%s`
temp="temp${timestamp}"
docker create -it --name ${temp} johnkit/new-truchas-ubuntu1604-modelbuilder bash
docker cp ${temp}:/home/buildslave/build/${package_name}.tar.gz .
docker rm -f ${temp}
