#! /bin/zsh -fG --glob-assign

log=~/Library/Preferences/Ableton/Live*/Log.txt(om[1]) # Latest
audio='wav|aif*'
#-------------------------------------------------------------------------------

# Current project
tail -r $log | grep -om1 /.\*.als | read && cd ${${REPLY:h}//\%20/ }

# Wait for export
touch .tmp
until [ *.$~audio -nt .tmp ] #-N #(oc[1])
do sleep 1
done && export=*.$~audio(oc[1])

# Convert to ALAC
afconvert -d alac $export:r{.$~audio,.m4a} &&
mv $export ~/.Trash
sleep 2
# Rename [any] matching .asd
mv $export:r{.*,.m4a}.asd

#-------------------------------------------------------------------------------
trap 'rm .tmp' EXIT
