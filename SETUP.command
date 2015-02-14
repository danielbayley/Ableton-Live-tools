#!/bin/sh

#sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db \
#"INSERT INTO access VALUES('kTCCServiceAccessibility',\
#'com.ableton.live',0,1,1,NULL);"
#com.apple.Automator
#com.apple.systemevents

cd "${0%/*}" &&
{
	mv pre-commit* .git/hooks/pre-commit &&

	mv "$0" *.workflow makefile *.icns ~/.Trash #LICENCE*

	open *.als
}
killall Terminal
exit 0
