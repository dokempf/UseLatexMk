#!/bin/bash

set -e

# This is the testing driver that configures that for each
# test scenario, creates a build and asserts the output.

# The currect working directory is considered the testspace,
# the first argument to this script should point to the source.
SRC=$1

# Scenario 1: A simple test case
rm -rf simple
mkdir simple
pushd simple
cmake -DSCENARIO_SIMPLE=1 $SRC
make install
popd

# Scenario 2: Depending on a fathering target
rm -rf father
mkdir father
pushd father
cmake -DSCENARIO_FATHER=1 $SRC
make pdf
popd

# Scenario 3: A simple test case
rm -rf install
mkdir install
pushd install
cmake -DSCENARIO_INSTALL=1 $SRC
make install
popd
