# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Library/Python/3.9/bin:$PATH
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="/Users/pm/.oh-my-zsh"

export PYTHONPATH=/usr/bin/python3
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/envs
export VIRTUALENVWRAPPER_WORKON_CD=0
source /Users/pm/Library/Python/3.9/bin/virtualenvwrapper.sh

export LSCOLORS="EHfxcxdxBxegecabagacad"

alias pcat='pygmentize -f terminal256 -O style=dracula -g'
alias p='pcat'
alias d='docker container'
alias dc='docker-compose'
alias gs='git status'
alias vim='/opt/homebrew/bin/vim'

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose node npm)
source $ZSH/oh-my-zsh.sh
