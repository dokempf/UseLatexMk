# What is UseLatexMk?

UseLatexMk is a cmake tool to build Latex documents from cmake projects.

Instead of doing the tedious work of implementing all the logic on how to
build Latex files in the CMake language (like the better known UseLATEX.cmake
does), it uses the LatexMk tool found on the system. As a result, there are
some advantages of using UseLatexMk.cmake over using UseLATEX.cmake:
* Additional input files, like e.g. code listing, do not have to be
  manually listed anymore. Dependency tracking is done by LatexMk instead
  of cmake.
* The generation procedure is more robust, because
  it relies on an upstream tool with a wider userbase.

There are currently some limitations to UseLatexMK:
* We intentionally restrict ourselves to building PDFs, as we believe
  that this covers 99% of todays use cases.

# What is needed to use UseLatexMk from my project?

You just need to
* copy all the CMake modules (`*.cmake`) from this project into your project
* Include them with `include(UseLatexMk)`

Now, you are ready to use it!

# How do I use it?

Just use the following CMake function `add_latex_document` from anywhere in your project.
For an explanation of parameters, check `UseLatexMk.cmake`.


# License

This software is provided under a BSD license, you can find it in the `.cmake` files of the project.