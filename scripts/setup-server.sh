#!/usr/bin/env bash

# Exit on any error
set -e

echo "Starting Ubuntu VM setup..."

# Update and upgrade system packages
echo "Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install Zsh
echo "Installing Zsh..."
sudo apt-get install -y zsh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Set Zsh as default shell for the current user
echo "Setting Zsh as default shell..."
sudo chsh -s $(which zsh) $USER

echo "Setup complete! Please log out and log back in for shell changes to take effect."
echo "You can now start using Zsh with Oh My Zsh!"