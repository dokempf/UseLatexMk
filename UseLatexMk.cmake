# UseLatexMk.cmake is a CMake module to build Latex documents
# from CMake.
#
# add_latex_document(SOURCE texsource
#                    [TARGET target]
#                    [EXCLUDE_FROM_ALL]
#                    [REQUIRED]
#                    [FATHER_TARGET father1 [father2 ...]]
#                    )
#
# The arguments:
# SOURCE
#   Required argument with a single tex source that defines the document to be built
# TARGET
#   An optional target name, defaults to a suitable mangling of the given source and its path.
# EXCLUDE_FROM_ALL
#   Set this to avoid the target from being built by default. If the FATHER_TARGET
#   parameter is set, this option is automatically set.
# REQUIRED
#   Set this option to issue a fatal error if the document could not
#   be built. By default it is only skipped.
# FATHER_TARGET
#   A list of meta-targets that should trigger a rebuild of this target (like "make doc").
#   The targets are expected to exist already. Specifying any such targets will automatically add the
#   above EXCLUDE_FROM_ALL option.
#
#
# For further informations, visit https://github.com/dokempf/UseLatexMk
#
#
# Copyright (c) 2017, Dominic Kempf, Steffen Müthing
#
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice, this
#   list of conditions and the following disclaimer in the documentation and/or
#   other materials provided with the distribution.
#
# * Neither the name of the Universität Heidelberg nor the names of its
#   contributors may be used to endorse or promote products derived from this
#   software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Find LATEX and LatexMk
find_package(LATEX)
find_package(LatexMk)

# Store the path to the latexmkrc template
set(LATEXMKRC_TEMPLATE ${CMAKE_CURRENT_SOURCE_DIR}/latexmkrc.cmake
    CACHE FILEPATH "The template to use for latexmkrc files")

function(add_latex_document)
  # Parse the input parameters to the function
  set(OPTION REQUIRED EXCLUDE_FROM_ALL)
  set(SINGLE SOURCE TARGET)
  set(MULTI FATHER_TARGET)
  include(CMakeParseArguments)
  cmake_parse_arguments(LMK "${OPTION}" "${SINGLE}" "${MULTI}" ${ARGN})

  if(LMK_UNPARSED_ARGUMENTS)
    message("add_latex_document: Unparsed arguments! This often indicates typos in named arguments.")
  endif()

  # Apply default arguments and check for required arguments
  if(NOT LMK_SOURCE)
    message(FATAL_ERROR "No tex source specified for add_latex_document!")
  endif()
  if(NOT LMK_TARGET)
    # Construct a nice target name from the source file
    get_filename_component(LMK_TARGET ${LMK_SOURCE} ABSOLUTE)
    file(RELATIVE_PATH LMK_TARGET ${CMAKE_SOURCE_DIR} ${LMK_TARGET})
    string(REPLACE "/" "_" LMK_TARGET ${LMK_TARGET})
    string(REPLACE "." "_" LMK_TARGET ${LMK_TARGET})
  endif()
  if(LMK_FATHER_TARGET)
    set(LMK_EXCLUDE_FROM_ALL TRUE)
  endif()

  # Check the existence of the latexmk executable and skip/fail if not present
  if(NOT (LATEXMK_FOUND AND PDFLATEX_COMPILER))
    if(LMK_REQUIRED)
      message(FATAL_ERROR "Some Latex documents were required by the project, but LATEX or LatexMk were not found!")
    else()
      return()
    endif()
  endif()

  # Inspect the EXCLUDE_FROM_ALL option
  if(LMK_EXCLUDE_FROM_ALL)
    set(ALL_OPTION "")
  else()
    set(ALL_OPTION "ALL")
  endif()

  # Generate a latexmkrc file for this project
  set(LATEXMKRC_FILE "${CMAKE_CURRENT_BINARY_DIR}/${LMK_TARGET}.latexmkrc"
  configure_file(${LATEXMKRC_TEMPLATE} ${LATEXMKRC_FILE} @ONLY)

  # Call the latexmk executable
  add_custom_target(${LMK_TARGET}
                    ${ALL_OPTION}
                    COMMAND ${LATEXMK_EXECUTABLE} -r ${LATEXMKRC_FILE} ${LMK_SOURCE}
                    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
                    COMMENT "Building PDF from ${LMK_SOURCE}..."
                    )

  # Add dependencies to father targets
  foreach(father ${LMK_FATHER_TARGET})
    if(NOT TARGET ${father})
      message(FATAL_ERROR "The target given to add_latex_documents FATHER_TARGET parameter does not exist")
    endif()
    add_dependencies(${father} ${LMK_TARGET})
  endforeach()
endfunction()
