# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# theme?
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="hyperzsh"

POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%{%F{249}%}\u250f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%F{249}%}\u2517%{%F{default}%} "

POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir node_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(battery)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6

POWERLEVEL9K_BATTERY_CHARGING='yellow'
POWERLEVEL9K_BATTERY_CHARGED='green'
POWERLEVEL9K_BATTERY_DISCONNECTED='$DEFAULT_COLOR'
POWERLEVEL9K_BATTERY_LOW_THRESHOLD='10'
POWERLEVEL9K_BATTERY_LOW_COLOR='red'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}" # remove 1 space before %H

# ENABLE WORD JUMPS by options + -> or <-
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# plugins? 
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh ?
alias tmux="TERM=screen-256color-bce tmux"

source ~/dotfiles/zsh/aliases
source ~/dotfiles/zsh/functions

#yarn
export PATH="$PATH:$HOME/.yarn/bin"

#laravel
export PATH="$PATH:$HOME/.composer/vendor/bin"

#local npm files
export PATH="$PATH:./node_modules/.bin"
export PATH="/usr/local/sbin:$PATH"

# android stuff
export PATH="$PATH:$HOME/Library/Android/sdk"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools:$PATH"

#go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

#personal scripts
export PATH="$PATH:$HOME/.bin"

# default user
DEFAULT_USER=`whoami`

# node verion manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS IS FOR ENABLING AUTO SUGGESTION OF COMMAND
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
