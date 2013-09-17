#!/usr/bin/perl

# Perl script to scrub unwanted artifacts in CruiseControl (CC)

# This script scans a specified CC logfile directory, and then scrubs
# any folders in the artifact tree that do not have a corresponding
# logfile entry.

# It is designed to be run from a cron or at scheduler.

# Note: While I could have written this script in a few lines of obscure perl
# I have chosen to make it much simpler and stepwise in design and operation
# to make it easier to extend and more comprehensible to perl unitiates.

# Author: Owen Carter; ocarter at mirabeau point nl; 
# http://www.linkedin.com/in/easytarget

# (C) no damn copyright.... no damn warranty either :-)

# Changelog:
# 16/4/2007		Owen Carter		Initial version for Mirabeau (http://mirabeau.nl/).

# ------------------------------------

# Assumptions:
# Valid entries in the log file directory have the forms:
# Failed Builds:      logXXXXXXXXXXXXXX.xml
# Successful Builds:  logXXXXXXXXXXXXXXLbuild.Y.xml
# - Successful and unsuccessful builds are treated equally.
# (X= 14 digits as a date/time stmp YYYYMMDDHHMMSS)
# (Y= Build Number, 1 or more digits.)

# Takes two arguments:
# - Path of the logfile directory
# - Path of the archives directory

# Modules:
# We need File:Path to give us the recursive directory removal tool 'rmtree'..
use File::Path;

die "Usage: $0 <LogFile_Dir> <Artifact_Dir> [run|verbose|test]\n" unless (@ARGV == 2 or @ARGV == 3);
    
$LOGDIR      = $ARGV[0];
$ARTIFACTDIR = $ARGV[1];
$RUNLEVEL    = "run" ;
if ( @ARGV == 3 ) {
	if ( ($ARGV[2] eq "run") || ($ARGV[2] eq "verbose") || ($ARGV[2] eq "test")) {
		$RUNLEVEL = $ARGV[2];
	}
	else {
	die "$0: Incorrect run level '$ARGV[2]' specified; valid values are 'run' (default), 'verbose', or 'test'.\n";
	}
}

# Declarations

$logitem = "";
@logignore = ("");
$logcount = 0;
@loglist = ("");

$cacheitem = "";
@cacheignore = ("");
$cachekeepcount = 0;
$cachedelcount = 0;

$artitem = "";
@artignore = ("");
$artkeepcount = 0;
$artdelcount = 0;

# Print info on the run level if in test mode
# -------------------------------------------

if ( $RUNLEVEL eq "test" ) 
{
	print "\n----------------------------------------------------------\n";
	print "- Currently running in TEST mode.                        -\n";
	print "- No file/directory write operations will be performed!  -\n";
	print "----------------------------------------------------------\n";
}


# Generate list of valid logfile timestamps
# -----------------------------------------

print "\nEvaluating log files in $LOGDIR:\n" unless $RUNLEVEL eq "run"; 

opendir (LOGS, "$LOGDIR") or die "Error: Couldn't open $LOGDIR : $!";
# build a list of all valid logfiles in the directory
while ( defined ($logitem = readdir(LOGS)) )
{
	print "."  unless $RUNLEVEL eq "run";
	if ( ( $logitem =~ /^log\d{14}.xml/ ) || ( $logitem =~ /^log\d{14}Lbuild.\d+.xml/ ) ) 
	{
		# It's a valid logfile, so push it's datetimestamp into the valid list
		$logitem =~ s/.*(\d{14}).*/$1/;
		push @loglist, $logitem;
		$logcount++;
	}
	else 
	{
		# It's not a valid logfile, add to the ignore list.
		push @logignore, $logitem;
	}
}
closedir (LOGS);


print "\n\n$logcount valid logfiles found.\n" unless $RUNLEVEL eq "run";
print "Ignored items in $LOGDIR: @logignore\n\n" unless $RUNLEVEL eq "run";

# Find non-matching cached html logfiles, and delete them.
# --------------------------------------------------------


print "\nEvaluating cached log files in $LOGDIR/_cache:\n" unless $RUNLEVEL eq "run";

opendir (LOGCACHE, "$LOGDIR/_cache") or die "Error: Couldn't open $LOGDIR/_cache : $!";
while ( defined ($cacheitem = readdir(LOGCACHE)) )
{
	print "."  unless $RUNLEVEL eq "run";
	# Ignore unless it is a file with a sensible filename.
	if ( ( $cacheitem =~ /^log\d{14}.*.html$/ ) && ( -f "$LOGDIR/_cache/$cacheitem") ) 
	{

		# We know the filename format, so just take the 14 digits comprising the timestamp
		$cachestamp = substr ( $cacheitem, 3, 14 );

		# Does it match up with any logfile? 
		if ( index ( "@loglist", $cachestamp ) != -1 ) 
		{
			print "KEEP $LOGDIR/_cache/$cacheitem\n" unless $RUNLEVEL eq "run";
			$cachekeepcount++;
		}
		else 
		{
			# Valid filename but no corresponding logfile.. delete it.
			print "DELETE $LOGDIR/_cache/$cacheitem\n" unless $RUNLEVEL eq "run";
			unlink ( "$LOGDIR/_cache/$cacheitem" ) unless $RUNLEVEL eq "test";
			$cachedelcount++;
		}
	}
	else 
	{
		# Not a valid cache file, add to the ignore list.
		push @cacheignore, $cacheitem;
	}
}
closedir (LOGCACHE);

print "\n", +($cachekeepcount+$cachedelcount), " valid cache files found.\n" unless $RUNLEVEL eq "run";
print "Ignored items in $LOGDIR/_cache: @cacheignore\n\n" unless $RUNLEVEL eq "run";

# Find non-matching valid artifact directories and delete them.
# -------------------------------------------------------------

if ( $RUNLEVEL ne "run" ) 
{
	print "\nEvaluating log files in $LOGDIR:\n";
}

opendir (ARTS, "$ARTIFACTDIR") or die "Error: Couldn't open $ARTIFACTDIR : $!";
while ( defined ($artitem = readdir(ARTS)) )
{
	print "."  unless $RUNLEVEL eq "run";
	# Ignore unless it is a directory with a 14 numerical digit name.
	if ( ( $artitem =~ /^\d{14}$/ ) && ( -d "$ARTIFACTDIR/$artitem") ) 
	{
		# Does it match any logfiles? 
		if ( index ( "@loglist", $artitem ) != -1 ) 
		{
			print "KEEP $ARTIFACTDIR/$artitem\n" unless $RUNLEVEL eq "run";
			$artkeepcount++;
		} 
		else 
		{
			# Ok, valid directoryname format, but no corresponding log entry.. delete it.
			print "DELETE $ARTIFACTDIR/$artitem\n" unless $RUNLEVEL eq "run";
			rmtree ( "$ARTIFACTDIR/$artitem" ) unless $RUNLEVEL eq "test";			
			$artdelcount++;
		}
	}
	else 
	{
		push @artignore, $artitem;
	}
}
closedir (ARTS);

print "\n", +($artkeepcount+$artdelcount), " valid artifact directories found.\n" unless $RUNLEVEL eq "run";
print "Ignored items in $ARTIFACTDIR: @artignore\n\n" unless $RUNLEVEL eq "run";

# Wrap-Up
# -------

# Work out our project name for the log (it's the last part of the logdir path).
$project = $LOGDIR;
$project =~ s/^.*[\\\/]//;

# Make a nice log entry.
print scalar localtime," - $project : $artkeepcount artifact directories have been retained and $artdelcount have been deleted; $cachedelcount cache entries have been scrubbed.\n" unless $RUNLEVEL eq "test";
print scalar localtime," - $project : $artkeepcount artifact directories would be retained and $artdelcount would be deleted; $cachedelcount cache entries would be scrubbed.\n" unless $RUNLEVEL ne "test";
