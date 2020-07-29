# CMB Modelbuilder Install Instructions for Linux

The CMB modelbuilder application can be used to create Truchas input
files from data entered in form-style attribute panels.


## Install

The linux version of modelbuilder is distributed as a tar file that
can be extracted to any folder on your system.

The modelbuilder packages are built using CentOS version 7 and has
not been tested on many different linux versions.


## Run

The modelbuilder executable is in the "bin" subfolder.

On some systems, including Ubuntu 16.04, you might see an error message
on startup like this:

    error while loading shared libraries: libcrypto.so.10: cannot open shared object file: No such file or directory

These libraries are not needed to run modelbuilder on the desktop (they are for
connecting paraview to remote servers). You can workaround this by deleteing or
moving the files that match lib/libcrypt*.


## Plugin Setup

The first time you run modelbuilder, the plugins used for Truchas might not
be loaded. Use these steps to update the application to auto-load two
plugins: smtkProjectManagerPlugin and smtkTruchasPlugin.

* In the "Tools" menu, select "Manage Plugins...", which brings up a dialog
  with two panels labeled "Remote Plugins" (which should be empty) and
  "Local PLugins".
* In the "Local Plugins" panel, look in the list for
  "smtkProjectManagerPlugin" and expand it by clicking the arrow to its left.
  In the expanded section, check the box labeled "Auto Load".
* In the same way, look in the list for "smtkTruchasPlugin" and expand it by
  clicking the arrow to its left. In the expanded section, check the box
  labeled "Auto Load".
* Close the panel, then close the application and restart. On restart, the
  "Project" menu should now be visible.

If either of the plugins are not shown in the panel, you might have to use
the "Load New..." button to navigate to the plugin .so file in the package.
The plugin files can be found under the install "lib" directory, at the path
lib/smtk-3.3.0/*.


## Settings Setup

Before using modelbuilder to create and use Truchas projects, you also need to
set an item in the application settings that specifies the locations of the
installed Truchas "workflows" folder:

* From the application's "Edit" menu, select the "Settings..." item to open
  the "Settings" dialog.
* In the dialog, select the tab labeled "Sim Pre-processing".
* Near the bottom of the tab is an item labeled "Workflows Folder". Set this
  to the "share/workflows/Truchas" folder in the unzipped modelbuilder package.
