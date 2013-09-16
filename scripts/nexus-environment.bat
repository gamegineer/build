@ECHO OFF

REM =========================================================================
REM
REM nexus-environment.bat
REM Copyright 2008-2013 Gamegineer contributors and others.
REM All rights reserved.
REM
REM This is a sample Nexus environment setup script required for a
REM Windows-based Gamegineer build server.  You should download this file to
REM your build server and customize the variable definitions between the
REM BEGIN-CUSTOM-VARIABLES and END-CUSTOM-VARIABLES markers.  The customized
REM file should then be archived on your server and be part of your server's
REM startup process.
REM
REM =========================================================================

REM -------------------------------------------------------------------------
REM
REM BEGIN-CUSTOM-VARIABLES
REM

REM
REM Home directories of all required tools.  These are tools used by the
REM Nexus environment.
REM
SET JAVA_HOME=C:\Program Files\Java\jdk1.7.0_25
SET NEXUS_HOME=C:\Program Files\nexus-2.6.2-01

REM
REM END-CUSTOM-VARIABLES
REM
REM -------------------------------------------------------------------------

REM
REM Update path to include all Nexus-related binaries.
REM
SET PATH=%JAVA_HOME%\bin;%NEXUS_HOME%\bin;%PATH%

ECHO Nexus Environment
ECHO.
ECHO Type 'nexus.bat console' to start Nexus.  Once started, press CTRL+C to
ECHO stop Nexus.
