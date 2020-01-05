#!/bin/zsh
rmFolderWithProgress() { rm -rv $1 | pv -l -s $(du -a $1 | wc -l) > /dev/null }
vf() { fzf | xargs -r -I % $EDITOR % ;}
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
