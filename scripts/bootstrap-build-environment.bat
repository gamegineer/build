@ECHO OFF

REM =========================================================================
REM
REM bootstrap-build-environment.bat
REM Copyright 2008-2011 Gamegineer.org
REM All rights reserved.
REM
REM This is a sample build environment bootstrap script required for a
REM Windows-based Gamegineer build server.  You should download this file to
REM your build server and customize the variable definitions between the
REM BEGIN-CUSTOM-VARIABLES and END-CUSTOM-VARIABLES markers.  The customized
REM file should then be archived on your server and be used to bootstrap the
REM build environment.
REM
REM =========================================================================

REM -------------------------------------------------------------------------
REM
REM BEGIN-CUSTOM-VARIABLES
REM

REM
REM The build's workspace directory.
REM
SET BUILD_WORKSPACE_HOME=%HOMEDRIVE%%HOMEPATH%\My Documents\build-workspace

REM
REM The branch to build.
REM
SET BUILD_BRANCH=trunk

REM
REM Home directories of all build bootstrap tools.
REM
SET SVN_HOME=C:\Program Files\Subversion

REM
REM END-CUSTOM-VARIABLES
REM
REM -------------------------------------------------------------------------

REM
REM Checkout the build environment files from version control.
REM
"%SVN_HOME%\bin\svn" co --force http://gamegineer.svn.sourceforge.net/svnroot/gamegineer/build/%BUILD_BRANCH% "%BUILD_WORKSPACE_HOME%"

ECHO Ready to start the Gamegineer build environment.  Please execute build-environment.bat
