# macOS builds

At present, macOS builds are done on "bare metal", that is,
without docker containers or other virtual machine environments.
As such, macOS build scripts are specific to each individual machine.

## Build on TalosIV

As of August 2020, Bob's TalosIV system is the preferred build machine
because it has a single python 3 installed (version python 3.7).

1\. Sign into johnt account on Talos:

    $ ssh johnt@talosiv

2\. Get latest source for superbuild and ace3p-production

    $ cd ~/projects/truchas/git/cmb-superbuild
    $ git status  ==> make sure nothing is modified
    $ git checkout truchas-production
    $ git pull
    $ git submodule update

    $ cd ~/projects/truchas/git/truchas-production
    $ git status  ==> make sure nothing is modified
    $ git checkout master
    $ git pull

3\. Clear and start build

    $ cd ~/projects/truchas/build/production
    $ rm -rf *
    $ ../../git/truchas-production/macos/talosiv.sh

That will ask if the superbuild is ready; enter 'y' to proceed.

On success a .dmg file will be generated in the build directory.

4\. Can then scp from TalosIV to local machine. Fill in the DATECODE below:

    $ scp johnt@talosiv:projects/truchas/build/production/modelbuilder-truchas-macos-{DATECODE}.dmg
