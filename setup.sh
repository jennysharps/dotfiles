#!/bin/bash

zshrc() {
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    
    echo "Installing plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    
    echo "Installing themes..."
    git clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula" --depth=1
    ln -s "$ZSH_CUSTOM/themes/dracula/dracula.zsh-theme" "$ZSH_CUSTOM/themes/dracula.zsh-theme"
    
    echo "Importing zshrc..."
    cat .zshrc > $HOME/.zshrc
    
    echo "Setting up brew & rbenv..."
    # From https://github.com/github/codespaces-base/blob/main/image/.devcontainer/Dockerfile#LL257C3-L257C57
    # Setup Homebrew
    # This is done in the `.devcontainer` for .bashrc, but not for .zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "${HOME}/.zshrc"
    echo 'eval "$(rbenv init -)"' >> "${HOME}/.zshrc"
}

echo "Setting up dotfiles..."

# Set up GITHUB_TOKEN
# Use GH_PAT instead of default GITHUB_TOKEN if it is defined.
# [ -v GH_GH_PAT ] && export GITHUB_TOKEN="${GH_GH_PAT}"

echo "Setting up ZSH..."
zshrc
