# NixOS Configuration

This repository contains my personal NixOS configuration using [Nix Flakes](https://nixos.wiki/wiki/Flakes).

## Features

- Wayland with [Hyprland](https://github.com/hyprwm/Hyprland) as the window manager
- Firefox with [Betterfox](https://github.com/yokoffing/Betterfox) optimization
- [Fish shell](https://github.com/fish-shell/fish-shell) for an enhanced terminal experience
- Full media setup with [MPV](https://github.com/mpv-player/mpv) and [Plex](https://github.com/plexinc/pms-docker)
- Gaming with [Steam](https://store.steampowered.com/), [Wine](https://github.com/wine-mirror/wine), and [Proton](https://github.com/ValveSoftware/Proton)
- Optimized audio with [PipeWire](https://github.com/PipeWire/pipewire) and real-time performance
- [Syncthing](https://github.com/syncthing/syncthing) for file synchronization

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