# Windows docker builds

A set of Docker and PowerShell scripts to build/package CMB Modelbuilder
with Truchas plugin.

To do a complete build & package:
* run `docker system prune`
* run the `buildall.ps1` script from this directory.

On success, this will produce a .zip package in this directory.

Note that the `buildall.ps1` script sets a memory limit of 20 GB,
primarily so that the paraview build doesn't run out of heap space.
It is not currently know if the system can be built with less
memory space.

## tools.dockerfile (builds cmb-win-tools)
Add and update several build tools not available in starting image,
and installs some scripts used by downstream docker builds.

## base.dockerfile (builds cmb-truchas-win-base)
Install python3 and clone cmb-superbuild source files.

## paraview.dockerfile (builds cmb-truchas-win-paraview)
Build superbuild up to and including paraview, leaving smtk, cmb, and
plugins to downstream images. This build uses ninja to run as fast as
possible. The dockerfile, like all of the docker files here, use a
powershell script `remove-files.ps1` to delete the build files, in order
to minimize the image footprints.

## smtk.dockerfile (builds cmb-truchas-win-smtk)
Uses the paraview image and builds the smtk project. To do this,
the CMakeCache.txt is deleted and cmake is rerun with the unix makefiles
generator. This allows us to build the smtk/fast target (which
cmake/ninja doesn't support).

## projectmanager.dockerfile (builds cmb-truchas-win-projectmanager)
Uses cmb-win-smtk to build smtkprojectmanager.

## truchas.dockerfile (builds cmb-truchas-win-projectmanager)
Build cumulus and the truchas plugin.

## cmb.dockerfile
Uses the truchas image build cmb and create the modelbuilder package.
