# Exports
export GIT_EDITOR=vim
export ZSH="${HOME}/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="dracula"

source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

# From https://github.com/github/codespaces-base/blob/main/image/.devcontainer/Dockerfile#LL257C3-L257C57
# Setup Homebrew
# This is done in the `.devcontainer` for bash, but not for zsh.
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(rbenv init -)"
