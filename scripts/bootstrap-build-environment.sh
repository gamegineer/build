#!/bin/bash
# =========================================================================
#
# bootstrap-build-environment.sh
# Copyright 2008-2013 Gamegineer.org
# All rights reserved.
#
# This is a sample build environment bootstrap script required for a
# Linux-based Gamegineer build server.  You should download this file to
# your build server and customize the variable definitions between the
# BEGIN-CUSTOM-VARIABLES and END-CUSTOM-VARIABLES markers.  The customized
# file should then be archived on your server and be used to bootstrap the
# build environment.
#
# =========================================================================

# -------------------------------------------------------------------------
#
# BEGIN-CUSTOM-VARIABLES
#

#
# The build's workspace directory.
#
export BUILD_WORKSPACE_HOME=~/build-workspace

#
# The branch to build.
#
export BUILD_BRANCH=trunk

#
# Home directories of all build bootstrap tools.
#
export SVN_HOME=~/tools/svn

#
# END-CUSTOM-VARIABLES
#
# -------------------------------------------------------------------------

#
# Checkout the build environment files from version control.
#
$SVN_HOME/bin/svn co --force http://svn.code.sf.net/p/gamegineer/code/build/$BUILD_BRANCH $BUILD_WORKSPACE_HOME

echo "Ready to start the Gamegineer build environment.  Please source 'build-environment.sh'."
