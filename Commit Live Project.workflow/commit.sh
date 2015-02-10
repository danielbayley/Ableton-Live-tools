#!/usr/bin/env bash

log=$(ls -t ~/Lib*/Pref*s/Ableton/Live*/Log.txt | head -1)

#-------------------------------------------------------------------------------

[ ! -d .git ] && exit 1

#Current
project=\
$(
	grep file:// "$log"| tail -1 | sed 's|.*://(.*)//.*|\1|'|

	perl -MURI::Escape -e "print uri_unescape '$(xargs)'"
)
cd "$project" && set **/*.als

#Uncompress set/s
ext=.${1#*.}

gunzip -qS $ext "$@" &&
{
	for file in "${@%.*}"
	do
		mv "$file"{,$ext}
	done
}
#Commit
if [ $(which github) ] #sourcetree
then
	github

elif [ $(which gittower) ]
then
	gittower "$PWD"
else
	osascript -e 'get text returned of (display dialog ¬
	¬
	"Git commit Live project" with title "Ableton Live" ¬
	¬
	default answer "" with icon path to resource "app.icns" in bundle ¬
	¬
	(path to application "Live"))'| read commit &&

	git add -A && git commit -m "$commit"
fi
exit 0
