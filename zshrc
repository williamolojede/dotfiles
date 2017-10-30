# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# theme?
ZSH_THEME="agnoster"

# plugins? 
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

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
