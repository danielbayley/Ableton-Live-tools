#!/usr/bin/env bash

log=$(ls -t ~/Lib*/Pref*s/Ableton/Live*/Log.txt | head -1)

#-------------------------------------------------------------------------------

#Save Live Set
osascript -l JavaScript -e "Live = Application('System Events').processes.byName('Live')

menu = Live.menuBars[0].menuBarItems.byName('File')

menu.menus[0].menuItems.byName('Save Live Set').click()" >/dev/null

#osascript -e 'tell app "system events" to tell process "Live"

#	click menu item "Save Live Set" of menu 1 of menu bar item "File" of menu bar 1
#end tell'

#Current
project=\
$(
	grep file:// "$log"| tail -1 | sed 's|.*://(.*)//.*|\1|'|

	perl -MURI::Escape -e "print uri_unescape '$(xargs)'"
)
cd "$project" && set **/*.als

#Uncompress set/s
ext=.${1#*.}

gunzip -qS $ext "$@" && #gzcat $@ >
{
	for file in "${@%.*}"
	do
		mv "$file"{,$ext}
	done
}
exit 0
