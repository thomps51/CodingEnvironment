
# History Saving (I like tons of history)
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

#NEED VIM YO.  Screw this emacs default.
bindkey -v          # use vim key commands for terminal
export KEYTIMEOUT=1 # make change to visual mode take .1 seconds instead of .4 seconds
something() {
  zle backward-word
}
zle -N something

bindkey "\e[A" history-search-backward  # auto history search to complete commands
bindkey "\e[B" history-search-forwards  # arrow keys, unvim like

