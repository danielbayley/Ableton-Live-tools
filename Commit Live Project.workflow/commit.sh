#!/bin/sh

log=$(ls -t ~/Lib*/Pref*s/Ableton/Live*/Log.txt | head -1)

#-------------------------------------------------------------------------------

[ ! -d .git ] && exit 1

cd "$( #Current project
	grep file:// "$log"| tail -1 | sed -E 's|.*://(.*)//.*|\1|'|

	perl -MURI::Escape -e "print uri_unescape '$(xargs)'"
)"
#Uncompress set/s
find . -name \*.als | while read set
do
	gunzip -qS .${set##*.} "$set" &&

	mv "${set%.*}" "$set"
done

#Commit
if [ $(which github) ] #sourcetree
then
	github

elif [ $(which gittower) ]
then
	gittower .
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
