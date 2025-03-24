{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
      upgrade = "nix flake update ~/.config/nixos-config && sudo nixos-rebuild switch --flake ~/.config/nixos-config";
    };
    plugins = [
      {
        name = "nvm";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "nvm.fish";
          rev = "96a5e00d7e04800d2a256ac4ec01fded5bf7db6f";
          sha256 = "sha256-QhlCGCmO1QCbqGwpy3UcJQiCYQBXfGYh/YKhV4qB/PU=";
        };
      }
    ];
    interactiveShellInit = builtins.readFile ../dotfiles/fish/config.fish;
  };
} 