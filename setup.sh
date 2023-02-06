#!/bin/bash

zshrc() {
    $ZSH:=$HOME/.oh-my-zsh
    echo "==========================================================="
    echo "             Installing dotfiles dependencies              "
    echo "-----------------------------------------------------------"
    sudo apt-get update && sudo apt-get -qq install --no-install-recommends zsh-syntax-highlighting zsh-autosuggestions
    echo "==========================================================="
    echo "             Installing dracula theme source               "
    echo "-----------------------------------------------------------"
    git clone --depth=1 https://github.com/dracula/zsh.git $ZSH/custom/themes/dracula
    echo "==========================================================="
    echo "             Symlinking dracula theme                      "
    echo "-----------------------------------------------------------"
    ln -s $ZSH/custom/themes/dracula/dracula.zsh-theme $ZSH/themes/dracula.zsh-theme
    echo "==========================================================="
    echo "                  Import zshrc                             "
    echo "-----------------------------------------------------------"
    cat .zshrc > $HOME/.zshrc
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
