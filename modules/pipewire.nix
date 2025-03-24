{ config, pkgs, ... }:

{
  # Audio setup with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  # Import your existing PipeWire configuration
  environment.etc = {
    "pipewire/pipewire.conf".source = ../dotfiles/pipewire/pipewire.conf;
  };
} 