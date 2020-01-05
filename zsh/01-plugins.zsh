#!/bin/zsh
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen bundle andrewferrier/fzf-z
antigen bundle joepvd/zsh-hints
antigen bundle jimeh/zsh-peco-history
antigen bundle git
antigen bundle z
antigen bundle command-not-found

antigen apply
