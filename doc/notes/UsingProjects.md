# Using projects in modelbuilder

The "Projects" was added to modelbuilder in 2019 to provide an easier way
to manage simulation assets. This document provides a simple example using
the project feature to create a simulation.

Before starting:

* Make sure you have completed the platform-specific install instructions in
  the linuxInstall.md, macosInstall.md, or windowsInstall.md file. In
  particular, be sure you have (i) set the smtkProjectManagerPlugin to load
  automatically, (ii) configured the applications settings/preferences items
  "Workflows Folder" and "Projects Root Folder".
* The example requires a mesh file, preferably small and of type genesis (.gen).

## Initial View Setup
When first starting the application, a number of view panels appear on the left-
hand side of the application. Each panel is a Dock Widget that can be closed or
undocked in the same way that ParaView panels work. For simulation preprocessing,
the following setup is recommended, although users can chose whatever
configuration they prefer:

* Close the Properties and Operations panels
* This should leave 3 view panels: Attribute Editor, Resources, Cumulus Jobs.
* Undock the Cumulus Jobs view and drag it over the Attribute Editor view,
  so that it docks as a second tab.
* Undock the Resources view and drag it over the Attribute Editor view,
  so that it docks as a third tab.
* Drag the left-hand panel so that it occupies approximately 1/3 of the
  widown size.You can change any of the fields as preferred, but
* Select the Resoures view (tab).

## Creating a Project

From the Project menu, select "New Project...", which brings up a dialog window.
If things have been configured correctly, you should only need to enter two items
in the dialog:

* "Name (Subdirectory)" - the project name, which is used as the subdirectory for
  storing project assets. As such, the string you enter must be a valid directory
  name.
* "Geometry File" - a mesh file, typically type .gen.

After entering the two fields, click the "Apply" button and two resources are
imported into the project and displayed in modelbuilder.

Once the model appears in the 3D view, is it important to SAVE THE PROJECT WHEN
IT IS FIRST CREATED. This is because, at present, the contents of the attribute
resource is typically modified when first displayed in modelbuilder. To save the
project, use the "Save Project" menu item in the "Project" menu.

At this point, you can select the "Attribute Editor" view (tab) and begin
defining the simulation attributes with the same UI as in previous versions of
modelbuilder. When you have completed defining the simulation, be sure to save
the project again.

## Writing Solver Input

To generate the solver file, use the "Project Export" item in the "Project" menu,
which brings up a dialog window. The dialog should enter default values for each
field, although you are free to change them as desired. Click the "Apply" button 
to write the input file to the local project directory.


## Saving Projects

Be sure to use the "Project Save" item after making changes to the simulation
attributes.
