#!/bin/sh

# Builds the entire modelbuilder-truchas software chain from scratch
datecode=`date +%y%m%d`
package_name=modelbuilder-truchas-centos7-${datecode}

# Generic (cmb-centos-*)
# docker build -f base.dockerfile --tag=johnkit/cmb-centos7-base .

# Truchas-specific (cmb-truchas-centos-*)
docker build -f paraview.dockerfile --tag=johnkit/cmb-truchas-centos7-paraview --no-cache .
docker build -f smtk.dockerfile --tag=johnkit/cmb-truchas-centos7-smtk --no-cache .
docker build -f projectmanager.dockerfile --tag=johnkit/cmb-truchas-centos7-projectmanager --no-cache .
docker build -f truchasext.dockerfile --tag=johnkit/cmb-truchas-centos7-truchasext --no-cache .
docker build -f cmb.dockerfile --build-arg package_name=${package_name} --tag=johnkit/cmb-truchas-centos7-modelbuilder --no-cache .

# Copy the package file
docker create -it --name temp johnkit/cmb-truchas-centos7-modelbuilder bash
docker cp temp:/home/buildslave/cmb-superbuild/build/${package_name}.tar.gz .
docker rm -f temp
