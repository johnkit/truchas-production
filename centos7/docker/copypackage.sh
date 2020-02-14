package_name=modelbuilder-6.3.0-rc1-Linux-64bit
rm -f ${package_name}.tar.gz

docker create -it --name temp johnkit/debug bash
docker cp temp:/home/buildslave/cmb-superbuild/build/${package_name}.tar.gz .
docker rm -f temp
