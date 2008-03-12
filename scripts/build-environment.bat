@ECHO OFF

REM
SUBST g: "%HOMEDRIVE%%HOMEPATH%\My Documents\builds" 1> nul

REM
SET JAVA_HOME=C:\Program Files\Java\jdk1.6.0_05
SET SVN_HOME=C:\Program Files\Subversion
SET ANT_HOME=C:\Program Files\apache-ant-1.7.0
SET SVNANT_HOME=C:\Program Files\svnant-1.0.0
SET CCDIR=C:\PROGRA~1\cruisecontrol-2.7.1\main

REM
SET PATH=%JAVA_HOME%\bin;%SVN_HOME%\bin;%ANT_HOME%\bin;%CCDIR%\bin;%PATH%

G:

ECHO Gamegineer build environment ready...
