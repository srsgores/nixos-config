{ config, pkgs, hypr-config, betterfox, ... }:

{
  home.stateVersion = "23.11";
  
  imports = [
    ./modules/alacritty.nix
    ./modules/fish.nix
    ./modules/mpv.nix
    ./modules/pipewire.nix
  ];

  home.packages = with pkgs; [
    cursor-bin
    playerctl
    pamixer
    brightnessctl
    xdg-desktop-portal-hyprland
    grim
    slurp
    wl-clipboard
    swappy
    waybar
    dunst
    libnotify
    polkit_gnome
  ];

  # Hyprland configuration
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
  };

  # Import your Hyprland configuration from the flake input
  xdg.configFile."hypr" = {
    source = hypr-config;
    recursive = true;
  };

  # Firefox with Betterfox
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;
      extraConfig = builtins.readFile "${betterfox}/user.js";
    };
  };

  # CopyQ configuration
  xdg.configFile."copyq/copyq.conf".source = ./dotfiles/copyq/copyq.conf;
  xdg.configFile."copyq/copyq-commands.ini".source = ./dotfiles/copyq/copyq-commands.ini;
  xdg.configFile."copyq/themes".source = ./dotfiles/copyq/themes;

  # Wpaperd (wallpaper)
  xdg.configFile."wpaperd/wallpaper.toml".text = ''
    [default]
    path = "~/Pictures/Wallpapers"
    duration = "30m"
  '';
  
  # Syncthing service
  services.syncthing.enable = true;
} 