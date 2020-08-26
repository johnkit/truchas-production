# 03-Aug-2020

Continued attribute reorganization

* Updates logic for making phase properties optional vs required
  depending on state of shared/common property.
* Uses new option to require specific_enthalpy_func and solid_frac_table
  editors to be expression-only.
* Refactors validation logic into C++ class with python bindings, so
  that same validation logic is used for UI and export functions.
* Migrates other material-attribute logic to C++ class and so that it can
  unit tests can be added.


# 11-Jul-2020

Major attribute reorganization, primarily focused on materials

* Flatten material/phase properties
* Add "invariant-properties" group for density, reference_enthalpy,
  reference_temperature
* Make shared properties now act as default properties (can be overridden
  in individual phases)
* Add support for Truchas specific_enthalpy_func and solid_frac_table variables
* Copy phase 1 properties to common group when adding 2nd phase
* Add "body" attribute and "Body" tab to subsume initial-conditions and
  material associations
* Refactor views to replace "Globals" and "Other" tabs with "Outputs"

Backward compatibility has not been tested and is not guaranteed.


# 14-Jun-2020

Updates export logic to write material namelists in the current
Truchas format (droppoing MATERIAL_SYSTEM namelist and many other
changes).

Fixes bugs in Truchas writer logic.

Note: the background-material option is temporarily unavailable
pending resolution of user interface issues.


# 31-May-2020

Fixes bug where Truchas toolbar didn't recognize models of
project when first created.

Fixes export bugs writing material functions, tabular_dim,
emissivity. Omits coord_scale_factor from ENCLOSURE_RADIATION
namelist.


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
