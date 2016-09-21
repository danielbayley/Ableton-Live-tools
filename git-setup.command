#! /bin/zsh -f
cd $0:h

hook=.git/hooks/pre-commit
gzip='zcat -f'

git config filter.gzip.smudge $gzip
git config filter.gzip.clean $gzip
git config filter.gzip.required true
git config diff.gzip.command $gzip
#git config include.path ../.gitconfig #mv -f {,.git/}config

mkdir -p $hook:h #&& ln -s {../../.,$_/}$hook:t #mv {,$_/}$hook:t
git show master:$hook:t >> $hook && chmod +x $hook
#git config core.hooksPath .

git lfs install

#open *.als([1])
killall Terminal
exit
