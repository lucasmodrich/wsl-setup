#!/bin/bash
#
# Install Oh My Zsh and set dotfiles
# Install dotfiles and configure git
# Install Powerlevel10k and run configuration

source ./scripts/utils.sh

echo_info "Installing dotfiles..."

# Install Oh My Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install plugin zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install plugin zsh-completions
#git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# Install plugin F-Sy-H
#git clone https://github.com/z-shell/F-Sy-H.git ~/.oh-my-zsh/custom/plugins/F-Sy-H

# Move permanent files to Home directory
#replace "./scripts/.zshrc" ".zshrc"
#replace "./scripts/.p10k.zsh" ".p10k.zsh"
replace "./scripts/config/config.nu" ".config/nushell/config.nu"

# Set Zsh as default shell in Linux
#chsh -s $(which zsh)

# Set Fish as the default shell in WSL
#chsh -s $(which fish)

# Set NuShell as the default shell in WSL
chsh -s $(which nu)


# Fix “zsh compinit: insecure directories” warnings
#fpath=(/usr/local/share/zsh-completions $fpath)

# Git configs
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global user.signingkey $GPG_KEY
git config --global commit.gpgsign true
git config --global tag.gpgsign true
git config --global gpg.format ssh
git config --global init.defaultBranch main
#git config --global --add oh-my-zsh.hide-dirty 1
#git config --global --add oh-my-zsh.hide-status 1
# Force Git to use SSH for all GitHub repos for this user
git config --global url.git@github.com:${GITHUB_USER}.insteadOf https://github.com/${GITHUB_USER}


# Install Powerlevel10k
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Run Powerlevel10k configuration (running zsh will trigger the config the first time)
#exec zsh
#p10k configure
# Need to exit the new shell
#exit 

# Finish
echo_success "Dotfiles settings complete."
