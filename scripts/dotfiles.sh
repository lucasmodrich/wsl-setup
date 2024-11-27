#!/bin/bash
#
# Install Oh My Zsh and set dotfiles
# Install dotfiles and configure git
# Install Powerlevel10k and run configuration

source ./scripts/utils.sh

echo_info "Installing dotfiles..."

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugin zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install plugin zsh-completions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# Install plugin F-Sy-H
git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Move permanent files to Home directory
replace "./scripts/.zshrc" ".zshrc"
#replace "./scripts/.p10k.zsh" ".p10k.zsh"

# Set Zsh as default shell in Linux
chsh -s $(which zsh)

# Fix “zsh compinit: insecure directories” warnings
fpath=(/usr/local/share/zsh-completions $fpath)

# Git configs
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
git config --global --add oh-my-zsh.hide-dirty 1
git config --global --add oh-my-zsh.hide-status 1

# Install Oh-My-Posh
curl -s https://ohmyposh.dev/install.sh | bash -s
# Install Oh-My-Posh fonts
oh-my-posh font install FiraCode Nerd Font Mono
# Enable auto-upgrades
oh-my-posh enable upgrade

# Finish
echo_success "Dotfiles settings complete."
