#!/bin/bash

# Get the directory in which this script lives.
$DOTFILES_DIR=$(dirname "$(readlink -f "$0")")

zshrc() {
    echo "==========================================================="
    echo "             Installing dotfiles dependencies              "
    echo "-----------------------------------------------------------"
    sudo apt-get update && sudo apt-get -qq install --no-install-recommends zsh-syntax-highlighting zsh-autosuggestions
    echo "==========================================================="
    echo "             Symlinking dotfiles                           "
    echo "-----------------------------------------------------------"
    rm -rf ~/.zshrc
    ln -sf $DOTFILES_DIR/zshrc ~/.zshrc
    echo "==========================================================="
    echo "             Setting up dracula theme                      "
    echo "-----------------------------------------------------------"
    ZSH="$HOME/.oh-my-zsh"
    ZSH_CUSTOM="$ZSH/custom"
    git clone --depth=1 https://github.com/dracula/zsh.git $ZSH_CUSTOM/themes/dracula
    ln -s $ZSH_CUSTOM/themes/dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme
}

echo "==========================================================="
echo "             Setting up GITHUB_TOKEN                       "
echo "-----------------------------------------------------------"
# Use GH_PAT instead of default GITHUB_TOKEN if it is defined.
[ -v GH_GH_PAT ] && export GITHUB_TOKEN="${GH_GH_PAT}"

echo "==========================================================="
echo "             Setting up ZSH                                "
echo "-----------------------------------------------------------"
zshrc
