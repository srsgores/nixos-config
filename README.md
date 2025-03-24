# NixOS Configuration

This repository contains my personal NixOS configuration using Nix Flakes.

## Features

- Wayland with Hyprland as the window manager
- Firefox with Betterfox optimization
- Fish shell for an enhanced terminal experience
- Full media setup with MPV and Plex
- Gaming with Steam, Wine, and Proton
- Optimized audio with PipeWire
- Syncthing for file synchronization

## Installation

### Fresh NixOS Install

1. Install NixOS using the standard installation method
2. Clone this repository:
   ```bash
   git clone https://github.com/your-username/nixos-config.git ~/.config/nixos
   ```
3. Run the installation script:
   ```bash
   cd ~/.config/nixos
   chmod +x scripts/install.sh
   ./scripts/install.sh
   ```

### Backing Up Your Current Configuration

If you want to update this repository with your current configuration:

```bash
cd ~/.config/nixos
chmod +x scripts/backup-configs.sh
./scripts/backup-configs.sh
```

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
- `scripts/`: Utility scripts for installation and maintenance

## Credits

- [Hyprland](https://github.com/hyprwm/Hyprland) for the window manager
- [Betterfox](https://github.com/yokoffing/Betterfox) for Firefox optimization 