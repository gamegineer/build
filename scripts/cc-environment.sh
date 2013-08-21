#!/bin/bash
# =========================================================================
#
# cc-environment.sh
# Copyright 2008-2013 Gamegineer.org
# All rights reserved.
#
# This is a sample CruiseControl environment setup script required for a
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
# The build platform.  The value of each coordinate should correspond to the
# same value used by the native Eclipse installation.
#
export BUILD_ARCH=x86_64
export BUILD_OS=linux
export BUILD_WS=gtk

#
# The build's home directory.
#
export BUILD_HOME=~/build-workspace/builds

#
# Home directories of all build tools.  These are tools used by the
# continuous integration environment.  Project builders should not rely on
# these tools being present.
#
export CC_HOME=~/tools/cruisecontrol-bin-2.8.4
export JAVA_HOME=~/tools/jdk1.6.0_45
export SVN_HOME=~/tools/svn

#
# Home directories of all project-specific build tools.  This list can
# shrink or grow as the needs of all projects included in the continuous
# integration environment change.
#
# Technically, projects should be getting these tools from their version
# control repository.  However, due to size limitations, they are
# pre-installed in the build environment.
#
export ANT_1_9_2_HOME=~/tools/apache-ant-1.9.2
export ECLIPSE_3_7_2_HOME=~/tools/eclipse-3.7.2
export ECLIPSE_TEST_FRAMEWORK_3_7_2_HOME=~/tools/eclipse-test-framework-3.7.2
export JDK_1_7_0_25_HOME=~/tools/jdk1.7.0_25
export MAVEN_3_0_5_HOME=~/tools/apache-maven-3.0.5

#
# CruiseControl e-mail build report configuration variables.
#
export CC_MAIL_HOST=smtp.isp.com
export CC_MAIL_PORT=25
export CC_MAIL_USESSL=false
export CC_MAIL_USERNAME=user@domain
export CC_MAIL_PASSWORD=password

#
# The X display to use for any build tools that require a display.
#
export DISPLAY=:99

#
# END-CUSTOM-VARIABLES
#
# -------------------------------------------------------------------------

#
# Set build tools home directories.
#
export BUILD_TOOLS_HOME=$BUILD_HOME/tools
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
export PATH=$SVN_HOME/bin:$CCDIR:$PATH

#
# Change to CruiseControl working directory.
#
cd $BUILD_HOME
