# Exports
export GIT_EDITOR=vim
export ZSH=$HOME/.oh-my-zsh
export GPG_TTY=$(tty)

ZSH_THEME="dracula"

# Plugins
plugins=(docker docker-compose git)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Initialization
[ -d /home/linuxbrew/.linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

eval "$(rbenv init -)"
