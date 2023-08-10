# Exports
export GIT_EDITOR=vim
export ZSH="${HOME}/.oh-my-zsh"
export GPG_TTY=$(tty)

ZSH_THEME="dracula"

source $ZSH/oh-my-zsh.sh

# Plugins
plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting)

helphub_url() { echo  "https://$(jq -r ".CODESPACE_NAME" /workspaces/.codespaces/shared/environment-variables.json)-8280.preview.app.github.dev/"; }

clone_ws() {
  if [[ -n "$1" ]]; then
    git clone "https://github.com/github/$1.git" "/workspaces/$1"
  else
      echo "error: missing repo name"
  fi
}

my_ip() {
  IP=$(curl ifconfig.me 2>/dev/null)
  echo "$IP"
}

nvm_init() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  [ -f ".nvmrc" ] && nvm install || nvm use
}

