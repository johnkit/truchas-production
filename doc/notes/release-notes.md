# 18-Apr-2020

Adds action (icon) to the Truchas toolbar for toggling the visibility
of the induction heating mesh.

Updates the create-project logic to automatically assign colors
to the input heat transfer mesh. The color palettes are currently
hard-coded to Brewer Qualitative Dark for surfaces (side sets) and
Brewer Qualitative Pastel for volumes (element blocks).

Updates the Emissivity View to require all side sets assigned to
an enclosure surface to also be assigned an emissivity value. Also
sets custom labels on the Emissivity View association widget.

Updates the python logic for writing Genre input files to surround
symmetry options in double quotes (e.g., "MirrorX", "RotZ4").

Fixes issue with busy/wait cursor not active for the entire time
when opening a project.

Fixes several non-fatal error messages related to SMTK color options
and resource visibility.


# 04-Apr-2020

Adds "SMTK display toolbar" with two icons/buttons for
"only show volume entities" and "only show surface entities",
respectively.

Bug fixes to Truchas workflow files (template and export script files).

Bug fix to material attribute view to respond to user changing
advance level (combo box).


# 29-Mar-2020

Adds support for enclosure radiation namelists. This includes:

* Top-level Genre/Truchas analysis switch
* New template and writer logic for generating Genre input files
* Updates and refactoring of logic to generate Truchas input files


# 23-Mar-2020

Adds feature to save and load "attribute collection" from
the Materials tab.

Fixes several bugs in validation logic for multiphase materials.


# 24-Feb-2020

Fixes bug in deleting attribute after it was renamed in the
same session.

Changes export panel to hide most settings as "Advanced". Only
item displayed by default is the path to the Truchas file to be
generated.


# 14-Feb-2020

Adds project "Save As" feature.


# 31-Jan-2020

Fixes bug that would crash modelbuilder when creating project.

Updates the entity "numbering" logic to use zero as the padding character,
so that alphabetic sorting will be more intuitive.

Updates the logic when adding a second model via the project menu to set
the association for the "electromagnetic" mesh, so that it displays correctly
in the Induction Heating tab.

Sets the application cursor to "busy" state when projects are loaded or
created.
