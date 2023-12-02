# This file is only used for basic testing/debugging.
# It is not actually needed for downstream use.
#

cmake_minimum_required(VERSION 3.10)
project(UseLatexMk)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
include(UseLatexMk)

install(CODE "message(\"This is only here, to trigger the existence of an installation target for the test project\")")
add_subdirectory(test)
