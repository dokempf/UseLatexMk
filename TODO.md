Things that need to be done:
* Implement a `OUTPUT` parameter for non-default output name
* Add a hook for latexmk weirdness insertion
* Add a hook for additional pdflatex flags
* Add BYPRODUCTS to add_custom_command (cmake >= 3.2)
* Honor bibtex compiler and other stuff found by FindLATEX
* Investigate compatibility issues mentioned by Steffen
* Investigate release history of add_custom_command and determine how clever we can be
