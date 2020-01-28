# CMB Modelbuilder Install Instructions

The CMB modelbuilder application can be used to create Truchas input
files from data entered in form-style attribute panels.


## Install

After opening the dmg, the macOS Finder should display a panel with 3
folders. Drag the "modelbuilder 6.x.x" and "Workflow" folders to the
Desktop or some other location on your file system as preferred. After
the folders are copied, you can close ("Eject") the dmg.

Before running modelbuilder, it is recommended that you also create a
projects root folder for modelbuilder projects that you will create.


## Run

From the macOS Finder, open the "modelbuilder 6.x.x" folder to show the
"modelbuilder.app" application. Because the app is not signed, macOS might
not give you permission to run the app by double-clicking "modelbuilder.app".
If that occurs, right-click on "modelbuilder.app" and select the "Open" menu
item. In response, macOS should display a pop-up window where you can chose
to open the application.


## Plugin Setup

The first time you run modelbuilder, the plugins used for Truchas might
not be loaded by default. Use these steps to update the application to auto-load two
plugins: smtkProjectManagerPlugin and smtkTruchasPlugin.

* In the "Tools" menu, select "Manager Plugins...", which brings up a dialog
  with two panels labeled "Remote Plugins" (which should be empty) and
  "Local PLugins".
* In the "Local Plugins" panel, look in the list for "smtkProjectManagerPlugin"
  and expand it by clicking the arrow to its left.  In the expanded section,
  check the box labeled "Auto Load".
* In the "Local Plugins" panel, look in the list for "smtkTruchasPlugin" and
  expand it by clicking the arrow to its left.  In the expanded section, check
  the box labeled "Auto Load".
* Close the panel, then close the application and restart. On restart, the
  "Project" menu should now be visible.


## Settings Setup

Before using modelbuilder to create and use Truchas projects, you also need to
set two items in the application preferences that specify the locations of the
Workflows and project-root folders:

* From the application's "modelbuilder" menu, select the "Preferences..." item
  to open the "Settings" dialog.
* In the dialog, select the tab labeled "Sim Pre-processing".
* Near the bottom of the tab is an item labeled "Workflows Folder". Set this to
  the "Workflows/Truchas" folder that you copied onto your system from the dmg
  package.
* Below that item is an item labeled "Projects Root Folder". Set this to a
  folder on your file system to use as the default parent for all "projects"
  you create with modelbuilder.
