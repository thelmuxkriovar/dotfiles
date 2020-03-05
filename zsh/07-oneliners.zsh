#!/bin/zsh
rmFolderWithProgress() { rm -rv $1 | pv -l -s $(du -a $1 | wc -l) > /dev/null }
vf() { fzf | xargs -r -I % $EDITOR % ;}
syncProgress() { watch -n .5 -d grep -e Dirty: -e Writeback: /proc/meminfo }
reverseDictionary() { dictionary -r $* }
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
