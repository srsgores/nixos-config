#!/usr/bin/env bash

# This script backs up your current configuration files to the dotfiles directory

NIXOS_CONFIG_DIR="$HOME/.config/nixos-config"
DOTFILES_DIR="$NIXOS_CONFIG_DIR/dotfiles"

# Create dotfiles directory structure
mkdir -p "$DOTFILES_DIR/copyq"
mkdir -p "$DOTFILES_DIR/fish"
mkdir -p "$DOTFILES_DIR/mpv/configs"
mkdir -p "$DOTFILES_DIR/pipewire"
mkdir -p "$DOTFILES_DIR/hypr"

# Backup CopyQ configuration
if [ -d "$HOME/.config/copyq" ]; then
  echo "Backing up CopyQ configuration..."
  mkdir -p "$DOTFILES_DIR/copyq/themes"
  cp -r "$HOME/.config/copyq/themes/" "$DOTFILES_DIR/copyq/"
  cp "$HOME/.config/copyq/copyq.conf" "$DOTFILES_DIR/copyq/"
  cp "$HOME/.config/copyq/copyq-commands.ini" "$DOTFILES_DIR/copyq/"
fi

# Backup Fish configuration
if [ -f "$HOME/.config/fish/config.fish" ]; then
  echo "Backing up Fish configuration..."
  cp "$HOME/.config/fish/config.fish" "$DOTFILES_DIR/fish/"
  
  # Optional: backup additional fish files
  if [ -f "$HOME/.config/fish/fish_plugins" ]; then
    cp "$HOME/.config/fish/fish_plugins" "$DOTFILES_DIR/fish/"
  fi
  
  if [ -d "$HOME/.config/fish/functions" ]; then
    mkdir -p "$DOTFILES_DIR/fish/functions"
    cp -r "$HOME/.config/fish/functions/" "$DOTFILES_DIR/fish/"
  fi
fi

# Backup MPV configuration
if [ -d "$HOME/.config/mpv/configs" ]; then
  echo "Backing up MPV configuration..."
  cp "$HOME/.config/mpv/configs/"* "$DOTFILES_DIR/mpv/configs/"
fi

# Backup PipeWire configuration
if [ -f "$HOME/.config/pipewire/pipewire.conf" ]; then
  echo "Backing up PipeWire configuration..."
  cp "$HOME/.config/pipewire/pipewire.conf" "$DOTFILES_DIR/pipewire/"
fi

# Backup Hyprland configuration
if [ -d "$HOME/.config/hypr" ]; then
  echo "Backing up Hyprland configuration..."
  cp "$HOME/.config/hypr/hyprland.conf" "$DOTFILES_DIR/hypr/"
  cp "$HOME/.config/hypr/.hyprpaper.conf" "$DOTFILES_DIR/hypr/" 2>/dev/null || true
  
  if [ -d "$HOME/.config/hypr/scripts" ]; then
    mkdir -p "$DOTFILES_DIR/hypr/scripts"
    cp -r "$HOME/.config/hypr/scripts/" "$DOTFILES_DIR/hypr/"
  fi
fi

echo "Configuration backup complete!" 