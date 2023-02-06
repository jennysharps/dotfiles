#!/bin/bash

zshrc() {
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
    echo "==========================================================="
    echo "             Installing plugins              "
    echo "-----------------------------------------------------------"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
    echo "==========================================================="
    echo "             Installing dracula theme               "
    echo "-----------------------------------------------------------"
    git clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula" --depth=1
    ln -s "$ZSH_CUSTOM/themes/dracula/dracula.zsh-theme" "$ZSH_CUSTOM/themes/dracula.zsh-theme"
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
