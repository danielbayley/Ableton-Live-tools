#!/usr/bin/env bash
#shopt -s extglob #nullglob

log=$(ls -t ~/Lib*/Pref*s/Ableton/Live*/Log.txt | head -1)

int=4 #s

#-------------------------------------------------------------------------------

#Export Audio
osascript -l JavaScript -e "Live = Application('System Events').processes.byName('Live')

menu = Live.menuBars[0].menuBarItems.byName('File')

menu.menus[0].menuItems.byName('Export Audio/Video...').click()"

#osascript -e 'tell app "system events" to tell process "Live"

#	click menu item "Export Audio/Video..." of menu 1 of menu bar item "File" of menu bar 1
#end tell'

#Current
project=\
$(
	grep file:// "$log"| tail -1 | sed 's|.*://(.*)//.*|\1|'|

	perl -MURI::Escape -e "print uri_unescape '$(xargs)'"
)
cd "$project"

#Wait for export
while [ ! -N *.wav ] && [ ! -N *.aif ]
do
	sleep $int
done
set "$(ls -t *.{wav,aif} | head -1)" #aif?(f)

#Covert to ALAC
afconvert -d alac "$1" "${1%.*}".m4a &&
{
	mv "$1" ~/.trash #original

	#Rename [any] accompanying .asd
	[[ $1.asd ]] && mv {"$1","${1%.*}".m4a}.asd
}
exit 0

#TODO Detect exported files across project subfolders
