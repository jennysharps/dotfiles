# Exports
export GIT_EDITOR=vim
export ZSH="${HOME}/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="dracula"

source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)
