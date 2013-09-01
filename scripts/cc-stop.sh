#!/bin/bash
# =========================================================================
#
# cc-stop.sh
# Copyright 2008-2013 Gamegineer contributors and others.
# All rights reserved.
#
# This is a sample CruiseControl environment stop script required for a
# Linux-based Gamegineer build server.  You should download this file to
# your build server and customize the variable definitions between the
# BEGIN-CUSTOM-VARIABLES and END-CUSTOM-VARIABLES markers.  The customized
# file should then be archived on your server and be part of your server's
# shutdown process.
#
# =========================================================================

# -------------------------------------------------------------------------
#
# BEGIN-CUSTOM-VARIABLES
#

#
# The build scripts home directory.  This is where your customized build
# scripts are located.
#
BUILD_SCRIPTS_HOME=~/scripts

#
# END-CUSTOM-VARIABLES
#
# -------------------------------------------------------------------------

#
# Start CruiseControl.
#
source $BUILD_SCRIPTS_HOME/cc-environment.sh
curl "http://localhost:8000/invoke?operation=halt&objectname=CruiseControl+Manager%3Aid%3Dunique"
