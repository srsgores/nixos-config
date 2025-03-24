# NixOS Configuration

This repository contains my personal NixOS configuration using Nix Flakes.

## Features

- Wayland with Hyprland as the window manager
- Firefox with Betterfox optimization
- Fish shell for an enhanced terminal experience
- Full media setup with MPV and Plex
- Gaming with Steam, Wine, and Proton
- Optimized audio with PipeWire and real-time performance
- Syncthing for file synchronization

## Installation

### Fresh NixOS Install

1. Install NixOS using the standard installation method
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/nixos-config.git ~/.config/nixos-config
   ```
3. Apply the configuration:
   ```bash
   cd ~/.config/nixos-config
   sudo nixos-rebuild switch --flake .#nixos
   ```

### Customizing Your Configuration

This configuration follows the declarative NixOS approach:

1. Modify files in this repository
2. Rebuild your system with `sudo nixos-rebuild switch --flake .#nixos`
3. Commit your changes to version control

## Customization

- Edit `configuration.nix` for system-wide settings
- Edit `home.nix` for user-specific settings
- Add hardware-specific configurations in the `hardware-configurations` directory
- Modify modules in the `modules` directory for specific applications

## Structure

- `flake.nix`: The main entry point for the Nix Flake
- `configuration.nix`: System-wide configuration
- `home.nix`: Home-manager configuration for user environment
- `modules/`: Configuration modules for specific applications
- `dotfiles/`: Configuration files for various applications

## Credits

- [Hyprland](https://github.com/hyprwm/Hyprland) for the window manager
- [Betterfox](https://github.com/yokoffing/Betterfox) for Firefox optimization 