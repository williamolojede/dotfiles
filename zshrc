# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# theme?
ZSH_THEME="agnoster"

# plugins? 
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh ?

source ~/dotfiles/zsh/aliases

#yarn
export PATH="$PATH:$HOME/.yarn/bin"

#laravel
export PATH="$PATH:$HOME/.composer/vendor/bin"

#local npm files
export PATH="$PATH:./node_modules/.bin"

# default user
DEFAULT_USER=`whoami`
