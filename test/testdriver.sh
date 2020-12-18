#!/bin/bash

# This is the testing driver that configures that for each
# test scenario, creates a build and asserts the output.

# Define two functions to assert test results
function success {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        exit 1
    fi
}

function failure {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        return 0
    fi
    exit 1
}

# The currect working directory is considered the testspace,
# the first argument to this script should point to the source.
SRC=$1

# Scenario 1: A simple test case
rm -rf simple
mkdir simple
pushd simple
success cmake -DSCENARIO_SIMPLE=1 $SRC
success make install
popd

# Scenario 2: Depending on a fathering target
rm -rf father
mkdir father
pushd father
success cmake -DSCENARIO_FATHER=1 $SRC
success make pdf
popd

# Scenario 3: A simple test case
rm -rf install
mkdir install
pushd install
success cmake -DSCENARIO_INSTALL=1 $SRC
success make install
popd

# Scenario 4: Building two documents from one source
rm -rf duplicate
mkdir duplicate
pushd duplicate
failure cmake -DSCENARIO_DUPLICATE=1 $SRC
popd

# Scenario 4: Building a Minted document
rm -rf minted
mkdir minted
pushd minted
success cmake -DSCENARIO_MINTED=1 $SRC
success make install
popd
