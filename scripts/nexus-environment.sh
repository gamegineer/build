#!/bin/bash
# =========================================================================
#
# nexus-environment.sh
# Copyright 2008-2013 Gamegineer.org
# All rights reserved.
#
# This is a sample Nexus environment setup script required for a
# Linux-based Gamegineer build server.  You should download this file to
# your build server and customize the variable definitions between the
# BEGIN-CUSTOM-VARIABLES and END-CUSTOM-VARIABLES markers.  The customized
# file should then be archived on your server and be part of your server's
# startup process.
#
# =========================================================================

# -------------------------------------------------------------------------
#
# BEGIN-CUSTOM-VARIABLES
#

#
# Home directories of all required tools.  These are tools used by the
# Nexus environment.
#
export JAVA_HOME=~/tools/jdk1.6.0_45
export NEXUS_HOME=~/tools/nexus-2.3.1-01

#
# END-CUSTOM-VARIABLES
#
# -------------------------------------------------------------------------

#
# Update path to include all Nexus-related binaries.
#
export PATH=$NEXUS_HOME/bin:$PATH
