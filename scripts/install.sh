#!/usr/bin/env bash

set -e

# Set repository URL - replace with your actual repository
REPO_URL="https://github.com/your-username/nixos-config.git"

# Clone the repository
if [ ! -d "$HOME/.config/nixos-config" ]; then
  echo "Cloning NixOS configuration..."
  git clone $REPO_URL "$HOME/.config/nixos-config"
else
  echo "Configuration already exists, updating..."
  (cd "$HOME/.config/nixos-config" && git pull)
fi

# Apply the configuration
echo "Applying NixOS configuration..."
sudo nixos-rebuild switch --flake "$HOME/.config/nixos-config#nixos"

# Setup NVM and Node.js
if [ ! -d "$HOME/.nvm" ]; then
  echo "Setting up NVM..."
  mkdir -p "$HOME/.nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm install node
fi

# Setup Rust
if ! command -v rustc &> /dev/null; then
  echo "Setting up Rust..."
  rustup default stable
fi

echo "Installation complete! Your NixOS system is now configured." 