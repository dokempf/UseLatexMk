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

Just use the following CMake function from anywhere in your project:

```
add_latex_document(SOURCE texsource
                   [TARGET target]
                   [EXCLUDE_FROM_ALL]
                   [REQUIRED]
                   [FATHER_TARGET father1 [father2 ...]]
                   )
```

The arguments:
* `SOURCE`: Required argument with a single tex source that defines the document to be built
* `TARGET`: An optional target name, defaults to a suitable mangling of the given source and its path.
* `EXCLUDE_FROM_ALL`: Set this to avoid the target from being built by default. If the FATHER_TARGET
  parameter is set, this option is automatically set.
* `REQUIRED`: Set this option to issue a fatal error if the document could not
  be built. By default it is only skipped.
* `FATHER_TARGET`: A list of meta-targets that should trigger a rebuild of this target (like `make doc`).
  The targets are expected to exist already. Specifying any such targets will automatically add the
  above EXCLUDE_FROM_ALL option.

# License

This software is provided under a BSD license, you can find it in the `.cmake` files of the project.