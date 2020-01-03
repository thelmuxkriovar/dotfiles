#############################
#  _____    _               #
# |__  /___| |__  _ __ ___  #
#   / // __| '_ \| '__/ __| #
#  / /_\__ \ | | | | | (__  #
# /____|___/_| |_|_|  \___| #
#                           #
#############################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


source ~/Dotfiles/zsh/antigen.zsh

antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle git
antigen bundle z
antigen bundle command-not-found
antigen bundle kennethreitz/autoenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle andrewferrier/fzf-z
antigen bundle joepvd/zsh-hints
antigen bundle changyuheng/zsh-interactive-cd

antigen apply

export PATH=$HOME/.local/bin:$HOME/.bin:/usr/local/bin:/home/danny/.gem/ruby/2.6.0/bin:$PATH
export PATH=$PATH:$(composer global config bin-dir --absolute 2>/dev/null)
export PATH="$HOME/.symfony/bin:$PATH"
export FZFZ_EXTRA_OPTS="--cycle"
export FZF_DEFAULT_OPTS="--cycle"

function rmFolderWithProgress {
	rm -rv $1 | pv -l -s $(du -a $1 | wc -l) > /dev/null
}

rangercd() {
	tmp="$(mktemp)"
	ranger --choosedir="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat $tmp)"
		rm -rf "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

vf() { fzf | xargs -r -I % $EDITOR % ;}

export EDITOR=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias cq='codeQuestion'
alias vim='/usr/bin/nvim'
alias ovim='/usr/bin/vim'
alias ディスコード='startDiscord'
alias :q='exit'
zle -N fancy-ctrl-z

bindkey -s '^o' 'rangercd\n'
bindkey -s '^k^k' 'editBin\n'
bindkey '^Z' fancy-ctrl-z

source ~/dlang/ldc-1.17.0/activate
source $HOME/.cargo/env

if [ -z "$DISPLAY" -a $XDG_VTNR -eq 1 ]; then
	startx
fi
