#############################
#  _____    _               #
# |__  /___| |__  _ __ ___  #
#   / // __| '_ \| '__/ __| #
#  / /_\__ \ | | | | | (__  #
# /____|___/_| |_|_|  \___| #
#                           #
#############################

export DOTFILES=$HOME/Dotfiles
export ZshFiles=$DOTFILES/zsh

typeset -U config_files
config_files=($ZshFiles/**/*.zsh)

for file in ${(M)config_files}; do
	echo "loading $file"
	source $file
done

# For settings which shouldn't be shared with the outside world.
if [[ -a "$DOTFILES/zshrc-local" ]]; then
	source "$DOTFILES/zshrc-local"
fi
