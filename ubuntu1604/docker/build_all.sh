#!/bin/sh
set -e  # exit on error

# Builds the entire modelbuilder-truchas software chain from scratch
datecode=`date +%y%m%d`
package_name=modelbuilder-truchas-ubuntu1604-${datecode}

# Generic (cmb-ubuntu1604-*)
docker build -f base.dockerfile --tag=johnkit/cmb-ubuntu1604-base .
docker build -f qt.dockerfile --tag=johnkit/cmb-ubuntu1604-qt --no-cache .

# Truchas-specific (cmb-truchas-ubuntu1604-*)
docker build -f paraview.dockerfile --tag=johnkit/cmb-truchas-ubuntu1604-paraview --no-cache .
# docker build -f smtk.dockerfile --tag=johnkit/cmb-truchas-ubuntu1604-smtk --no-cache .
# docker build -f projectmanager.dockerfile --tag=johnkit/cmb-truchas-ubuntu1604-projectmanager --no-cache .
# docker build -f truchasext.dockerfile --tag=johnkit/cmb-truchas-ubuntu1604-truchasext --no-cache .
# docker build -f cmb.dockerfile --build-arg package_name=${package_name} --tag=johnkit/cmb-truchas-ubuntu1604-modelbuilder --no-cache .

# # Copy the package file
# docker create -it --name temp johnkit/cmb-truchas-ubuntu1604-modelbuilder bash
# docker cp temp:/home/buildslave/cmb-superbuild/build/${package_name}.tar.gz .
# docker rm -f temp
