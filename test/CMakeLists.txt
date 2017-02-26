if(SCENARIO_SIMPLE)
  add_latex_document(SOURCE simple.tex
                     INSTALL ${CMAKE_BINARY_DIR}/install-test)
endif()

if(SCENARIO_FATHER)
  add_custom_target(pdf)
  add_latex_document(SOURCE simple.tex
                     FATHER_TARGET pdf)
endif()

if(SCENARIO_INSTALL)
  add_latex_document(SOURCE simple.tex
                     INSTALL ${CMAKE_BINARY_DIR}/install-test
                     EXCLUDE_FROM_ALL
                     BUILD_ON_INSTALL)
endif()
