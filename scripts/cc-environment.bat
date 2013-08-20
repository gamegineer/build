@ECHO OFF

REM =========================================================================
REM
REM cc-environment.bat
REM Copyright 2008-2013 Gamegineer.org
REM All rights reserved.
REM
REM This is a sample CruiseControl environment setup script required for a
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
REM The build platform.  The value of each coordinate should correspond to the
REM same value used by the native Eclipse installation.
REM
SET BUILD_ARCH=x86
SET BUILD_OS=win32
SET BUILD_WS=win32

REM
REM The build's home directory.
REM
SET BUILD_HOME=%HOMEDRIVE%%HOMEPATH%\My Documents\build-workspace\builds

REM
REM Home directories of all build tools.  These are tools used by the
REM continuous integration environment.  Project builders should not rely on
REM these tools being present.
REM
REM NOTE: The CC_HOME variable must use the short directory name because, as
REM of CruiseControl 2.8.4, the CruiseControl startup scripts do not properly
REM handle directory names with embedded spaces.
REM
SET CC_HOME=C:\PROGRA~1\cruisecontrol-2.8.4
SET JAVA_HOME=C:\Program Files\Java\jdk1.6.0_45
SET SVN_HOME=C:\Program Files\Subversion

REM
REM Home directories of all project-specific build tools.  This list can
REM shrink or grow as the needs of all projects included in the continuous
REM integration environment change.
REM
REM Technically, projects should be getting these tools from their version
REM control repository.  However, due to size limitations, they are
REM pre-installed in the build environment.
REM
SET ANT_1_9_2_HOME=C:\Program Files\apache-ant-1.9.2
SET ECLIPSE_3_7_2_HOME=C:\Program Files\eclipse-3.7.2
SET ECLIPSE_TEST_FRAMEWORK_3_7_2_HOME=C:\Program Files\eclipse-test-framework-3.7.2
SET JDK_1_7_0_25_HOME=C:\Program Files\Java\jdk1.7.0_25

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
REM Set build tools home directories.
REM
SET BUILD_TOOLS_HOME=%BUILD_HOME%\tools
SET ANT_CONTRIB_1_0_B3_HOME=%BUILD_TOOLS_HOME%\ant-contrib-1.0b3
SET ANT_CONTRIB_LATEST_HOME=%ANT_CONTRIB_1_0_B3_HOME%
SET SVNANT_1_3_1_HOME=%BUILD_TOOLS_HOME%\svnant-1.3.1
SET SVNANT_LATEST_HOME=%SVNANT_1_3_1_HOME%

REM
REM Set CruiseControl server home directory.  
REM
SET CCDIR=%CC_HOME%

REM
REM Update path to include all build-related binaries.
REM
SET PATH=%SVN_HOME%\bin;%CCDIR%;%PATH%

REM
REM Alias a drive to refer to the build home directory.  We do this to avoid
REM excessively long paths during builds in the event the build home directory
REM is located within the build user's profile.
REM
SUBST G: "%BUILD_HOME%" 1> nul
G:

ECHO CruiseControl Environment
ECHO.
ECHO Type 'cruisecontrol.bat' to start CruiseControl.  Once started, use the
ECHO JMX console to stop CruiseControl.
