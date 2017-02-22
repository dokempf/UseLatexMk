Things that need to be done:
* Implement an `OUTPUT` parameter for non-default output name
* Add a hook for latexmk weirdness insertion
* Add a hook for additional pdflatex flags
* Add BYPRODUCTS to add_custom_command (cmake >= 3.2)
* Honor bibtex compiler and other stuff found by FindLATEX
* Investigate compatibility issues mentioned by Steffen
* Investigate release history of add_custom_command and determine how clever we can be
* Move documentation from README to UseLatexMk.cmake
* Add a testing suite to the project (even CI?)
* Do some research on what needs to be done on non-Unices
