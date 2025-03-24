{ config, pkgs, ... }:

{
  # Real-time audio configuration
  security = {
    # Real-time kit for audio
    rtkit.enable = true;
    
    # PAM limits for real-time audio
    pam.loginLimits = [
      # For real-time audio
      { domain = "@realtime"; item = "memlock"; type = "-"; value = "unlimited"; }
      { domain = "@realtime"; item = "rtprio"; type = "-"; value = "99"; }
      { domain = "@realtime"; item = "nofile"; type = "soft"; value = "99999"; }
      { domain = "@realtime"; item = "nofile"; type = "hard"; value = "99999"; }
    ];
  };

  # User groups for audio
  users.groups.realtime = {};
  users.users.seang.extraGroups = [ "realtime" "audio" ];

  # PipeWire configuration
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    
    # Low latency config
    config.pipewire = {
      "context.properties" = {
        "default.clock.rate" = 48000;
        "default.clock.allowed-rates" = [ 44100 48000 88200 96000 ];
        "default.clock.quantum" = 256;
        "default.clock.min-quantum" = 32;
        "default.clock.max-quantum" = 8192;
      };
    };
    
    # Media session config for JACK compatibility
    media-session.config.jack = {
      "jack.properties" = {
        "jack.default.rate" = 48000;
        "jack.default.channels" = 2;
        "jack.default.quantum" = 256;
        "jack.allow-rate-changes" = true;
      };
    };
  };

  # Import existing PipeWire configuration from dotfiles
  environment.etc = {
    "pipewire/pipewire.conf".source = ../dotfiles/pipewire/pipewire.conf;
  };

  # Kernel parameters for real-time performance
  boot.kernelParams = [ 
    "threadirqs" 
    "preempt=full" 
    "cpufreq.default_governor=performance"
  ];

  # Kernel optimization for audio
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_background_ratio" = 5;
    "vm.dirty_ratio" = 10;
  };
} 