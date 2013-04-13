#!/bin/bash
# =========================================================================
#
# build-environment.sh
# Copyright 2008-2013 Gamegineer.org
# All rights reserved.
#
# This is a sample build environment setup script required for a
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
# The build's home directory.
#
export BUILD_HOME=~/build-workspace

#
# Home directories of all build tools.
#
export JAVA_HOME=~/tools/jdk1.6.0_37
export SVN_HOME=~/tools/svn
export ANT_HOME=~/tools/apache-ant-1.7.0
export ECLIPSE_HOME=~/tools/eclipse-3.7.2
export ECLIPSE_TEST_FRAMEWORK_HOME=~/tools/eclipse-test-framework-3.7.2
export CC_HOME=~/tools/cruisecontrol-bin-2.8.4

#
# CruiseControl e-mail build report configuration variables.
#
export CC_MAIL_HOST=smtp.isp.com
export CC_MAIL_PORT=25
export CC_MAIL_USESSL=false
export CC_MAIL_USERNAME=user@domain
export CC_MAIL_PASSWORD=password

#
# END-CUSTOM-VARIABLES
#
# -------------------------------------------------------------------------

#
# Set build tools home directories.
#
export BUILD_TOOLS_HOME=$BUILD_HOME/builds/tools
export ANT_CONTRIB_1_0_B3_HOME=$BUILD_TOOLS_HOME/ant-contrib-1.0b3
export ANT_CONTRIB_LATEST_HOME=$ANT_CONTRIB_1_0_B3_HOME
export SVNANT_1_3_1_HOME=$BUILD_TOOLS_HOME/svnant-1.3.1
export SVNANT_LATEST_HOME=$SVNANT_1_3_1_HOME

#
# Set CruiseControl server directories.  
#
export CCDIR=$CC_HOME
export JETTY_LOGS=$BUILD_HOME/logs

#
# Update path to include all build-related binaries.
#
export PATH=$JAVA_HOME/bin:$SVN_HOME/bin:$ANT_HOME/bin:$CCDIR:$PATH

#
# Change to build home directory.
#
cd $BUILD_HOME

echo Gamegineer build environment ready...
