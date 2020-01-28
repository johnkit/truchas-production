# CMB Modelbuilder Install Instructions

The CMB modelbuilder application can be used to create Truchas input
files from data entered in form-style attribute panels.


## Install

The Windows version of modelbuilder is distributed as a zip file.
There is no installer program; you only unzip the file to a convenient
location in your user area. The modelbuilder.exe program is in the "bin"
subfolder. You can create a shortcut to it on your desktop, if desired.

Before running modelbuilder, it is recommended that you also create a
projects root folder for modelbuilder projects that you will create.


## Run

The first time you run modelbuilder.exe, your system might display a
blue popup with the title "Windows protected your PC". This because
our packages are not signed with MicroSoft. You can proceed to run
modelbuilder by clicking the "More Info" link, which brings up a
"Run anyway" button.


## Plugin Setup

The first time you run modelbuilder, the plugins used for Truchas might not
be loaded. Use these steps to update the application to auto-load two
plugins: smtkProjectManagerPlugin and smtkTruchasPlugin.

* In the "Tools" menu, select "Manager Plugins...", which brings up a dialog
  with two panels labeled "Remote Plugins" (which should be empty) and
  "Local PLugins".
* In the "Local Plugins" panel, look in the list for
  "smtkProjectManagerPlugin" and expand it by clicking the arrow to its left.
  In the expanded section, check the box labeled "Auto Load".
* In the "Local Plugins" panel, look in the list for "smtkTruchasPlugin" and
  expand it by clicking the arrow to its left. In the expanded section, check
  the box labeled "Auto Load".
* Close the panel, then close the application and restart. On restart, the
  "Project" menu should now be visible.

If any of the plugins are not shown in the panel, you might have to use
the "Load New..." button to navigate to the plugin dll file in the package.
The dll files can be found under the install "bin" directory, at the path
bin/smtk-3.3.0/*.


## Settings Setup

Before using modelbuilder to create and use Truchas projects, you also need to
set two items in the application settings that specify the locations of the
workflows and project-root folders:

* From the application's "Edit" menu, select the "Settings..." item to open
  the "Settings" dialog.
* In the dialog, select the tab labeled "Sim Pre-processing".
* Near the bottom of the tab is an item labeled "Workflows Folder". Set this
  to the "share/workflows/Truchas" folder in the unzipped modelbuilder package.
* Below that item is an item labeled "Projects Root Folder". Set this to a
  folder on your file system to use as the default parent for all "projects"
  you create with modelbuilder.
