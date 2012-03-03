@ECHO OFF

REM =========================================================================
REM
REM build-environment.bat
REM Copyright 2008-2012 Gamegineer.org
REM All rights reserved.
REM
REM This is a sample build environment setup script required for a
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
REM The build's home directory.
REM
SET BUILD_HOME=%HOMEDRIVE%%HOMEPATH%\My Documents\build-workspace\builds

REM
REM Home directories of all build tools.
REM
REM NOTE: The CC_HOME variable must use the short directory name because, as
REM of CruiseControl 2.8.4, the CruiseControl startup scripts do not properly
REM handle directory names with embedded spaces.
REM
SET JAVA_HOME=C:\Program Files\Java\jdk1.6.0_31
SET SVN_HOME=C:\Program Files\Subversion
SET ANT_HOME=C:\Program Files\apache-ant-1.7.0
SET SVNANT_HOME=C:\Program Files\svnant-1.3.0
SET ECLIPSE_HOME=C:\Program Files\eclipse-3.7.2
SET ECLIPSE_TEST_FRAMEWORK_HOME=C:\Program Files\eclipse-test-framework-3.7.2
SET CC_HOME=C:\PROGRA~1\cruisecontrol-2.8.4

REM
REM CruiseControl e-mail build report configuration variables.
REM
SET CC_MAIL_HOST=smtp.isp.com
SET CC_MAIL_PORT=25
SET CC_MAIL_USESSL=false
SET CC_MAIL_USERNAME=user@domain
SET CC_MAIL_PASSWORD=password

REM
REM END-CUSTOM-VARIABLES
REM
REM -------------------------------------------------------------------------

REM
REM Set CruiseControl server home directory.  
REM
SET CCDIR=%CC_HOME%

REM
REM Update path to include all build-related binaries.
REM
SET PATH=%JAVA_HOME%\bin;%SVN_HOME%\bin;%ANT_HOME%\bin;%ECLIPSE_HOME%;%CCDIR%;%PATH%

REM
REM Alias a drive to refer to the build home directory.  We do this to avoid
REM excessively long paths during builds in the event the build home directory
REM is located within the build user's profile.
REM
SUBST G: "%BUILD_HOME%" 1> nul
G:

ECHO Gamegineer build environment ready...
