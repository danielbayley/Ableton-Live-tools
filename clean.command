#! /bin/zsh -f --glob-dots
cd $0:h

# Enable Accessibility for Live
#sudo sqlite3 ~/Library/App*Support/com.apple.TCC/TCC.db \
#"INSERT INTO access VALUES('kTCCServiceAccessibility','com.ableton.live',0,1,1,NULL);"

# Install Services
#mv -f */*.workflow ~/Library/Services

rm -rf .git
git init --template=
git add -f */*.cfg *.als *git?* pre-commit && source $_ #Ableton*(/)
git commit -qm "Initial commit" &&
rm pre-commit
git clean -qfdx

source git*.command
