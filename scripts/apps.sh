#!/bin/bash
#
# Install applications
# Comment (with #) what should not be installed and add the applications you want to install.

source ./scripts/utils.sh

echo_info "Installing apps..."

# Update Ubuntu
sudo apt update && sudo apt upgrade -y

# Ubuntu WSL
# Check out https://github.com/wslutilities/wslufor more details
sudo apt install -y ubuntu-wsl

# Essential package
sudo apt install -y build-essential

# Common packages
sudo apt install -y apt-transport-https ca-certificates curl gawk ssh-askpass tree unzip wget cifs-utils keychain

# Install Fish Shell
#sudo apt-add-repository ppa:fish-shell/release-3
#sudo apt update
#sudo apt install fish

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# GPG (GnuPG)
sudo apt install -y gpg gnupg gpg-agent

# Git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update && sudo apt install -y git

# Nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs yarn

# Go (Go-Lang)
sudo apt install -y go-lang

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#source $HOME/.cargo/env.fish
sudo apt install -y build-essential pkg-config libssl-dev

# Install NuShell and add to list of available shells
cargo install nu
sudo echo $HOME/.cargo/bin/nu >> /etc/shells

# Hugo (Snap). APT is out of date
snap install hugo

# Finish
echo_success "Finished applications installation."
