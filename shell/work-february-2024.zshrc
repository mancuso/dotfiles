ZSH_DISABLE_COMPFIX="true"
export PATH=$PATH:/Users/mancuso/Library/Python/3.9/bin:/Users/mancuso/bin:/opt/homebrew/bin
export ZSH="/Users/mancuso/.oh-my-zsh"
export HOMEBREW_NO_AUTO_UPDATE=1

export VIMRUNTIME=/opt/homebrew/Cellar/vim/9.1.0050/share/vim/vim91
export PYTHONPATH=/usr/bin/python3
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/envs
export VIRTUALENVWRAPPER_WORKON_CD=0
source /Users/mancuso/Library/Python/3.9/bin/virtualenvwrapper.sh

export LSCOLORS="EHfxcxdxBxegecabagacad"
alias c='clear; ls -la'
alias pcat='pygmentize -f terminal256 -O style=dracula -g'
alias p='pcat'
alias d='docker container'
alias dc='docker-compose'
alias gs='git status'
alias dev='cd ~/src/; ls -la'
alias vim='/opt/homebrew/Cellar/vim/9.1.0050/bin/vim'

ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose node npm)

source $ZSH/oh-my-zsh.sh

