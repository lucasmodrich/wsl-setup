#!/bin/bash
#
# npm packages
# Add or exclude packages before installation

# Install asdf (nodejs plugin))
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

source ./scripts/utils.sh
. $HOME/.asdf/asdf.sh

echo_info "Setting Node.js and npm packages..."

# Install asdf nodejs plugin and nodejs
asdf plugin-add nodejs
asdf global nodejs system

# Resolving EACCES permissions errors when installing packages globally
# Check out https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally more details
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

# Finish
echo_success "Finished Node.js and npm settings."
