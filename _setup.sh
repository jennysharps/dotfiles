#!/bin/bash

zshrc() {
    $ZSH:=$HOME/.oh-my-zsh
    echo "==========================================================="
    echo "             Installing plugins              "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "             Installing dracula theme               "
    echo "-----------------------------------------------------------"
    git clone --depth=1 https://github.com/dracula/zsh.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/dracula
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
