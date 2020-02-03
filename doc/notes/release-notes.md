# 31-Jan-2020

Fixes bug that would crash modelbuilder when creating project.

Updates the entity "numbering" logic to use zero as the padding character,
so that alphabetic sorting will be more intuitive.

Updates the logic when adding a second model via the project menu to set
the association for the "electromagnetic" mesh, so that it displays correctly
in the Induction Heating tab.

Sets the application cursor to "busy" state when projects are loaded or
created.
